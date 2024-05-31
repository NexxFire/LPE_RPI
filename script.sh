#!/bin/bash

# check if the script is run as root
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

# Source the environment variables
source config.source

envPath=$(pwd)

# Asking for the disk name
lsblk
echo -e "\nEnter the name of the disk you want to use (default: sda) > "
read disk

if [ "$disk" = "" ]; then
	disk="sda"
fi

# Vefify the existence of the disk
if [ ! -e /dev/$disk ]; then
	echo "The disk you entered doesn't exist. Exiting..."
	exit 1  
fi

# asking for confirmation
echo "The disk you want to use is $disk. Are you sure? (Y/n) > "
read answer

if [ "$answer" =~ "nN" ]; then
	echo "Exiting..."
	exit 1
fi
echo "Starting creation of files system image on /dev/$disk."


# Start Bbox key mounting

# Create folders rpi_boot and rpi_root in /mnt
mkdir -p /mnt/rpi_boot
mkdir -p /mnt/rpi_root

# Unmount the SD card
umount /dev/${disk}1
umount /dev/${disk}2

# Format the key and create partitions
reset="o\n"
createPart1="n\np\n\n\n+100M\n"
createPart2="n\np\n\n\n+200M\n"
changeType1="t\n1\nc\n"
bootable1="a\n1\n"
write="w\n"

echo -e $reset$createPart1$createPart2$changeType1$bootable1$write | fdisk /dev/${disk}

# Format partitions
/sbin/mkfs.vfat -n rpi_boot /dev/${disk}1
/sbin/mkfs.ext4 -L rpi_root /dev/${disk}2

# Mount partitions
mount /dev/${disk}1 /mnt/rpi_boot
mount /dev/${disk}2 /mnt/rpi_root

# Copy files/directories from boot directory of original image
cp -r srcRPI/boot_rpi/* /mnt/rpi_boot

# Create necessary directories in rpi_root
mkdir -p rootRPI/{bin,dev,etc,home,lib,mnt,proc,root,sbin,sys,tmp,usr,var}

# Install busybox
cd srcRPI

if [ ! -d busybox ]; then
	echo "Downloading ..."
	tar -xvf busybox.tar.bz2
	mv busybox-1.36.1 busybox

fi
cd busybox
cp ../config/busybox.config .config
make -j$(nproc)
echo "installing busybox..."
make CROSS_COMPILE=$PATH_CC/arm-linux-gnueabihf- CONFIG_PREFIX=$envPath/rootRPI install
cd $envPath

# Configure boot
echo "Configuring boot..."
mkdir -p rootRPI/etc/init.d/
touch rootRPI/etc/inittab
touch rootRPI/etc/init.d/rcS

# copy inittab from config
cp srcRPI/config/inittab rootRPI/etc/inittab

# Edit rcS
cp srcRPI/config/rcS rootRPI/etc/init.d/rcS
chmod +x rootRPI/etc/init.d/rcS

# Create azerty.kmap
if [ ! -f srcRPI/config/azerty.kmap ]; then
	curl -o srcRPI/config/azerty.kmap http://www.blaess.fr/christophe/files/glmf/rpi-scratch-02/azerty.kmap # Dependance on curl
fi
cp srcRPI/config/azerty.kmap rootRPI/etc/

# Copy libraries
echo "Copying libraries..."
cp -r $PATH_CC/../arm-linux-gnueabihf/libc/lib/arm-linux-gnueabihf/* rootRPI/lib


# # Create a new user
# Demande des informations de l'utilisateur 
echo -e "\e[36m"
read -p "Username: " username
read -p "Password: " password
echo -e "\e[0m"

# # Création des utilisateurs

# Création de root sans mot de passe
echo "root:x:0:0:root:/root:/bin/sh" >> rootRPI/etc/passwd
echo "root::18657:0:99999:7:::" >> rootRPI/etc/shadow

# Création de l'utilisateur
mkdir -p rootRPI/home/$username
password=$(openssl passwd -1 -salt xyz $password)
echo "$username:x:1003:1000::/home/$username:/bin/sh" >> rootRPI/etc/passwd
echo "$username:$password:18657:0:99999:7:::" >> rootRPI/etc/shadow

# Ajout de l'utilisateur au groupe users
echo "users:x:1000:" >> /mnt/lemb/etc/group*

# Copie du fichier .profile
cp srcRPI/config/.profile rootRPI/root/.profile
cp srcRPI/config/.profile rootRPI/home/$username/.profile



# # Install ncurses
echo "Downloading and installing ncurses..."
cd srcRPI
if [ ! -d ncurses ]; then
	# Extract ncurses
	tar -xvf ncurses-stable.tar.gz
	mv ncurses-6.3 ncurses
fi
cd ncurses

# Configure ncurses with specified options
export CC=$CCC
export CXX=$PATH_CC/arm-linux-gnueabihf-c++
./configure --with-shared --prefix=$envPath/rootRPI --host=x86_64-build_unknown-linux-gnu --target=arm-linux-gnueabihf --disable-stripping

# Compile ncurses using available processors
make -j$(nproc)

# Install ncurses
make install

# Creation test file
cd srcRPI/ncursesTestFiles
export PREFIX="$envPath/rootRPI"
make -j$(nproc)
make install

cd $envPath


# # Install WiringPi 
echo "Installing WiringPi..."

# Download WiringPi
cd srcRPI
if [ ! -d wiringPi ]; then
	# Extract WiringPi
	tar -xvf wiringPi.tar.gz
	mv wiringPi-36fb7f1 wiringPi
fi

# Install WiringPi
cd wiringPi/wiringPi
make clean
export DESTDIR="$envPath/rootRPI"
export PREFIX=""
export CC=$CCC
make -j$(nproc) V=1 
make install

# Install WiringPiDev
cd ../devLib
make clean
export DESTDIR="$envPath/rootRPI"
export PREFIX=""
export CC="$CCC -I$DESTDIR/include"
make -j$(nproc) V=1 
make install

# Install GPIO
cd ../gpio
make clean
export DESTDIR="$envPath/rootRPI"
export PREFIX=""
export CC="$CCC"
make -j$(nproc) V=1 
make install

# Clean up
unset DESTDIR
unset PREFIX
unset CC

cd $envPath


rm rootRPI/lib/libwiringPi.so
rm rootRPI/lib/libwiringPiDev.so

cd rootRPI/lib
ln -sr libwiringPi.so.2.50 libwiringPi.so
ln -sr libwiringPiDev.so.2.50 libwiringPiDev.so

cd $envPath
# # Install WiringPi Test
echo "Installing WiringPi Test..."
cd srcRPI/wiringPiTestFiles
export PREFIX="$envPath/rootRPI"
make -j$(nproc)
make install

cd $envPath

# # Install fbv and graphical libraries

# Install jpeg
echo "Installing jpeg..."
cd srcRPI
if [ ! -d jpeg ]; then
	# Extract jpeg
	tar -xvf jpeg.tar.gz
fi
cd jpeg
./configure --prefix=$envPath/rootRPI --host=arm-linux-gnueabihf CC=$CCC CFALGS="-I$envPath/rootRPI/include" LDFLAGS="-L$envPath/rootRPI/lib"
make -j$(nproc)
make install CC=$CCC CFALGS="-I$envPath/rootRPI/include" LDFLAGS="-L$envPath/rootRPI/lib"

cd ..

# Install zlib
echo "Installing zlib..."
if [ ! -d zlib ]; then
	# Extract zlib
	tar -xvf zlib.tar.gz
fi
cd zlib
./configure --prefix=$envPath/rootRPI
make -j$(nproc) CC=$CCC CFALGS="-I$envPath/rootRPI/include" LDFLAGS="-L$envPath/rootRPI/lib" LDSHARED="${CCC} -shared -Wl,-soname,libz.so.1,--version-script,zlib.map"
make install CC=$CCC CFALGS="-I$envPath/rootRPI/include" LDFLAGS="-L$envPath/rootRPI/lib"

cd ..

# Install libpng
echo "Installing libpng..."
if [ ! -d libpng ]; then
	# Extract libpng
	tar -xvf libpng.tar.gz
fi
cd libpng
./configure --prefix=$envPath/rootRPI --with-zlib-prefix=$envPath/rootRPI --host=x86_64-build_unknown-linux-gnu --build=arm-linux-gnueabihf CC=$CCC CFLAGS="-I$envPath/rootRPI/include" LDFLAGS="-L$envPath/rootRPI/lib"
make -j$(nproc) INCLUDES="-I$envPath/rootRPI/include"
make install INCLUDES="-I$envPath/rootRPI/include"

cd ..

# Install fbv
echo "Installing fbv..."
if [ ! -d fbv ]; then
	# Extract fbv
	tar -xvf fbv.tar.gz
fi
cd fbv
./configure --prefix=$envPath/rootRPI --without-bmp CC=$CCC --libs="-I$envPath/rootRPI/include/libpng16 -I$envPath/rootRPI/include -L$envPath/rootRPI/lib -lpng -lz -ljpeg -lm"
make -j$(nproc) CC=$CCC CFLAGS="-I$envPath/rootRPI/include/libpng16 -I$envPath/rootRPI/include" LDFLAGS="-L$envPath/rootRPI/lib -lpng -lz -ljpeg -lm"
make install

cd $envPath

# Copy images
cp srcRPI/images/* rootRPI/home/$username/

# # Network configuration
echo "Configuring network..."

mkdir -p rootRPI/etc/network
mkdir -p rootRPI/etc/share/udhcpc
cp srcRPI/config/udhcpc.default.script rootRPI/etc/share/udhcpc/default.script
chmod +x rootRPI/etc/share/udhcpc/default.script

# # Web server configuration
echo "Configuring web server..."

mkdir -p rootRPI/var/www/
cp srcRPI/config/index.html rootRPI/var/www/index.html



# Copy from rootRPI to /mnt/rpi_root
cp -r rootRPI/* /mnt/rpi_root

echo "Mounting and configuration completed."
