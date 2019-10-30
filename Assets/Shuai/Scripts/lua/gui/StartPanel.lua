---@class 开始界面
StartPanel = PanelClass:new() or {}
local _M = StartPanel

_M.prefabName = "StartPanel"

function _M:InitView()
    local transform = self.gameObject.transform
    self.view.Button1 = transform:Find("buttons/Button1"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.Button2 = transform:Find("buttons/Button2"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.Button3 = transform:Find("buttons/Button3"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.Button4 = transform:Find("buttons/Button4"):GetComponent(typeof(UnityEngine.UI.Button))
end

function _M:Main()
    UnityEngine.EventTriggerListener.Get(self.view.Button1.gameObject, 1).onClick = function()
        -- TipManager.Show("开始游戏~~~")

        -- GameManager.GotoGame({index = 1})

        GameRecordPanel:Create()
    end

    UnityEngine.EventTriggerListener.Get(self.view.Button2.gameObject, 2).onClick = function()
        TipManager.Show("选项~~~")
    end

    UnityEngine.EventTriggerListener.Get(self.view.Button3.gameObject, 3).onClick = function()
        TipManager.Show("意见反馈~~~")
    end

    UnityEngine.EventTriggerListener.Get(self.view.Button4.gameObject, 4).onClick = function()
        -- TipManager.Show("语言~~~")
        LanguagePanel:Create()
    end
end