print("CUM")
local inputs = {s ={
    repo = "Above_and_Beyond_CC",
    user = "Schmarni-Dev",
    file = "updater.lua",
    branch = "main"
}}

print(textutils.serialise(inputs["s"]))
fs.delete("updater.lua")
print("Done")