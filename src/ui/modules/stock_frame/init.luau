local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local Styles = require(ReplicatedStorage.ui.styles)

local StudFrame = require(ReplicatedStorage.ui.layouts.stud_frame)
local px = require(ReplicatedStorage.ui.utils.use_px)

local Header = require(script.header)
local List = require(script.list)
local Element = require(script.element)

local create = Vide.create
local source = Vide.source
local action = Vide.action

type Any<T> = Vide.Source<T> | T

type Props = {
	Position: Any<UDim2>,
}

local testElementData = {
	{
		Id = "item1",
		Name = "Item One",
		Price = 100,
		Stock = 50,
	},
	{
		Id = "item2",
		Name = "Item Two",
		Price = 200,
		Stock = 30,
	},
	{
		Id = "item3",
		Name = "Item Three",
		Price = 300,
		Stock = 0,
	},
	{
		Id = "item4",
		Name = "Item Four",
		Price = 400,
		Stock = 0,
	},
	{
		Id = "item5",
		Name = "Item Five",
		Price = 500,
		Stock = 0,
	},
	{
		Id = "item6",
		Name = "Item Two",
		Price = 10000,
		Stock = 500,
	},
}

return function(props: Props)
	local elements: Vide.Source<{ Element.Element }> = source(testElementData)

	return StudFrame {
		Size = px(UDim2.fromOffset(Styles.StockFrameXSize, Styles.StockFrameYSize)),
		Position = props.Position,
		Color = Styles.StockFrameBackgroundColor,
		-- HasGradient = true,
		-- HasVignette = true,
		HasStroke = true,

		ImageTransparency = 0.5,

		-- workaround for stroke to cover header too

		create("Frame") {
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = px(UDim2.fromOffset(Styles.StockFrameXSize - 100, 50)),
			create("UIStroke") {
				Thickness = px(3),
				Color = Styles.StockFrameBackgroundColor:Lerp(Color3.new(), 0.45),
			},
			create("UICorner") {
				CornerRadius = UDim.new(0, 4),
			},

			ZIndex = -1,
		},

		Header {
			Color = Styles.StockFrameHeaderColor,
			Position = UDim2.fromScale(0.5, 0),
			Size = px(UDim2.fromOffset(Styles.StockFrameXSize - 100, 50)),
		},

		List {
			Position = px(UDim2.fromOffset(4, 8 + 25)),
			Size = px(UDim2.fromOffset(Styles.StockFrameXSize - 8, Styles.StockFrameYSize - 16 - 25)),

			-- create("UIStroke") {},
			Vide.values(elements, function(element, i)
				return Element {
					Size = px(UDim2.fromOffset(136, 150)),
					Data = element,
					LayoutOrder = i,
				}
			end),
		},
	}
end
