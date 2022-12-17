local m = {}
local lib = require("lib")

m.activate = function ()
    local neoscroll = lib.requireLoad("neoscroll")

    if neoscroll ~= -1 then
        neoscroll.setup({
            hide_cursor = true
        })
    end
end

return m