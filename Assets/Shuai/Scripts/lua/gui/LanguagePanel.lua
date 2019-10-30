---@class 多语言界面
LanguagePanel = PanelClass:new() or {}
local _M = LanguagePanel

_M.prefabName = "LanguagePanel"

_M.dataList = 
{
    [1] = {language = "cn", name = "中文", image = "ui_image_team7"},
    [2] = {language = "en", name = "英语", image = "ui_image_team28"},
    [3] = {language = "ja", name = "日语", image = "ui_image_team32"},
    [4] = {language = "ko", name = "韩语", image = "ui_image_team24"},
    [5] = {language = "fr", name = "法语", image = "ui_image_team1"},
    [6] = {language = "de", name = "德语", image = "ui_image_team25"},
    [7] = {language = "it", name = "意大利语", image = "ui_image_team22"},
    [8] = {language = "es", name = "西班牙语", image = "ui_image_team6"},
    [9] = {language = "pt", name = "葡萄牙语", image = "ui_image_team5"},
    [10] = {language = "pt-rBR", name = "巴西语", image = "ui_image_team17"},
    [11] = {language = "ru", name = "俄语", image = "ui_image_team20"},
    [12] = {language = "nl", name = "荷兰语", image = "ui_image_team31"},
}

function _M:InitView()
    local transform = self.gameObject.transform

    self.view.Image_mask = transform:Find("Image_mask"):GetComponent(typeof(UnityEngine.UI.Image))
    self.view.main = transform:Find("main"):GetComponent(typeof(UnityEngine.UI.Image))
    self.view.Button_close = transform:Find("main/Button_close"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.Button_cancel = transform:Find("main/Button_cancel"):GetComponent(typeof(UnityEngine.UI.Button))
    self.view.buttons = transform:Find("main/buttons").transform

    self.view.buttonList = UIManager.ToLuaButtonArray(self.view.buttons:GetComponentsInChildren(typeof(UnityEngine.UI.Button)))
    self.view.imageList = UIManager.ToLuaButtonArray(self.view.buttons:GetComponentsInChildren(typeof(UnityEngine.UI.Image)))
end

function _M:Main()
    UnityEngine.EventTriggerListener.Get(self.view.Button_close.gameObject, nil).onClick = function()
        _M:Destroy()
    end

    UnityEngine.EventTriggerListener.Get(self.view.Button_cancel.gameObject, nil).onClick = function()
        _M:Destroy()
    end

    local parent = self.view.buttons.transform
    local childCount = parent.transform.childCount
    if childCount <= 0 then
        return
    end
    -- 隐藏
    UIManager.SetChildrenActive(parent, false)

    local prefab = parent.transform:GetChild(0)
    for i = 1, #self.dataList, 1 do
        local cellData = self.dataList[i]
        local gameObject = nil

        if i <= childCount then
            gameObject = parent.transform:GetChild(i - 1).gameObject
        else
            gameObject = UnityEngine.Object.Instantiate(prefab)
        end
        gameObject.gameObject:SetActive(true)
        gameObject.transform:SetParent(parent.transform, false)
        
        local Text_1 = gameObject:GetComponentInChildren(typeof(UnityEngine.UI.Text))
        local Image_1 = gameObject:GetComponent(typeof(UnityEngine.UI.Image))
        local Button_1 = gameObject:GetComponent(typeof(UnityEngine.UI.Button))
        
        Text_1.text = cellData.name
        Image_1.sprite = ABManager.abList.sprite_country:LoadAsset(cellData.image, typeof(UnityEngine.Sprite))
        
        UnityEngine.EventTriggerListener.Get(Button_1.gameObject, i).onClick = function()
            TipManager.Show(cellData.name)
        end
    end

end