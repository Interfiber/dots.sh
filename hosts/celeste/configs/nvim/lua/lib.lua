local m = {}


m.installPacker = function ()
	if m.requireLoad("packer") == -1 then
		-- install packer
		os.execute("git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
		return true
	end
	return false
end

m.loadConfig = function (config)

	-- load config
	if m.installPacker() == false then
		-- load color scheme
		config.appearance.colorscheme.activate()


		-- enable modules
		for k, v in pairs(config.modules) do
			if v.enable then
				v.module.activate()
			else
				print("Not enabling module: "..k)
			end
		end

		-- load keybinds
		config.keyboard.leader.activate()

		for _, v in pairs(config.keyboard.bindings) do
			v.activate()
		end

		-- load editor options
		config.editor.options.activate()

		-- load plugins
		require("packer").startup(function (use)
			for k,v in pairs(config.packer.packages) do
				v.activate(use)

				-- install submodules
				if v.cfg.requires ~= nil then
					for _, dep in pairs(v.cfg.requires) do
						dep.activate(use)
					end
				end

			end
		end)

		-- enable LSP
		if config.lsp.enable then
			config.lsp.cmp.activate()

			for _, v in pairs(config.lsp.servers) do
				v.activate()
			end

			config.lsp.features.activate()
		end
	else
		-- DO NOT LOAD THE CONFIG IF PACKER WAS NOT ALREADY INSTALLED
		print("Installed packer, please restart Neovim")
	end
end

m.requireLoad = function (moduleName)
	if pcall(require, moduleName) then
		return require(moduleName)
	else
		return -1
	end
end

m.makeLspServer = function (serverName, config)
	return {
		name = serverName,
		cfg = config,
		activate = function ()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			
			require("lspconfig")[serverName].setup {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					local navic = require("nvim-navic")
				    navic.attach(client, bufnr)
				end
			}
		end
	}
end

function setupColorScheme(config)
	if config.type == "setupFunction" then
		local colorscheme = m.requireLoad(config.name)
	
		if colorscheme.termGuiColors then
			vim.opt.termguicolors = true
		end

		if colorscheme ~= -1 then
			colorscheme.setup(config.setupConfig)
		else
			print("Colorscheme not found!")
		end
	end
end

m.makeColorscheme = function (config)
	return {
		cfg = config,
		activate = function ()
			setupColorScheme(config)
		end
	}
end

m.makePackage = function (repo, config)
	return {
		name = repo,
		cfg = config,
		activate = function (use)
			use(repo, {
				run = config.run,
			})
		end
	}
end

m.makePackerPackage = function ()
	return m.makePackage('wbthomason/packer.nvim', {})
end

m.makeBinding = function (binding, action)
	return {
		binding = binding,
		action = action,
		activate = function ()
			vim.api.nvim_set_keymap("n", binding, action.."<CR>", { noremap = true })
		end
	}
end

m.makeLeader = function (leader)
	return {
		leader = leader,
		activate = function ()
			vim.g.mapleader = leader
		end
	}
end

m.makeEditorOptions = function (config)
	return {
		cfg = config,
		activate = function ()
			vim.opt.tabstop = config.tabSize
			vim.opt.softtabstop = config.tabSize
			vim.opt.shiftwidth = config.tabSize
			vim.opt.expandtab = true
			
			vim.opt.swapfile = config.enableSwapFile

			vim.opt.hlsearch = config.hlSearch
			vim.opt.incsearch = config.incSearch

			vim.opt.wrap = not config.enableLineWrap

			vim.opt.smartindent = config.enableSmartIndent
			vim.opt.nu = config.enableLineNumbers
			vim.opt.relativenumber = config.enableRelativeLineNumbers
		
			if config.removeBufferSeperator then
				vim.cmd "set fillchars+=vert:\\  "
			end
		end
	}

end

return m
