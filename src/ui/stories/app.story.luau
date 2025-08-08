local ReplicatedStorage = game:GetService("ReplicatedStorage")

local App = require(ReplicatedStorage.ui.App)
local Vide = require(ReplicatedStorage.ui.Vide)

local story = {
	vide = Vide,
	story = function(props)
		return App()
	end,
}

return story
