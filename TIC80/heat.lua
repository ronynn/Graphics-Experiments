-- title:  heat
-- author: r01nx
-- desc:   editing fire demo by filippo
-- script: lua
-- input:  gamepad

t=0
x=120
y=120

particle = {}
palete = {14,9,6,3,10,15}

function addParticle(x,y)
 local p = {}
	p.x = x
	p.y = y
	p.dx = math.random(-10.0,10.0)/150.0
	p.dy = math.random(-10.0,-2)/50
	p.t = 0
	table.insert(particle,p)
end

function ticParticle()	
	--print("#"..#particle)
	local s=0
	local s2=0
	local c=0
	for k,p in pairs(particle) do
		p.t = p.t + 1
		s = math.log(p.t / 2.0)
		s2 = s/2.0
		c = palete[math.ceil(p.t/70)]
	 p.x = p.x + p.dx
		p.y = p.y + p.dy

		rect(p.x-s2,p.y-s2,s,s,c)

		--remove old ones
		if p.t > 300 then
			table.remove(particle,k)
		end		
	end		
end

function TIC()
	
	--warp space
	x = x % 240
	y = y % 136
	
	addParticle(x,y)		
--	addParticle(30,130)		
--  addParticle(210,130)		

	cls(3)

	--Update & Draw particles	
	ticParticle()

	--cursor	
	pix(x,y,3)
	
	print("HEAT !",106,34)
	t=t+1
end
