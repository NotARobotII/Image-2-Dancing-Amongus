# Image-2-Dancing-Amongus
Collection of files for my batchfile dancing amongus converters 📮

Inspired from Among-Us-Dumpy-Gif-Maker, but while that is for more stylized gifs, this is for any image you want 

REQUIRES IMAGEMAGICK


![Dancing Crewmates tinted to look like a color wheel, it is 16 crewmates by 16 crewmates](https://imgur.com/dkGSSFv.gif)

If you want to download the files with examples, download "BatchesWithExamples.zip" ~7.7 MB when uncompressed

If you want to download the files without example, download "Batches.zip" ~140 KB when uncompressed

## Descriptions of what the batch files do

- image2amongus.bat converts a still image to a gif of dancing amongus
- vid2amongus.bat converts a series of images to a series of images that when combined will create a video of dancing amongus colored to look like the input images

These basically work by taking the source image, using editting to find the average color sections of the image, then tint a grid of dancing crewmates the corresponding colors

## Commands

Commands for the various batch files, run these in CMD in the same directory as the batch file 

### image2amongus.bat 1 2 3 4 5 6 7 8

1. How many amongus wide
2. How many amongus tall
3. The image name, including the file extension
4. The name of the ouput excluding .gif
5. How much of a delaybetween frames in centiseconds (10 milliseconds)
6. What color to put in the background, use transparent if none, can use hex codes by using "#FFFFFF", and rgb with "rgb(255,255,255)", with the quotation marks, some color names work with this
7. What percenatge to change the brightness of the image, including + or -, put +0 if you want no change
8. What pattern of dances to use, 0 will have all of the characters dancing as once, 1 will have all of the characters dancing in a way that creates a wave going from left to right



This next one needs to be run in another function, as it only converts one image by itself
an example would be
`
for %i in (frames\*.png) do amongus2vid.bat 12 9 %i 10
`

### amongus2vid.bat 1 2 3 4 5 6 

1. How many amongus wide
2. How many amongus tall
3. The file name, the file name needs to be a number and start with 6, such as 6000.png, 6001.png, 6002.png this is to ensure that it isn't registered as an octal number, and will still work with the modulo used, put %i when used in the for loop shown earlier
4. How much brightness percentage you want to add or remove from the image, including + or -, such as +10 for increasing brightness by 10 %, put +0 if you don't want to change it
5. How many frames one frame of the dancing gif will be used, such with 2, the first two frames of the video will be the 1st frame of the dancing gifs, with the second 2 frames will be the 2nd frames of the dancing gifs.
6. The color of what to put behind the dancing, can use hex codes by using "#FFFFFF", and rgb with "rgb(255,255,255)", with the quotation marks, some color names work with this 
7. The pattern, 0 being all dance at once, 1 creates a wave left to right.

Put frames to be processed in a folder called "inputframes", be sure to name the files with 1 in the tenth place, such as 1000000000.png, 1000000001.png, can use `magick *.png 1%09d.png` to convert a bunch of frames to the needed naming scheme. 

Frames will be put in a folder called "processedframes"

# Things To Do 

- [x] Make them
- [x] Make the still Image converters not generate so many temp files
- [x] Make the still Image converters not require background.png
- [x] Use the techniques used in the video converter in the image converter
- [ ] Write in something other than batch
