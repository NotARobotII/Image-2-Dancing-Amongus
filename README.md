# Image-2-Dancing-Amongus
Collection of files for my batchfile dancing amongus converters 📮

Inspired from Among-Us-Dumpy-Gif-Maker, but while that is for more stylized gifs, this is for any image you want 

If someone wants to make this work for another OS, that'd be cool

REQUIRES IMAGEMAGICK

If you would like to see an example, download file "example.zip", extract, and the run example.bat, it will create the colorwheel gif shown, it takes up about 760 kb 

![Dancing Crewmates tinted to look like a color wheel, it is 16 crewmates by 16 crewmates](https://imgur.com/dkGSSFv.gif)

If you want to download the still image converters ( amongus.bat, amonguswave.bat, amonguswavecolor.bat ), then simply download "forstillimages.zip"

If you want to download the video converter ( amongus2vid.bat ) then download "forvideos.zip"


## Descriptions of what the batch files do

- amongus.bat creates a gif with all of the crewmates dancing at the same exact time | This one is the first one so it is currently the most inefficent one
- amonguswave.bat creates a gif with the crewmates making a wave with their dancing
- amonguswavecolor.bat creates a gif like the amongus wave, but you can limit how many different colors the crewmate will be
- amongus2vid.bat takes an image sequence, and converts each frame to a corresponding amongusfied frame, it DOES NOT automatically take in a video file and export one, you must first convert the video to an image sequence then convert the processed frames to a video sequence yourself

These basically work by taking the source image, using editting to find the average color sections of the image, then tint a grid of dancing crewmates the corresponding colors

## Commands

Commands for the various batch files, run these in CMD in the same directory as the batch file

### amongus.bat 1 2 3 4

1. How many amongus wide
2. How many amongus tall
3. Name of the file
4. What to name the gif, do NOT include the .gif in the name, such as if you want troll.gif, write troll for 4.

### amonguswave.bat 1 2 3 4 5 

1. How many amongus wide
2. How many amongus tall
3. Name of the file, including the extension
4. What to name the gif, do NOT include .gif
5. What color to put behind the dancing
   - put transparent if nothing
   - for hex codes put "#ffffff" INCLUDING the quotation marks
   - for rgb values put "rgb(255,255,255)" again include the quotation marks
   - can also just put the name of the color, do NOT put quotation marks 

### amonguswavecolor.bat 1 2 3 4 5 6

1. How many amongus wide
2. How many amongus tall
3. Name of the file, including the extension
4. What to name the gif, do NOT include .gif
5. What color to put behind the dancing
   - put transparent if nothing
   - for hex codes put "#ffffff" INCLUDING the quotation marks
   - for rgb values put "rgb(255,255,255)" again include the quotation marks
   - can also just put the name of the color, do NOT put quotation marks 
6. The max amount of colors for the source image to have when converted to tint the dancing gif, such as 16 if you want at maximum 16 differently colored crewmates

This one needs to be run in another function, as it only converts one image by itself
an example would be
`
for %i in (frames\*.png) do amongus2vid.bat 12 9 %i 10
`

### amongus2vid.bat 1 2 3 4

1. How many amongus wide
2. How many amongus tall
3. The file name, the file name needs to be a number and start with 6, such as 6000.png, 6001.png, 6002.png this is to ensure that it isn't registered as an octal number, and will still work with the modulo used 
4. How much brightness you percentage want to add to the source image, put 0 if you don't want to edit the brightness.

This one NEEDS a folder called "amongusframes" in the same folder as the batch file

Also put the frames in a folder in the same folder as the batch file, simply change "frames\" in the command to whatever you call the folder


# Requirements

Needs ImageMagick

Was written for Windows 10, so you'll have to change somethings around for it to work on another OS

You need to have the required image files in the same file as the batch file

## For the 3 still image batchs

- Put all of the required images in the same folder as the batch file
- Batch file will create all of the folders needed


If you want to avoid having the batch create new directories, create new folders with the names that follow and delete lines starting with "md"

- overlayframes
- finalframes
- dancingtemp

You will also need to create a sub-folder in finalframes, so go into finalframes, create a new folder and rename it to,
- output

After the program is finished, you can delete everything in 
- dancing temp
- overlayframes

You can delete everything in finalframes BESIDES "output" because output is where your result is

If you want to see the process, change all instances of .mpc to .png in the batch file

![Shows a bunch of folders and files, from left to right, dancingtemp, finalframes, overlayframes, amongus.bat, amonguswave.bat, amonguswavecolor.bat, background.png colorwheel.jpg, then the required images](https://i.imgur.com/uledWoo.png)

## For the video batch

- Put line[0-5].png in the same folder as the batch file
- Put OverlayLine[0-5].png in the same folder as the batch file
- Put the image sequence in a folder called "frames" in the same folder as the batch file
- Create a folder called "amongusframes" in the same folder as the batch file

![Shows folders and files, from left to right, amonguframes, frames, amongus2vid.bat, line[0-5].png, and OverlayLine[0-5].png ](https://i.imgur.com/IDnvKmt.png)
# Things To Do 

- [x] Make them
- [ ] Make the still Image converters not generate so many temp files
- [ ] Make the still Image converters not require background.png
- [ ] Use the techniques used in the video converter in the image converter
- [ ] Write in something other than batch
