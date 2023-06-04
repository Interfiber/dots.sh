return lib:makeModule({
	name = "autopairs",
	enabled = true,
	onActivate = function()
		require("nvim-autopairs").setup({})
	end,
})
