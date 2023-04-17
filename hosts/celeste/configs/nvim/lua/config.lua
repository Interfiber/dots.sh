local m = {}
local lib = require("lib")

m.config = {
	appearance = {
		colorscheme = lib.makeColorscheme({
			termGuiColors = true,
			type = "function",
			setup = function()
				local decay = lib.requireLoad("decay")

				if decay ~= -1 then
					decay.setup({
						style = "decayce",
						nvim_tree = {
							contrast = true, -- nvim tree contrast
						},

						italics = {
							code = true,
							comments = true, -- to disable italic comments, replace to true to enable
						},
					})
				end
			end,
			name = "decay",
		}),
	},
	editor = {
		options = lib.makeEditorOptions({
			tabSize = 2,
			enableSwapfile = false,
			hlSearch = false,
			incSearch = true,
			enableLineWrap = false,
			enableSmartIndent = true,
			enableLineNumbers = true,
			enableRelativeLineNumbers = true,
			removeBufferSeperator = true,
		}),
	},
	lsp = {
		enable = true,
		servers = {
			lib.makeLspServer("rust_analyzer", {}),
			lib.makeLspServer("clangd", {}),
		},
		cmp = require("modules").getModule("cmp"),
		features = require("modules").getModule("lsp_features"),
	},
	modules = {
		treesitter = {
			enable = true,
			module = require("modules").getModule("treesitter"),
		},
		bufferline = {
			enable = true,
			module = require("modules").getModule("bufferline"),
		},
		lualine = {
			enable = true,
			module = require("modules").getModule("lualine"),
		},
		nvimtree = {
			enable = true,
			module = require("modules").getModule("nvimtree"),
		},
		indent_blankline = {
			enable = true,
			module = require("modules").getModule("indent_blankline"),
		},
		trouble = {
			enable = true,
			module = require("modules").getModule("trouble"),
		},
		alpha = {
			enable = true,
			module = require("modules").getModule("alpha"),
		},
		neoscroll = {
			enable = true,
			module = require("modules").getModule("neoscroll"),
		},
		noice = {
			enable = true,
			module = require("modules").getModule("noice"),
		},
	},
	keyboard = {
		leader = lib.makeLeader(" "),
		bindings = {
			lib.makeBinding("<Leader>q", ":q"),
			lib.makeBinding("<Leader>f", ":Telescope find_files"),
			lib.makeBinding("<Leader>w", ":bd"),
			lib.makeBinding("<Leader>t", ":NvimTreeToggle"),
			lib.makeBinding("<Leader>h", ":bprev"),
			lib.makeBinding("<Leader>l", ":bnext"),
			lib.makeBinding("<Leader>p", ":Trouble"),
			lib.makeBinding("<Leader>to", ":TodoTelescope"),
			lib.makeBinding("<Leader>tr", ":TodoTrouble"),
			lib.makeBinding("<Leader>g", ":Telescope grep_string"),
		},
	},
	packer = {
		packages = {
			lib.makePackage("decaycs/decay.nvim", {}),
			lib.makePackage("nvim-telescope/telescope.nvim", {
				requires = { lib.makePackage("nvim-lua/plenary.nvim", {}) },
			}),
			lib.makePackage("nvim-treesitter/nvim-treesitter", {
				run = ":TSUpdate",
			}),
			lib.makePackage("nvim-tree/nvim-web-devicons", {}),
			lib.makePackage("akinsho/bufferline.nvim", {}),
			lib.makePackage("nvim-lualine/lualine.nvim", {}),
			lib.makePackage("nvim-tree/nvim-tree.lua", {}),
			lib.makePackage("lukas-reineke/indent-blankline.nvim", {}),
			lib.makePackage("neovim/nvim-lspconfig", {}),

			-- nvim lsp
			lib.makePackage("hrsh7th/cmp-nvim-lsp", {}),
			lib.makePackage("hrsh7th/cmp-buffer", {}),
			lib.makePackage("hrsh7th/cmp-path", {}),
			lib.makePackage("hrsh7th/cmp-cmdline", {}),
			lib.makePackage("hrsh7th/nvim-cmp", {}),
			lib.makePackage("L3MON4D3/LuaSnip", {}),
			lib.makePackage("folke/trouble.nvim", {}),
			lib.makePackage("saadparwaiz1/cmp_luasnip", {}),
			lib.makePackage("onsails/lspkind.nvim", {}),

			lib.makePackage("goolord/alpha-nvim", {}),
			lib.makePackage("SmiteshP/nvim-navic", {}),
			lib.makePackage("karb94/neoscroll.nvim", {}),
			lib.makePackage("windwp/nvim-autopairs", {}),
			lib.makePackage("folke/noice.nvim", {
				requires = { lib.makePackage("MunifTanjim/nui.nvim", {}), lib.makePackage("rcarriga/nvim-notify", {}) },
			}),
			lib.makePackage("folke/todo-comments.nvim", {}),
			lib.makePackage("lukas-reineke/lsp-format.nvim", {}),
			lib.makePackage("RRethy/nvim-base16", {}),
			lib.makePackage("decaycs/decay.nvim", {}),

			lib.makePackerPackage(),
		},
	},
}

return m
