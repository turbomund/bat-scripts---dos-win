::save as "timeBtwn.bat"
::usage --> timeBtwn hr1 mn1 sc1 hr2 mn2 sc2
::ex --> timeBtwn 0 19 8 0 22 40 (00,19,08 til 00,22,40)
@echo off

:: convert input hours to seconds
set /a hh1=60*60*%1
set /a hh2=60*60*%4

:: convert input minutes to seconds
set /a mm1=60*%2
set /a mm2=60*%5

:: input seconds
set /a ss1=%3
set /a ss2=%6

:: add input hours , minutes , seconds 
set /a t1=hh1+mm1+ss1
set /a t2=hh2+mm2+ss2

:: calculate difference in seconds
set /a ds=t2-t1
  
if %ds% LSS 0 set /a ds=%ds%+24*60*60

set /a h=(%ds%/3600)
set /a m=(%ds%/60)-60*%h%
set /a s=%ds%-60*(%ds%/60)

echo hrs=%h% min=%m% sec=%s%
pause
goto :EOF
