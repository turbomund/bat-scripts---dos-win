@ECHO OFF
pip install youtube-dl --upgrade


:choice
set /P c=Kopier youtube-dl.exe til MPV[Y/N]?
if /I "%c%" == "Y" goto :kopier_ja
if /I "%c%" == "N" goto :kopier_nej
goto :choice


:kopier_ja

echo "Kopierer youtube-dl.exe til MPV directory"
del "C:\Program Files\MPV\youtube-dl.exe"
copy "C:\Program Files (x86)\Python35-32\Scripts\youtube-dl.exe" "C:\Program Files\MPV\"
pause
exit


:kopier_nej

echo "Ingen opdatering ... hence ... ingen kopiering "
pause 
exit
