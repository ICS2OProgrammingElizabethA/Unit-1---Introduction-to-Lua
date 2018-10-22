-- Title: MovingImages
-- Name: Elizabeth
-- Course: ICS2O/3C
-- This program displays an image that moves acrross the screen.

--LOCAL SOUND EFFECTS
local buddySound = audio.loadSound( "Sounds/buddy.mp3" )
local buddySoundChannel

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3
local scrollSpeed2 = 2

--background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--character images with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

local girl2 = display.newImageRect("Images/girl2.png", 200, 200)

--set the images to be transparent
beetleship.alpha = 0
girl2.alpha = 1

--set the initial x and y position of beetleship and girl2
beetleship.x = 0
beetleship.y = display.contentHeight / 3
girl2.x = display.contentWidth*3/3
girl2.y = display.contentHeight*2/3

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	--add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed

	--change the transparency of the ship every time it so fast that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

--Function: MoveGirl2
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the girl
local function MoveGirl2(event)
	--add the scroll speed to the x-value of the ship
	girl2.x = girl2.x - scrollSpeed2

	--change the transparency of the ship every time it so fast that it fades out
	girl2.alpha = girl2.alpha - 0.0000000000000000001
end

--MoveShip will be called over and over again
buddySoundChannel = audio.play(buddySound)
timer.performWithDelay(200, HideBuddy)
Runtime:addEventListener("enterFrame", MoveShip)
Runtime:addEventListener("enterFrame", MoveGirl2)