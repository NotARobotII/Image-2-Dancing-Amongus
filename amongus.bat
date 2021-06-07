set /A x = %1
set /A y = %2
set /A size = (%x% * %y%) - 1

set /A ResolutionX = %x% * 74
set /A ResolutionY = %y% * 63 

md dancingtemp

magick montage frame0.png -duplicate %size% -border 0 -tile %x%x%y% -background none -geometry +0+0 dancingtemp\output0.mpc
magick montage frame1.png -duplicate %size% -border 0 -tile %x%x%y% -background none -geometry +0+0 dancingtemp\output1.mpc
magick montage frame2.png -duplicate %size% -border 0 -tile %x%x%y% -background none -geometry +0+0 dancingtemp\output2.mpc
magick montage frame3.png -duplicate %size% -border 0 -tile %x%x%y% -background none -geometry +0+0 dancingtemp\output3.mpc
magick montage frame4.png -duplicate %size% -border 0 -tile %x%x%y% -background none -geometry +0+0 dancingtemp\output4.mpc
magick montage frame5.png -duplicate %size% -border 0 -tile %x%x%y% -background none -geometry +0+0 dancingtemp\output5.mpc

magick convert ( ( background.png -resize "%x%x%y%^!" ) ( %3 -resize %x%x%y% ) -layers flatten ) -scale "%ResolutionX%x%ResolutionY%^!" colors.mpc

md overlayframes

magick montage overlay0.png -duplicate %size% -tile %x%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay0.mpc
magick montage overlay1.png -duplicate %size% -tile %x%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay1.mpc
magick montage overlay2.png -duplicate %size% -tile %x%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay2.mpc
magick montage overlay3.png -duplicate %size% -tile %x%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay3.mpc
magick montage overlay4.png -duplicate %size% -tile %x%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay4.mpc
magick montage overlay5.png -duplicate %size% -tile %x%x%y% -background none -geometry +0+0 -border 0 -define png:color-type=6 overlayframes\overlay5.mpc

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
magick composite overlayframes\overlay0.mpc dancingtemp\output0.mpc -compose multiply finalframes\0.png
magick composite overlayframes\overlay1.mpc dancingtemp\output1.mpc -compose multiply finalframes\1.png
magick composite overlayframes\overlay2.mpc dancingtemp\output2.mpc -compose multiply finalframes\2.png
magick composite overlayframes\overlay3.mpc dancingtemp\output3.mpc -compose multiply finalframes\3.png
magick composite overlayframes\overlay4.mpc dancingtemp\output4.mpc -compose multiply finalframes\4.png
magick composite overlayframes\overlay5.mpc dancingtemp\output5.mpc -compose multiply finalframes\5.png
cd finalframes
magick convert -delay 5 -loop 0 -alpha set -dispose previous *.png %4.gif  
cd..

cd colortemp
del *
cd..