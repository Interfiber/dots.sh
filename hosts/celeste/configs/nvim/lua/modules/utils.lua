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
	}
end

return m
