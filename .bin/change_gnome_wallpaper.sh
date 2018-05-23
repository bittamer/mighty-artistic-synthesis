#!/bin/bash
while true; do
    export bgr="/home/hubbi/Images/Wallpapers/unsplash/"$(shuf -n1 /home/hubbi/.bin/wallpaper.list)
    echo Changing wallpaper to $bgr
    gsettings set org.gnome.desktop.background picture-uri $bgr
    sleep 300
done
