# CREATING NEW LAB
#zenlabs new box

cd box

# GENERATING TABLE
#zenlabs generate table inp.dat rule1.py
#zenlabs add table inp_rule1.dat

# GENERATING PLOT
zenlabs generate plot inp_rule1.dat "1:3,4:5"
#zenlabs add plot inp_rule1_plot.pdf

## NOTE ##
# there are 'add table' and 'add plot',
# so we need a little bit of a structure in our ZenLabs
# script.
