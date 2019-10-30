test = test or {}
local _M = test

function _M.__init__()
    -- print("test.__init__()")
    _M.test1()
end

function _M.test1()
    local GM = UnityEngine.GameObject.Find("GameManager")
    local map = UnityEngine.GameObject.Find("Map")
    local canvas = UnityEngine.GameObject.Find("Canvas").transform

    LUA_Texture2D = {}

    -- local ab_sprite = UnityEngine.ResourceManager.LoadFromStreamingAssetsPath("sprite.unity3d")
    -- local ab_prefab = UnityEngine.ResourceManager.LoadFromStreamingAssetsPath("prefab.unity3d")


    -- local button = UnityEngine.GameObject.Find("Canvas/Button").transform
    -- print_t(UnityEngine.EventTriggerListener, "EventTriggerListener")
    -- UnityEngine.EventTriggerListener.Get(button.gameObject, 0).onClick = function()
    --     print_t(123)
    -- end

    
    -- local prefabScene = UnityEngine.SceneManagement.SceneManager.GetSceneByName("PrefabScene")
    -- SceneManager.UnloadSceneAsync(SceneManager.GetSceneByName("PrefabScene"))


    -- local name = "LoadingPanel"
    -- local ab_panel = UnityEngine.ResourceManager.LoadFromStreamingAssetsPath("prefab/panel.unity3d")
    -- local prefab = ab_panel:LoadAsset(name, typeof(UnityEngine.GameObject))
    -- local go = UnityEngine.Object.Instantiate(prefab, canvas)
    -- go.name = name
    
    
do return end


    -- local prefab = ab_prefab:LoadAsset("sprite", typeof(UnityEngine.GameObject))
    -- local go = UnityEngine.Object.Instantiate(prefab)
    -- go.name = "椎名由奈"


    local names = ab_sprite:GetAllAssetNames()
    for i = 1, names.Length, 1 do
        local name = names[i - 1]
        local sprite = ab_sprite:LoadAsset(name, typeof(UnityEngine.Sprite))
        LUA_Texture2D[sprite.name] = sprite

        local x = math.floor((i - 1) / 4)
        local y = math.floor((i - 1) % 4)
        local go = UnityEngine.ResourceManager.NewGameObject(tostring(i))
        go.transform.position = UnityEngine.Vector3(x * 2 - 4, y * 2 - 3, 0)
        local sr = go:AddComponent(typeof(UnityEngine.SpriteRenderer))
        sr.sprite = sprite -- LUA_Texture2D["1"]
    end

    
    -- local count = map.transform.childCount
    -- for i = 1, count, 1 do
    --     local cell = map.transform:GetChild(i - 1)
    --     cell.gameObject:SetActive(true)
    --     cell.transform.position = UnityEngine.Vector3(i * 1.7 - 6, 0, 0)

    --     local sr = cell.transform:GetComponent(typeof(UnityEngine.SpriteRenderer)) -- local sp = cell.transform:GetComponent("SpriteRenderer")
    --     local sprite = ab_sprite:LoadAsset(names[i - 1], typeof(UnityEngine.Sprite))
    --     sr.sprite = sprite -- LUA_Texture2D["1"]
    -- end
end


_M.__init__()