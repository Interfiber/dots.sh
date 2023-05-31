return lib:makeConfig({
	editor = {
		colorscheme = lib:makeColorscheme({
			name = "zenbones", -- colorscheme name
			background = "dark", -- vim.opt.background
			setupType = "default", -- default or function
		}),
		keybinds = lib:makeEditorKeybinds({
			{ binding = "<Leader>f", action = ":Telescope find_files" },
			{ binding = "<Leader>w", action = ":bd" },
			{ binding = "<Leader>t", action = ":NvimTreeToggle" },
			{ binding = "<Leader>h", action = ":bprev" },
			{ binding = "<Leader>l", action = ":bnext" },
			{ binding = "<Leader>g", action = ":Telescope grep_string" },
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
		"lua_ls"
	}),
	modules = require("user.modules"),
	packages = lib:makePackageList({
		"mcchrish/zenbones.nvim", -- Colors
		{
			"mcchrish/zenbones.nvim", -- Colors
			dependencies = { "rktjmp/lush.nvim" }
		},
		"nvim-tree/nvim-web-devicons", -- Nerd font icon support
		{
			"nvim-telescope/telescope.nvim", -- Fuzzy finder
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		"nvim-treesitter/nvim-treesitter", -- Pretty syntax highlights
		"akinsho/bufferline.nvim", -- Shows open buffers at the top of the screen just like 99% of editors do
		"nvim-tree/nvim-tree.lua", -- File tree/browser
		"goolord/alpha-nvim", -- Startup menu
		"nvim-lualine/lualine.nvim", -- Status line
		"SmiteshP/nvim-navic", -- Winbar
		"utilyre/barbecue.nvim", -- Winbar++
		"windwp/nvim-autopairs", -- Autopairs
		"folke/todo-comments.nvim", -- TODO, HACK, BUG, FIXME, etc comments
		"lukas-reineke/lsp-format.nvim", -- Auto format files with the LSP server on save
		utils:makeLanguageServerPackages(),
	}),
})
