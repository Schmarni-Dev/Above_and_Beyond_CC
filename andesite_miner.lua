while true do
    if turtle.dig() then
        local i = turtle.getItemDetail(1)
        print(i["name"])
        if i["name"] == "create:andesite_cobblestone" then
            turtle.select(1)
            turtle.dropUp()
        else
            turtle.select(1)
            turtle.dropDown()
        end
    end
end
