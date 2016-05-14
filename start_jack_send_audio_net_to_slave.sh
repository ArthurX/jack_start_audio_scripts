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

killall qsampler 

sleep 10
# inputs from mixer to slave
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 1_in" RoseWoodSamDebian:to_slave_1  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 2_in" RoseWoodSamDebian:to_slave_2  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 3_in" RoseWoodSamDebian:to_slave_3  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 5_in" RoseWoodSamDebian:to_slave_5  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 11_in" RoseWoodSamDebian:to_slave_11  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 12_in" RoseWoodSamDebian:to_slave_12  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 13_in" RoseWoodSamDebian:to_slave_13  &
jack_connect "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Ch 14_in" RoseWoodSamDebian:to_slave_14  &


# outputs from slave to mixer
jack_connect  RoseWoodSamDebian:from_slave_1  "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Out L_out"   &
jack_connect  RoseWoodSamDebian:from_slave_2  "firewire_pcm:00149600000002e1_Phonic HB 18 FireWire Out R_out"   &




