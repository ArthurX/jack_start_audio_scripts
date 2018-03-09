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
  output_connections = [("Non-Mixer/HeadPhone:out-1", "system:playback_1"),
                        ("Non-Mixer/HeadPhone:out-2", "system:playback_2"),
                 ("Non-Mixer/BassPhone:out-1", "system:playback_3"),
                 ("Non-Mixer/BassPhone:out-2", "system:playback_4"),
                 ("Non-Mixer/RobPhone:out-1", "system:playback_5"),
                 ("Non-Mixer/RobPhone:out-2", "system:playback_6"),
                 ("Non-Mixer/HornPhone:out-1", "system:playback_7"),
                 ("Non-Mixer/HornPhone:out-2", "system:playback_8"),

                        ]



  stage_connections = [("Non-Mixer/HeadPhone:out-1", "system:playback_1"),
                 ("Non-Mixer/HeadPhone:out-2", "system:playback_2"),
                 ("Non-Mixer/KeysAll:out-1", "system:playback_3"),       # piano to output 3 and 4
                 ("Non-Mixer/KeysAll:out-2", "system:playback_4"),
                 ("Non-Mixer/Voice:out-1", "system:playback_5"),           # voice  to  5
                 ("Non-Mixer/Drum:out-1", "system:playback_6"),            # drum   to  6
                 ("Non-Mixer/ZitaVerb:out-1", "system:playback_7"),        # zita verb to 7 8
                 ("Non-Mixer/ZitaVerb:out-2", "system:playback_8")]



  args = sys.argv[1:]

  if not args:
    print 'usage: choose connect or disconnect '
    sys.exit(1)

  if args[0] == "connect" :   
    make_jack_connect(output_connections)
    print "Connect jack to tascam outputs"

  if args[0] == "disconnect" :
    make_jack_disconnect(output_connections)
    print "Disconnect jack to tascam outputs"   



if __name__ == '__main__':
  main()
