#!/usr/bin/env python
import argparse, sys

parser = argparse.ArgumentParser()
parser.add_argument('inp', nargs='?')
parser.add_argument('out', nargs='?')
args = parser.parse_args()

if args.inp:
    string = open(args.inp).read()
elif not sys.stdin.isatty():
    string = sys.stdin.read()
else:
    parser.print_help()
    exit(0)

if args.out:
    out = args.out
else:
    out = sys.stdout

sys.path.append('templates/tables/processor/')
from tables import *

dat = read(string)

#<<-- INSERT YOUR RULES HERE -->>

outp = open(out, 'w')
write(new_table, outp)
