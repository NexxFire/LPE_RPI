cmd_libbb/perror_nomsg_and_die.o := /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc -Wp,-MD,libbb/.perror_nomsg_and_die.o.d  -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.36.1"' -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os    -DKBUILD_BASENAME='"perror_nomsg_and_die"'  -DKBUILD_MODNAME='"perror_nomsg_and_die"' -c -o libbb/perror_nomsg_and_die.o libbb/perror_nomsg_and_die.c

deps_libbb/perror_nomsg_and_die.o := \
  libbb/perror_nomsg_and_die.c \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/lib/gcc/arm-linux-gnueabihf/4.8.3/include-fixed/limits.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/lib/gcc/arm-linux-gnueabihf/4.8.3/include-fixed/syslimits.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/limits.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/features.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/predefs.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/sys/cdefs.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/wordsize.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/gnu/stubs.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/posix1_lim.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/local_lim.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/linux/limits.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/posix2_lim.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/xopen_lim.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/stdio_lim.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/byteswap.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/byteswap.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/endian.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/endian.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/lib/gcc/arm-linux-gnueabihf/4.8.3/include/stdint.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/stdint.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/wchar.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/lib/gcc/arm-linux-gnueabihf/4.8.3/include/stdbool.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/unistd.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/posix_opt.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/environments.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/types.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/typesizes.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/lib/gcc/arm-linux-gnueabihf/4.8.3/include/stddef.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/arm-linux-gnueabihf/bits/confname.h \
  /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/arm-linux-gnueabihf/libc/usr/include/getopt.h \

libbb/perror_nomsg_and_die.o: $(deps_libbb/perror_nomsg_and_die.o)

$(deps_libbb/perror_nomsg_and_die.o):
