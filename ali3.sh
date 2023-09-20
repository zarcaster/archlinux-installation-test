#!/bin/bash

sudo pacman -S \
audacity gimp handbrake keepassxc mpv neovim obs-studio qbittorrent retroarch uget unrar yt-dlp strawberry xclip mkvtoolnix-cli imagemagick parallel moreutils \
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-liberation \
libreoffice-fresh hunspell hunspell-en_us hyphen hyphen-en libmythes mythes-en libreoffice-extension-texmaths libreoffice-extension-writer2latex \
java17-openjfx java17-openjfx-doc java17-openjfx-src jdk17-openjdk openjdk17-doc openjdk17-src \
virtualbox virtualbox-guest-iso virtualbox-host-modules-arch

sudo gpasswd -a "$USER" vboxusers

#cat "${HOME}/Documents/bashrcCommandsAndAlias.txt" >> "${HOME}/.bashrc"
#source "${HOME}/.bashrc"
#echo -e '\nexport MOZ_USE_XINPUT2=1' >> "${HOME}/.profile"
