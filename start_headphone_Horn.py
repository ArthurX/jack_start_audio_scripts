#!/usr/bin/python -tt

# to start jack connections for studio use

import sys
import commands

def make_jack_connect(connections):



  for connect in connections:
    cmd = 'jack_connect "' + connect[0] + '" "' + connect[1] + '"'
    print 'command to run:' , cmd
    (status, output) = commands.getstatusoutput(cmd)
    if status:    ## Error case, print the command's output to stderr and exit
      sys.stderr.write(output)
#      sys.exit(1)
    print output  ## Otherwise do something with the command's output

def make_jack_disconnect(connections):



  for connect in connections:
    cmd = 'jack_disconnect "' + connect[0] + '" "' + connect[1] + '"'
    print 'command to run:' , cmd
    (status, output) = commands.getstatusoutput(cmd)
    if status:    ## Error case, print the command's output to stderr and exit
      sys.stderr.write(output)
#      sys.exit(1)
    print output  ## Otherwise do something with the command's output






def main():
  Horn_connections = [
                 # inputs
                 ("Non-Mixer/KeysAll:out-1", "Non-Mixer/HornPiano:in-1"),
                 ("Non-Mixer/KeysAll:out-2", "Non-Mixer/HornPiano:in-2"),
                 ("Non-Mixer/Bass:out-1", "Non-Mixer/HornBass:in-1"),
                 ("Non-Mixer/Bass:out-2", "Non-Mixer/HornBass:in-2"),
                 ("Non-Mixer/Drum:out-1", "Non-Mixer/HornDrum:in-1"),
                 ("Non-Mixer/Drum:out-2", "Non-Mixer/HornDrum:in-2"),
                 ("Non-Mixer/DrumEllo:out-1", "Non-Mixer/HornDrumEllo:in-1"),
                 ("Non-Mixer/DrumEllo:out-2", "Non-Mixer/HornDrumEllo:in-2"),
                 ("Non-Mixer/Voice:out-1", "Non-Mixer/HornVoice1:in-1"),
                 ("Non-Mixer/Voice:out-2", "Non-Mixer/HornVoice1:in-2"),
                 ("Non-Mixer/Voice2:out-1", "Non-Mixer/HornHorn:in-1"),
                 ("Non-Mixer/Voice2:out-2", "Non-Mixer/HornHorn:in-2"),
                 ("Non-Mixer/Guitarix:out-1", "Non-Mixer/HornGuitarix:in-1"),
                 ("Non-Mixer/Guitarix:out-2", "Non-Mixer/HornGuitarix:in-2"),
                 ("Non-Mixer/Main Out:out-1", "Non-Mixer/HornMainMix:in-1"),
                 ("Non-Mixer/Main Out:out-2", "Non-Mixer/HornMainMix:in-2"),

                  # internal
                 ( "Non-Mixer/HornPiano:out-1","Non-Mixer/HornPhone:in-1" ),
                 ("Non-Mixer/HornPiano:out-2","Non-Mixer/HornPhone:in-2" ),
                ("Non-Mixer/HornHorn:out-1","Non-Mixer/HornPhone:in-1" ),
                 ( "Non-Mixer/HornHorn:out-2", "Non-Mixer/HornPhone:in-2"),
                 ("Non-Mixer/HornDrum:out-1","Non-Mixer/HornPhone:in-1" ),
                 ( "Non-Mixer/HornDrum:out-2", "Non-Mixer/HornPhone:in-2"),
                 ("Non-Mixer/HornDrumEllo:out-1","Non-Mixer/HornPhone:in-1" ),
                 ( "Non-Mixer/HornDrumEllo:out-2", "Non-Mixer/HornPhone:in-2"),
                 ( "Non-Mixer/HornMainMix:out-1", "Non-Mixer/HornPhone:in-1"),
                 ("Non-Mixer/HornMainMix:out-2", "Non-Mixer/HornPhone:in-2"),
                 ("Non-Mixer/HornVoice1:out-1","Non-Mixer/HornPhone:in-1" ),
                 ( "Non-Mixer/HornVoice1:out-2", "Non-Mixer/HornPhone:in-2"),
                 ( "Non-Mixer/HornGuitarix:out-1", "Non-Mixer/HornPhone:in-1"),
                 ("Non-Mixer/HornGuitarix:out-2", "Non-Mixer/HornPhone:in-2"),
                 ( "Non-Mixer/HornBass:out-1", "Non-Mixer/HornPhone:in-1"),
                 ("Non-Mixer/HornBass:out-2", "Non-Mixer/HornPhone:in-2"),

                  #outputs in make_jack_output_connections_to_tascam.py

                 ]



  make_jack_connect(Horn_connections)

  print "Horn Mixer to 7 8"


if __name__ == '__main__':
  main()
