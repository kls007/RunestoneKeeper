---@class 游戏管理类
GameManager = GameManager or {}
local _M = GameManager

_M.player = nil
function _M.__init__()
    _M.require()

end

function _M.require()
    
end

function _M.GotoGame(params)
    local index = params.index

    GameRecordPanel:Destroy()
    StartPanel:Destroy()

    GamePanel:Create()


    local prefab_map = ABManager.abList.prefab_gameobject:LoadAsset("Grid", typeof(UnityEngine.GameObject))
    print_t(prefab_map, "prefab_map")
    local gameObject_map = UnityEngine.Object.Instantiate(prefab_map, GlobalObject.Root)

    local prefab_player = ABManager.abList.prefab_gameobject:LoadAsset("Player", typeof(UnityEngine.GameObject))
    _M.player = UnityEngine.Object.Instantiate(prefab_player, GlobalObject.Root)
    
end

_M.__init__()