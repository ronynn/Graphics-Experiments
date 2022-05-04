-- title:  dialogue_boxes
-- author: r01nx
-- desc:   editing dialogue boxes tutorial by ats_xp
-- script: lua

t=0

dialogues = {}
layer = 1
text_pos = 1

function addDialogues(table)
	dialogues = table
end

addDialogues( { "Hello World!","This is a sentence.", "This is another sentence"} )
function TIC()
	cls()
	
	if dialogues ~= nil and dialogues[layer] ~= nil then
		local string = dialogues[layer]
		local lenght = string.len(string)
		
		if btnp(4) and text_pos >= 2 then
		
			if text_pos < lenght then
				text_pos = lenght
			else
				text_pos = 1
				layer = layer + 1
			end
			
		end
		
		if layer <= #dialogues then
			rect(0,68/2,240,68,15)
			rectb(0,68/2,240,68,12)
			print(string.sub( string , 1, text_pos),5,68/2+5,13)
			
			if text_pos < lenght and t % 4 == 0 then
				text_pos = text_pos + 1
			end
			
		end
	end
	
	t=t+1
end