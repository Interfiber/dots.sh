local m = {}

---
--- Creates an editor configuration
---
---@param conf table
---@return table config
function m:makeConfig(conf)
	local config = {}

	function config:apply()
		conf.editor.settings:apply()
		conf.editor.keybinds:apply()
		conf.packages:apply()
		conf.editor.colorscheme:apply()
		conf.modules:apply()
		conf.languages:apply()
	end

	return config
end

---
--- Creates a colorscheme
---
---@param colorscheme table
---@return table colorscheme
function m:makeColorscheme(colorscheme)
	local scheme = {}

	function scheme:apply()
		vim.opt.background = colorscheme.background

		if colorscheme.setupType == "default" then
			vim.cmd("colorscheme " .. colorscheme.name)
		else
			colorscheme.setup()
		end
	end

	return scheme
end

---
--- Creates a package list
---
---@param packageList table
---@return table packageList
function m:makePackageList(packageList)
	local packages = {}

	function packages:apply()
		require("bootstrap.lazy") -- Make sure we have lazy.nvim installed

		require("lazy").setup(packageList, {})
	end

	return packages
end

---
--- Creates an editor module list
---
---@param modules table
---@return table moduleList
function m:makeModuleList(modules)
	local moduleList = {}

	function moduleList:apply()
		for _, module in pairs(modules) do
			require(module):activate()
		end
	end

	return moduleList
end

---
--- Creates an editor module
---
---@param mod table
---@return table module
function m:makeModule(mod)
	local module = {}

	function module:activate()
		if mod.enabled then
			mod:onActivate()
		else
			print(mod.name .. " is not enabled")
		end
	end

	return module
end

---
--- Creates an editor settings module
---
---@param conf table
---@return table settings
function m:makeEditorSettings(conf)
	local settings = {}

	function settings:apply()
		-- I had to hardcode all of these :(

		vim.wo.relativenumber = conf.relativeLineNumbers -- Relative line numbers
		vim.wo.number = conf.lineNumbers             -- Line numbers
		vim.opt.termguicolors = conf.termGuiColors   -- Term GUI colors
		vim.opt.tabstop = conf.tabSize               -- Tab size
		vim.opt.softtabstop = conf.tabSize           -- Tab size
		vim.opt.shiftwidth = conf.tabSize            -- Tab size
		vim.opt.expandtab = false                    -- Don't turn tabs into ugly spaces
		vim.g.mapleader = conf.leader                -- Leader key, comes before every keybind(if mapped with it)
	end

	return settings
end

---
--- Creates an editor keybinds module
---
---@param binds table
---@return table bindings
function m:makeEditorKeybinds(binds)
	local bindings = {}

	function bindings:apply()
		for _, bind in pairs(binds) do
			if type(bind.action) == "string" then
				vim.api.nvim_set_keymap("n", bind.binding, bind.action .. "<CR>", { noremap = true })
			else
				vim.keymap.set("n", bind.binding, bind.action, { noremap = true })
			end
		end
	end

	return bindings
end

---
--- Creates a language server module
---
---@param serverList table
---@return table lspServers
function m:makeLanguageServers(serverList)
	local lspServers = {}

	function lspServers:apply()
		for _, serverName in pairs(serverList) do
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspformat = require("lsp-format")

			require("lspconfig")[serverName].setup({
				capabilities = capabilities,
				on_attach = function(client)
					lspformat.on_attach(client)
				end,
			})
		end
	end

	return lspServers
end

return m
