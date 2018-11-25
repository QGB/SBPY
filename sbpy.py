#coding=utf-8
from __future__ import print_function,absolute_import
import sys,os
from io import open,StringIO
def printty(*a):
	if os.isatty(1):
		print(*a)

def detect_encoding(pyFile):
	from lib2to3.pgen2 import tokenize
	f=open(pyFile,'rb')
	return tokenize.detect_encoding(f.readline)[0]
	
def readlines(pyFile):
	f=open(pyFile,mode='r',encoding=detect_encoding(pyFile)) 
	return f.readlines()

r'''
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
 ! #$  '( *+,-./0123456789:; = ?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\] _`abcdefghijklmnopqrstuvwxyz{ }~
  "  %&  )                  < >                               ^                             |  
")			^
&<>^|		^^^
%			%
'''	
gdBatch={
	0:u'@echo off\n(\necho ###### SBPY by QGB ###### this line can not be deleted and unable to append any char (^)\n',
	-1:u'echo ###### this line can not be deleted\n)|python \n',# -c "import sys;print '[',sys.stdin.read(-1),']'"
	')':u'^)'  ,
	'"':u'^^^"'  ,
	'&':u'^^^&',
	'<':u'^^^<',
	'>':u'^^^>',
	'^':u'^^^^',
	'|':u'^^^|',
	'%':u'%%'   }
# [32-126]  95  95-8=87 default -base86
def convert(pyFile):
	'中文测试'
	r=StringIO()
	lines=readlines(pyFile)
	if os.name=='nt':
		# isRParen=False
		r.write(gdBatch[0])
		for i,line in enumerate(lines):
			if not line.strip():continue
			# if isRParen or u')' in line:isRParen=True
			r.write(u'echo ')
			for c in line:
				if c in gdBatch:
					r.write(gdBatch[c])
				else:r.write(c)
			# if i+1==len(lines):
				# if not isRParen:r.write('echo #^)')
			# r.write(u'\n')	
		if c!='\n':r.write(u'\n')
		r.write(gdBatch[-1].format(os.path.splitext(pyFile)[0] ))
		r.seek(0)
		return r.read()
def help():
	print('''Useage: sbpy source.py\n sys.argv =''',sys.argv)
	os._exit(0)
if __name__=='__main__':
	if sys.argv==['']:
		import psutil
		ppid=psutil.Process(os.getpid()).ppid()
		sys.argv=psutil.Process(ppid).cmdline()
		# import sys;'qgb.U' in sys.modules or sys.path.append('G:/QGB/babun/cygwin/lib/python2.7/');from qgb import *
		# import IPython;IPython.embed()
		# U.msgbox()
	if len(sys.argv)<2:
		help()
	needHelp=True
	for f in sys.argv[1:]:
		if f.lower().endswith('.py'):
			r=convert(f)
			f=f[:-3]
			if os.path.exists(f):f+='.sbpy'
			if os.name=='nt':f+='.bat'
			with open(f,'w') as o:
				o.write(r)
				print('sbpy successfully created {}'.format(f))
			needHelp=False
	if needHelp:help()
	