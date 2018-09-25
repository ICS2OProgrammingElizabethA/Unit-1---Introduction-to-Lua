--Name:Elizabeth Acheng---------------------------------------------------------------------------------------
--Course:ICS2O/3C
-- This program displays Hello, World on the iPad and "Helloooooooo!" to the command 
--terminal.
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hellooooooooooooo!")
print ("***This is awsome!")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 66/255, 206/255, 244/255)

--create a local variable
local textObject

--displays text on the screen at position x = 300 and y = 400 width
--a default font style and font size of 80
textObject = display.newText( "Hello, Elizabeth!", 300, 250, nil, 70 )

--sets the color of the text
textObject:setTextColor(226/255, 66/255, 244/255)

--create a local variable
local textObjectSignature

--displays text on the screen at position x = 400 and y = 600 width
--a default font style and font size of 50
textObjectSignature = display.newText( "By:Elizabeth", 700, 400, nil, 85 )

