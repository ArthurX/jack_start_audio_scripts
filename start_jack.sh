#!/bin/bash

# from https://wiki.archlinux.org/index.php/JACK_Audio_Connection_Kit

jack_control start

jack_control eps realtime true
jack_control ds firewire
#jack_control dps device hw:HD2
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 256
#sleep 10
jack_load netmanager  
sleep 10
killall qsampler 
/usr/bin/a2jmidid -e &
#sleep 10
#qjackctl &
#sleep 10
#guitarix &
qmidiroute /home/arthurx/Audio_Samples/MidiKeySplit_69_under_to_2_above_to_3_midichannel.qmr &


sleep 10
non-mixer /home/arthurx/Audio_Rec_2016/2016_01_January/2016_01_January_11/Non-Mixer/ &


non-timeline /home/arthurx/Audio_Rec_2016/2016_01_January/2016_01_January_11/ &
sleep 10



zynaddsubfx --load="/home/arthurx/Audio_Samples/ZynAdd_Presets/StringSaw6.xmz"	&

#sleep 10
qsampler /home/arthurx/Audio_Rec/test.lscp &

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
jack_connect "a2j:RoMIO II [24] (capture): RoMIO II MIDI 1" ArtBamba:midi_to_slave_1  &
jack_connect "a2j:RoMIO II [28] (capture): RoMIO II MIDI 1" ArtBamba:midi_to_slave_1  &
jack_connect "a2j:RoMIO II [20] (capture): RoMIO II MIDI 1" ArtBamba:midi_to_slave_1  &

jack_connect "a2j:RoMIO II [24] (capture): RoMIO II MIDI 1" zynaddsubfx:midi_input  &
jack_connect "a2j:RoMIO II [28] (capture): RoMIO II MIDI 1" zynaddsubfx:midi_input  &
jack_connect "a2j:RoMIO II [20] (capture): RoMIO II MIDI 1" zynaddsubfx:midi_input  &


