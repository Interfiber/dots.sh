return lib:makeModule({
	name = "bufferline",
	enabled = true,
	onActivate = function()
		require("bufferline").setup({})
	end,
})
