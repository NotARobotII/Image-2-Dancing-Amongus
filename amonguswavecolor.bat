set /A x = %1
set /A y = %2
set /A size = (%x% * %y%) - 1

set /A Linex = (%x% / 6) + 1
set /A LineSize = (%Linex% * %y%) - 1
set /A Crop = ((6 - (%x% %% 6)) * 74)

set /A ResolutionX = %x% * 74
set /A ResolutionY = %y% * 63 

md dancingtemp

magick montage line0.png -duplicate %LineSize% -border 0 -tile %Linex%x%y% -background none -geometry +0+0 dancingtemp\output0.mpc
magick montage line1.png -duplicate %LineSize% -border 0 -tile %Linex%x%y% -background none -geometry +0+0 dancingtemp\output1.mpc
magick montage line2.png -duplicate %LineSize% -border 0 -tile %Linex%x%y% -background none -geometry +0+0 dancingtemp\output2.mpc
magick montage line3.png -duplicate %LineSize% -border 0 -tile %Linex%x%y% -background none -geometry +0+0 dancingtemp\output3.mpc
magick montage line4.png -duplicate %LineSize% -border 0 -tile %Linex%x%y% -background none -geometry +0+0 dancingtemp\output4.mpc
magick montage line5.png -duplicate %LineSize% -border 0 -tile %Linex%x%y% -background none -geometry +0+0 dancingtemp\output5.mpc

magick mogrify dancingtemp\output*.mpc -gravity east -chop %Crop%x dancingtemp\output*.mpc

magick convert ( ( background.png -resize "%x%x%y%^!" ) ( %3 -resize %x%x%y% ) -layers flatten ) -scale "%ResolutionX%x%ResolutionY%^!" -colors %6 colors.mpc

md overlayframes

magick montage overlayline0.png -duplicate %LineSize% -tile %Linex%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay0.mpc
magick montage overlayline1.png -duplicate %LineSize% -tile %Linex%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay1.mpc
magick montage overlayline2.png -duplicate %LineSize% -tile %Linex%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay2.mpc
magick montage overlayline3.png -duplicate %LineSize% -tile %Linex%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay3.mpc
magick montage overlayline4.png -duplicate %LineSize% -tile %Linex%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay4.mpc
magick montage overlayline5.png -duplicate %LineSize% -tile %Linex%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay5.mpc

magick mogrify overlayframes\overlay*.mpc -gravity east -chop %Crop%x overlayframes\overlay*.mpc

magick composite colors.mpc overlayframes\overlay0.mpc -compose multiply overlayframes\overlay0.mpc 
magick composite colors.mpc overlayframes\overlay1.mpc -compose multiply overlayframes\overlay1.mpc 
magick composite colors.mpc overlayframes\overlay2.mpc -compose multiply overlayframes\overlay2.mpc 
magick composite colors.mpc overlayframes\overlay3.mpc -compose multiply overlayframes\overlay3.mpc 
magick composite colors.mpc overlayframes\overlay4.mpc -compose multiply overlayframes\overlay4.mpc 
magick composite colors.mpc overlayframes\overlay5.mpc -compose multiply overlayframes\overlay5.mpc 
cd overlayframes
magick mogrify overlay*.mpc -fill "#94c9db" -opaque transparent *.mpc
cd..

md finalframes
magick composite overlayframes\overlay0.mpc dancingtemp\output0.mpc -compose multiply finalframes\frame0.png
magick composite overlayframes\overlay1.mpc dancingtemp\output1.mpc -compose multiply finalframes\frame1.png
magick composite overlayframes\overlay2.mpc dancingtemp\output2.mpc -compose multiply finalframes\frame2.png
magick composite overlayframes\overlay3.mpc dancingtemp\output3.mpc -compose multiply finalframes\frame3.png
magick composite overlayframes\overlay4.mpc dancingtemp\output4.mpc -compose multiply finalframes\frame4.png
magick composite overlayframes\overlay5.mpc dancingtemp\output5.mpc -compose multiply finalframes\frame5.png


IF NOT "%5"=="transparent" magick convert background.png -scale "%ResolutionX%x%ResolutionY%^!" -fill %5 -opaque black -define png:color-type=6 finalframes\background.png
cd finalframes
md output
IF NOT "%5"=="transparent" convert background.png frame0.png -layers flatten -background none -define png:color-type=6 frame0.png
IF NOT "%5"=="transparent" convert background.png frame1.png -layers flatten -background none -define png:color-type=6 frame1.png
IF NOT "%5"=="transparent" convert background.png frame2.png -layers flatten -background none -define png:color-type=6 frame2.png
IF NOT "%5"=="transparent" convert background.png frame3.png -layers flatten -background none -define png:color-type=6 frame3.png
IF NOT "%5"=="transparent" convert background.png frame4.png -layers flatten -background none -define png:color-type=6 frame4.png
IF NOT "%5"=="transparent" convert background.png frame5.png -layers flatten -background none -define png:color-type=6 frame5.png

magick convert -delay 5 -loop 0 -alpha set -dispose previous frame*.png output\%4.gif  
cd..