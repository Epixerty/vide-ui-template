local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local ExampleModule = require(ReplicatedStorage.ui.modules.example_module)

-- a story is a way to showcase a component or module in isolation
-- great for previewing different states and variations

local story = {
	vide = Vide,
	story = function(props)
		return ExampleModule {
			Position = UDim2.fromScale(0.5, 0.5),
		}
	end,
}

return story
