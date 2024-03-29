return lib:makeConfig({
	editor = {
		colorscheme = lib:makeColorscheme({
			name = "horizon", -- colorscheme name
			background = "dark", -- vim.opt.background
			setupType = "function", -- default or function
			setup = function()
				require("horizon").setup({})

				-- Italic comments
				vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#4B4C53", bg = "NONE" })
			end,
		}),
		keybinds = lib:makeEditorKeybinds({
			{ binding = "<Leader>f", action = ":Telescope find_files" },
			{ binding = "<Leader>w", action = ":bd" },
			{ binding = "<Leader>t", action = ":Neotree toggle" },
			{ binding = "<Leader>h", action = ":bprev" },
			{ binding = "<Leader>l", action = ":bnext" },
			{ binding = "<Leader>g", action = ":Telescope grep_string" },
			{ binding = "gr",        action = ":Lspsaga rename" },
			{ binding = "gh",        action = ":Lspsaga lsp_finder" },
			{ binding = "K",         action = ":Lspsaga hover_doc ++keep" },
			{ binding = "tt",        action = ":Lspsaga term_toggle" },
			{ binding = "gt",        action = ":Lspsaga show_workspace_diagnostics" },
			{
				binding = "gd",
				action = function()
					vim.lsp.buf.definition()
				end
			},
			{
				binding = "gv",
				action = function()
					vim.lsp.buf.code_action()
				end
			}
		}),
		settings = lib:makeEditorSettings({
			lineNumbers = true,
			relativeLineNumbers = true,
			termGuiColors = true,
			tabSize = 3,
			leader = " ",
		}),
	},
	languages = lib:makeLanguageServers({
		"clangd",
		"rust_analyzer",
		"tsserver",
		"lua_ls",
		"hls",
		"zls",
	}),
	modules = require("user.modules"),
	packages = lib:makePackageList({
		utils:makeColorschemePackages(),
		"akinsho/bufferline.nvim",    -- Tab bar
		"nvim-lualine/lualine.nvim",  -- Status line
		"goolord/alpha-nvim",         -- Startup screen
		"nvim-tree/nvim-web-devicons", -- Nerd font icon support
		{
			"nvim-telescope/telescope.nvim", -- Fuzzy finder
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		"nvim-treesitter/nvim-treesitter", -- Pretty syntax highlights
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
		},
		"folke/todo-comments.nvim",  -- TODO, HACK, BUG, FIXME, etc comments
		"lukas-reineke/lsp-format.nvim", -- Auto format files with the LSP server on save
		"j-hui/fidget.nvim",         -- LSP server progress
		utils:makeLanguageServerPackages()
	}),
})
