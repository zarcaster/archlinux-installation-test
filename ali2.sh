#!/bin/bash

ln -sf "/usr/share/zoneinfo/America/La_Paz" "/etc/localtime"
hwclock --systohc

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' "/etc/locale.gen"
locale-gen
echo 'LANG=en_US.UTF-8' >> "/etc/locale.conf"

read -p "Enter name of device: " deviceName
echo "$deviceName" >> "/etc/hostname"
echo -e "127.0.0.1	localhost\n::1	localhost\n192.168.0.151	${deviceName}" | tee -a "/etc/hosts"

passwd

#%wheel      ALL=(ALL:ALL) ALL
EDITOR=nano visudo

read -p "Enter name of user: " userName
useradd -m "$userName"
passwd "$userName"
gpasswd -a "$userName" wheel

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

#systemctl enable ufw.service
systemctl enable sshd.service
systemctl enable cups.service
systemctl enable fstrim.timer
systemctl enable gdm.service
systemctl enable NetworkManager.service
systemctl enable bluetooth.service

echo 'End of script 2, now restart the system..'
