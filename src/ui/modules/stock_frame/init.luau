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
		HasGradient = true,
		HasVignette = true,

		ImageTransparency = 0.5,

		Header {
			Color = Styles.StockFrameHeaderColor,
			Position = UDim2.fromScale(0.5, 0),
			Size = px(UDim2.fromOffset(Styles.StockFrameXSize - 100, 50)),

			create("Frame") {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,

				create("UIPadding") {
					PaddingLeft = px(UDim.new(0, 8)),
					PaddingRight = px(UDim.new(0, 8)),
					PaddingTop = px(UDim.new(0, 8)),
					PaddingBottom = px(UDim.new(0, 8)),
				},

				-- new stock text
				create("TextLabel") {
					BackgroundTransparency = 1,

					Text = "New Stock in 4m 30s",
					TextColor3 = Styles.MainTextColor,
					FontFace = Font.new(Styles.MainTextFontId, Enum.FontWeight.Bold),
					TextSize = px(28),
					Size = UDim2.fromScale(1, 1),

					TextXAlignment = Enum.TextXAlignment.Left,

					create("UIPadding") {
						PaddingLeft = UDim.new(0, 4),
					},

					create("UIStroke") {
						Thickness = 2,
						Transparency = 0.8,
						Color = Styles.MainTextColor:Lerp(Color3.new(), 0.7),
					},
				},

				-- close button
				create("TextButton") {
					-- BackgroundTransparency = 1,
					BackgroundColor3 = Styles.CloseButtonColor,
					Text = "X",
					AutomaticSize = Enum.AutomaticSize.XY,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.fromScale(1, 0.5),
					TextColor3 = Styles.MainTextColor,
					FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Bold),
					TextSize = px(24),

					create("UICorner") {
						CornerRadius = UDim.new(0, 4),
					},

					create("UIStroke") {
						Thickness = 2,
						Transparency = 0.8,
						Color = Styles.CloseButtonColor:Lerp(Color3.new(), 0.7),
					},

					create("UIPadding") {
						PaddingLeft = px(UDim.new(0, 12)),
						PaddingRight = px(UDim.new(0, 12)),
						PaddingTop = px(UDim.new(0, 6)),
						PaddingBottom = px(UDim.new(0, 6)),
					},
				},
			},
		},

		List {
			Position = px(UDim2.fromOffset(4, 8 + 25)),
			Size = px(UDim2.fromOffset(Styles.StockFrameXSize - 8, Styles.StockFrameYSize - 16 - 25)),

			-- create("UIStroke") {},
			Vide.values(elements, function(element, i)
				return Element {
					Size = px(UDim2.fromOffset(110, 120)),
					Data = element,
					LayoutOrder = i,
				}
			end),
		},
	}
end
