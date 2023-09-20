#!/bin/bash

mount /dev/nvme0n1p2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi

dd if=/dev/zero of=/mnt/swapfile bs=1M count=8k status=progress
chmod 0600 /mnt/swapfile
mkswap -U clear /mnt/swapfile
swapon /mnt/swapfile

pacstrap -K /mnt xorg amd-ucode base base-devel bluez bluez-utils curl dosfstools efibootmgr git gnome gnome-extra grub linux-firmware linux linux-headers man-db man-pages nano networkmanager ntfs-3g rsync texinfo wget cups cups-pdf openssh ufw

genfstab -U /mnt >> /mnt/etc/fstab

nano /mnt/etc/fstab

echo 'End of script 1, now to chroot...'
