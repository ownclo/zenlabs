# CREATING NEW LAB
zenlabs new box

cd box

# GENERATING TABLE
zenlabs generate table inp.dat rule1.py
zenlabs add table inp_rule1.dat

# GENERATING PLOTS
#zenlabs generate plot SOURCE_TABLE_NAME [FIELDS]
#zenlabs add plot [SECTION=plots]

## NOTE ##
# there are 'add table' and 'add plot',
# so we need a little bit of a structure in our ZenLabs
# script.
