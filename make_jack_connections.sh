
#!/bin/bash

# Make all the jack connections


#######################################################################################
# connect net audio inputs to non-mixer and non-timeline
#######################################################################################
jack_connect  system:capture_5 "Non-Mixer/Drum:in-1"      &
jack_connect  system:capture_1 "Non-Mixer/Voice:in-1"      &
jack_connect  system:capture_2 "Non-Mixer/Voice2:in-1"      &
jack_connect  system:capture_7 "Non-Mixer/VoiceTube:in-1"      &
jack_connect  system:capture_10 "Non-Mixer/Bass:in-1"      &
jack_connect  system:capture_9 "Non-Mixer/Guitar:in-1"      &
jack_connect  system:capture_9 "Non-Mixer/GuitarClean:in-1"      &
#jack_connect  system:capture_11 "Non-Mixer/Piano:in-1"    &
#jack_connect  system:capture_12 "Non-Mixer/Piano:in-2"    &
jack_connect  system:capture_13 "Non-Mixer/DrumManami:in-1"      &
jack_connect  system:capture_14 "Non-Mixer/DrumManami:in-2"      &
jack_connect  system:capture_15 "Non-Mixer/DrumEllo:in-1"      &
jack_connect  system:capture_16 "Non-Mixer/DrumEllo:in-2"      &

# conect GxtTuner
jack_connect  system:capture_9 "gxtuner:in_0"      &


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

jack_connect  yoshimi-01:left "Non-Mixer/ZynArtBamba:in-1"    &
jack_connect  yoshimi-01:right "Non-Mixer/ZynArtBamba:in-2"    &
#  zynaddsubfx to non-timeline
jack_connect  yoshimi-01:left "Non-Timeline:ZynArtBamba/in-1"    &
jack_connect  yoshimi-01:right "Non-Timeline:ZynArtBamba/in-2"    &

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

# Keys1,2,3  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:Keys1/out-1" "Non-Mixer/Keys1:in-1"    &
jack_connect  "Non-Timeline:Keys1/out-2" "Non-Mixer/Keys1:in-2"    &
jack_connect  "Non-Timeline:Keys2/out-1" "Non-Mixer/Keys2:in-1"    &
jack_connect  "Non-Timeline:Keys2/out-2" "Non-Mixer/Keys2:in-2"    &
jack_connect  "Non-Timeline:Keys3/out-1" "Non-Mixer/Keys3:in-1"    &
jack_connect  "Non-Timeline:Keys3/out-2" "Non-Mixer/Keys3:in-2"    &

# Guitar1,2,3  :: Non-Timeline to Non-Mixer
jack_connect  "Non-Timeline:Guitar1/out-1" "Non-Mixer/Guitar1:in-1"    &
jack_connect  "Non-Timeline:Guitar1/out-2" "Non-Mixer/Guitar1:in-2"    &
jack_connect  "Non-Timeline:Guitar2/out-1" "Non-Mixer/Guitar2:in-1"    &
jack_connect  "Non-Timeline:Guitar2/out-2" "Non-Mixer/Guitar2:in-2"    &
jack_connect  "Non-Timeline:Guitar3/out-1" "Non-Mixer/Guitar3:in-1"    &
jack_connect  "Non-Timeline:Guitar3/out-2" "Non-Mixer/Guitar3:in-2"    &

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

sleep 4

######################################################################################
#   non-mixer intern from left to right
######################################################################################

# Voices

jack_connect  "Non-Mixer/Voice:out-1"       "Non-Mixer/AllVocals:in-1"     &
jack_connect  "Non-Mixer/Voice:out-2"       "Non-Mixer/AllVocals:in-2"     &
jack_connect  "Non-Mixer/Voice:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Voice:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &

jack_connect  "Non-Mixer/Voice2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Voice2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Voice2:out-1"       "Non-Mixer/AllVocals:in-1"     &
jack_connect  "Non-Mixer/Voice2:out-2"       "Non-Mixer/AllVocals:in-2"     &

jack_connect  "Non-Mixer/VoiceTube:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/VoiceTube:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/VoiceTube:out-1"       "Non-Mixer/AllVocals:in-1"     &
jack_connect  "Non-Mixer/VoiceTube:out-2"       "Non-Mixer/AllVocals:in-2"     &

# Keys

jack_connect  "Non-Mixer/Piano:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Piano:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Piano:out-1"       "Non-Mixer/BussKeys:in-1"     &
jack_connect  "Non-Mixer/Piano:out-2"       "Non-Mixer/BussKeys:in-2"     &

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

sleep 4 

# Keys1 Keys2 & Keys3
jack_connect  "Non-Mixer/Keys1:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Keys1:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Keys1:out-1"       "Non-Mixer/BussKeys:in-1"     &
jack_connect  "Non-Mixer/Keys1:out-2"       "Non-Mixer/BussKeys:in-2"     &

jack_connect  "Non-Mixer/Keys2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Keys2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Keys2:out-1"       "Non-Mixer/BussKeys:in-1"     &
jack_connect  "Non-Mixer/Keys2:out-2"       "Non-Mixer/BussKeys:in-2"     &

jack_connect  "Non-Mixer/Keys3:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Keys3:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Keys3:out-1"       "Non-Mixer/BussKeys:in-1"     &
jack_connect  "Non-Mixer/Keys3:out-2"       "Non-Mixer/BussKeys:in-2"     &


#jack_connect  "Non-Mixer/ZynArtBamba:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
#jack_connect  "Non-Mixer/ZynArtBamba:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
#jack_connect  "Non-Mixer/ZynArtBamba:out-1"       "Non-Mixer/Main Out:in-1"     &
#jack_connect  "Non-Mixer/ZynArtBamba:out-2"       "Non-Mixer/Main Out:in-2"     &


# Drums

jack_connect  "Non-Mixer/Drum:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Drum:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Drum:out-1"       "Non-Mixer/BussDrums:in-1"     &
jack_connect  "Non-Mixer/Drum:out-2"       "Non-Mixer/BussDrums:in-2"     &

jack_connect  "Non-Mixer/DrumEllo:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/DrumEllo:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/DrumEllo:out-1"       "Non-Mixer/BussDrums:in-1"     &
jack_connect  "Non-Mixer/DrumEllo:out-2"       "Non-Mixer/BussDrums:in-2"     &

jack_connect  "Non-Mixer/DrumManami:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/DrumManami:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/DrumManami:out-1"       "Non-Mixer/BussDrums:in-1"     &
jack_connect  "Non-Mixer/DrumManami:out-2"       "Non-Mixer/BussDrums:in-2"     &

# Bass

jack_connect  "Non-Mixer/Bass:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Bass:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Bass:out-1"       "Non-Mixer/BussBass:in-1"     &
jack_connect  "Non-Mixer/Bass:out-2"       "Non-Mixer/BussBass:in-2"     &

# Guitars


# Guitar input to Guitar FX
jack_connect  "Non-Mixer/Guitar:aux-B/out-1"       "Non-Mixer/GuitarMoon:in-1"     &


# Guitarix  to Guitar1 , 2, 3 etc
jack_connect  "Non-Mixer/Guitarix:aux-A/out-1" "Non-Mixer/Guitar1:in-1"     &
jack_connect  "Non-Mixer/Guitarix:aux-A/out-2" "Non-Mixer/Guitar1:in-2"     &
jack_connect  "Non-Mixer/Guitarix:aux-B/out-1" "Non-Mixer/Guitar2:in-1"     &
jack_connect  "Non-Mixer/Guitarix:aux-B/out-2" "Non-Mixer/Guitar2:in-2"     &
jack_connect  "Non-Mixer/Guitarix:aux-C/out-1" "Non-Mixer/Guitar3:in-1"     &
jack_connect  "Non-Mixer/Guitarix:aux-C/out-2" "Non-Mixer/Guitar3:in-2"     &

# GuitarMoon to Guitar1 , 2, 3 etc
jack_connect  "Non-Mixer/GuitarMoon:aux-A/out-1" "Non-Mixer/Guitar1:in-1"     &
jack_connect  "Non-Mixer/GuitarMoon:aux-A/out-2" "Non-Mixer/Guitar1:in-2"     &
jack_connect  "Non-Mixer/GuitarMoon:aux-B/out-1" "Non-Mixer/Guitar2:in-1"     &
jack_connect  "Non-Mixer/GuitarMoon:aux-B/out-2" "Non-Mixer/Guitar2:in-2"     &
jack_connect  "Non-Mixer/GuitarMoon:aux-C/out-1" "Non-Mixer/Guitar3:in-1"     &
jack_connect  "Non-Mixer/GuitarMoon:aux-C/out-2" "Non-Mixer/Guitar3:in-2"     &

# GuitarClean to Guitar1 , 2, 3 etc
jack_connect  "Non-Mixer/GuitarClean:aux-A/out-1" "Non-Mixer/Guitar1:in-1"     &
jack_connect  "Non-Mixer/GuitarClean:aux-A/out-2" "Non-Mixer/Guitar1:in-2"     &
jack_connect  "Non-Mixer/GuitarClean:aux-B/out-1" "Non-Mixer/Guitar2:in-1"     &
jack_connect  "Non-Mixer/GuitarClean:aux-B/out-2" "Non-Mixer/Guitar2:in-2"     &
jack_connect  "Non-Mixer/GuitarClean:aux-C/out-1" "Non-Mixer/Guitar3:in-1"     &
jack_connect  "Non-Mixer/GuitarClean:aux-C/out-2" "Non-Mixer/Guitar3:in-2"     &

# Guitar1
jack_connect  "Non-Mixer/Guitar1:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Guitar1:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Guitar1:out-1"       "Non-Mixer/BussGuitars:in-1"  &
jack_connect  "Non-Mixer/Guitar1:out-2"       "Non-Mixer/BussGuitars:in-2"  &
# Guitar2
jack_connect  "Non-Mixer/Guitar2:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Guitar2:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Guitar2:out-1"       "Non-Mixer/BussGuitars:in-1"  &
jack_connect  "Non-Mixer/Guitar2:out-2"       "Non-Mixer/BussGuitars:in-2"  &
# Guitar3
jack_connect  "Non-Mixer/Guitar3:aux-A/out-1" "Non-Mixer/ZitaVerb:in-1"     &
jack_connect  "Non-Mixer/Guitar3:aux-A/out-2" "Non-Mixer/ZitaVerb:in-2"     &
jack_connect  "Non-Mixer/Guitar3:out-1"       "Non-Mixer/BussGuitars:in-1"  &
jack_connect  "Non-Mixer/Guitar3:out-2"       "Non-Mixer/BussGuitars:in-2"  &

# Zita Verb
jack_connect  "Non-Mixer/ZitaVerb:aux-A/out-1"   "Non-Mixer/HeadPhone:in-1" &
jack_connect  "Non-Mixer/ZitaVerb:aux-A/out-2"   "Non-Mixer/HeadPhone:in-2"  &
#jack_connect  "Non-Mixer/ZitaVerb:aux-B/out-1"   "Non-Mixer/Main Out:in-1" &
#jack_connect  "Non-Mixer/ZitaVerb:aux-B/out-2"   "Non-Mixer/Main Out:in-2"   &
#jack_connect  "Non-Mixer/ZitaVerb:out-1"         "Non-Mixer/Main Out:in-1"   &
#jack_connect  "Non-Mixer/ZitaVerb:out-2"         "Non-Mixer/Main Out:in-2"  &



############################################################################################
#
# In mixer from Subbus to AllMusic, AllFX to Main Out
#
############################################################################################

# Subbus to AllMusic

jack_connect  "Non-Mixer/BussBass:out-1"   "Non-Mixer/AllMusic:in-1" &
jack_connect  "Non-Mixer/BussBass:out-2"   "Non-Mixer/AllMusic:in-2"   &

jack_connect  "Non-Mixer/BussDrums:out-1"   "Non-Mixer/AllMusic:in-1" &
jack_connect  "Non-Mixer/BussDrums:out-2"   "Non-Mixer/AllMusic:in-2"   &

jack_connect  "Non-Mixer/BussGuitars:out-1"   "Non-Mixer/AllMusic:in-1" &
jack_connect  "Non-Mixer/BussGuitars:out-2"   "Non-Mixer/AllMusic:in-2"   &

jack_connect  "Non-Mixer/BussKeys:out-1"   "Non-Mixer/AllMusic:in-1" &
jack_connect  "Non-Mixer/BussKeys:out-2"   "Non-Mixer/AllMusic:in-2"   &

# Subbus to AllFX

jack_connect  "Non-Mixer/BussDelays:out-1"   "Non-Mixer/AllFX:in-1" &
jack_connect  "Non-Mixer/BussDelays:out-2"   "Non-Mixer/AllFX:in-2"   &

jack_connect  "Non-Mixer/ZitaVerb:aux-B/out-1"   "Non-Mixer/AllFX:in-1" &
jack_connect  "Non-Mixer/ZitaVerb:aux-B/out-2"   "Non-Mixer/AllFX:in-2"   &

# All_buss to Main Out

jack_connect  "Non-Mixer/AllFX:out-1"   "Non-Mixer/Main Out:in-1" &
jack_connect  "Non-Mixer/AllFX:out-2"   "Non-Mixer/Main Out:in-2"   &

jack_connect  "Non-Mixer/AllMusic:out-1"   "Non-Mixer/Main Out:in-1" &
jack_connect  "Non-Mixer/AllMusic:out-2"   "Non-Mixer/Main Out:in-2"   &

jack_connect  "Non-Mixer/AllVocals:out-1"   "Non-Mixer/Main Out:in-1" &
jack_connect  "Non-Mixer/AllVocals:out-2"   "Non-Mixer/Main Out:in-2"   &

sleep 4

##########################################################################################
#
#  To Out Headphone 3+4 5+6 7+8
#
##########################################################################################

jack_connect  "Non-Mixer/Main Out:out-1"   "Non-Mixer/HeadPhone:in-1"   &
jack_connect  "Non-Mixer/Main Out:out-2"   "Non-Mixer/HeadPhone:in-2"   &

jack_connect  "Non-Mixer/Main Out:aux-B/out-1"   "Non-Mixer/Out_3:in-1"   &
jack_connect  "Non-Mixer/Main Out:aux-B/out-2"   "Non-Mixer/Out_3:in-1"   &

jack_connect  "Non-Mixer/Main Out:aux-E/out-1"   "Non-Mixer/Out_4:in-1"   &
jack_connect  "Non-Mixer/Main Out:aux-E/out-2"   "Non-Mixer/Out_4:in-1"   &

#jack_connect  "Non-Mixer/Main Out:aux-B/out-1"   "Non-Mixer/Out_3+4:in-1"   &
#jack_connect  "Non-Mixer/Main Out:aux-B/out-2"   "Non-Mixer/Out_3+4:in-2"   &
#jack_connect  "Non-Mixer/BussKeys:aux-A/out-1"   "Non-Mixer/Out_3+4:in-1"   &
#jack_connect  "Non-Mixer/BussKeys:aux-A/out-2"   "Non-Mixer/Out_3+4:in-2"   &

jack_connect  "Non-Mixer/Main Out:aux-C/out-1"   "Non-Mixer/Out_5+6:in-1"   &
jack_connect  "Non-Mixer/Main Out:aux-C/out-2"   "Non-Mixer/Out_5+6:in-2"   &
jack_connect  "Non-Mixer/BussDrums:aux-A/out-1"   "Non-Mixer/Out_5+6:in-1"   &
jack_connect  "Non-Mixer/BussDrums:aux-A/out-2"   "Non-Mixer/Out_5+6:in-2"   &

jack_connect  "Non-Mixer/Main Out:aux-D/out-1"   "Non-Mixer/Out_7+8:in-1"   &
jack_connect  "Non-Mixer/Main Out:aux-D/out-2"   "Non-Mixer/Out_7+8:in-2"   &
jack_connect  "Non-Mixer/AllVocals:aux-A/out-1"   "Non-Mixer/Out_7+8:in-1"   &
jack_connect  "Non-Mixer/AllVocals:aux-A/out-2"   "Non-Mixer/Out_7+8:in-2"   &


############################################################################################
#
#  From mixer   to hardware outputs, to timeline,    to guitarix
#
############################################################################################

#    mixer :: to hardware outputs

jack_connect   "Non-Mixer/HeadPhone:out-1" system:playback_1  &
jack_connect   "Non-Mixer/HeadPhone:out-2" system:playback_2  &

#jack_connect   "Non-Mixer/Out_3+4:out-1" system:playback_3  &
#jack_connect   "Non-Mixer/Out_3+4:out-2" system:playback_4  &

jack_connect   "Non-Mixer/Out_3:out-1" system:playback_3  &
jack_connect   "Non-Mixer/Out_4:out-1" system:playback_4  &

jack_connect   "Non-Mixer/Out_5+6:out-1" system:playback_5 &
jack_connect   "Non-Mixer/Out_5+6:out-2" system:playback_6  &

jack_connect   "Non-Mixer/Out_7+8:out-1" system:playback_7 &
jack_connect   "Non-Mixer/Out_7+8:out-2" system:playback_8  &

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

# Guitar1,2,3    :: timeline
jack_connect  "Non-Mixer/Guitar1:aux-B/out-1"       "Non-Timeline:Guitar1/in-1"     &
jack_connect  "Non-Mixer/Guitar1:aux-B/out-2"       "Non-Timeline:Guitar1/in-2"     &
jack_connect  "Non-Mixer/Guitar2:aux-B/out-1"       "Non-Timeline:Guitar2/in-1"     &
jack_connect  "Non-Mixer/Guitar2:aux-B/out-2"       "Non-Timeline:Guitar2/in-2"     &
jack_connect  "Non-Mixer/Guitar3:aux-B/out-1"       "Non-Timeline:Guitar3/in-1"     &
jack_connect  "Non-Mixer/Guitar3:aux-B/out-2"       "Non-Timeline:Guitar3/in-2"     &

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


jack_connect "a2j:SWISSONIC EasyKeys61 [20] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi-01:midi in"     &
jack_connect "a2j:SWISSONIC EasyKeys61 [24] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi-01:midi in"   &
jack_connect "a2j:SWISSONIC EasyKeys61 [28] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi-01:midi in"  &
jack_connect "a2j:SWISSONIC EasyKeys61 [32] (capture): SWISSONIC EasyKeys61 MIDI 1" "yoshimi-01:midi in"   &

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


jack_connect "a2j:Swissonic 88 [20] (capture): Swissonic 88 MIDI 1" "yoshimi-01:midi in"     &
jack_connect "a2j:Swissonic 88 [24] (capture): Swissonic 88 MIDI 1" "yoshimi-01:midi in"    &
jack_connect "a2j:Swissonic 88 [28] (capture): Swissonic 88 MIDI 1" "yoshimi-01:midi in"    &
jack_connect "a2j:Swissonic 88 [32] (capture): Swissonic 88 MIDI 1" "yoshimi-01:midi in"    &

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
sleep 5
#/home/arthurx/Audio_Settings_Samples/Scripts/make_jack_output_connections_to_tascam.py connect &
sleep 5
#/home/arthurx/Audio_Settings_Samples/Scripts/start_headphone_rob.py  &
sleep 5
#/home/arthurx/Audio_Settings_Samples/Scripts/start_headphone_Bass.py  &
sleep 5
#/home/arthurx/Audio_Settings_Samples/Scripts/start_headphone_Horn.py  &


