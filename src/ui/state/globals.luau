local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local source = Vide.source

return {
	PreferredInput = source(Enum.PreferredInput.KeyboardAndMouse),
}
