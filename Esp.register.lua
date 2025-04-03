local ESP = {} 

return function(Text, Distance, Color, Size, PartSet, Type)
    if Text == "Clear" then
        if Type == "All" then
            for _, data in pairs(ESP) do
                if data.GUI then
                    data.GUI:Destroy()
                end
            end
            ESP = {}
            return
        end
        if ESP[Type] then
            ESP[Type].GUI:Destroy()
            ESP[Type] = nil
        else
            warn("Not found or already deleted: " .. Type)
        end
        return
    end
    if not PartSet or PartSet:FindFirstChild("BoardGUI") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, Size, 0, Size)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = PartSet
    billboard.Name = 'BoardGUI'

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = billboard

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = Text .. " - " .. math.floor(Distance) .. "m"
    textLabel.TextColor3 = Color
    textLabel.TextScaled = true
    textLabel.Parent = frame

    local partLabel = Instance.new("TextLabel")
    partLabel.Size = UDim2.new(1, 0, 0.5, 0)
    partLabel.Position = UDim2.new(0, 0, 0.5, 0)
    partLabel.BackgroundTransparency = 1
    partLabel.Text = "[" .. PartSet.Name .. "]"
    partLabel.TextColor3 = Color
    partLabel.TextScaled = true
    partLabel.Parent = frame
  
    ESP[Type] = { GUI = billboard, TextLabel = textLabel }
end
