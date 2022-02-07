print("Depth?")
local d = tonumber(io.read())
print("Width?")
local w = tonumber(io.read())
local h = 1

print("mining for", d, "blocks depth")
print("mining for", w, "blocks width")
print("walking for", w * d, "blocks")
print("mining", w * d * 3, "blocks")

turtle.select(1)

local function D()
    turtle.dig()
    turtle.digDown()
    turtle.digUp()
    turtle.forward()
end
local function L()
    print("Turning Left")
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
    h = 1
end
local function R()
    print("Turning Right")
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
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
end

local function main()
    -- wb = width blocks
    for wb = 1, w, 1 do
        -- db = depth blocks
        for db = 1, d, 1 do
            D()
        end
        if h == 1 then
            R()
        else
            L()
            B()
        end
    end
end

print("")
main()
