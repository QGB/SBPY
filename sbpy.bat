@echo off
(
echo ###### SBPY by QGB ###### this line can not be deleted and unable to append any char (^)
echo #coding=utf-8
echo from __future__ import print_function,absolute_import
echo import sys,os
echo from io import open,StringIO
echo def printty(*a^):
echo 	if os.isatty(1^):
echo 		print(*a^)
echo def detect_encoding(pyFile^):
echo 	from lib2to3.pgen2 import tokenize
echo 	f=open(pyFile,'rb'^)
echo 	return tokenize.detect_encoding(f.readline^)[0]
echo def readlines(pyFile^):
echo 	f=open(pyFile,mode='r',encoding=detect_encoding(pyFile^)^) 
echo 	return f.readlines(^)
echo r'''
echo  !^^^"#$%%^^^&'(^)*+,-./0123456789:;^^^<=^^^>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^^^^_`abcdefghijklmnopqrstuvwxyz{^^^|}~
echo  ! #$  '( *+,-./0123456789:; = ?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\] _`abcdefghijklmnopqrstuvwxyz{ }~
echo   ^^^"  %%^^^&  ^)                  ^^^< ^^^>                               ^^^^                             ^^^|  
echo ^^^"^)			^^^^
echo ^^^&^^^<^^^>^^^^^^^|		^^^^^^^^^^^^
echo %%			%%
echo '''	
echo gdBatch={
echo 	0:u'@echo off\n(\necho ###### SBPY by QGB ###### this line can not be deleted and unable to append any char (^^^^^)\n',
echo 	-1:u'echo ###### this line can not be deleted\n^)^^^|python \n',# -c ^^^"import sys;print '[',sys.stdin.read(-1^),']'^^^"
echo 	'^)':u'^^^^^)'  ,
echo 	'^^^"':u'^^^^^^^^^^^^^^^"'  ,
echo 	'^^^&':u'^^^^^^^^^^^^^^^&',
echo 	'^^^<':u'^^^^^^^^^^^^^^^<',
echo 	'^^^>':u'^^^^^^^^^^^^^^^>',
echo 	'^^^^':u'^^^^^^^^^^^^^^^^',
echo 	'^^^|':u'^^^^^^^^^^^^^^^|',
echo 	'%%':u'%%%%'   }
echo def convert(pyFile^):
echo 	'÷–Œƒ≤‚ ‘'
echo 	r=StringIO(^)
echo 	lines=readlines(pyFile^)
echo 	if os.name=='nt':
echo 		# isRParen=False
echo 		r.write(gdBatch[0]^)
echo 		for i,line in enumerate(lines^):
echo 			if not line.strip(^):continue
echo 			# if isRParen or u'^)' in line:isRParen=True
echo 			r.write(u'echo '^)
echo 			for c in line:
echo 				if c in gdBatch:
echo 					r.write(gdBatch[c]^)
echo 				else:r.write(c^)
echo 			# if i+1==len(lines^):
echo 				# if not isRParen:r.write('echo #^^^^^)'^)
echo 			# r.write(u'\n'^)	
echo 		if c!='\n':r.write(u'\n'^)
echo 		r.write(gdBatch[-1].format(os.path.splitext(pyFile^)[0] ^)^)
echo 		r.seek(0^)
echo 		return r.read(^)
echo def help(^):
echo 	print('''Useage: sbpy source.py\n sys.argv =''',sys.argv^)
echo 	os._exit(0^)
echo if __name__=='__main__':
echo 	if sys.argv==['']:
echo 		import psutil
echo 		ppid=psutil.Process(os.getpid(^)^).ppid(^)
echo 		sys.argv=psutil.Process(ppid^).cmdline(^)
echo 		# import sys;'qgb.U' in sys.modules or sys.path.append('G:/QGB/babun/cygwin/lib/python2.7/'^);from qgb import *
echo 		# import IPython;IPython.embed(^)
echo 		# U.msgbox(^)
echo 	if len(sys.argv^)^^^<2:
echo 		help(^)
echo 	needHelp=True
echo 	for f in sys.argv[1:]:
echo 		if f.lower(^).endswith('.py'^):
echo 			r=convert(f^)
echo 			f=f[:-3]
echo 			if os.path.exists(f^):f+='.sbpy'
echo 			if os.name=='nt':f+='.bat'
echo 			with open(f,'w'^) as o:
echo 				o.write(r^)
echo 				print('sbpy successfully created {}'.format(f^)^)
echo 			needHelp=False
echo 	if needHelp:help(^)
echo ###### this line can not be deleted
)|python 
