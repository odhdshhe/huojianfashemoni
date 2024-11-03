local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
local OpenUI = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner") 
local UIColor = Instance.new("UIGradient")
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
TextButton.Parent = OpenUI 
TextButton.BackgroundColor3 = Color3.fromRGB(5, 6, 7)
TextButton.BackgroundTransparency = 0.5
TextButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
TextButton.Size = UDim2.new(0, 50, 0, 50)
TextButton.Text = ""
TextButton.Draggable = true
TextLabel.Parent = TextButton
TextLabel.BackgroundColor3 = Color3.fromRGB(5, 6, 7)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "开/关"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)--圈内字体颜色
TextLabel.TextSize = 14
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = TextButton
UIColor.Rotation = 45
UIColor.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
UIColor.Parent = TextLabel
TextButton.MouseButton1Click:Connect(function() 
  if uihide == false then
	uihide = true
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
else
	uihide = false
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
		end 
		
end)

uihide = false

local win = lib:Window("Eat the world(冷开源制作)",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("主要功能")

local buyFuel = false
local buyBackpack = false
local buyRocket = false

tab:Toggle("自动买收集器", false, function(state)
    buyFuel = state
    if buyFuel then
        while buyFuel do
            for i = 1, 12, 1 do
                game:GetService("ReplicatedStorage").BuyFuelScoop:InvokeServer("FuelScoop", i)
                wait(1)
            end
        end
    end
end)

tab:Toggle("自动买背包", false, function(state)
    buyBackpack = state
    if buyBackpack then
        while buyBackpack do
            for i = 1, 13, 1 do
                game:GetService("ReplicatedStorage").BuyItem:InvokeServer("Backpack", i)
                wait(1)
            end
        end
    end
end)

tab:Toggle("自动买火箭", false, function(state)
    buyRocket = state
    if buyRocket then
        while buyRocket do
            for i = 1, 10, 1 do
                game:GetService("ReplicatedStorage").BuyRocket:InvokeServer("Rocket", i)
                wait(1)
            end
        end
    end
end)

tab:Button("传送到放燃料区域",function()
game:GetService("ReplicatedStorage").Teleport:FireServer()
end)

tab:Button("上火箭",function()
game:GetService("ReplicatedStorage").BoardRocket:FireServer()
end)

tab:Button("清空火箭上面玩家",function()
game:GetService("ReplicatedStorage").RemovePlayer:FireServer()
end)