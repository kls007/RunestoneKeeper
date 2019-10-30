---@class 加载界面
LoadingPanel = PanelClass:new() or {}
local _M = LoadingPanel

_M.prefabName = "LoadingPanel"

function _M:Main()
    UnityEngine.EventTriggerListener.Get(self.gameObject.gameObject, 0).onClick = function()
        TipManager.Show("点击LoadingPanel~~~")

        _M:Destroy()
        StartPanel:Create()
    end
end