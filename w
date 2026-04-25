-- MAX LUCK CRAFTING MACHINE GUI

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

if CoreGui:FindFirstChild("MaxLuckGui") then
    CoreGui.MaxLuckGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MaxLuckGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- =====================================================
-- TOGGLE BUTTON
-- =====================================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 38, 0, 38)
ToggleBtn.Position = UDim2.new(0, 16, 0.5, -19)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 68)
ToggleBtn.Text = "M"
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 15
ToggleBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
ToggleBtn.BorderSizePixel = 0
ToggleBtn.ZIndex = 300
ToggleBtn.Parent = ScreenGui

Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 1.5
ToggleStroke.Color = Color3.fromRGB(130, 130, 145)
ToggleStroke.Parent = ToggleBtn

-- =====================================================
-- MAIN FRAME
-- =====================================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 185)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -92)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 200
MainFrame.Active = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(80, 80, 95)
MainStroke.Parent = MainFrame

-- Accent line
local Accent = Instance.new("Frame")
Accent.Size = UDim2.new(1, -24, 0, 2)
Accent.Position = UDim2.new(0, 12, 0, 0)
Accent.BackgroundColor3 = Color3.fromRGB(110, 110, 130)
Accent.BorderSizePixel = 0
Accent.ZIndex = 202
Accent.Parent = MainFrame

Instance.new("UICorner", Accent).CornerRadius = UDim.new(1, 0)

-- =====================================================
-- TITLE
-- =====================================================
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -24, 0, 26)
Title.Position = UDim2.new(0, 14, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "MAX LUCK CRAFTING MACHINE"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(230, 230, 230)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 202
Title.Parent = MainFrame

-- =====================================================
-- ACTIVATE BUTTON (middle)
-- =====================================================
local ActivateBtn = Instance.new("TextButton")
ActivateBtn.Size = UDim2.new(1, -28, 0, 36)
ActivateBtn.Position = UDim2.new(0, 14, 0, 48)
ActivateBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ActivateBtn.Text = "ACTIVATE"
ActivateBtn.Font = Enum.Font.GothamBold
ActivateBtn.TextSize = 13
ActivateBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
ActivateBtn.BorderSizePixel = 0
ActivateBtn.ZIndex = 202
ActivateBtn.Parent = MainFrame

Instance.new("UICorner", ActivateBtn).CornerRadius = UDim.new(0, 8)

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Thickness = 1.5
BtnStroke.Color = Color3.fromRGB(110, 110, 130)
BtnStroke.Parent = ActivateBtn

-- =====================================================
-- DIVIDER
-- =====================================================
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -28, 0, 1)
Divider.Position = UDim2.new(0, 14, 0, 98)
Divider.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
Divider.BorderSizePixel = 0
Divider.ZIndex = 201
Divider.Parent = MainFrame

-- =====================================================
-- PROGRESS BAR (always visible, empty until activated)
-- =====================================================
local ProgressBg = Instance.new("Frame")
ProgressBg.Size = UDim2.new(1, -28, 0, 7)
ProgressBg.Position = UDim2.new(0, 14, 0, 110)
ProgressBg.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
ProgressBg.BorderSizePixel = 0
ProgressBg.ZIndex = 201
ProgressBg.Parent = MainFrame

Instance.new("UICorner", ProgressBg).CornerRadius = UDim.new(1, 0)

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(150, 150, 170)
ProgressFill.BorderSizePixel = 0
ProgressFill.ZIndex = 202
ProgressFill.Parent = ProgressBg

Instance.new("UICorner", ProgressFill).CornerRadius = UDim.new(1, 0)

-- PERCENT left + right row
local PercentLeft = Instance.new("TextLabel")
PercentLeft.Size = UDim2.new(0.5, 0, 0, 16)
PercentLeft.Position = UDim2.new(0, 14, 0, 122)
PercentLeft.BackgroundTransparency = 1
PercentLeft.Text = "0%"
PercentLeft.Font = Enum.Font.GothamBold
PercentLeft.TextSize = 10
PercentLeft.TextColor3 = Color3.fromRGB(160, 160, 175)
PercentLeft.TextXAlignment = Enum.TextXAlignment.Left
PercentLeft.ZIndex = 202
PercentLeft.Parent = MainFrame

local StatusRight = Instance.new("TextLabel")
StatusRight.Size = UDim2.new(0.5, -14, 0, 16)
StatusRight.Position = UDim2.new(0.5, 0, 0, 122)
StatusRight.BackgroundTransparency = 1
StatusRight.Text = "Waiting..."
StatusRight.Font = Enum.Font.Gotham
StatusRight.TextSize = 10
StatusRight.TextColor3 = Color3.fromRGB(120, 120, 135)
StatusRight.TextXAlignment = Enum.TextXAlignment.Right
StatusRight.ZIndex = 202
StatusRight.Parent = MainFrame

-- Status detail below
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -28, 0, 16)
StatusLabel.Position = UDim2.new(0, 14, 0, 142)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Press ACTIVATE to begin"
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 10
StatusLabel.TextColor3 = Color3.fromRGB(100, 100, 115)
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.ZIndex = 202
StatusLabel.Parent = MainFrame

-- =====================================================
-- SUBTEXT BELOW FRAME
-- =====================================================
local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(0, 300, 0, 18)
SubText.Position = UDim2.new(0.5, -150, 0.5, 104) -- sits below MainFrame (92 + half height 185/2 = 92, so 92+12 padding)
SubText.BackgroundTransparency = 1
SubText.Text = "APPLY MAX LUCK IN CRAFT MACHINE"
SubText.Font = Enum.Font.Gotham
SubText.TextSize = 10
SubText.TextColor3 = Color3.fromRGB(100, 100, 115)
SubText.TextXAlignment = Enum.TextXAlignment.Center
SubText.ZIndex = 201
SubText.Parent = ScreenGui

-- =====================================================
-- DRAG SYSTEM
-- =====================================================
local dragging, dragInput, dragStart, startPos, subStartPos = false, nil, nil, nil, nil

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        subStartPos = SubText.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or
       input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        SubText.Position = UDim2.new(
            subStartPos.X.Scale, subStartPos.X.Offset + delta.X,
            subStartPos.Y.Scale, subStartPos.Y.Offset + delta.Y
        )
    end
end)

-- =====================================================
-- TOGGLE LOGIC
-- =====================================================
local guiVisible = true

ToggleBtn.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    SubText.Visible = guiVisible
    ToggleBtn.Text = guiVisible and "M" or "+"
    ToggleBtn.BackgroundColor3 = guiVisible
        and Color3.fromRGB(60, 60, 68)
        or Color3.fromRGB(35, 35, 42)
end)

-- =====================================================
-- ACTIVATE LOGIC
-- =====================================================
local running = false

ActivateBtn.MouseButton1Click:Connect(function()
    if running then return end
    running = true

    ActivateBtn.Text = "Running..."
    ActivateBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
    ActivateBtn.Active = false

    local statuses = {
        "Locating craft machine...",
        "Injecting luck values...",
        "Overriding RNG seed...",
        "Applying 1000x multiplier...",
        "Finalizing luck data...",
        "Almost done...",
    }

    local progress = 0
    local totalDuration = 120
    local startTime = tick()

    local dotThread = task.spawn(function()
        local dot = 0
        while running do
            dot = (dot + 1) % 4
            local elapsed = tick() - startTime
            local idx = math.clamp(math.floor((elapsed / totalDuration) * #statuses) + 1, 1, #statuses)
            StatusLabel.Text = statuses[idx] .. string.rep(".", dot)
            task.wait(0.4)
        end
    end)

    while progress < 1 do
        local elapsed = tick() - startTime
        if elapsed >= totalDuration then break end

        local chunk = math.random(1, 4) / 100
        local cap = elapsed / totalDuration
        progress = math.min(progress + chunk, cap, 0.99)

        ProgressFill.Size = UDim2.new(progress, 0, 1, 0)
        PercentLeft.Text = math.floor(progress * 100) .. "%"
        StatusRight.Text = "Loading..."

        local roll = math.random(1, 10)
        if roll <= 3 then
            task.wait(math.random(80, 300) / 100)
        elseif roll <= 6 then
            task.wait(math.random(20, 80) / 100)
        else
            task.wait(math.random(5, 20) / 100)
        end
    end

    local remaining = totalDuration - (tick() - startTime)
    if remaining > 0 then task.wait(remaining) end

    running = false
    task.cancel(dotThread)

    ProgressFill.Size = UDim2.new(1, 0, 1, 0)
    PercentLeft.Text = "100%"
    StatusRight.Text = "Done!"
    StatusRight.TextColor3 = Color3.fromRGB(120, 210, 150)
    StatusLabel.Text = "Successfully implemented 1000x luck into craft machine!"
    StatusLabel.TextColor3 = Color3.fromRGB(120, 210, 150)

    ActivateBtn.Text = "LUCK APPLIED"
    ActivateBtn.BackgroundColor3 = Color3.fromRGB(35, 90, 55)
end)

-- Delete banner
task.spawn(function()
    local coreGui = game:GetService("CoreGui")
    pcall(function()
        local b = coreGui:FindFirstChild("PremiumDiscordBanner")
        if b then b:Destroy() end
    end)
    coreGui.ChildAdded:Connect(function(child)
        if child.Name == "PremiumDiscordBanner" then
            pcall(function() child:Destroy() end)
        end
    end)
end)
