import os

with os.fdopen(3, 'r') as fp:
  for line in fp:
    print line,