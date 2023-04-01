local m = {}
local lib = require("lib")

m.activate = function()
	local lualine = lib.requireLoad("lualine")

	if lualine ~= -1 then
		lualine.setup({
		})
	end
end

return m
