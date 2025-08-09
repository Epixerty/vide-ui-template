local ReplicatedStorage = game:GetService("ReplicatedStorage")

local App = require(ReplicatedStorage.ui.App)
local Vide = require(ReplicatedStorage.ui.Vide)
local usePx = require(ReplicatedStorage.ui.utils.use_px)

local story = {
	vide = Vide,
	story = function(props)
		usePx.mount()

		return App()
	end,
}

return story
