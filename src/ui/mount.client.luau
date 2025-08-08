local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local App = require(script.Parent.App)

local mount = Vide.mount
local create = Vide.create

local screenGui = create("ScreenGui")({
	IgnoreGuiInset = true,
	Parent = Players.LocalPlayer,
})

mount(App, screenGui)
