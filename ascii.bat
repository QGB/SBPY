@echo off
(
echo ###### SBPY by QGB ######this line can not be deleted and unable to append any char (^)
echo print r'''  !^^^"#$%%'''   #"
echo ###### this line can not be deleted
)|python
 @REM -c "import sys;print '[',sys.stdin.read(-1),']'"
