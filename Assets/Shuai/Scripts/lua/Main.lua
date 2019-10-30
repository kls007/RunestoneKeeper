Main = Main or {}
local _M = Main

--主入口函数。从这里开始lua逻辑
function _M.__init__()
    -- print("Lua_Main~~~")
    -- print("Main.__init__()")

    require "Game"
end

_M.__init__()