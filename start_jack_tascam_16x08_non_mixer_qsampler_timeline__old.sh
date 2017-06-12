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

source /home/arthurx/Audio_Settings_Samples/Scripts/make_jack_connections.sh  

#######################################################################################
# connect net audio inputs to non-mixer and non-timeline
#######################################################################################
jack_connect  system:capture_5 "Non-Mixer/Drum:in-1"      &
jack_connect  system:capture_1 "Non-Mixer/Voice:in-1"      &
jack_connect  system:capture_2 "Non-Mixer/Voice2:in-1"      &
jack_connect  system:capture_7 "Non-Mixer/VoiceTube:in-1"      &
jack_connect  system:capture_10 "Non-Mixer/Bass:in-1"      &
jack_connect  system:capture_9 "Non-Mixer/Guitar:in-1"      &
#jack_connect  system:capture_11 "Non-Mixer/Piano:in-1"    &
#jack_connect  system:capture_12 "Non-Mixer/Piano:in-2"    &
jack_connect  system:capture_13 "Non-Mixer/DrumManami:in-1"      &
jack_connect  system:capture_14 "Non-Mixer/DrumManami:in-2"      &
jack_connect  system:capture_15 "Non-Mixer/DrumEllo:in-1"      &
jack_connect  system:capture_16 "Non-Mixer/DrumEllo:in-2"      &


# connect net audio inputs to non-timeline
#######################################################################################
jack_connect  system:capture_5 "Non-Timeline:Drum/in-1"      &
jack_connect  system:capture_1 "Non-Timeline:Voice/in-1"      &
jack_connect  system:capture_2 "Non-Timeline:Voice2/in-1"      &
jack_connect  system:capture_7 "Non-Timeline:VoiceTube/in-1"      &
jack_connect  system:capture_10 "Non-Timeline:Bass/in-1"      &
jack_connect  system:capture_9 "Non-Timeline:Guitar/in-1"      &
#jack_connect  system:capture_11 "Non-Timeline:Piano/in-1"    &
#jack_connect  system:capture_12 "Non-Timeline:Piano/in-2"    &
jack_connect  system:capture_13 "Non-Timeline:DrumManami/in-1"      &
jack_connect  system:capture_14 "Non-Timeline:DrumManami/in-2"      &
jack_connect  system:capture_15 "Non-Timeline:DrumEllo/in-1"      &
jack_connect  system:capture_16 "Non-Timeline:DrumEllo/in-2"      &

###############################################################################################
# from linuxsampler to non-mixer  non-timeline
###################################################################################################
jack_connect  LinuxSampler:0 "Non-Mixer/LinSamplr:in-1"    &
jack_connect  LinuxSampler:1 "Non-Mixer/LinSamplr:in-2"    &

jack_connect  LinuxSampler:2 "Non-Mixer/LinSamplr2:in-1"    &
jack_connect  LinuxSampler:3 "Non-Mixer/LinSamplr2:in-2"    &

jack_connect  LinuxSampler:4 "Non-Mixer/LinSamplr3:in-1"    &
jack_connect  LinuxSampler:5 "Non-Mixer/LinSamplr3:in-2"    &
# from linuxsampler to non-timeline
jack_connect  LinuxSampler:0 "Non-Timeline:LinSamplr/in-1"    &
jack_connect  LinuxSampler:1 "Non-Timeline:LinSamplr/in-2"    &

jack_connect  LinuxSampler:2 "Non-Timeline:LinSamplr2/in-1"    &
jack_connect  LinuxSampler:3 "Non-Timeline:LinSamplr2/in-2"    &

jack_connect  LinuxSampler:4 "Non-Timeline:LinSamplr2/in-1"    &
jack_connect  LinuxSampler:5 "Non-Timeline:LinSamplr2/in-2"    &

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
jack_connect  "Non-Timeline:DrumManami/out-1"  "Non-Mixer/DrumManami:in-1"      &
jack_connect  "Non-Timeline:DrumManami/out-2"  "Non-Mixer/DrumManami:in-2"      &
jack_connect  "Non-Timeline:DrumEllo/out-1"  "Non-Mixer/DrumEllo:in-1"      &
jack_connect  "Non-Timeline:DrumEllo/out-2"  "Non-Mixer/DrumEllo:in-2"      &
jack_connect  "Non-Timeline:Drum/out-1"  "Non-Mixer/Drum:in-1"      &
jack_connect  "Non-Timeline:Voice/out-1"  "Non-Mixer/Voice:in-1"      &
jack_connect  "Non-Timeline:Voice2/out-1"  "Non-Mixer/Voice2:in-1"      &
jack_connect  "Non-Timeline:VoiceTube/out-1" "Non-Mixer/VoiceTube:in-1"    &
jack_connect  "Non-Timeline:Bass/out-1"  "Non-Mixer/Bass:in-1"      &
jack_connect  "Non-Timeline:Guitar/out-1"  "Non-Mixer/Guitar:in-1"      &
jack_connect  "Non-Timeline:Piano/out-1" "Non-Mixer/Piano:in-1"    &
jack_connect  "Non-Timeline:Piano/out-2"  "Non-Mixer/Piano:in-2"    &


#  linuxsampler  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:LinSamplr/out-1"   "Non-Mixer/LinSamplr:in-1"    &
jack_connect  "Non-Timeline:LinSamplr/out-2" "Non-Mixer/LinSamplr:in-2"    &
jack_connect  "Non-Timeline:LinSamplr2/out-1" "Non-Mixer/LinSamplr2:in-1"    &
jack_connect  "Non-Timeline:LinSamplr2/out-2" "Non-Mixer/LinSamplr2:in-2"    &

jack_connect  "Non-Timeline:Keys1/out-1" "Non-Mixer/Keys1:in-1"    &
jack_connect  "Non-Timeline:Keys1/out-2" "Non-Mixer/Keys1:in-2"    &
jack_connect  "Non-Timeline:Keys2/out-1" "Non-Mixer/Keys2:in-1"    &
jack_connect  "Non-Timeline:Keys2/out-2" "Non-Mixer/Keys2:in-2"    &
jack_connect  "Non-Timeline:Keys3/out-1" "Non-Mixer/Keys3:in-1"    &
jack_connect  "Non-Timeline:Keys3/out-2" "Non-Mixer/Keys3:in-2"    &

#  zynaddsubfx  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:ZynArtBamba/out-1"  "Non-Mixer/ZynArtBamba:in-1"    &
jack_connect  "Non-Timeline:ZynArtBamba/out-2" "Non-Mixer/ZynArtBamba:in-2"    &

#   guitarix   ::  Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:Guitarix/out-1"  "Non-Mixer/Guitarix:in-1"    &
jack_connect  "Non-Timeline:Guitarix/out-2"  "Non-Mixer/Guitarix:in-2"    &

#######################################################################################
# qtractor to non-mixer 
#######################################################################################
#jack_connect  "Non-Timeline:DrumManami/out-1"  "Non-Mixer/DrumManami:in-1"      &
#jack_connect  "Non-Timeline:DrumManami/out-2"  "Non-Mixer/DrumManami:in-2"      &
#jack_connect  "Non-Timeline:DrumEllo/out-1"  "Non-Mixer/DrumEllo:in-1"      &
#jack_connect  "Non-Timeline:DrumEllo/out-2"  "Non-Mixer/DrumEllo:in-2"      &
jack_connect  "Qtractor:Drum/out_1"  "Non-Mixer/Drum:in-1"      &
jack_connect  "Qtractor:Voice/out_1"  "Non-Mixer/Voice:in-1"      &
#jack_connect  "Non-Timeline:Voice2/out-1"  "Non-Mixer/Voice2:in-1"      &
#jack_connect  "Non-Timeline:VoiceTube/out-1" "Non-Mixer/VoiceTube:in-1"    &
jack_connect  "Qtractor:Bass/out_1"  "Non-Mixer/Bass:in-1"      &
#jack_connect  "Non-Timeline:Guitar/out-1"  "Non-Mixer/Guitar:in-1"      &
jack_connect  "Qtractor:Bass/out_1"  "Non-Mixer/Bass:in-1"      &
#jack_connect  "Non-Timeline:Piano/out-1" "Non-Mixer/Piano:in-1"    &
#jack_connect  "Non-Timeline:Piano/out-2"  "Non-Mixer/Piano:in-2"    &


#  linuxsampler  :: qtractor to Non-Mixer
jack_connect  "Qtractor:LinSamplr/out_1"   "Non-Mixer/LinSamplr:in-1"    &
jack_connect  "Qtractor:LinSamplr/out_2" "Non-Mixer/LinSamplr:in-2"    &
jack_connect  "Qtractor:LinSamplr2/out_1" "Non-Mixer/LinSamplr2:in-1"    &
jack_connect  "Qtractor:LinSamplr2/out_2" "Non-Mixer/LinSamplr2:in-2"    &

#  zynaddsubfx  :: Non-Timeline to Non-Mixer
jack_connect  "Qtractor:ZynArtBamba/out_1"  "Non-Mixer/ZynArtBamba:in-1"    &
jack_connect  "Qtractor:ZynArtBamba/out_2" "Non-Mixer/ZynArtBamba:in-2"    &

# disconnnect master qtractor
jack_disconnect  "Qtractor:Master/out_1"  "system:playback_1"    &
jack_disconnect  "Qtractor:Master/out_2" "system:playback_2"    &
jack_disconnect  "Qtractor:MixDown/out_1"  "system:playback_1"    &
jack_disconnect  "Qtractor:MixDown/out_2" "system:playback_2"    &

######################################################################################
#   non-mixer intern from left to right
######################################################################################

jack_connect  "Non-Mixer/Voice:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Voice:out-2"       "Non-Mixer/Main Out:in-2"     &
jack_connect  "Non-Mixer/Voice:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Voice:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &

jack_connect  "Non-Mixer/Voice2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Voice2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Voice2:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Voice2:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/VoiceTube:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/VoiceTube:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/VoiceTube:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/VoiceTube:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Piano:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Piano:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Piano:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Piano:out-2"       "Non-Mixer/Main Out:in-2"     &

#jack_connect  "Non-Mixer/LinSamplr:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
#jack_connect  "Non-Mixer/LinSamplr:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
#jack_connect  "Non-Mixer/LinSamplr:out-1"       "Non-Mixer/Main Out:in-1"     &
#jack_connect  "Non-Mixer/LinSamplr:out-2"       "Non-Mixer/Main Out:in-2"     &

#jack_connect  "Non-Mixer/LinSamplr2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
#jack_connect  "Non-Mixer/LinSamplr2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
#jack_connect  "Non-Mixer/LinSamplr2:out-1"       "Non-Mixer/Main Out:in-1"     &
#jack_connect  "Non-Mixer/LinSamplr2:out-2"       "Non-Mixer/Main Out:in-2"     &

# to KeysAll
jack_connect  "Non-Mixer/LinSamplr:out-1"       "Non-Mixer/KeysAll:in-1"     &
jack_connect  "Non-Mixer/LinSamplr:out-2"       "Non-Mixer/KeysAll:in-2"     &
jack_connect  "Non-Mixer/LinSamplr2:out-1"       "Non-Mixer/KeysAll:in-1"     &
jack_connect  "Non-Mixer/LinSamplr2:out-2"       "Non-Mixer/KeysAll:in-2"     &
jack_connect  "Non-Mixer/LinSamplr3:out-1"       "Non-Mixer/KeysAll:in-1"     &
jack_connect  "Non-Mixer/LinSamplr3:out-2"       "Non-Mixer/KeysAll:in-2"     &
jack_connect  "Non-Mixer/ZynArtBamba:out-1"       "Non-Mixer/KeysAll:in-1"     &
jack_connect  "Non-Mixer/ZynArtBamba:out-2"       "Non-Mixer/KeysAll:in-2"     &

# KeysAll to Keys1 Keys2 & Keys3
jack_connect  "Non-Mixer/KeysAll:aux-A/out-1" "Non-Mixer/Keys1:in-1"     &
jack_connect  "Non-Mixer/KeysAll:aux-A/out-2" "Non-Mixer/Keys1:in-2"     &
jack_connect  "Non-Mixer/KeysAll:aux-B/out-1" "Non-Mixer/Keys2:in-1"     &
jack_connect  "Non-Mixer/KeysAll:aux-B/out-2" "Non-Mixer/Keys2:in-2"     &
jack_connect  "Non-Mixer/KeysAll:aux-C/out-1" "Non-Mixer/Keys3:in-1"     &
jack_connect  "Non-Mixer/KeysAll:aux-C/out-2" "Non-Mixer/Keys3:in-2"     &
#jack_connect  "Non-Mixer/KeysAll:out-1"       "Non-Mixer/Main Out:in-1"     &
#jack_connect  "Non-Mixer/KeysAll:out-2"       "Non-Mixer/Main Out:in-2"     &

# Keys1 Keys2 & Keys3
jack_connect  "Non-Mixer/Keys1:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Keys1:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Keys1:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Keys1:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Keys2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Keys2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Keys2:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Keys2:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Keys3:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Keys3:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Keys3:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Keys3:out-2"       "Non-Mixer/Main Out:in-2"     &


#jack_connect  "Non-Mixer/ZynArtBamba:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
#jack_connect  "Non-Mixer/ZynArtBamba:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
#jack_connect  "Non-Mixer/ZynArtBamba:out-1"       "Non-Mixer/Main Out:in-1"     &
#jack_connect  "Non-Mixer/ZynArtBamba:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Drum:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Drum:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Drum:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Drum:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/DrumEllo:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/DrumEllo:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/DrumEllo:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/DrumEllo:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/DrumManami:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/DrumManami:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/DrumManami:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/DrumManami:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Bass:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Bass:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Bass:out-1"       "Non-Mixer/Main Out:in-1"     &
jack_connect  "Non-Mixer/Bass:out-2"       "Non-Mixer/Main Out:in-2"     &


#jack_connect  "Non-Mixer/Guitar:out-1"       "Non-Mixer/Main Out:in-1"     &
#jack_connect  "Non-Mixer/Guitar:out-2"       "Non-Mixer/Main Out:in-2"     &

jack_connect  "Non-Mixer/Guitarix:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Guitarix:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Guitarix:out-1"       "Non-Mixer/Main Out:in-1"  &
jack_connect  "Non-Mixer/Guitarix:out-2"       "Non-Mixer/Main Out:in-2"  &


# Zita Verb
jack_connect  "Non-Mixer/ZitaVerb:aux-A/out-1"   "Non-Mixer/HeadPhone:in-1" &
jack_connect  "Non-Mixer/ZitaVerb:aux-A/out-2"   "Non-Mixer/HeadPhone:in-2"  &
jack_connect  "Non-Mixer/ZitaVerb:aux-B/out-1"   "Non-Mixer/Main Out:in-1" &
jack_connect  "Non-Mixer/ZitaVerb:aux-B/out-2"   "Non-Mixer/Main Out:in-2"   &
#jack_connect  "Non-Mixer/ZitaVerb:out-1"         "Non-Mixer/Main Out:in-1"   &
#jack_connect  "Non-Mixer/ZitaVerb:out-2"         "Non-Mixer/Main Out:in-2"  &

jack_connect  "Non-Mixer/Main Out:out-1"   "Non-Mixer/HeadPhone:in-1"   &
jack_connect  "Non-Mixer/Main Out:out-2"   "Non-Mixer/HeadPhone:in-2"   &

############################################################################################
# from mixer to net, timeline, guitarix
##################################################################################################

#    mixer :: net
jack_connect   "Non-Mixer/HeadPhone:out-1" system:playback_1  &
jack_connect   "Non-Mixer/HeadPhone:out-2" system:playback_2  &

#    mixer  ::  timeline
jack_connect   "Non-Mixer/Main Out:out-1" "Non-Timeline:MainOut/in-1"   &
jack_connect   "Non-Mixer/Main Out:out-2" "Non-Timeline:MainOut/in-2"   &

# keys1, keys2, keys3 :: timeline
jack_connect  "Non-Mixer/Keys1:aux-B/out-1"       "Non-Timeline:Keys1/in-1"     &
jack_connect  "Non-Mixer/Keys1:aux-B/out-2"       "Non-Timeline:Keys1/in-2"     &
jack_connect  "Non-Mixer/Keys2:aux-B/out-1"       "Non-Timeline:Keys2/in-1"     &
jack_connect  "Non-Mixer/Keys2:aux-B/out-2"       "Non-Timeline:Keys2/in-2"     &
jack_connect  "Non-Mixer/Keys3:aux-B/out-1"       "Non-Timeline:Keys3/in-1"     &
jack_connect  "Non-Mixer/Keys3:aux-B/out-2"       "Non-Timeline:Keys3/in-2"     &

#    mixer  ::  qtractor
jack_connect   "Non-Mixer/Main Out:out-1" "Qtractor:MixDow/in_1"   &
jack_connect   "Non-Mixer/Main Out:out-2" "Qtractor:MixDow/in_2"   &

#    mixer  ::   guitarix
jack_connect  "Non-Mixer/Voice:aux-B/out-1"    gx_head_amp:in_0   &
jack_connect  "Non-Mixer/Guitar:out-1"   gx_head_amp:in_0   &




#############################################################################################
#    MIDI
#############################################################################################

# SWISSONIC EasyKeys61
jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:SWISSONIC EasyKeys61 [32] (capture): SWISSONIC EasyKeys61 MIDI 1" LinuxSampler:midi_in_0    &

jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"     &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:SWISSONIC EasyKeys61 [32] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi:midi in"    &

jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" zynaddsubfx:midi_input     &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" zynaddsubfx:midi_input     &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" zynaddsubfx:midi_input     &

#  Swissonic 88 [24] (capture): Swissonic 88 MIDI 1
# 
jack_connect "a2j:Swissonic 88 [20] (capture): Swissonic 88 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:Swissonic 88 [24] (capture): Swissonic 88 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:Swissonic 88 [28] (capture): Swissonic 88 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:Swissonic 88 [32] (capture): Swissonic 88 MIDI 1" LinuxSampler:midi_in_0    &

jack_connect "a2j:Swissonic 88 [20] (capture): Swissonic 88 MIDI 1" "yoshimi:midi in"     &
jack_connect "a2j:Swissonic 88 [24] (capture): Swissonic 88 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:Swissonic 88 [28] (capture): Swissonic 88 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:Swissonic 88 [32] (capture): Swissonic 88 MIDI 1" "yoshimi:midi in"    &

# RoMIO II
jack_connect "a2j:RoMIO II [28] (capture): RoMIO II MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:RoMIO II [20] (capture): RoMIO II MIDI 1" LinuxSampler:midi_in_0   &
jack_connect "a2j:RoMIO II [24] (capture): RoMIO II MIDI 1" LinuxSampler:midi_in_0   &

jack_connect "a2j:RoMIO II [24] (capture): RoMIO II MIDI 1" "yoshimi:midi in"  &
jack_connect "a2j:RoMIO II [28] (capture): RoMIO II MIDI 1" "yoshimi:midi in"  &
jack_connect "a2j:RoMIO II [20] (capture): RoMIO II MIDI 1" "yoshimi:midi in"  &


# Axion 49
jack_connect "a2j:USB Axiom 49 [20] (capture): USB Axiom 49 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:USB Axiom 49 [24] (capture): USB Axiom 49 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:USB Axiom 49 [28] (capture): USB Axiom 49 MIDI 1" LinuxSampler:midi_in_0    &
jack_connect "a2j:USB Axiom 49 [32] (capture): USB Axiom 49 MIDI 1" LinuxSampler:midi_in_0    &

jack_connect "a2j:USB Axiom 49 [20] (capture): USB Axiom 49 MIDI 1" "yoshimi:midi in"     &
jack_connect "a2j:USB Axiom 49 [24] (capture): USB Axiom 49 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:USB Axiom 49 [28] (capture): USB Axiom 49 MIDI 1" "yoshimi:midi in"    &
jack_connect "a2j:USB Axiom 49 [32] (capture): USB Axiom 49 MIDI 1" "yoshimi:midi in"    &
#jack_connect   system:midi_capture_1     LinuxSampler:midi_in_0        &
#jack_connect   system:midi_capture_1     zynaddsubfx:midi_input       &


########################################################################################
#### jack mixer output to tascam
########################################################################################

/home/arthurx/Audio_Settings_Samples/Scripts/start_jack_studio_connections.py studio &
/home/arthurx/Audio_Settings_Samples/Scripts/start_headphone_rob.py  &
/home/arthurx/Audio_Settings_Samples/Scripts/start_headphone_Bass.py  &
/home/arthurx/Audio_Settings_Samples/Scripts/start_headphone_Horn.py  &

