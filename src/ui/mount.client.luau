local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
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
