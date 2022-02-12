local tArgs = { ... }
local inputs = {s ={
    repo = "Above_and_Beyond_CC",
    user = "Schmarni-Dev",
    file = "updater.lua",
    branch = "main"
}}

if tArgs == nil then
    print("error please supply args")
    return
end

print(textutils.serialise(inputs["s"]))
fs.delete("updater.lua")
print("Done")