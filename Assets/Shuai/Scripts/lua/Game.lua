Game = Game or {}
local _M = Game

function _M.__init__()
    -- print("Game.__init__()")
    _M.require()

    ABManager.Load()
    
    -- LoadingPanel:Create()
    GamePanel:Create()
end

function _M.require()
    require "core/requireAll"
    
end

_M.__init__()