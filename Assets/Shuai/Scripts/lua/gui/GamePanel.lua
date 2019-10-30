---@class 游戏主界面
GamePanel = PanelClass:new() or {}
local _M = GamePanel

_M.prefabName = "GamePanel"

function _M:InitView()
    local transform = self.gameObject.transform

    self.view.enemy = transform:Find("enemy")
    local buttons_c = self.view.enemy.transform:GetComponentsInChildren(typeof(UnityEngine.UI.Button))
    self.view.buttons_lua = {}
    for i = 1, buttons_c.Length, 1 do
        self.view.buttons_lua[i] = buttons_c[i - 1]
    end
end

function _M:Main()
    for index, value in ipairs(self.view.buttons_lua) do
        UnityEngine.EventTriggerListener.Get(value.gameObject, index).onClick = function()
            -- print(index)
            TipManager.Show(index)
    
        end
    end
end
