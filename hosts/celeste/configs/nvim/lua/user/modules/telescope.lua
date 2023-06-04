return lib:makeModule({
	name = "telescope",
	enabled = true,

	onActivate = function()
		local bg = "#16161C"
		local fg = "#8B8D8F"

		local TelescopeColor = {
			TelescopeMatching = { fg = fg },
			TelescopeSelection = { fg = "#FFFFFF", bg = bg, bold = true },
			TelescopeSelectionCaret = { fg = "#8B8D8f", bg = bg, bold = true },

			TelescopePromptPrefix = { bg = bg },
			TelescopePromptNormal = { bg = bg },
			TelescopeResultsNormal = { bg = bg },
			TelescopePreviewNormal = { bg = bg },
			TelescopePromptBorder = { bg = bg, fg = bg },
			TelescopeResultsBorder = { bg = bg, fg = bg },
			TelescopePreviewBorder = { bg = bg, fg = bg },
			TelescopePromptTitle = { bg = "#0195F7", fg = "#FFFFFF" },
			TelescopeResultsTitle = { fg = fg },
			TelescopePreviewTitle = { bg = bg, fg = bg },
		}

		for hl, col in pairs(TelescopeColor) do
			vim.api.nvim_set_hl(0, hl, col)
		end

		require("telescope").setup({
			  extensions_list = { "themes", "terms" }
		})
	end,
})
