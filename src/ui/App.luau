local Vide = require(script.Parent.Vide)

local StockFrame = require(script.Parent.modules.stock_frame)

return function()
	return Vide.create("Frame") {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,

		StockFrame {
			Position = UDim2.fromScale(0.5, 0.5),
		},
	}
end
