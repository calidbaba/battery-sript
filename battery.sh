#!/bin/bash
on=1
bt_perc=20
bt_path=$( upower -e | grep battery)
test -z "$bt_path" && echo "Didn't find any battery" && exit

while true; do
    bat=$(upower -i "$bt_path" | grep percentage | cut -d":" -f2)
    bat=${bat::-1}
    if [ $bt_perc -gt $bat ] && [ $on -gt 0 ];then
        paplay "test.wav"
	dunstify "BATTERY WARNING" "Battery is 20%" -u critical -I ./battery.png
        on=0
    elif [ $bat -gt $bt_perc ];then
        on=1
    fi
    sleep 120
done
