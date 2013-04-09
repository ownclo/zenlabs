import numpy as np
import sys
from StringIO import StringIO

def read(string):
    result = []
    blocks = string.split("\n\n\n")
    for block in blocks:
        result.append(np.loadtxt(StringIO(block)).T)
    return result

def write(table, out=sys.stdout):
    table = table.T
    out.write(plaintext(table))

def table(rows):
    return np.vstack(rows)

def plaintext(table):
    rows = []
    for row in table:
        rows += [' '.join([str(i) for i in row])]
    res = '\n'.join(rows)
    return res
