#!/usr/bin/python -tt

import sys
import liblo


class TranslateOSC:

    def callback(self, path, args, types, src):
        arg = None
        # loop through arguments and print them
        for a, t in zip(args, types):
            if t == 'f':
                arg = a
        if(arg != None):
            msg = liblo.Message(path)
            msg.add(int(arg*127))
            try:
                liblo.send(self.addr, msg)
            except:
                sys.exit(0)

    def __init__(self, in_port, out_port):
        # create server object
        try:
            self.server = liblo.Server(in_port)
        except liblo.ServerError as err:
            sys.exit(str(err))

        self.addr = "osc.udp://localhost:" + str(out_port) + "/"

        print("listening on URL: " + self.server.get_url())
        print("sending   to URL: " + self.addr)

        # register callback function for all messages
        self.server.add_method(None, None, self.callback)

    def run(self):
        # just loop and dispatch messages every 10ms
        while True:
            self.server.recv(10)


# display help
if len(sys.argv) != 3:
    sys.exit("Usage: " + sys.argv[0] + " port-in port-out")

app = TranslateOSC(sys.argv[1], sys.argv[2])
try:
    app.run()
except KeyboardInterrupt:
    del app


