local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local StudFrame = require(ReplicatedStorage.ui.layouts.stud_frame)

type Any<T> = Vide.Source<T> | T

type Props = {
	Position: Any<UDim2>,
	Size: Any<UDim2>,
	Color: Any<Color3>,
}

return function(props: Props)
	return StudFrame {
		Position = props.Position,
		Size = props.Size,
		Color = props.Color,
		HasVignette = true,

		ImageTransparency = 0.5,

		table.unpack(props),
	}
end
