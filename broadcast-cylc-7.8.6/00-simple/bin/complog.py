#!/usr/bin/python2

import os
import shlex
import sys
from distutils import command

from cylc.cylc_subproc import procopen

print
print "This is the broadcast test suite log comparator"

event, suite = sys.argv[1], sys.argv[2]
if event != 'shutdown':
    raise SystemExit("ERROR: run this as a shutdown event handler")

try:
    log_dir = os.path.expandvars(os.environ['CYLC_SUITE_LOG_DIR'])
    suite_dir = os.path.expandvars(os.environ['CYLC_SUITE_DEF_PATH'])
except KeyError, x:
    raise SystemExit(x)

ref = os.path.join(suite_dir, 'broadcast.ref')
log = os.path.join(suite_dir, 'broadcast.log')

fref = open(ref, 'r')
flog = open(log, 'r')

reflines = fref.readlines()
loglines = flog.readlines()

reflines.sort()
loglines.sort()

if reflines != loglines:
    sys.exit("ERROR: broadcast logs do not compare")
else:
    print "broadcast logs compare OK"

res = procopen(["cylc check-triggering " + event + " " + suite], usesh=True)
status = res.wait()
if status != 0:
    sys.exit(1)
