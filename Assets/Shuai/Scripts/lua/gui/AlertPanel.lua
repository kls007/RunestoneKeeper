---@class 二级确认弹窗界面
AlertPanel = PanelClass:new() or {}
local _M = AlertPanel

_M.prefabName = "AlertPanel"

function _M:InitView()
    local transform = self.gameObject.transform

    self.viewText_content = transform:Find("main/Text_content"):GetComponent(typeof(UnityEngine.UI.Text))
    self.Button_close = transform:Find("main/Button_close"):GetComponent(typeof(UnityEngine.UI.Button))
    self.viewButton_cancel = transform:Find("main/buttons/Button_cancel"):GetComponent(typeof(UnityEngine.UI.Button))
    self.viewButton_ok = transform:Find("main/buttons/Button_ok"):GetComponent(typeof(UnityEngine.UI.Button))
end

function _M:Main()
    self.viewText_content.text = ((self.externalParams or {}).text) or "What's Your Problem!"

    UnityEngine.EventTriggerListener.Get(self.Button_close.gameObject, nil).onClick = function()
        _M:Destroy()
    end

    UnityEngine.EventTriggerListener.Get(self.viewButton_cancel.gameObject, nil).onClick = function()
        _M:Destroy()
    end

    UnityEngine.EventTriggerListener.Get(self.viewButton_ok.gameObject, nil).onClick = function()
        if type((self.externalParams or {}).callback) == "function" then
            self.externalParams.callback()
        end

        _M:Destroy()
    end

end