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
  Rob_connections = [
                 # inputs
                 ("Non-Mixer/KeysAll:out-1", "Non-Mixer/RobPiano:in-1"),
                 ("Non-Mixer/KeysAll:out-2", "Non-Mixer/RobPiano:in-2"),
                 ("Non-Mixer/Voice:out-1", "Non-Mixer/RobVoice:in-1"),
                 ("Non-Mixer/Voice:out-2", "Non-Mixer/RobVoice:in-2"),
                 ("Non-Mixer/Bass:out-1", "Non-Mixer/RobBass:in-1"),
                 ("Non-Mixer/Bass:out-2", "Non-Mixer/RobBass:in-2"),
                 ("Non-Mixer/Guitarix:out-1", "Non-Mixer/RobGuitarix:in-1"),
                 ("Non-Mixer/Guitarix:out-2", "Non-Mixer/RobGuitarix:in-2"),
                 ("Non-Mixer/Drum:out-1", "Non-Mixer/RobDrum:in-1"),
                 ("Non-Mixer/Drum:out-2", "Non-Mixer/RobDrum:in-2"),
                 ("Non-Mixer/DrumEllo:out-1", "Non-Mixer/RobDrumEllo:in-1"),
                 ("Non-Mixer/DrumEllo:out-2", "Non-Mixer/RobDrumEllo:in-2"),
                 ("Non-Mixer/Main Out:out-1", "Non-Mixer/RobMainMix:in-1"),
                 ("Non-Mixer/Main Out:out-2", "Non-Mixer/RobMainMix:in-2"),

                  # internal
                 ( "Non-Mixer/RobVoice:out-1","Non-Mixer/RobPhone:in-1" ),
                 ("Non-Mixer/RobVoice:out-2","Non-Mixer/RobPhone:in-2" ),
                 ( "Non-Mixer/RobPiano:out-1","Non-Mixer/RobPhone:in-1" ),
                 ("Non-Mixer/RobPiano:out-2","Non-Mixer/RobPhone:in-2" ),
                 ( "Non-Mixer/RobGuitarix:out-1","Non-Mixer/RobPhone:in-1" ),
                 ("Non-Mixer/RobGuitarix:out-2","Non-Mixer/RobPhone:in-2" ),
                 ( "Non-Mixer/RobBass:out-1","Non-Mixer/RobPhone:in-1" ),
                 ("Non-Mixer/RobBass:out-2","Non-Mixer/RobPhone:in-2" ),
                 ("Non-Mixer/RobDrum:out-1","Non-Mixer/RobPhone:in-1" ),
                 ( "Non-Mixer/RobDrum:out-2", "Non-Mixer/RobPhone:in-2"),
                 ("Non-Mixer/RobDrumEllo:out-1","Non-Mixer/RobPhone:in-1" ),
                 ( "Non-Mixer/RobDrumEllo:out-2", "Non-Mixer/RobPhone:in-2"),
                 ( "Non-Mixer/RobMainMix:out-1", "Non-Mixer/RobPhone:in-1"),
                 ("Non-Mixer/RobMainMix:out-2", "Non-Mixer/RobPhone:in-2"),

                  #outputs  in make_jack_output_connections_to_tascam.py

                 ]



  make_jack_connect(Rob_connections)

  print "piano to output 3 and 4 \n voice  to  5   \n  drum   to  6  \n zita verb to 7 8"


if __name__ == '__main__':
  main()
