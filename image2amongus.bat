@echo off

set /A x = %1
set /A y = %2
set /A size = (%x% * %y%) - 1

set /A ResolutionX = %x% * 74
set /A ResolutionY = %y% * 63 

set /A xpoint = %ResolutionX% - 1
set /A ypoint = %ResolutionY% - 1

if "%8" == "0" set danceframe=frame
if "%8" == "0" set overlayframe=Overlay

if "%8" == "1" set danceframe=line
if "%8" == "1" set overlayframe=OverlayLine

magick convert -delay %5 -dispose 2^
 ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%0.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%0.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %7,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite )^
 ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%1.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%1.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %7,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite )^
 ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%2.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%2.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %7,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite )^
 ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%3.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%3.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %7,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite )^
 ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%4.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%4.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %7,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite )^
 ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:%6 ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%danceframe%5.png -draw "rectangle 0,0 %xpoint%,%ypoint%"  ) ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:transparent -tile required\%overlayframe%5.png -draw "rectangle 0,0 %xpoint%,%ypoint%" ) ( ( %3 -scale "%x%x%y%^!" ) -brightness-contrast %7,0 -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) -compose multiply -composite ) -compose over -composite )^
  %4.gif
  
echo Image "%3" susified as %4.gif in grid with a height of %1 and width of %2, a delay of %5 ticks, a background color of %6, brightness changed by %7 %%, and pattern %8

:: image2amongus.bat 1 2 3 4 5 6 7 8
:: 1 = how wide, 2 = how tall, 3 = imagename including file extension, 4 = output name not including file extension, 5 = how much of a delay between frames in centiseconds, 6 = background color, 7 = what perantage to brighten the image include + or -, 8 = horizontal wave vs all at once | 0 = pulse 1 = horizontal wave

:: 38 seconds to process an image at 64 x 64 compared to 1 minute 32 seconds with the old method 