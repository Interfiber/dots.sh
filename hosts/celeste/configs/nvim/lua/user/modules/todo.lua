return lib:makeModule({
	name = "todo-comments",
	enabled = true,

	onActivate = function()
		require("todo-comments").setup({})
	end,
})
