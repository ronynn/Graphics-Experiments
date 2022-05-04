-- title:  glitch
-- author: r01nx
-- desc:   editing glitch demo by vadim, it changes screen offset in every scanline
-- script: lua
-- input:  gamepad


shake=0
d=4
function TIC()
	if btnp()~=0 then shake=30 end
	if shake>0 then
		poke(0x3FF9+1,math.random(-d,d))
		shake=shake-1
		if shake==0 then memset(0x3FF9,0,2) end
	end
	cls(6)
	print("PRESS ANY KEY TO GLITCH!",54,64)
end

function scanline(row)
	if shake>0 then
		poke(0x3FF9,math.random(-d,d))
	end
end