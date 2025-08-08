local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Size: Any<UDim2>,
}

-- a layout is a wrapper for ui elements, similar to a component but you use it to add children to it.
-- for example, a menu wrapper to have a consistent style across all menus

return function(props: Props)
	return create("Frame") {
		Size = props.Size,

		table.unpack(props),
	}
end
