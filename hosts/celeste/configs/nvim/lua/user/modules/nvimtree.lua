return lib:makeModule({
	name = "nvimtree",
	enabled = true,
	onActivate = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				side = "left",
				width = 25,
				adaptive_size = true,
			},
			update_cwd = true,
			git = {
				enable = false,
				ignore = true,
			},
			actions = {
				open_file = { resize_window = true },
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
		})
	end,
})
