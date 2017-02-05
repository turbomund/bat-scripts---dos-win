@ECHO OFF
pip install youtube-dl --upgrade


:choice
set /P c=Want to copy newest youtube-dl.exe to MPV[Y/N]?
if /I "%c%" == "Y" goto :copy_yes
if /I "%c%" == "N" goto :copy_no
goto :choice


:copy_yes

echo "Copying youtube-dl.exe to MPV (program files) directory"
del "C:\Program Files\MPV\youtube-dl.exe"
copy "C:\Program Files (x86)\Python35-32\Scripts\youtube-dl.exe" "C:\Program Files\MPV\"
pause
exit


:copy_no

echo "No update ... hence ... no copying"
pause 
exit
