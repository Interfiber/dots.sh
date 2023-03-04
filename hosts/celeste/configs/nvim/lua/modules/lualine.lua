local m = {}
local lib = require("lib")

m.activate = function()
	local lualine = lib.requireLoad("lualine")

	if lualine ~= -1 then
		lualine.setup({
			options = {
				theme = "vscode",
			},
		})
	end
end

return m
