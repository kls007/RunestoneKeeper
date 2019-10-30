ABManager = ABManager or {}
local _M = ABManager

_M.abList = {}

function _M.__init__()
    _M.require()

    
end

function _M.require()
    
end

function _M.Load()
    _M.abList.sprite_country = UnityEngine.ResourceManager.LoadFromStreamingAssetsPath("sprite/country.unity3d")
    _M.abList.prefab_gameobject = UnityEngine.ResourceManager.LoadFromStreamingAssetsPath("prefab/gameobject.unity3d")
    _M.abList.prefab_panel = UnityEngine.ResourceManager.LoadFromStreamingAssetsPath("prefab/panel.unity3d")
end

_M.__init__()