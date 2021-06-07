set /A x = %1
set /A y = %2
set /A size = (%x% * %y%) - 1

set /A ResolutionX = %x% * 74
set /A ResolutionY = %y% * 63 

set /A xpoint = %ResolutionX% - 1
set /A ypoint = %ResolutionY% - 1

set /A decider = %~n3 %% 6

:: version with the background matching the color
:: magick (  (  (  ( %3 -resize "%x%x%y%^!" ) -scale "%ResolutionX%x%ResolutionY%^!" ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile overlayline0.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:white -tile line0.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite %4.png

:: magick (  (  (  ( %3 -resize "%x%x%y%^!" ) -scale "%ResolutionX%x%ResolutionY%^!" ) ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile  

IF "%decider%" == "0" magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine0.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line0.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

IF "%decider%" == "1" magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine1.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line1.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

IF "%decider%" == "2" magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine2.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line2.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

IF "%decider%" == "3" magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine3.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line3.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

IF "%decider%" == "4" magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine4.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line4.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

IF "%decider%" == "5" magick (  ( ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine5.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue ) (  ( ( %3 -resize "%x%x%y%^!" ) -brightness-contrast +%4,0 ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite ) -fill "#94c9db" -opaque transparent ) ( -size "%ResolutionX%x%ResolutionY%^!" canvas:black -tile line5.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -compose multiply -composite amongusframes\%~n3.png

:: magick ( ( -size "%ResolutionX%x%ResolutionY%^!" canvas:blue -tile OverlayLine0.png -border 0 -draw "rectangle 0,0 %xpoint%,%ypoint%" ) -fill transparent -opaque blue )  (  ( %3 -resize "%x%x%y%^!" ) -scale "%ResolutionX%x%ResolutionY%^!" ) -compose multiply -composite fbf402.png

::some stupid thing iwth overlays