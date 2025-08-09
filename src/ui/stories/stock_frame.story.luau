local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local StockFrame = require(ReplicatedStorage.ui.modules.stock_frame)

-- a story is a way to showcase a component or module in isolation
-- great for previewing different states and variations

local story = {
	vide = Vide,
	story = function(props)
		return StockFrame {
			Position = UDim2.fromScale(0.5, 0.5),
		}
	end,
}

return story
