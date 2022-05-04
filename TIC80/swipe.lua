-- title:  swipe
-- author: r01nx
-- desc:   editing swipe tutorials
-- script: lua
-- input:  touch

--vars to log swipe and direction of a swipe
direction=nil
swipe=false

function TIC()

 --basic drawing functions
 cls()
 print("SWIPE IN A DIRECTION",8*8,2*8,2)
 print(direction,13*8,8*8,13)

 --swipe evaluation code

 mx,my,md=mouse()


 --second coordinate checking
 --if a swipe happened then evaluate the direction
 if swipe then
  if mx>startx+10 then
   direction="right"
  elseif mx<startx-10 then
   direction="left"
  elseif my>starty+10 then
   direction="down"
  elseif my<starty-10 then
   direction="up"
  end
 end

 --first coordinate checking
 --if a touch happened then log the coors
 --and allow swipe checking
 if md then
  startx=mx
  starty=my
  swipe=true
 else
  swipe=false
 end
end