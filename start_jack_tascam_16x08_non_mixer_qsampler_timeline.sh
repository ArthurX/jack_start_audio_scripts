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

sleep 10
qsampler /home/arthurx/Audio_Settings_Samples/Audio_Samples/Grand_Strings.lscp &
sleep 10
guitarix &
sleep 10
/usr/bin/a2jmidid -e &
#sleep 10
#qjackctl &
#sleep 10
#guitarix &
#qmidiroute /home/arthurx/Audio_Samples/MidiKeySplit_69_under_to_2_above_to_3_midichannel.qmr &


sleep 10
non-mixer /home/arthurx/Audio_Rec_2016/work_dir/Non-Mixer/ &


non-timeline /home/arthurx/Audio_Rec_2016/work_dir/ &


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


#######################################################################################
# connect net audio inputs to non-mixer non-timeline
#######################################################################################
jack_connect  system:capture_5 "Non-Mixer/Drum:in-1"      &
jack_connect  system:capture_1 "Non-Mixer/Voice:in-1"      &
jack_connect  system:capture_2 "Non-Mixer/Voice2:in-1"      &
jack_connect  system:capture_10 "Non-Mixer/Bass:in-1"      &
jack_connect  system:capture_9 "Non-Mixer/Guitar:in-1"      &
#jack_connect  system:capture_11 "Non-Mixer/Piano:in-1"    &
#jack_connect  system:capture_12 "Non-Mixer/Piano:in-2"    &
# connect net audio inputs to non-timeline
#######################################################################################
jack_connect  system:capture_5 "Non-Timeline:Drum/in-1"      &
jack_connect  system:capture_1 "Non-Timeline:Voice/in-1"      &
jack_connect  system:capture_2 "Non-Timeline:Voice2/in-1"      &
jack_connect  system:capture_10 "Non-Timeline:Bass/in-1"      &
jack_connect  system:capture_9 "Non-Timeline:Guitar/in-1"      &
#jack_connect  system:capture_11 "Non-Timeline:Piano/in-1"    &
#jack_connect  system:capture_12 "Non-Timeline:Piano/in-2"    &


###############################################################################################
# from linuxsampler to non-mixer  non-timeline
###################################################################################################
jack_connect  LinuxSampler:0 "Non-Mixer/LinSamplr:in-1"    &
jack_connect  LinuxSampler:1 "Non-Mixer/LinSamplr:in-2"    &

jack_connect  LinuxSampler1:0 "Non-Mixer/LinSamplr2:in-1"    &
jack_connect  LinuxSampler1:1 "Non-Mixer/LinSamplr2:in-2"    &
# from linuxsampler to non-timeline
jack_connect  LinuxSampler:0 "Non-Timeline:LinSamplr/in-1"    &
jack_connect  LinuxSampler:1 "Non-Timeline:LinSamplr/in-2"    &

jack_connect  LinuxSampler1:0 "Non-Timeline:LinSamplr2/in-1"    &
jack_connect  LinuxSampler1:1 "Non-Timeline:LinSamplr2/in-2"    &

#############################################################################################
#  yoshimi to non-mixer  non-timeline
#########################################################################################################
jack_connect  yoshimi:left "Non-Mixer/ZynArtBamba:in-1"    &
jack_connect  yoshimi:right "Non-Mixer/ZynArtBamba:in-2"    &
#  zynaddsubfx to non-timeline
jack_connect  yoshimi:left "Non-Timeline:ZynArtBamba/in-1"    &
jack_connect  yoshimi:right "Non-Timeline:ZynArtBamba/in-2"    &

#############################################################################################
#  zynaddsubfx to non-mixer  non-timeline
#########################################################################################################
jack_connect  zynaddsubfx:out_1 "Non-Mixer/ZynArtBamba:in-1"    &
jack_connect  zynaddsubfx:out_2 "Non-Mixer/ZynArtBamba:in-2"    &
#  zynaddsubfx to non-timeline
jack_connect  zynaddsubfx:out_1 "Non-Timeline:ZynArtBamba/in-1"    &
jack_connect  zynaddsubfx:out_2 "Non-Timeline:ZynArtBamba/in-2"    &

######################################################################################
#   guitarix    to non-mixer
######################################################################################
jack_connect  gx_head_fx:out_0       "Non-Mixer/Guitarix:in-1"             &
jack_connect  gx_head_fx:out_1       "Non-Mixer/Guitarix:in-2"             &
jack_connect  gx_head_fx:out_0       "Non-Timeline:Guitarix/in-1"             &
jack_connect  gx_head_fx:out_1       "Non-Timeline:Guitarix/in-2"             &


###########################################################################################
#  Non-Timeline to Non-Mixer
###########################################################################################
#  net inputs  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:Drum/out-1"  "Non-Mixer/Drum:in-1"      &
jack_connect  "Non-Timeline:Voice/out-1"  "Non-Mixer/Voice:in-1"      &
jack_connect  "Non-Timeline:Voice2/out-1"  "Non-Mixer/Voice2:in-1"      &
jack_connect  "Non-Timeline:Bass/out-1"  "Non-Mixer/Bass:in-1"      &
#jack_connect  "Non-Timeline:Bass/out-1"  "Non-Mixer/Bass:in-1"      &
jack_connect  "Non-Timeline:Piano/out-1" "Non-Mixer/Piano:in-1"    &
jack_connect  "Non-Timeline:Piano/out-2"  "Non-Mixer/Piano:in-2"    &

#  linuxsampler  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:LinSamplr/out-1"   "Non-Mixer/LinSamplr:in-1"    &
jack_connect  "Non-Timeline:LinSamplr/out-2" "Non-Mixer/LinSamplr:in-2"    &
jack_connect  "Non-Timeline:LinSamplr2/out-1" "Non-Mixer/LinSamplr2:in-1"    &
jack_connect  "Non-Timeline:LinSamplr2/out-2" "Non-Mixer/LinSamplr2:in-2"    &

#  zynaddsubfx  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:ZynArtBamba/out-1"  "Non-Mixer/ZynArtBamba:in-1"    &
jack_connect  "Non-Timeline:ZynArtBamba/out-2" "Non-Mixer/ZynArtBamba:in-2"    &

#   guitarix   ::  Non-Timeline to Non-Mixer





######################################################################################
#   non-mixer intern from left to right
######################################################################################
jack_connect  "Non-Mixer/Voice:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Voice:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &


jack_connect  "Non-Mixer/Voice:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Voice:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Voice2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Voice2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Voice2:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Voice2:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Piano:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Piano:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Piano:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Piano:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/LinSamplr:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/LinSamplr:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/LinSamplr:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/LinSamplr:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/LinSamplr2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/LinSamplr2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/LinSamplr2:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/LinSamplr2:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/ZynArtBamba:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/ZynArtBamba:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/ZynArtBamba:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/ZynArtBamba:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Drum:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Drum:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Drum:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Drum:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Bass:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Bass:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Bass:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Bass:out-2"       "Non-Mixer/Main Out:in-2"     &


jack_connect  "Non-Mixer/Guitar:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Guitar:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Guitarix:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Guitarix:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Guitarix:out-1"       "Non-Mixer/Main Out:in-1"  &
jack_connect  "Non-Mixer/Guitarix:out-2"       "Non-Mixer/Main Out:in-2"  &

jack_connect  "Non-Mixer/ZitaVerb:out-1"   "Non-Mixer/Main Out:in-1"  &
jack_connect  "Non-Mixer/ZitaVerb:out-2"   "Non-Mixer/Main Out:in-2"  &

jack_connect  "Non-Mixer/Main Out:out-1"   "Non-Mixer/HeadPhone:in-1"   &
jack_connect  "Non-Mixer/Main Out:out-2"   "Non-Mixer/HeadPhone:in-2"   &

############################################################################################
# from mixer to net, timeline, guitarix
##################################################################################################
#  mixer :: net
jack_connect   "Non-Mixer/HeadPhone:out-1" system:playback_1  &
jack_connect   "Non-Mixer/HeadPhone:out-2" system:playback_2  &
#    mixer  ::  timeline
jack_connect   "Non-Mixer/Main Out:out-1" "Non-Timeline:MainOut/in-1"   &
jack_connect   "Non-Mixer/Main Out:out-2" "Non-Timeline:MainOut/in-2"   &
#    mixer  ::   guitarix
jack_connect  "Non-Mixer/Voice:aux-B/out-1"    gx_head_amp:in_0   &
jack_connect  "Non-Mixer/Guitar:out-1"   gx_head_amp:in_0   &


#############################################################################################
#    MIDI
#############################################################################################

jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &




jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"     &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"    &



jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" zynaddsubfx:midi_input     &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" zynaddsubfx:midi_input     &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" zynaddsubfx:midi_input     &


#jack_connect "a2j:RoMIO II [28] (capture): RoMIO II MIDI 1" LinuxSampler:midi_in_0    &
#jack_connect "a2j:RoMIO II [20] (capture): RoMIO II MIDI 1" LinuxSampler:midi_in_0   &

#jack_connect "a2j:RoMIO II [24] (capture): RoMIO II MIDI 1" zynaddsubfx:midi_input  &
#jack_connect "a2j:RoMIO II [28] (capture): RoMIO II MIDI 1" zynaddsubfx:midi_input  &
#jack_connect "a2j:RoMIO II [20] (capture): RoMIO II MIDI 1" zynaddsubfx:midi_input  &

#jack_connect   system:midi_capture_1     LinuxSampler:midi_in_0        &
#jack_connect   system:midi_capture_1     zynaddsubfx:midi_input       &


########################################################################################
#### jack mixer output to tascam
########################################################################################

/home/arthurx/Audio_Settings_Samples/Scripts/start_jack_studio_connections.py studio &

