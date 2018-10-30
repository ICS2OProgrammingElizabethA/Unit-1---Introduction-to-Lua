-- Title: Numeric Textfield
--Name: Elizabeth
-- Course:ICS2O/3C
--This program displays a math question and asks the user to answer in a numeric
--textfield terminal.
---------------------------------------------------------------

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--set the background colour 
display.setDefault("background", 144/255, 16/255, 200/255)

--------------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------------

--create local variables 
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local incorrectAnswer
local correctAnswer
local pointsTextObject
local numberOfPoints = 0
local randomOperator

--Correct Sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel

--Incorrect Sound
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel

-- local functions 
local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,3)
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(10,20)

 
 	if (randomOperator == 1) then
 		correctAnswer = randomNumber1 + randomNumber2
	
		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
	 	correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	end	

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function NumericFieldListener( event )

	--User begins editing "numericFeild"
	if ( event.phase == "began" ) then

		--clear text field 
		event.target.text = "" 

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			correctSoundChannel = audio.play(correctSound)
			incorrectObject.isVisible = false
			timer.performWithDelay(2000,HideCorrect)
			numberOfPoints = numberOfPoints + 1

			event.target.text = "" 

        -- create increasing points in the text object
			 pointsTextObject.text = "Points = ".. numberOfPoints

		else 
			correctObject.isVisible = false 
			wrongSoundChannel = audio.play(wrongSound)
			incorrectObject.isVisible = true
			timer.performWithDelay(2000,HideIncorrect)

			event.target.text = "" 
		end
	end
end
-- create points box and make it visible
pointsTextObject = display.newText( "Points = ".. numberOfPoints, 430, 110, nil, 60 )
pointsTextObject:setTextColor(214/255, 66/255, 86/255)

-------------------------------------------------------
--OBJECT CREATION 
--------------------------------------------------------

-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/2, display.contentHeight/2, nil, 150)
questionObject:setTextColor(124/255, 144/255, 255/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, 250, nil, 60)
correctObject:setTextColor(1/255, 0/255, 2/255)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("Incorrect!", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(155/255, 206/255, 100/255)
incorrectObject.isVisible = false

-----------------------------------------------------------
-- CREATE THE NUMERIC FIELD 
------------------------------------------------------------

numericField = native.newTextField(display.contentWidth/2, display.contentHeight*2/3, 350, 90)
numericField.inputType = "default"

--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

---------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------
-- call the function to ask the Question
AskQuestion()