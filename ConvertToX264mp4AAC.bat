@echo off
echo Encode video with ffmpeg h264_nvenc and aac audio
echo **************************
echo video codec : h264_nvenc
echo audio codec : AAC
echo If u choose Lossless video > choose output as h264
echo **************************

:choice
set /P c=Lossless video[Y/N]?
if /I "%c%" == "Y" goto :lossless_yes
if /I "%c%" == "N" goto :lossless_no
goto :choice


:lossless_yes

echo "Lossless video... audio 320k aac "
echo.
set /p input= Input File :
set /p output= Output File :
set /p SSRC= SSRC Value :
set /p threads= Threads :
ffmpeg -i "%input%" -c:a aac -b:a 320k -af aresample=resampler=soxr -ar %SSRC% -c:v h264_nvenc -preset lossless -threads %threads% "%output%"
pause 
exit


:lossless_no

echo "NOT as lossless -> set output settings for the video... "
echo.
set /p input= Input File :
set /p output= Output File :
set /p Qmin= Value__0-12 :
set /p Qmax= Value__8-20 :
set /p BA= bits audio aac Value(ex 320k) :
set /p SSRC= SSRC Value :
set /p threads= Threads :
ffmpeg -i "%input%" -c:a aac -b:a %BA%k -af aresample=resampler=soxr -ar %SSRC% -c:v h264_nvenc -preset slow -level 5.0 -tune film -qmin %Qmin% -qmax %Qmax% -movflags +faststart -threads %threads% "%output%"
pause 
exit
