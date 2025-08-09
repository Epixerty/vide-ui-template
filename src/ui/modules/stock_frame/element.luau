local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)
local Styles = require(ReplicatedStorage.ui.styles)

local Shadow = require(ReplicatedStorage.ui.components.shadow)
local Vignette = require(ReplicatedStorage.ui.components.vignette)
local Globals = require(ReplicatedStorage.ui.state.globals)

local px = require(ReplicatedStorage.ui.utils.use_px)

local create = Vide.create
local source = Vide.source
local spring = Vide.spring
local derive = Vide.derive

type Any<T> = Vide.Source<T> | T

type Props = {
	Size: Any<UDim2>,
	LayoutOrder: Any<number>,
	Data: Element,
}

export type Element = {
	Id: string,
	Name: string,
	Price: number,
	Stock: number,
}

local function formatNumber(number: number): string
	local formatted, k = tostring(number), nil

	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
		if k == 0 then
			break
		end
	end

	return formatted
end

return function(props: Props)
	local shadowThickness = 5
	local buttonHeight = 36

	local buttonSize = source(UDim2.new(1, 0 + shadowThickness * 2, 0, buttonHeight + shadowThickness * 2))
	local imagePosition = source(UDim2.fromScale(0.5, 0.45))
	local shadowTransparency = source(1)
	local purchaseLabelRotation = source(0)

	local buttonSizeSpring = spring(buttonSize, 0.2, 0.4)
	local imagePositionSpring = spring(imagePosition, 0.3, 0.3)
	local shadowTransparencySpring = spring(shadowTransparency, 0.15, 1)
	local purchaseLabelRotationSpring = spring(purchaseLabelRotation, 0.3, 0.35)

	local strokeTransparencySpring = derive(function()
		return 1 - (shadowTransparencySpring() * 0.5)
	end)

	return create("Frame") {
		Size = props.Size,
		BackgroundColor3 = Styles.ElementBackgroundColor,
		LayoutOrder = props.LayoutOrder,

		Vignette {
			ImageTransparency = 0.8,

			create("UICorner") {
				CornerRadius = UDim.new(0, 4),
			},
		},

		create("UICorner") {
			CornerRadius = UDim.new(0, 4),
		},

		create("UIStroke") {
			Thickness = px(1.5),
			Color = Styles.ElementBackgroundColor:Lerp(Color3.new(), 0.25),
		},

		MouseEnter = function()
			if Globals.PreferredInput() ~= Enum.PreferredInput.KeyboardAndMouse then
				return
			end

			-- imagePosition(UDim2.new(0.5, 0, 0.45, -8))
			imagePosition(UDim2.fromScale(0.5, 0.4))
		end,

		MouseLeave = function()
			if Globals.PreferredInput() ~= Enum.PreferredInput.KeyboardAndMouse then
				return
			end

			imagePosition(UDim2.fromScale(0.5, 0.45))
		end,

		create("Frame") {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,

			create("UIPadding") {
				PaddingLeft = px(UDim.new(0, 6)),
				PaddingRight = px(UDim.new(0, 6)),
				PaddingTop = px(UDim.new(0, 6)),
				PaddingBottom = px(UDim.new(0, 6)),
			},

			create("UICorner") {
				CornerRadius = UDim.new(0, 4),
			},

			-- item icon
			create("ImageLabel") {
				Name = "ItemIcon",
				Position = px(imagePositionSpring),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromScale(1, 0.4),
				BackgroundTransparency = 1,
				-- Image = `rbxassetid://{props.Data.Id}`,
				Image = `rbxassetid://17016090025`,

				ScaleType = Enum.ScaleType.Fit,

				create("UICorner") {
					CornerRadius = UDim.new(0, 4),
				},
			},

			create("TextLabel") {
				Name = "StockLabel",
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = `{props.Data.Stock}x STOCK`,
				TextSize = px(18),
				TextColor3 = Styles.MainTextColor,
				FontFace = Font.new(Styles.MainTextFontId, Enum.FontWeight.Bold),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,

				create("UIStroke") {
					Thickness = 1,
					Transparency = 0.5,
					Color = Styles.MainTextColor:Lerp(Color3.new(), 0.7),
				},
			},

			-- no stock overlay
			create("Frame") {
				Name = "NoStockOverlay",
				Size = px(UDim2.new(1, 12, 1, 12)),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = Color3.new(),
				BackgroundTransparency = 0.5,

				Visible = function()
					return props.Data.Stock <= 0
				end,

				create("UICorner") {
					CornerRadius = UDim.new(0, 4),
				},

				create("TextLabel") {
					Name = "NoStockLabel",
					Position = UDim2.fromScale(0.5, 0.5),
					BackgroundTransparency = 1,
					Text = `OUT OF STOCK!`,
					TextSize = px(16),
					TextColor3 = Styles.MainTextColor,
					FontFace = Font.new(Styles.MainTextFontId, Enum.FontWeight.Bold),
					Rotation = math.random(-5, 5),

					create("UIPadding") {
						PaddingBottom = px(UDim.new(0, 12)),
					},

					create("UIStroke") {
						Thickness = 1,
						Transparency = 0.5,
						Color = Styles.MainTextColor:Lerp(Color3.new(), 0.7),
					},
				},
			},

			Shadow {
				Color = Styles.PurchaseButtonColor:Lerp(Color3.new(1, 1, 1), 0.15),
				Transparency = shadowTransparencySpring,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = function()
					return px(UDim2.new(0.5, 0, 1, 3 - (buttonHeight + 6) / 2))()
				end,
				Size = px(buttonSizeSpring),

				create("UICorner") {
					CornerRadius = UDim.new(0, 3),
				},

				create("UIGradient") {
					Rotation = 90,
					Color = ColorSequence.new {
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255):Lerp(Color3.new(), 0.3)),
					},
				},

				create("TextButton") {
					Name = "PurchaseButton",
					Size = function()
						return UDim2.fromScale(1, 1)
					end,

					BackgroundColor3 = Styles.PurchaseButtonColor,

					MouseEnter = function()
						if Globals.PreferredInput() ~= Enum.PreferredInput.KeyboardAndMouse then
							return
						end

						shadowTransparency(0)
						purchaseLabelRotation(7)
					end,

					MouseLeave = function()
						if Globals.PreferredInput() ~= Enum.PreferredInput.KeyboardAndMouse then
							return
						end

						shadowTransparency(1)
						purchaseLabelRotation(0)

						buttonSize(UDim2.new(1, 0 + shadowThickness * 2, 0, buttonHeight + shadowThickness * 2))
					end,

					MouseButton1Down = function()
						buttonSize(UDim2.new(1, 0 + shadowThickness * 2 - 4, 0, buttonHeight + shadowThickness * 2 - 4))
					end,

					MouseButton1Up = function()
						buttonSize(UDim2.new(1, 0 + shadowThickness * 2, 0, buttonHeight + shadowThickness * 2))
					end,

					create("UIGradient") {
						Rotation = 90,
						Color = ColorSequence.new {
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255):Lerp(Color3.new(), 0.3)),
						},
					},

					create("UIStroke") {
						Thickness = 1,
						Transparency = strokeTransparencySpring,
						Color = Styles.MainTextColor:Lerp(Color3.new(), 0.7),

						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					},

					create("UICorner") {
						CornerRadius = UDim.new(0, 2),
					},

					create("TextLabel") {
						Name = "PurchaseLabel",
						Rotation = purchaseLabelRotationSpring,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						Text = `${formatNumber(props.Data.Price)}`,
						TextSize = px(18),
						TextColor3 = Styles.MainTextColor,
						FontFace = Font.new(Styles.MainTextFontId, Enum.FontWeight.Bold),

						create("UIStroke") {
							Thickness = 1,
							Transparency = 0.8,
							Color = Styles.MainTextColor:Lerp(Color3.new(), 0.7),
						},
					},
				},
			},
		},
	}
end
