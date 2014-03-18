
#unpack boot image
./unmkbootimg boot.img

#unpack ramdisk
mkdir ramdisk
cd ramdisk
gunzip -c ../initramfs.cpio.gz | cpio -i



#repack ramdisk
cd ramdisk
find . | cpio -o -H newc | gzip > ../newramdisk.cpio.gz





mkbootimg --cmdline 'console=ttyDDC0 androidboot.hardware=runnymede' --kernel zImage --ramdisk 1.28.cpio.gz --board 'runnymede' --base 0x14400000 -o 1.28.img


mkbootimg --cmdline 'console=ttyDDC0 androidboot.hardware=runnymede' --kernel zImage --ramdisk 1.25.cpio.gz --board 'runnymede' --base 0x14400000 -o 1.25.img


mkbootimg --cmdline 'console=ttyDDC0 androidboot.hardware=runnymede' --kernel kernel --ramdisk ramdisk.img --board 'runnymede' --base 0x14400000 -o boot.img





init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M
