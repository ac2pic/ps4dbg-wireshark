#!/usr/bin/env python
import os

master_lua = ""


read_order = [
    'cmds',
    'global_init',
    'util',
] + list(map(lambda name: 'sub/{}'.format(name.replace('.lua', '')), os.listdir('src/sub'))) + [
    'dissector_table',
    'main'
]

for script in read_order:
    with open('src/{}.lua'.format(script), 'r') as global_init:
        master_lua += global_init.read() + '\n'
with open('ps4debug.lua', 'w') as outFile:
    outFile.write(master_lua)