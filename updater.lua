local git = require("github")
local tArgs = { ... }
local Vinputs = {"a","b","x","y"}
local inputs = {_self ={
    repo = "Above_and_Beyond_CC",
    user = "Schmarni-Dev",
    file = "updater.lua",
    branch = "main"
}}

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
    git.getFile(t["file"],t["branch"],t["user"],t["repo"])
    print("Done")
    shell.run(t["file"])
end

local function SelfUpdate(value,args)
    local t = inputs[value]
    local fPath = shell.resolve(t["file"])
    fs.delete(fPath)
    git.getFile(t["file"],t["branch"],t["user"],t["repo"])
    print("Done")
    shell.run(t["file "..args.." self"])
end



if tArgs[2] ~= "self" then
    SelfUpdate("_self",tArgs[1])
elseif isValid(tArgs[1]) then
    Update(tArgs[1])
else
    print("Error: please supply valid args")
end
    