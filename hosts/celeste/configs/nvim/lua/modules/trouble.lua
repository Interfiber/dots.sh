local m = {}
local lib = require("lib")

m.activate = function()
	local trouble = lib.requireLoad("trouble")

	if trouble ~= -1 then
		trouble.setup({})
	end
end

return m
