#!  /usr/bin/env python

import os
import sys
from jinja2 import Environment, FileSystemLoader
import settings

def mmain(argv):
  if len(argv) < 3:
    sys.stderr.write('%s templatedir file1 [file2 ...]\r\n' % (argv[0], ))
    return 1
  tdir = argv[1]
  jinja = Environment(loader = FileSystemLoader(tdir))
  for arg in argv[2:]:
    tempt = jinja.get_template(arg)
    dats  = settings.generate_test_data()
    sys.stdout.write(tempt.render(dats).encode('utf-8'))
  return 0

if __name__ == '__main__':
  sys.exit(mmain(sys.argv))
