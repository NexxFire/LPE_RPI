cmd_libbb/hash_md5_sha_x86-32_shaNI.o := /home/martin/Bureau/Cours/LA1/LPE/Partie2/srcRPI/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc -Wp,-MD,libbb/.hash_md5_sha_x86-32_shaNI.o.d  -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.36.1"' -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os       -c -o libbb/hash_md5_sha_x86-32_shaNI.o libbb/hash_md5_sha_x86-32_shaNI.S

deps_libbb/hash_md5_sha_x86-32_shaNI.o := \
  libbb/hash_md5_sha_x86-32_shaNI.S \
    $(wildcard include/config/sha1/hwaccel.h) \

libbb/hash_md5_sha_x86-32_shaNI.o: $(deps_libbb/hash_md5_sha_x86-32_shaNI.o)

$(deps_libbb/hash_md5_sha_x86-32_shaNI.o):
