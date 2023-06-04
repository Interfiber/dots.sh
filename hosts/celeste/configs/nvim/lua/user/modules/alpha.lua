return lib:makeModule({
	name = "alpha",
	enabled = true,
	onActivate = function()
		require("alpha").setup(require'alpha.themes.dashboard'.config)
	end,
})
