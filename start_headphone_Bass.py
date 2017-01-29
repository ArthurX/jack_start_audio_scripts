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
                 ("Non-Mixer/KeysAll:out-1", "Non-Mixer/BassPiano:in-1"),
                 ("Non-Mixer/KeysAll:out-2", "Non-Mixer/BassPiano:in-2"),
                 ("Non-Mixer/Bass:out-1", "Non-Mixer/BassBass:in-1"),
                 ("Non-Mixer/Bass:out-2", "Non-Mixer/BassBass:in-2"),
                 ("Non-Mixer/Drum:out-1", "Non-Mixer/BassDrum:in-1"),
                 ("Non-Mixer/Drum:out-2", "Non-Mixer/BassDrum:in-2"),
                 ("system:capture_15", "Non-Mixer/BassDrum:in-1"),
                 ("system:capture_16", "Non-Mixer/BassDrum:in-2"),
                 ("Non-Mixer/Voice:out-1", "Non-Mixer/BassVoice:in-1"),
                 ("Non-Mixer/Voice:out-2", "Non-Mixer/BassVoice:in-2"),
                 ("Non-Mixer/Guitarix:out-1", "Non-Mixer/BassGuitarix:in-1"),
                 ("Non-Mixer/Guitarix:out-2", "Non-Mixer/BassGuitarix:in-2"),
                 ("Non-Mixer/Main Out:out-1", "Non-Mixer/BassMainMix:in-1"),
                 ("Non-Mixer/Main Out:out-2", "Non-Mixer/BassMainMix:in-2"),

                  # internal
                 ( "Non-Mixer/BassPiano:out-1","Non-Mixer/BassPhone:in-1" ),
                 ("Non-Mixer/BassPiano:out-2","Non-Mixer/BassPhone:in-2" ),
                ("Non-Mixer/BassBass:out-1","Non-Mixer/BassPhone:in-1" ),
                 ( "Non-Mixer/BassBass:out-2", "Non-Mixer/BassPhone:in-2"),
                 ("Non-Mixer/BassDrum:out-1","Non-Mixer/BassPhone:in-1" ),
                 ( "Non-Mixer/BassDrum:out-2", "Non-Mixer/BassPhone:in-2"),
                 ( "Non-Mixer/BassMainMix:out-1", "Non-Mixer/BassPhone:in-1"),
                 ("Non-Mixer/BassMainMix:out-2", "Non-Mixer/BassPhone:in-2"),
                 ("Non-Mixer/BassVoice:out-1","Non-Mixer/BassPhone:in-1" ),
                 ( "Non-Mixer/BassVoice:out-2", "Non-Mixer/BassPhone:in-2"),
                 ( "Non-Mixer/BassGuitarix:out-1", "Non-Mixer/BassPhone:in-1"),
                 ("Non-Mixer/BassGuitarix:out-2", "Non-Mixer/BassPhone:in-2"),

                  #outputs
                 ("Non-Mixer/BassPhone:out-1", "system:playback_3"),
                 ("Non-Mixer/BassPhone:out-2", "system:playback_4"),
                 ]



  make_jack_connect(Rob_connections)

  print "piano to output 3 and 4 \n voice  to  5   \n  drum   to  6  \n zita verb to 7 8"


if __name__ == '__main__':
  main()
