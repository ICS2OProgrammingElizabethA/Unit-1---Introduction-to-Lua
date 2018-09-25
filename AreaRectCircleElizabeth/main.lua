-----------------------------------------------------------------------------------------
--Title:AreaRectCircle
-- Name;Elizabeth Acheng
--Course:ICS2O/3C
--This program displays a rectangle and shows its area

-- create my local variables
local textSize = 50

local areaTextRect
local areaTextCircle
local myRectangle
local myCircle
local widthOfRectangle = 350
local heightOfRectangle = 200
local radiusOfCircle = 130
local areaOfRectangle
local areaOfCircle
local PI = 3.14

--set the background colour of my screen.Remember that colors are between 0 and 1.
display.setDefault("background", 244/255, 66/255, 191/255)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

--draw the circle that is half the width and height of the screen
myCircle = display.newCircle(850, 140, 130)

--anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 50
myRectangle.y = 50

--anchor the circle in the top right corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY =0 
myCircle.x = 700
myCircle.y = 35

--set the width of the border (Rectangle)
myRectangle.strokeWidth = 20

--set the width of the border (Circle)
myCircle.strokeWidth = 20

--set the color of the rectangle
myRectangle:setFillColor(255/255, 112/255, 61/255)

--set the colour of the circle
myCircle:setFillColor(4/255, 4/255, 4/255)

--set the color of the border (Rectangle)
myRectangle:setStrokeColor(14/255, 19/255, 56/255)

--set the color of the border (Circle)
myCircle:setStrokeColor(255/255, 225/255, 0/255)

--calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

--calculate the area
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaTextRect = display.newText("The area of this rectangle with a width of \n" ..
widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaTextCircle = display.newText("The area of this circle with a radius of \n" ..
radiusOfCircle .. " is " .. areaOfCircle .. " pixels².",0, 0, Arial, textSize) 

--anchor the text size and set its (x,y) position
areaTextRect.anchorX = 0
areaTextRect.anchorY = 0
areaTextRect.x = 20
areaTextRect.y = display.contentHeight/2

--anchor the text size and set its (x,y) position
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 20
areaTextCircle.y = 600

--set the colour of the newText (Rectangle)
areaTextRect:setTextColor(1, 1, 1)

--set the colour of the newText (Circle)
areaTextCircle:setTextColor(0, 0, 0)

