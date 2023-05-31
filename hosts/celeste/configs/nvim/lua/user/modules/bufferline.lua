return lib:makeModule({
	name = "bufferline",
	enabled = true,
	onActivate = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = true,
				show_close_icon = false,
				persist_buffer_sort = true,
				separator_style = { "│", "│" },
				indicator = {
					icon = "│",
					style = "icon",
				},
				enforce_regular_tabs = false,
				always_show_bufferline = false,
			},
		})
	end,
})
