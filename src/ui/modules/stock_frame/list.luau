local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local px = require(ReplicatedStorage.ui.utils.use_px)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Position: Any<UDim2>,
	Size: Any<UDim2>,
}

return function(props: Props)
	return create("ScrollingFrame") {
		Position = props.Position,
		Size = props.Size,
		ScrollBarThickness = 4,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(),

		BackgroundTransparency = 1,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Wraps = true,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = px(UDim.new(0, 10)),
		},

		create("UIPadding") {
			PaddingLeft = px(UDim.new(0, 8)),
			PaddingRight = px(UDim.new(0, 8)),
			PaddingTop = px(UDim.new(0, 8)),
			PaddingBottom = px(UDim.new(0, 8)),
		},

		table.unpack(props),
	}
end
