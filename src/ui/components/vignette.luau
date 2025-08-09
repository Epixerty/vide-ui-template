local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.ui.Vide)

local create = Vide.create

type Any<T> = Vide.Source<T> | T

type Props = {
	Size: Any<UDim2>?,
	ZIndex: Any<number>?,

	ImageTransparency: Any<number>?,
}

return function(props: Props)
	return create("ImageLabel") {
		Size = props.Size or UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = props.ZIndex or 0,

		Image = "rbxassetid://4576475446",
		ImageTransparency = props.ImageTransparency or 0,

		table.unpack(props),
	}
end
