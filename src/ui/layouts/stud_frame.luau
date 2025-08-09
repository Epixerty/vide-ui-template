local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local read = require(ReplicatedStorage.ui.Vide.read)
local StudBackground = require(ReplicatedStorage.ui.components.stud_background)
local Vignette = require(ReplicatedStorage.ui.components.vignette)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Position: Any<UDim2>,
	Size: Any<UDim2>,
	Color: Any<Color3>,
	HasGradient: boolean?,
	HasVignette: boolean?,
}

return function(props: Props)
	return create("Frame") {
		Size = props.Size,
		Position = props.Position,
		AnchorPoint = Vector2.new(0.5, 0.5),

		StudBackground {
			Color = props.Color,
			ImageTransparency = 0.5,

			create("UICorner") {
				CornerRadius = UDim.new(0, 4),
			},

			props.HasGradient and create("UIGradient") {
				Rotation = 75,
				Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(185, 185, 185)),
				},
			},

			-- vignette
			props.HasVignette
				and Vignette {
					ImageTransparency = 0.65,

					create("UICorner") {
						CornerRadius = UDim.new(0, 4),
					},
				},
		},

		create("UICorner") {
			CornerRadius = UDim.new(0, 4),
		},

		create("UIStroke") {
			Thickness = 3,
			Color = function()
				local color = read(props.Color)

				return color:Lerp(Color3.new(), 0.1)
			end,

			props.HasGradient and create("UIGradient") {
				Rotation = 75,
				Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 175, 175)),
				},
			},
		},

		table.unpack(props),
	}
end
