local Vide = require(script.Parent.Vide)

return function()
	return Vide.create("Frame") {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
	}
end
