local m = {}
local lib = require("lib")

m.activate = function()
	local tree = lib.requireLoad("nvim-tree")

	if tree ~= -1 then
		tree.setup({})
	end
end

return m
