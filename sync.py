import sys
import os
import signal

import inotify.adapters
import dirsync

EDIT_EVENTS = ["IN_DELETE", "IN_MOVED_FROM", "IN_MOVED_TO", "IN_CLOSE_WRITE"]

g_target = None
g_src = None
g_killed = False

def kill(signum, frame):
    global g_killed
    if not g_killed:
        g_killed = True
        if g_src and g_target:
            print("Killed, syncing one last time")
            dirsync.sync(g_src, g_target, "sync", create=False, purge=True, verbose=True)
        exit(0)

#test
def watch(src, target, pull=False):
    if pull:
        print("Pulling target")
        dirsync.sync(target, src, "sync", create=True, purge=True, verbose=True)
    i = inotify.adapters.InotifyTree(src)
    for e in i.event_gen(yield_nones=False):
        #print(e[1], e[2], e[3])
        if any([event in e[1] for event in EDIT_EVENTS]):
            print(e)
            dirsync.sync(src, target, "sync", create=False, purge=True, verbose=True)

if __name__ == "__main__":
    PULL_STR = "--pull"
    if len(sys.argv) < 3:
        print("{} DIR1 DIR2 [{}]".format(sys.argv[0], PULL_STR))
        exit(-1)
    d1 = sys.argv[1]
    d2 = sys.argv[2]
    pull = False
    if len(sys.argv) > 3:
        if sys.argv[3] == PULL_STR:
            pull = True
        else:
            print("did you mean {}?".format(PULL_STR))
            exit(-1)
    if (not os.path.isdir(d1)) or (not os.path.isdir(d2)):
        print("Bad directories {} {}".format(d1, d2))
        exit(-1)

    signal.signal(signal.SIGINT, kill)
    signal.signal(signal.SIGTERM, kill)
    g_src = d1
    g_target = d2
    watch(d1, d2, pull=pull)

