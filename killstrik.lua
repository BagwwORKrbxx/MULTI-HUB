-- Этот LocalScript должен лежать в StarterGui

local player    = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name   = "TradeBypassGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Основной фрейм
local frame = Instance.new("Frame")
frame.Size             = UDim2.new(0, 300, 0, 200)
frame.Position         = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel  = 0
frame.Active           = true
frame.Draggable        = true
frame.Parent           = screenGui

-- Заголовок
local title = Instance.new("TextLabel", frame)
title.Size               = UDim2.new(0, 280, 0, 50)
title.Position           = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Font               = Enum.Font.SourceSansBold
title.TextSize           = 20
title.TextColor3         = Color3.new(1, 1, 1)
title.Text               = "ADM TRADE SCAM\nmade by BagWorkRbx"

-- Кнопка BYPASS
local bypassBtn = Instance.new("TextButton", frame)
bypassBtn.Size             = UDim2.new(0, 280, 0, 50)
bypassBtn.Position         = UDim2.new(0, 10, 0, 70)
bypassBtn.Font             = Enum.Font.SourceSans
bypassBtn.TextSize         = 18
bypassBtn.TextColor3       = Color3.new(1, 1, 1)
bypassBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
bypassBtn.Text             = "👻 BYPASS"

-- Предупреждение
local warning = Instance.new("TextLabel", frame)
warning.Size               = UDim2.new(0, 280, 0, 20)
warning.Position           = UDim2.new(0, 10, 0, 130)
warning.BackgroundTransparency = 1
warning.Font               = Enum.Font.SourceSans
warning.TextSize           = 14
warning.TextColor3         = Color3.fromRGB(150, 150, 150)
warning.Text               = "**Must be on trade before using!**"

-- Кнопки ON / OFF
local toggleOn  = Instance.new("TextButton", frame)
local toggleOff = Instance.new("TextButton", frame)

toggleOn.Size             = UDim2.new(0, 130, 0, 30)
toggleOn.Position         = UDim2.new(0, 10, 0, 160)
toggleOn.Font             = Enum.Font.SourceSans
toggleOn.TextSize         = 16
toggleOn.TextColor3       = Color3.new(1, 1, 1)
toggleOn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleOn.Text             = "ON"

toggleOff.Size             = UDim2.new(0, 130, 0, 30)
toggleOff.Position         = UDim2.new(0, 150, 0, 160)
toggleOff.Font             = Enum.Font.SourceSans
toggleOff.TextSize         = 16
toggleOff.TextColor3       = Color3.new(1, 1, 1)
toggleOff.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
toggleOff.Text             = "OFF"

-- Уведомление внизу экрана
local notify = Instance.new("TextLabel", screenGui)
notify.Size               = UDim2.new(0, 250, 0, 50)
notify.Position           = UDim2.new(1, -270, 1, -60)
notify.Font               = Enum.Font.SourceSansBold
notify.TextSize           = 18
notify.TextColor3         = Color3.new(1, 1, 1)
notify.BackgroundColor3   = Color3.fromRGB(40, 40, 40)
notify.BackgroundTransparency = 0.2
notify.BorderSizePixel    = 0
notify.TextWrapped        = true
notify.TextXAlignment     = Enum.TextXAlignment.Center
notify.TextYAlignment     = Enum.TextYAlignment.Center
notify.Text               = "Glitch Trade: On\nYou can now trade!"
notify.Visible            = false

-- Логика переключения и уведомления
local isOn = false

toggleOn.MouseButton1Click:Connect(function()
    isOn = true
    toggleOn.BackgroundColor3  = Color3.fromRGB(0, 170, 0)
    toggleOff.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end)

toggleOff.MouseButton1Click:Connect(function()
    isOn = false
    toggleOff.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    toggleOn.BackgroundColor3  = Color3.fromRGB(100, 100, 100)
end)

bypassBtn.MouseButton1Click:Connect(function()
    if isOn then
        notify.Visible = true
        task.delay(3, function()
            notify.Visible = false
        end)
    else
        warn("Toggle must be ON to proceed.")
    end
end)
