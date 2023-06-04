return lib:makeModule({
	name = "lualine",
	enabled = true,
	onActivate = function()
		require("lualine").setup({})
	end,
})
