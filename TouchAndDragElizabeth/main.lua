--Title: TouchAndDrag
--Name: Elizabeth
-- Course: ICS2O/3C
--This program displays images that react to a person's finger.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables. I am trying to get the x value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local girl2 = display.newImageRect("Images/girl2.png", 150, 150)
local girl2Width = girl2.width
local girl2Height = girl2.height

local girl3 = display.newImageRect("Images/girl3.png", 150, 150)
local girl3Width = girl3.width
local girl3Height = girl3.height

--my boolen variables to keep track of which object I touched first
local alreadyTouchedgirl2 = false
local alreadyTouchedgirl3 = false

--set the initial x and y position of myImage
girl2.x = 400
girl2.y = 500

girl3.x = 300
girl3.y =200

--Function: Girl2Listener
--Input: touch listener
--Output: none
--Description: when girl2 is touched, move her
local function girl2Listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedgirl3 == false) then
			alreadyTouchedgirl2 = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedgirl2 == true) ) then
		girl2.x = touch.x
		girl2.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl2 = false
		alreadyTouchedgirl3 = false
	end
end

--add the respective listeners to each object
girl2:addEventListener("touch", girl2Listener)

--Function: Girl3Listener
--Input: touch listener
--Output: none
--Description: when girl3 is touched, move her
local function girl3Listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedgirl2 == false) then
			alreadyTouchedgirl3 = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedgirl3 == true) ) then
		girl3.x = touch.x
		girl3.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl3 = false
		alreadyTouchedgirl2 = false
	end
end

--add the respective listeners to each object
girl3:addEventListener("touch", girl3Listener)