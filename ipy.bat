@echo off
(
echo ###### SBPY by QGB ###### this line can not be deleted and unable to append any char (^)
echo import sys,os,io
echo from ctypes import windll
echo import psutil
echo ppid=psutil.Process(os.getpid(^)^).ppid(^)
echo # ConIO = io._WindowsConsoleIO
echo k=windll.kernel32
echo windll.user32.MessageBoxA(None,' 0 ','title',0^)
echo k.AllocConsole(^)
echo sys.stdin=open(^^^"CONIN$^^^"^)
echo sys.stdout=open(^^^"CONOUT$^^^", ^^^"w^^^"^)
echo sys.stderr=open(^^^"CONOUT$^^^", ^^^"w^^^"^)
echo print('1111111111'^)
echo s=raw_input(^)
echo print(repr(s^)^)
echo # stdout.flush(^)
echo import IPython
echo IPython.embed(^)
echo os.system('pause'^)
echo windll.user32.MessageBoxA(None,'       ','title',0^)
echo import pdb
echo pdb.set_trace(^)
echo import IPython;IPython.embed(^)
echo print(23333^)
echo ###### this line can not be deleted
)|python 
