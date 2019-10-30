GlobalObject = GlobalObject or {}
local _M = GlobalObject

function _M.__init__()
    _M.require()

    _M.Root = UnityEngine.GameObject.Find("Root").transform
    _M.Canvas = UnityEngine.GameObject.Find("Canvas").transform
    _M.Canvas_Panel = UnityEngine.GameObject.Find("Canvas/Root_Panel").transform
    _M.Canvas_Tips = UnityEngine.GameObject.Find("Canvas/Root_Tips").transform
end

function _M.require()
    
end

_M.__init__()