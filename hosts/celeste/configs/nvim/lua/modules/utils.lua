local m = {}

function m:makeLanguageServerPackages()
	return {
		"neovim/nvim-lspconfig",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"dcampos/cmp-snippy",
		"dcampos/nvim-snippy",
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		{
			"glepnir/lspsaga.nvim",
			event = "LspAttach",
			config = function()
				require("lspsaga").setup({
					ui = {
						title = false
					}
				})
			end,
			dependencies = {
				{ "nvim-tree/nvim-web-devicons" },
				--Please make sure you install markdown and markdown_inline parser
				{ "nvim-treesitter/nvim-treesitter" },
			},
		},
	}
end

function m:makeColorschemePackages()
	return {
		"savq/melange-nvim", -- Colors 0
		"NTBBloodbath/doom-one.nvim", -- Colors 1
		"catppuccin/nvim", -- Colors 2
		"LunarVim/horizon.nvim" -- Colors 3
	}
end

return m
