local ESP = {}

function ESP.CreateEsp(Name, Distance, Color, Size, PartSet)
    if not PartSet then
        warn("Invalid PartSet")
        return
    end

    -- Kiểm tra nếu ESP đã tồn tại
    if PartSet:FindFirstChild("ESP_" .. Name) then
        return
    end

    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "ESP_" .. Name
    Billboard.Size = UDim2.new(0, Size, 0, Size)
    Billboard.Adornee = PartSet
    Billboard.AlwaysOnTop = true
    Billboard.Parent = PartSet

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color
    TextLabel.Text = string.format("[%s] - [%d]", Name, Distance)
    TextLabel.Parent = Billboard
end

function ESP.EditEsp(Name, Distance, Color, Size, PartSet)
    if not PartSet then
        warn("Invalid PartSet")
        return
    end
    local Billboard = PartSet:FindFirstChild("ESP_" .. Name)
    if not Billboard then
        return
    end
    Billboard.Size = UDim2.new(0, Size, 0, Size)
    local TextLabel = Billboard:FindFirstChildOfClass("TextLabel")
    if TextLabel then
        TextLabel.TextColor3 = Color
        TextLabel.Text = string.format("[%s] - [%d]", Name, Distance)
    end
end

return ESP
