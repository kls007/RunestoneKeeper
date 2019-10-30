TipManager = TipManager or {}
local _M = TipManager

_M.beginPos = UnityEngine.Vector3(0, 0, 0)
_M.endPos = UnityEngine.Vector3(0, 300, 0)
_M.duration = 2
function _M.__init__()
    _M.require()
end

function _M.require()
    
end

function _M.Show(content)
    content = tostring(content)
    if content == nil or content == "" then
        content = "空"
    end

    local prefabName = "TipText"
    local prefab = ABManager.abList.prefab_gameobject:LoadAsset(prefabName, typeof(UnityEngine.GameObject))
    local go = UnityEngine.Object.Instantiate(prefab, GlobalObject.Canvas_Tips)
    go.name = "TipText"
    go.transform:SetParent(GlobalObject.Canvas_Tips, false)
    local text = go.transform:GetComponent(typeof(UnityEngine.UI.Text))
    text.text = content

    local action = Actions.New("Move", 
        {
            target = go.transform, 
            duration = TipManager.duration, 
            beginPos = TipManager.beginPos, 
            endPos = TipManager.endPos, 
            completeCallback = 
                function()
                    UnityEngine.Object.DestroyImmediate(go)
                end
        }
    )
    action:Start()
end

_M.__init__()