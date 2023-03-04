local m = {}
local lib = require("lib")

m.activate = function()
	local autopairs = lib.requireLoad("nvim-autopairs")
	local todo = lib.requireLoad("todo-comments")

	if autopairs ~= -1 then
		autopairs.setup({})
	end

	if todo ~= -1 then
		todo.setup({})
	end

	vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

return m
