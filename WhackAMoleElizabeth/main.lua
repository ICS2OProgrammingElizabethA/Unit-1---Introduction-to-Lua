------------------------------------------------------------
--Title: Whack A Mole
--Name: Elizabeth A
--Course: ICS2O/3C

---FUNCTIONS----
--This function places the mole in random places o n the screen.
--if the user clicks on it in time, the score increases by 1.
------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

---SOUNDS----
local whackSound = audio.loadSound( "Sounds/whack.mp3")
local backgroundSound = audio.loadSound("Sounds/bgmusic.mp3")
local whackSoundChannel
local backgroundSoundChannel
------------------------------------------------------

--set the background colour
display.setDefault( "background", 75/255, 1/255, 209/255 )
backgroundSoundChannel = audio.play(backgroundSound)

--creating the mole
	local mole2 = display.newImage("Images/mole2.png", 0, 0 )

	--set the position of the mole
	mole2.x = display.contentCenterX
	mole2.y = display.contentCenterY

	--scale the size of the mole
	mole2:scale(0.4, 0.4)
	
--make the mole invisible
mole2.isVisible = false
--add local variable to keep track of
--the score
local scoreNumber = 0

local scoreObject = display.newText( "Score = "..scoreNumber, 150, 100, nil, 60)
scoreObject:setTextColor(243/255, 185/255, 223/255)
scoreObject.isVisible = 1


----FUNCTIONS---
--thus function that makes the mole appear in a random
--(x,y) position on the screen before calling the Hide
--function

function PopUp()
 --Choosing random Position on the screen between 0 and the
 --size of the screen
 mole2.x = math.random(0, display.contentWidth)
 mole2.y = math.random(0, display.contentHeight)
 --make the mole visible
 mole2.isVisible = true
 timer.performWithDelay(200, HidePopUp)
end

--This function calls the PopUp function after 3 seconds
function PopUpDelay( )
 timer.performWithDelay(200, PopUp)
end

--This function makes the mole invisible and then calls
--the PopUpDelay function
function Hide( )

 -- Changing visibility
 mole2.isVisible = false
 PopUpDelay()
end
--this function starts the game
function GameStart( )
 PopUpDelay()
end
--this function increments the score only if the
--mole is clicked.It then displays the new score
function Whacked( event )
 -- If touch phase just started
if (event.phase == "began") then
	whackSoundChannel = audio.play(whackSound)
  scoreNumber = scoreNumber + 1
  scoreObject.isVisible = true
  Hide()
  scoreObject.text = ( "Score = "..scoreNumber)
 end
end
---------------EVENT LISTENERS---------------
--Add the event listener to the moles so that if the mole
--is touched, the whacked function is called
mole2:addEventListener( "touch", Whacked)


-----------START GAME--------------------
GameStart()
