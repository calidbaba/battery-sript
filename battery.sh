#!/bin/bash
on=1
while true; do
    bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d":" -f2)
    bat=${bat::-1}
    if [ 20 -gt $bat ] && [ $on -gt 0 ];then
        paplay "/home/baba/bin/test.wav"
        zenity --error --text="Battery low" 
        on=0
    elif [ $bat -gt 20 ];then 
        on=1
    fi
    sleep 120
done
