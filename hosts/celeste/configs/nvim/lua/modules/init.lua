local m = {}
local lib = require("lib")

m.getModule = function (moduleName)
	local module = lib.requireLoad("modules."..moduleName)

	return module
end

return m