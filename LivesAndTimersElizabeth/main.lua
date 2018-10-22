-- Title: LivesAndTimers
-- Name: Elizabeth
-- Course: ICS2O/3C
-- This program...

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 6/255, 46/255, 124/255)

---VARIABLES FOR THE TIMER
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2

--***ADD LOCAL VARIABLE FOR: INCORRECT OBJECT, POINTS

--------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------

local function UpdateTime()
	-- decrement the number of sounds left
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the
	--clock object
	clockText.text = secondsLeft .. ""

	if(secondsLeft == 0 ) then
		--reset the  number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1

		--***IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND,
		--SHOW A "YOU LOSE IMAGE AND CANCEL THE TIMER, REMOVE
		--REMOVE THE THIRD HEART BY MAKIND IT INVISIBLE
		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end

		--*** CALL THE FUNCTION TO ASK A NEW QUESTION
	end
end


--function that calls the timer
local function StartTime()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------

--create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = di.contentHeight * 1 / 7