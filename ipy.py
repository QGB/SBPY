import sys,os,io
from ctypes import windll
import psutil
ppid=psutil.Process(os.getpid()).ppid()
# ConIO = io._WindowsConsoleIO

k=windll.kernel32
windll.user32.MessageBoxA(None,' 0 ','title',0)
k.AllocConsole()
sys.stdin=open("CONIN$")
sys.stdout=open("CONOUT$", "w")
sys.stderr=open("CONOUT$", "w")



print('1111111111')
s=raw_input()
print(repr(s))
# stdout.flush()
import IPython
IPython.embed()
os.system('pause')

windll.user32.MessageBoxA(None,'       ','title',0)







import pdb
pdb.set_trace()
import IPython;IPython.embed()
print(23333)