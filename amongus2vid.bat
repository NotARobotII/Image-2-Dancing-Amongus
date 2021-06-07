echo off 

set /A x = %1
set /A y = %2
set /A size = (%x% * %y%) - 1

set /A ResolutionX = %x% * 74
set /A ResolutionY = %y% * 63 

set /A xpoint = %ResolutionX% - 1
set /A ypoint = %ResolutionY% - 1

set /A decider = %~n3 %% 6

magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine%decider%.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line%decider%.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

echo "On Frame %~n3"
