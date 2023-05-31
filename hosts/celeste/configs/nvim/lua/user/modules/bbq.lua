return lib:makeModule({
	name = "bbq",
	enabled = true,

	onActivate = function()
		require("barbecue").setup({})
		require("barbecue.ui").toggle(true)
	end,
})
