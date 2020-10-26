#!/bin/bash

# Скрипт для удобной установки Openbox в Debian 10.
# 1-Установка основных програм для стобильной работы Openbox.

echo "\e[31;4mОбновить операционную систему Linux?\e[0m"
echo "1 - Обновить!"
echo "2 - Прпустить обновления!"
echo "Введите номер:"
read -r UP
if [ "$UP" -eq "1" ]; 
then
    sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove
elif [ "$UP" -eq "2" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[31;4mУстановка пакетов отобродение\e[0m"
    sudo apt-get install x11-xserver-utils x11-utils xinit conky volti network-manager-gnome nitrogen
    sudo cp /etc/conky/conky.conf /home/$USER/.conkyrc
echo "\e[31;4mУстановка Openbox\e[0m"
    sudo apt-get install openbox obconf obmenu obsession menu openbox-menu lxappearance lxappearance-obconf pulseaudio pavucontrol
    echo "\e[1mСоздания деректории и копия конфирурации Openbox"
        mkdir -p .config/openbox
        sudo cp /etc/xdg/openbox/* .config/openbox
    echo "\e[1mУкажите владельца файлов в директории .config/openbox/*:"
    read -r USER
        sudo chown $USER:$USER .config/openbox/*
echo ""

echo "\e[31;4mУстанавка менеджера входа в систему LightDM\e[0m"
    sudo apt-get install lightdm

echo "\e[31;4mКакой эмулятор терминала установить?\e[0m"
echo "1 - LXTerminal (*)"
echo "2 - Konsole"
echo "3 - Gnome Terminal"
echo "4 - QTerminal (*)"
echo "5 - Terminator"
echo "6 - Пропустить этот пункт!"
echo "Введите номер:"
read -r TERMINAL
if [ "$TERMINAL" -eq "1" ]; 
then
    sudo apt-get install lxterminal
elif [ "$TERMINAL" -eq "2" ]; 
then
    sudo apt-get install konsole
elif [ "$TERMINAL" -eq "3" ]; 
then
    sudo apt-get install gnome-terminal gnome-terminal-data
elif [ "$TERMINAL" -eq "4" ]; 
then
    sudo apt-get install qterminal qterminal-l10n
elif [ "$TERMINAL" -eq "5" ]; 
then
    sudo apt-get install terminator
elif [ "$TERMINAL" -eq "6" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[31;4mКакой метопакет драйверов установить?\e[0m"
echo "1-видеодарйвер AMDGPU"
echo "2-обёртка видеодарйвера AMD/ATI"
echo "3-пустой видеодрайвер"
echo "4-драйвер fbdev для кадрового буфера"
echo "5-видеодрайвер Nvidea"
echo "6-видеодрайвер VESA"
echo "7-видеодрайвер для VMware"
echo "8-видеодарйвер Intel i8xx, i9xx"
echo "9-видеодрайвер QXL"
echo "Введите номер:"
read -r DVR
if [ "$DVR" -eq "1" ]; 
then
    sudo apt-get install xserver-xorg-video-amdgpu
elif [ "$DVR" -eq "2" ]; 
then
    sudo apt-get install xserver-xorg-video-ati
elif [ "$DVR" -eq "3" ]; 
then
    sudo apt-get install xserver-xorg-video-dummy
elif [ "$DVR" -eq "4" ]; 
then
    sudo apt-get install xserver-xorg-video-fbdev
elif [ "$DVR" -eq "5" ]; 
then
    sudo apt-get install xserver-xorg-video-nouveau
elif [ "$DVR" -eq "6" ]; 
then
    sudo apt-get install xserver-xorg-video-vesa
elif [ "$DVR" -eq "7" ]; 
then
    sudo apt-get install xserver-xorg-video-vmware
elif [ "$DVR" -eq "8" ]; 
then
    sudo apt-get install xserver-xorg-video-intel
elif [ "$DVR" -eq "9" ]; 
then
    sudo apt-get install xserver-xorg-video-qxl
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[31;4mУстановка пакетов отобродение (x11)\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r x11
if [ "$x11" -eq "1" ]; 
then
    sudo apt-get install x11-xserver-utils x11-utils xinit
elif [ "$x11" -eq "2" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

# 2-Установка дополнительного програмного обеспечения.
echo "\e[1mЖелаете продолжить установку?\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r INSTALL
if [ "$INSTALL" -eq "1" ]; 
then
    echo ""
elif [ "$INSTALL" -eq "2" ]; 
then
    sudo lightdm
    exit
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mУстановить панель Tint2\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r INSTALL
if [ "$INSTALL" -eq "1" ]; 
then
    sudo apt-get install tint2
elif [ "$INSTALL" -eq "2" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mКакой текстовый редактор установить?\e[0m"
echo "1 - Leafpad (*)"
echo "2 - Kate"
echo "3 - GEdit"
echo "4 - Mousepad (*)"
echo "5 - Abiword (*)"
echo "6 - Пропустить этот пункт!"
echo "Введите номер:"
read -r TXT
if [ "$TXT" -eq "1" ]; 
then
    sudo apt-get install leafpad
elif [ "$TXT" -eq "2" ]; 
then
    sudo apt-get install kate
elif [ "$TXT" -eq "3" ]; 
then
    sudo apt-get install gedit gedit-common
elif [ "$TXT" -eq "4" ]; 
then
    sudo apt-get install mousepad
elif [ "$TXT" -eq "5" ]; 
then
    sudo apt-get install abiword abiword-common abiword-plugin-grammar libabiword-3.0
elif [ "$TXT" -eq "6" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mКакой браузер установить?\e[0m"
echo "1 - Iceweasel (*)"
echo "2 - Firefox"
echo "3 - Chromium"
echo "4 - Пропустить этот пункт!"
echo "Введите номер:"
read -r WEB
if [ "$WEB" -eq "1" ]; 
then
    sudo apt-get install iceweasel iceweasel-l10n-ru
elif [ "$WEB" -eq "2" ]; 
then
    sudo apt-get install firefox-esr firefox-esr-l10n-ru
elif [ "$WEB" -eq "3" ]; 
then
    sudo apt-get install chromium chromium-common chromium-l10n chromium-sandbox
elif [ "$WEB" -eq "4" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mКакой Файловый менеджер установить?\e[0m"
echo "1 - Thunar (*)"
echo "2 - PCManFM"
echo "3 - X File Explorer"
echo "4 - Пропустить этот пункт!"
echo "Введите номер:"
read -r FILE
if [ "$FILE" -eq "1" ]; 
then
    sudo apt-get install thunar
elif [ "$FILE" -eq "2" ]; 
then
    sudo apt-get install pcmanfm
elif [ "$FILE" -eq "3" ]; 
then
    sudo apt-get install xfe
elif [ "$FILE" -eq "4" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mУстановить меноджер архивов Xarchiver ?\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r ARCHIV
if [ "$ARCHIV" -eq "1" ]; 
then
    sudo apt-get install xarchiver
elif [ "$ARCHIV" -eq "2" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mУстановить пакетный меноджер Gdebi?(.deb)\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r GDEBI
if [ "$GDEBI" -eq "1" ]; 
then
    sudo apt-get install gdebi
elif [ "$GDEBI" -eq "2" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

echo "\e[1mУстановить меноджер пакетов Synaptic?\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r SYNAP
if [ "$SYNAP" -eq "1" ]; 
then
    sudo apt-get install synaptic
elif [ "$SYNAP" -eq "2" ]; 
then
    echo ""
else
    echo "Вы ввели неверный номер."
    exit
fi

exit
