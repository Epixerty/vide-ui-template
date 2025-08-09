local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Color: Any<Color3>,
	Size: Any<UDim2>,
	Position: Any<UDim2>,
	Transparency: Any<number>,
	AnchorPoint: Any<Vector2>,
}

return function(props: Props)
	return create("ImageLabel") {

		Name = "Shadow",

		Size = props.Size,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		-- AutomaticSize = Enum.AutomaticSize.XY,

		BackgroundTransparency = 1,

		Image = "rbxasset://textures/StudioSharedUI/dropShadow.png",
		ImageColor3 = props.Color,
		ImageTransparency = props.Transparency,

		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 8, 8),
		SliceScale = 0.8,

		create("UIPadding") {
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
		},

		table.unpack(props),
	}
end
