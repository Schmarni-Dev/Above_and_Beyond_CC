print("Running Updater")
local git = require("github")
local tArgs = {...}
local Vinputs = {"hello"}
local inputs = {
    hello = {
        repo = "Above_and_Beyond_CC",
        user = "Schmarni-Dev",
        file = "printHelloWorld.lua",
        branch = "main"
    },
    _self = {
        repo = "Above_and_Beyond_CC",
        user = "Schmarni-Dev",
        file = "updater.lua",
        branch = "main"
    }
}

local function isValid(input)
    for k, v in pairs(Vinputs) do
        if v == input then
            return true
        end
    end
    return false
end

local function Update(value)
    local t = inputs[value]
    local fPath = shell.resolve(t["file"])
    fs.delete(fPath)
    git.getFile(t["file"], t["branch"], t["user"], t["repo"])
    print("Done")
    shell.run(t["file"])
end

local function SelfUpdate(value, args)
    local t = inputs[value]
    local fPath = shell.resolve(t["file"])
    fs.delete(fPath)
    if git.getFile(t["file"], t["branch"], t["user"], t["repo"]) then
        print("Done")
        shell.run(t["file " .. args .. " self"])
    end
end

if tArgs[2] ~= "self" then
    SelfUpdate("_self", tArgs[1])
elseif isValid(tArgs[1]) then
    Update(tArgs[1])
else
    print("Error: please supply valid args")
end
