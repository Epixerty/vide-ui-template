local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Size: Any<UDim2>,
}

-- a component is just a reusable piece of ui that can be customized through props
-- for example, a button component that can have different labels and actions

return function(props: Props)
	return create("Frame") {
		Size = props.Size,

		table.unpack(props),
	}
end
