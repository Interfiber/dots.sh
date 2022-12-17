local m = {}
local lib = require("lib")

m.activate = function ()
	local indent = lib.requireLoad("indent_blankline")

	if indent ~= -1 then
		indent.setup({
			show_current_context = true,
    		show_current_context_start = true,
		})
	end
end

return m