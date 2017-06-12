#!/bin/bash
# start jack with qsampler,non-mixer etc and connections

# from https://wiki.archlinux.org/index.php/JACK_Audio_Connection_Kit

jack_control start

jack_control eps realtime true
jack_control ds alsa
jack_control dps device hw:US16x08
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 128
#sleep 10
#jack_load netmanager 

#/usr/bin/jackd -R -d net -C 16 -P 2 -i 2 -o 2 &
# -C capture from master to slave audio
# -P send from slave to master audio
# -i-o for midi

 
sleep 10
killall qsampler 
killall qtractor 

sleep 20
qsampler /home/arthurx/Audio_Settings_Samples/Audio_Samples/Grand_Strings.lscp &
#qsampler /home/arthurx/Audio_Settings_Samples/Audio_Samples/Grand_Strings_Back_Up.lscp &

sleep 10
guitarix &
sleep 10
/usr/bin/a2jmidid -e &
#sleep 10
#qjackctl &
#sleep 10
#guitarix &
#qmidiroute /home/arthurx/Audio_Settings_Samples/Scripts/foot_con_soft_64_to_67.qmr &


sleep 10
#qtractor /home/arthurx/Audio_Rec_2016/2017/1/Wolbodo_7_Jan_2017/Qtrac/Wolbodo_2017.qtr &

sleep 10
#/home/arthurx/Audio_Settings_Samples/Scripts/convert_osc_to_non_float.py  8080 8081 &

non-mixer /home/arthurx/Audio_Settings_Samples/Scripts/Mixers/HeadPhone_Mix/RobPhone_5+6/ &
sleep 2
non-mixer /home/arthurx/Audio_Settings_Samples/Scripts/Mixers/HeadPhone_Mix/BassPhone_3+4/ &
sleep 2
non-mixer /home/arthurx/Audio_Settings_Samples/Scripts/Mixers/HeadPhone_Mix/HornPhone_7+8/ &
sleep 2
non-mixer /home/arthurx/Audio_Rec_2016/work_dir/Non-Mixer/ & # --osc-port 8081 &
sleep 2

non-timeline /home/arthurx/Audio_Rec_2016/work_dir/ &

sleep 10
yoshimi --load-instrument="/usr/share/yoshimi/banks/Strings/0006-Saw Strings 6.xiz"  &
#zynaddsubfx --load="/home/arthurx/Audio_Settings_Samples/Audio_Samples/ZynAdd_Presets/StringSaw6.xmz"	&


sleep 10


# set priority order for software under jack
musicsoft=( "jackdbus" "non-timeline"  "non-mixer")       # "linuxsampler" "zynaddsubfx"       # order the programs from most critical to less
priority=20                                               # the highest priority for jackdbus
for i in "${musicsoft[@]}"
    do schedtool -R -p $priority `pidof $i`
    ((priority=priority-1))                               # decrease the priority
    done

#schedtool -R -p 20 `pidof jackdbus`                      # example of the normal line

#sleep 5
qjackctl &
#sleep 30


# to make all jack connections 
source /home/arthurx/Audio_Settings_Samples/Scripts/make_jack_connections.sh  


