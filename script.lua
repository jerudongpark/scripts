-- Memulai script tanpa login key

local function b(c)
    return cloneref and cloneref(c) or c
end

local d = {
    [Enum.UserInputType.MouseButton1] = "M1",
    [Enum.UserInputType.MouseButton2] = "M2",
    [Enum.UserInputType.MouseButton3] = "M3"
}

local e = {
    Enum.KeyCode.Unknown,
    Enum.KeyCode.W,
    Enum.KeyCode.A,
    Enum.KeyCode.S,
    Enum.KeyCode.D,
    Enum.KeyCode.Up,
    Enum.KeyCode.Left,
    Enum.KeyCode.Down,
    Enum.KeyCode.Right,
    Enum.KeyCode.Slash,
    Enum.KeyCode.Tab,
    Enum.KeyCode.Backspace,
    Enum.KeyCode.Escape,
    Enum.KeyCode.RightShift
}

local function f(g, h)
    for i, j in next, g do
        if j == h or i == h then return true end
    end
end

local k = {
    accentclr = Color3.fromRGB(173, 95, 127),
    dropdownframes = {},
    colorpickerframes = {}
}

local l = b(game:GetService("UserInputService"))
local m = b(game:GetService("TweenService"))
local n = b(game:GetService("RunService"))
local o = game:GetService("Players").LocalPlayer
local p = b(o:GetMouse())
local q = b(game:GetService("HttpService"))

if not isfile("nexlib/config.cfg") then
    writefile("nexlib/config.cfg", tostring(q:JSONEncode({})))
end

local function r(s, t)
    pcall(function()
        local u = false
        local v, w, x
        s.InputBegan:Connect(function(y)
            if y.UserInputType == Enum.UserInputType.MouseButton1 then
                u = true
                w = y.Position
                x = t.Position
                y.Changed:Connect(function()
                    if y.UserInputState == Enum.UserInputState.End then
                        u = false
                    end
                end)
            end
        end)
        s.InputChanged:Connect(function(y)
            if y.UserInputType == Enum.UserInputType.MouseMovement then
                v = y
            end
        end)
        l.InputChanged:Connect(function(y)
            if y == v and u then
                local z = y.Position - w
                t.Position = UDim2.new(x.X.Scale, x.X.Offset + z.X, x.Y.Scale, x.Y.Offset + z.Y)
            end
        end)
    end)
end

local A = Instance.new("ScreenGui")
A.Name = "nexlib"
A.Parent = game.CoreGui
A.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local B = Instance.new("Folder")

function k:Notification(C, D, E, F)
    for i, j in pairs(B:GetChildren()) do
        j:TweenPosition(UDim2.new(0.5, 0, j.Position.Y.Scale - 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
    end
    local G = Instance.new("Frame")
    local H = Instance.new("ImageLabel")
    local I = Instance.new("ImageLabel")
    local J = Instance.new("ImageLabel")
    local K = Instance.new("TextLabel")
    local L = Instance.new("TextLabel")
    G.Name = "Notification"
    G.Parent = B
    G.AnchorPoint = Vector2.new(0.5, 0.5)
    G.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    G.BorderColor3 = Color3.fromRGB(60, 60, 60)
    G.BorderSizePixel = 0
    G.Position = UDim2.new(1.5, 0, 0.5, 0)
    G.Size = UDim2.new(0, 328, 0, 45)
    H.Name = "OutlineNotification1"
    H.Parent = G
    H.BackgroundTransparency = 1.000
    H.Position = UDim2.new(0, 1, 0, 1)
    H.Size = UDim2.new(1, -2, 1, -2)
    H.Image = "rbxassetid://2592362371"
    H.ImageColor3 = Color3.fromRGB(60, 60, 60)
    H.ScaleType = Enum.ScaleType.Slice
    H.SliceCenter = Rect.new(2, 2, 62, 62)
    I.Name = "OutlineNotification2"
    I.Parent = G
    I.BackgroundTransparency = 1.000
    I.Size = UDim2.new(1, 0, 1, 0)
    I.Image = "rbxassetid://2592362371"
    I.ImageColor3 = Color3.fromRGB(0, 0, 0)
    I.ScaleType = Enum.ScaleType.Slice
    I.SliceCenter = Rect.new(2, 2, 62, 62)
    J.Name = "NotificationIco"
    J.Parent = G
    J.AnchorPoint = Vector2.new(0, 0.5)
    J.BackgroundColor3 = Color3.fromRGB(0, 184, 113)
    J.BackgroundTransparency = 1.000
    J.Position = UDim2.new(0, 7, 0.5, 0)
    J.Size = UDim2.new(0, 25, 0, 25)
    J.Image = "http://www.roblox.com/asset/?id=6026568210"
    J.ImageColor3 = k.accentclr
    K.Name = "NotificationTitle"
    K.Parent = G
    K.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    K.BackgroundTransparency = 1.000
    K.Position = UDim2.new(0, 39, 0, 6)
    K.Size = UDim2.new(0, 200, 0, 19)
    K.Font = Enum.Font.Code
    K.Text = C
    K.TextColor3 = Color3.fromRGB(255, 255, 255)
    K.TextSize = 16.000
    K.TextXAlignment = Enum.TextXAlignment.Left
    L.Name = "NotificationDesc"
    L.Parent = G
    L.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    L.BackgroundTransparency = 1.000
    L.Position = UDim2.new(0.0143884895, 35, 1, -25)
    L.Size = UDim2.new(0, 200, 0, 19)
    L.Font = Enum.Font.Code
    L.Text = D
    L.TextColor3 = Color3.fromRGB(200, 200, 200)
    L.TextSize = 15.000
    L.TextXAlignment = Enum.TextXAlignment.Left
    G.Size = UDim2.new(0, L.TextBounds.X + 45, 0, 45)
    if #K.Text >= #L.Text then
        G.Size = UDim2.new(0, K.TextBounds.X + 45, 0, 45)
    end
    G:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
    delay(E, function()
        G:TweenPosition(UDim2.new(1.5, 0, G.Position.Y.Scale, 0), "InOut", "Linear", 0.2, true)
        wait(0.2)
        G:Destroy()
    end)
end
