return lib:makeModule({
	name = "alpha",
	enabled = true,

	onActivate = function()
		require'alpha'.setup(require'alpha.themes.startify'.config)
	end,
})
