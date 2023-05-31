return lib:makeModule({
	name = "telescope",
	enabled = true,

	onActivate = function()
		require("telescope").setup({})
	end,
})
