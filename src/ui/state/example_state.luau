local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local source = Vide.source
local effect = Vide.effect

-- a state module is just used to store and manage state for certain modules with more complex state,
-- to avoid having too much logic in the module itself.
-- also helps sharing state between different components.

local apples = source(10)

return {
	sources = {
		Apples = apples,
	},
	run = function() -- this should only be called once
		effect(function()
			print(`Apples changed to {apples()}`)
		end)
	end,
}
