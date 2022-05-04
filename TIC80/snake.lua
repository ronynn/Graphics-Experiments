-- title:  snake
-- author: r01nx
-- desc:   editing snake tutorials
-- script: lua
-- input:  gamepad

dirs={
[0]={x= 0,y=-1}, --up
[1]={x= 0,y= 1}, --down
[2]={x=-1,y= 0}, --left
[3]={x= 1,y= 0} --right
}

function init()
    t=0 --time
    score=0
    snake={
        {x=15,y=8}, --tail
        {x=14,y=8}, --neck
        {x=13,y=8} --head
    }
    food={x=0,y=0}
    dir=dirs[0]
end

function update()
return t%10==0
end

function gotFood()
    if head.x==food.x and head.y==food.y then
        return true
    end
end

function setFood()
    food.x=math.random(0,29)
    food.y=math.random(0,16)
    for i,v in pairs(snake) do
        if v.x==food.x and v.y==food.y then
            setFood()
        end
    end
end

function draw()
    cls(2)
    for i,v in pairs(snake) do
        rect(v.x*8,v.y*8,8,8,15)
    end

    rect(food.x*8,food.y*8,8,8,6)
end

init()
setFood()
function TIC()
    t=t+1
    head = snake[#snake]
    neck = snake[#snake-1]
    tail = snake[1]
    if update() then

        for i,v in pairs(snake) do
            if i~=#snake and v.x==head.x and v.y==head.y then
                trace("Game OVER!")
                trace("Score: "..score)
                exit()
            end
        end

        table.insert(snake,#snake+1,{x=(head.x+dir.x)%30,y=(head.y+dir.y)%17})
        if not gotFood() then
            table.remove(snake,1)
        else
            setFood()
            score=score+1
        end

    end

    local last_dir=dir

    if btn(0) then dir=dirs[0]
        elseif btn(1) then dir=dirs[1]
        elseif btn(2) then dir=dirs[2]
        elseif btn(3) then dir=dirs[3]
    end

    if head.x+dir.x==neck.x and head.y+dir.y==neck.y then
        dir=last_dir
    end

    draw()
end