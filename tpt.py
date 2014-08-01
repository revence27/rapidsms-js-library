#!  /usr/bin/env python

import os
import sys
from jinja2 import Environment, FileSystemLoader
import settings

def mmain(argv):
  if len(argv) < 3:
    sys.stderr.write('%s templatedir file1 [file2 ...]\r\n' % (argv[0], ))
  app, tdir = argv[0], argv[1]
  jinja = Environment(loader = FileSystemLoader(app))
  for arg in argv[2:]:
    with jinja.get_template(arg) as fch:
      raise Exception, str(fch)
  pass

if __name__ == '__main__':
        sys.exit(mmain(sys.argv))
