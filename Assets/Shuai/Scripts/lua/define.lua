define = define or {}
local _M = define

function _M.__init__()
    -- print("define.__init__()")
    UnityEngine = CS.UnityEngine
    -- GameObject = CS.UnityEngine.GameObject
    -- Transform = CS.UnityEngine.Transform
    SceneManager = UnityEngine.SceneManagement.SceneManager
end

_M.__init__()