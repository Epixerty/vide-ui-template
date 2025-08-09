local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Vide = require(ReplicatedStorage.ui.Vide)
local Globals = require(ReplicatedStorage.ui.state.globals)
local App = require(script.Parent.App)

local usePx = require(ReplicatedStorage.ui.utils.use_px)

local mount = Vide.mount
local create = Vide.create
local root = Vide.root

local screenGui = create("ScreenGui") {
	IgnoreGuiInset = true,
	Parent = Players.LocalPlayer.PlayerGui,
}

root(usePx.mount)
mount(App, screenGui)

UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
	Globals.PreferredInput(UserInputService.PreferredInput)
end)
Globals.PreferredInput(UserInputService.PreferredInput)
