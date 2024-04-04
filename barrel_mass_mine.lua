print("Depth?")
-- Offset to match the actuall distance including the block the turtle started on
local depth_input = tonumber(io.read()) - 1
print("Width?")
local width_input = tonumber(io.read())
print("height?")
local height_input = tonumber(io.read())
local turn_left_next = false
local just_placed_barrel = false
local place_barrel_on_left_turn = true
local function move()
    if not turtle.forward() then
        turtle.dig()
        move()
    end
end
print("mining for", depth_input, "blocks depth")
print("mining for", width_input, "blocks width")
print("walking for", width_input * depth_input, "blocks")
print("mining", width_input * depth_input * 3, "blocks")

turtle.select(1)

local function dig_forward()
    turtle.dig()
    turtle.digDown()
    if not just_placed_barrel then
        turtle.digUp()
    end
    move()
    just_placed_barrel = false
end

---@param should_move boolean
local function left_turn(should_move)
    print("Turning Left")
    turtle.digDown()
    turtle.digUp()
    turtle.turnLeft()
    turtle.dig()
    if should_move then
        move()
    end
    turtle.digDown()
    turtle.digUp()
    turtle.turnLeft()
    turn_left_next = false
end
---@param should_move boolean
local function right_turn(should_move)
    print("Turning Right")
    turtle.digDown()
    turtle.digUp()
    turtle.turnRight()
    turtle.dig()
    if should_move then
        move()
    end
    turtle.digDown()
    turtle.digUp()
    turtle.turnRight()
    turn_left_next = true
end

local function find_barrel()
    local barrel_slot = 1 -- barrel slot
    local found = false
    for i = 1, 16, 1 do
        turtle.select(i)
        local item_detail = turtle.getItemDetail()
        if item_detail ~= nil and item_detail.name == "minecraft:barrel" then
            barrel_slot = i
            found = true
            break
        end
    end
    return found, barrel_slot
end

local function place_barrel()
    local found, barrel_slot = find_barrel()
    while not found do
        print("Out of Barrels")
        sleep(10)
        found, barrel_slot = find_barrel()
    end
    turtle.select(barrel_slot)
    turtle.placeUp()
    for i = 1, 16, 1 do
        turtle.select(i)
        if i == barrel_slot then
            print("oh")
        else
            turtle.dropUp()
        end
    end
    turtle.select(1)
    just_placed_barrel = true
end
local function main()
    -- local first_loop = true
    for height_layer = 1, height_input, 1 do
        for width_block = 1, width_input, 1 do
            for depth_blocks = 1, depth_input, 1 do
                -- if not first_loop then
                dig_forward()
                -- end
                -- first_loop = false
            end
            if width_block == width_input then
                break
            end
            if not turn_left_next then
                right_turn(true)
                if not place_barrel_on_left_turn then
                    place_barrel()
                end
            else
                left_turn(true)
                if place_barrel_on_left_turn then
                    place_barrel()
                end
            end
        end


        if height_layer == height_input then
            break
        end

        -- turtle.digUp()
        -- turtle.up()
        -- turtle.digUp()
        -- turtle.up()
        -- turtle.digUp()
        -- turtle.up()
        turtle.digUp()

        turtle.digDown()
        turtle.down()
        turtle.digDown()
        turtle.down()
        turtle.digDown()
        turtle.down()
        turn_left_next = not turn_left_next
        place_barrel_on_left_turn = not place_barrel_on_left_turn
        if not turn_left_next then
            right_turn(false)
            if not place_barrel_on_left_turn then
                place_barrel()
            end
        else
            left_turn(false)
            if place_barrel_on_left_turn then
                place_barrel()
            end
        end
    end
end

main()
