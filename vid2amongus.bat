@echo off

set /A x = %1
set /A y = %2
set /A size = (%x% * %y%) - 1

set /A ResolutionX = %x% * 74
set /A ResolutionY = %y% * 63 

set /A xpoint = %ResolutionX% - 1
set /A ypoint = %ResolutionY% - 1

if "%7" == "0" set danceframe=frame
if "%7" == "0" set overlayframe=Overlay

if "%7" == "1" set danceframe=line
if "%7" == "1" set overlayframe=OverlayLine

set /A decider = ( (%~n3 %% 1000000000) %% (6 * %5) ) / %5

:: magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile required\OverlayLine%decider%.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast %4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile required\line%decider%.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite processedframes\%~n3.png

magick ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%%decider%.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%%decider%.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %4,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite ) processedframes\%~n3.png

echo "On Frame %~n3"

:: for %i in (inputframes\*.png) do amongus2vid.bat 1 2 3 4 5 6
:: 1 = how wide it is, 2 = how wide it is, 3 = image name, use %i, 4 = increasing / decreasing the brightness of the imagee, such as +10 to increase brightness by 10 percent, use +0 if no change, 5 = how many frames to go for the next frame, such as if set to 2, the batch will convert two frames to frame 0 of the dancing gif, then on the next two it use use frame 1, and so on. 6 = color of what is behind the dancing, 7 = Which pattern, 0 = pulse, 1 = 