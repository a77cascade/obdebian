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
echo ""
echo "\e[31;4mУстановка пакетов отобродение\e[0m"
    sudo apt-get install xserver-xorg-video-nouveau x11-xserver-utils x11-utils xinit
echo ""
echo "\e[31;4mУстановка Openbox\e[0m"
    sudo apt-get install openbox obconf obmenu obsession menu openbox-menu lxappearance lxappearance-obconf pulseaudio pavucontrol volti network-manager-gnome
    echo "\e[1mСоздания деректории и копия конфирурации Openbox"
        mkdir -p .config/openbox
        sudo cp /etc/xdg/openbox/* .config/openbox
    echo "\e[1mУкажите владельца файлов в директории: .config/openbox/*"
    read -r USER
        sudo chown " $USER:$USER " .config/openbox/*
echo ""
echo "\e[31;4mУстанавка менеджера входа в систему LightDM\e[0m"
    sudo apt-get install lightdm
echo ""
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

# 2-Установка дополнительного програмного обеспечения.
echo "\e[1mЗапустить Lightdm?\e[0m"
echo "1 -Да"
echo "2 -Нет"
echo "Введите номер:"
read -r INSTALL

if [ "$INSTALL" -eq "1" ]; 
then
    sudo lightdm
    exit
elif [ "$INSTALL" -eq "2" ]; 
then
    exit
else
    echo "Вы ввели неверный номер."
    exit
fi