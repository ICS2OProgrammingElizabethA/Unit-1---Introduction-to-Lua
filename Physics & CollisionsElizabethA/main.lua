------------------------------------------------------------
--Title: Interacting Objects 2
--Name: Elizabeth A
--Course: ICS2O/3C
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

--start physics
physics.start()

---------------------------------------
--OBJECTS--
---------------------------------------
--Grond
local ground = display.newImage("Images/ground.png", 0, 740)

--------------------------------------------------------
--Put the ground at the middle of the screen width.
--Then put it at the bottom of the screen height.
--Change the width to be the same as the screen
--------------------------------------------------------
ground.width = display.contentWidth
ground.x = display.contentWidth/2
--Add to physics
physics.addBody(ground, "static", {friction = 0.4, bounce = 0.5})

----------------------------------------------------------------
--Display the image of the beam
local beam = display.newImage("Images/beam.png", 0, 0)
--set the x and y positions
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

--set the beam width to be half of the width.
--Set the beam's height to be 1/10th of the iPad height. 
beam.width = display.contentWidth/2
beam.height = display.contentHeight*1/10

--rotate the beam -60 degrees so its on an angle
beam:rotate(45)

--send it to the back layer
beam:toBack()

--add to physics
physics.addBody(beam, "static", {friction = 0.6, bounce = 0.4})

--create the background
local background