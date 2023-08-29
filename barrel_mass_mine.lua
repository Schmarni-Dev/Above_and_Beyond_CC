print("Depth?")
local d = tonumber(io.read())
print("Width?")
local w = tonumber(io.read())
print("height?")
local test = tonumber(io.read())
local h = 1
local du = true --dig up
local function move()
    if not turtle.forward() then
        turtle.dig()
        move()
    end
end
print("mining for", d, "blocks depth")
print("mining for", w, "blocks width")
print("walking for", w * d, "blocks")
print("mining", w * d * 3, "blocks")

turtle.select(1)

local function D()
    turtle.dig()
    turtle.digDown()
    if du then
        turtle.digUp()
    end
    move()
    du = true
end
local function L()
    print("Turning Left")
    turtle.digDown()
    turtle.digUp()
    turtle.turnLeft()
    turtle.dig()
    move()
    turtle.digDown()
    turtle.digUp()
    turtle.turnLeft()
    h = 1
end
local function R()
    print("Turning Right")
    turtle.digDown()
    turtle.digUp()
    turtle.turnRight()
    turtle.dig()
    move()
    turtle.digDown()
    turtle.digUp()
    turtle.turnRight()
    h = 0
end
local function B()
    local BS = 1 -- barrel slot
    for i = 1, 16, 1 do
        turtle.select(i)
        local ID = turtle.getItemDetail()
        if ID["name"] == "minecraft:barrel" then
            BS = i
            break
        end
    end
    turtle.select(BS)
    turtle.placeUp()
    for i = 1, 16, 1 do
        turtle.select(i)
        if i == BS then
            print("oh")
        else
            turtle.dropUp()
        end
    end
    turtle.select(1)
    du = false
end
local start = 1
local function main()
    for hl = 1, test, 1 do
        -- wb = width blocks
        for wb = 1, w, 1 do
            if start == 0 then
                if h == 1 then
                    R()
                else
                    L()
                    B()
                end
            end
            start = 0
            -- db = depth blocks
            for db = 1, d, 1 do
                D()
            end
        end

        turtle.digUp()
        turtle.up()
        turtle.digUp()
        turtle.up()
        turtle.digUp()
        turtle.up()
        h = 1 - h
    end
end

print("")
main()

