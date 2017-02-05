@echo off
echo video ffmpeg h264_nvenc AAC
echo **************************
echo video codec : h264_nvenc
echo audio codec : AAC
echo **************************

:choice
set /P c=Lossless video[Y/N]?
if /I "%c%" == "Y" goto :lossless_ja
if /I "%c%" == "N" goto :lossless_nej
goto :choice


:lossless_ja

echo "Lossless video... audio 320k aac "
echo.
set /p input= Input File :
set /p output= Output File :
set /p SSRC= SSRC Value :
set /p threads= Threads :
ffmpeg -i "%input%" -c:a aac -b:a 320k -af aresample=resampler=soxr -ar %SSRC% -c:v h264_nvenc -preset lossless -threads %threads% "%output%"
pause 
exit


:lossless_nej

echo "Ikke lossless ... hence ... vælg kvalitet "
echo.
set /p input= Input File :
set /p output= Output File :
set /p Qmin= Value__0-12 :
set /p Qmax= Value__4-16 :
set /p BA= bits audio aac Value :
set /p SSRC= SSRC Value :
set /p threads= Threads :
ffmpeg -i "%input%" -c:a aac -b:a %BA%k -af aresample=resampler=soxr -ar %SSRC% -c:v h264_nvenc -preset slow -level 5.0 -qmin %Qmin% -qmax %Qmax% -movflags +faststart -threads %threads% "%output%"
pause 
exit
