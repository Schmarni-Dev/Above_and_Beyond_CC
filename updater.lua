local tArgs = { ... }
local Vinputs = {}
local inputs = {s ={
    repo = "Above_and_Beyond_CC",
    user = "Schmarni-Dev",
    file = "updater.lua",
    branch = "main"
}}

local function isValid(input)
    for k, v in pairs(t) do
        print(v)
    end
end

local function main(value)
    print(textutils.serialise(inputs["s"]))
    fs.delete("updater.lua")
    print("Done")
end

print("Error: please supply valid args")

if tArgs[1] == "S" then
    main("s")
end
    