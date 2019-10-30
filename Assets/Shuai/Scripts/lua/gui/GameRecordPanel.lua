---@class 游戏存档界面
GameRecordPanel = PanelClass:new() or {}
local _M = GameRecordPanel

_M.prefabName = "GameRecordPanel"

function _M:InitView()
    local transform = self.gameObject.transform

    self.view.Button_cancel = transform:Find("main/Button_cancel"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.Button_dead = transform:Find("main/Button_dead"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.buttons = transform:Find("main/buttons").transform

    self.view.buttonList = UIManager.ToLuaButtonArray(self.view.buttons:GetComponentsInChildren(typeof(UnityEngine.UI.Button)))
end

function _M:Main()
    UnityEngine.EventTriggerListener.Get(self.view.Button_cancel.gameObject, nil).onClick = function()
        _M:Destroy()
    end

    UnityEngine.EventTriggerListener.Get(self.view.Button_dead.gameObject, nil).onClick = function()
        TipManager.Show("停尸间")
    end

    for index, button in ipairs(self.view.buttonList) do
        UnityEngine.EventTriggerListener.Get(button.gameObject, index).onClick = function()
            AlertPanel:Create(
                {
                    text = "确认进入游戏存档 " .. index .. " 吗", 
                    callback = function()
                        TipManager.Show("进入游戏中...")
                        GameManager.GotoGame({index = index})
                    end
                }
            )
        end
    end
end