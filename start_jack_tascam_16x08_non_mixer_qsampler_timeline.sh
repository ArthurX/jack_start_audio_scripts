#!/bin/bash
# start jack with qsampler,non-mixer etc and connections

# from https://wiki.archlinux.org/index.php/JACK_Audio_Connection_Kit


killall jack
killall qsampler 
killall qtractor 
killall yoshimi
killall a2jmidid
killall gxtuner

sleep 10

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
qsampler /home/arthurx/Audio_Settings_Samples/Audio_Samples/Grand_Strings.lscp &
#qsampler /home/arthurx/Audio_Settings_Samples/Audio_Samples/Grand_Strings_Back_Up.lscp &

sleep 2
#guitarix &
sleep 2
/usr/bin/a2jmidid -e &


#qmidiroute /home/arthurx/Audio_Settings_Samples/Scripts/Copy_Note_On_to_Channel2.qmr &


sleep 1
#qtractor /home/arthurx/Audio_Rec_2016/2017/1/Wolbodo_7_Jan_2017/Qtrac/Wolbodo_2017.qtr &

sleep 1
#/home/arthurx/Audio_Settings_Samples/Scripts/convert_osc_to_non_float.py  8080 8081 &


sleep 2
non-mixer /home/arthurx/Audio_Rec_2016/work_dir/Non-Mixer/ & # --osc-port 8081 &
sleep 2

non-timeline /home/arthurx/Audio_Rec_2016/work_dir/ &

sleep 5
#yoshimi --load-instrument="/usr/share/yoshimi/banks/Strings/0006-Saw Strings 6.xiz"  &
#zynaddsubfx --load="/home/arthurx/Audio_Settings_Samples/Audio_Samples/ZynAdd_Presets/StringSaw6.xmz"	&
#yoshimi  --state="/home/arthurx/Audio_Settings_Samples/Scripts/Yoshimi/SawStrings6_1__fantasy_synth_2.state" & # --no-gui  

yoshimi  --state="/home/arthurx/Audio_Settings_Samples/Scripts/Yoshimi/Midi_01.state" & # --no-gui 

sleep 5
yoshimi  --state="/home/arthurx/Audio_Settings_Samples/Scripts/Yoshimi/Midi_02.state" & # --no-gui
sleep 5
yoshimi  --state="/home/arthurx/Audio_Settings_Samples/Scripts/Yoshimi/Midi_03.state" & # --no-gui
sleep 5


# set priority order for software under jack
musicsoft=( "jackdbus" "non-timeline"  "non-mixer" "yoshimi" "linuxsampler")       # "linuxsampler" "zynaddsubfx"       # order the programs from most critical to less
priority=20                                               # the highest priority for jackdbus
for i in "${musicsoft[@]}"
    do schedtool -R -p $priority `pidof $i`
    ((priority=priority-1))                               # decrease the priority
    done

#schedtool -R -p 20 `pidof jackdbus`                      # example of the normal line

sleep 2
qjackctl &


sleep 2
gxtuner


# to make all jack connections 

source /home/arthurx/Audio_Settings_Samples/Scripts/make_jack_connections.sh  


