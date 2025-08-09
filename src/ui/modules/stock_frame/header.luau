local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local StudFrame = require(ReplicatedStorage.ui.layouts.stud_frame)
local Styles = require(ReplicatedStorage.ui.styles)
local px = require(ReplicatedStorage.ui.utils.use_px)

local create = Vide.create

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
		-- HasVignette = true,

		ImageTransparency = 0.5,

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
					PaddingLeft = px(UDim.new(0, 4)),
				},

				create("UIStroke") {
					Thickness = px(2),
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
					Thickness = px(2),
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

		table.unpack(props),
	}
end
