local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local ExampleLayout = require(ReplicatedStorage.ui.layouts.example_layout)
local ExampleState = require(ReplicatedStorage.ui.state.example_state)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Position: Any<UDim2>,
}

-- a module is a finalized part of the ui, which uses layouts and/or components

return function(props: Props)
	ExampleState.run()

	return ExampleLayout {
		Size = UDim2.fromScale(1, 1),
		Position = props.Position,

		create("TextButton") {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.one / 2,
			Size = UDim2.fromOffset(300, 40),

			BackgroundColor3 = Color3.fromRGB(55, 185, 155),

			Text = function()
				return `Hello, World! I have {ExampleState.sources.Apples()} apples.`
			end,
			TextSize = 20,

			Activated = function()
				ExampleState.sources.Apples(ExampleState.sources.Apples() + 1)
			end,

			create("UICorner") {
				CornerRadius = UDim.new(0, 8),
			},
		},
	}
end
