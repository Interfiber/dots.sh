#!/usr/bin/env bash

rm /run/user/1000/tapete.socket
tapeted &
sleep 1
tapete set-wallpaper --file ~/.df/wallpapers/wallpaper_railroad.png
