# https://www.youtube.com/playlist?list=PLhDuUim9RB83wdVkX8omALVkYZ-1kYp1c

# -*- coding: utf-8 -*-

import datetime
import os
import optparse


parser = optparse.OptionParser()
date = datetime.datetime.now().strftime("%m_%d_%Y___%H_%M_%S")

parser.add_option('-d', '--outdir', help="Report output directory", default=f"test_cases/{date}")
parser.add_option('-f', '--testfolder', help="query string", default="test_cases")

options, args = parser.parse_args()

cmd = "robot -d %s %s" % (options.outdir, options.testfolder)

print(f'cmd: {cmd}')
print(f'options: {options}')
print(f'args: {args}')

os.system(cmd)
