--Title: Buttons in Lua
--name: Elizabeth
-- Course: ICS2O/3C
--This program displays a red button when the blue button is clicked.
-----------------------------------------------------------------------------------------

-- set background colour
display.setDefault ("background", 104/255, 221/255, 161/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

local correctSound = audio.loadSound("Sounds/BoingSoundEffect.mp3")
local correctSoundChannel

----create red button, set its position and make visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create text object, set its position and make it visible
local textObject = display.newText ("Clicked!",0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (145/255, 54/255, 216/255)
textObject.isVisible = false

--LOCAL SOUND EFFECTS
local boingSound = audio.loadSound( "Sound/BoingSoundEffect.mp3" )
local boingSoundChannel

--Fucntion; BlueButtonListener
--Input: touch listener
--Output: none
--Description: when blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function BlueButtonlistener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end 

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

--add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonlistener)

--Fucntion; BlueButtonListener
--Input: touch listener
--Output: none
--Description: when blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function RedButtonlistener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end 

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		boingSoundChannel = audio.play(boingSound)
		timer.performWithDelay(2000, HideBoing)
		textObject.isVisible = true
	end
end

--add the respective listeners to each object
redButton:addEventListener("touch", RedButtonlistener)