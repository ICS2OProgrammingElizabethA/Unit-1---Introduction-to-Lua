-- Title: Numeric Textfield
--Name: Elizabeth
-- Course:ICS2O/3C
--This program displays a math question and asks the user to answer in a numeric
--textfield terminal.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 132/255, 54/255, 86/255)

----------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

------------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. an a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0,10)

	correctAnswer = randomNumber1 + randomNumber2
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericfieldListener( event )
	-- User begins editing "numericField
		if ( event.phase == "began" ) then

		--clear the text field
		event.target.text = ""

    elseif event.phase == "submitted" then

    	--when the answer is submitted (enter key is pressed) set user input to 
    	--user's answer
    	
end