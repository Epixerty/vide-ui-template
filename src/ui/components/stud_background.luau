local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local create = Vide.create
local read = Vide.read

type Any<T> = Vide.Source<T> | T

type Props = {
	Size: Any<UDim2>?,
	Color: Any<Color3>,
	ZIndex: Any<number>?,

	ImageTransparency: Any<number>?,
	StudSize: Any<UDim2>?,
}

return function(props: Props)
	return create("ImageLabel") {
		Size = props.Size or UDim2.fromScale(1, 1),
		BackgroundColor3 = props.Color or Color3.fromRGB(255, 255, 255),
		ZIndex = props.ZIndex or 0,

		Image = "rbxassetid://7447638591",
		ImageTransparency = props.ImageTransparency or 0,

		ScaleType = Enum.ScaleType.Tile,
		TileSize = function()
			return UDim2.fromOffset(read(props.StudSize) or 24, read(props.StudSize) or 24)
		end,

		table.unpack(props),
	}
end
