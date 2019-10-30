ShuaiTest = {}
local _M = ShuaiTest

function _M.__init__()
    ShuaiTest.require()
end

function _M.require()
    
end

function _M.Refresh(params)
    local keyCode = params.keyCode
    local keyCodeStr = tostring(keyCode)

    package.loaded["ShuaiTest"] = nil
    require("ShuaiTest")

    local functionTestKeyCode = ShuaiTest["Test" .. keyCodeStr]
    if functionTestKeyCode then
        functionTestKeyCode()
    else
        TipManager.Show("Test" .. keyCodeStr .. "不存在")
    end
end


function _M.TestQ()
    -- print_t("QQQ", "ShuaiTest")
    -- TipManager.Show("TestQ")

    -- print_t(_VERSION, "_VERSION")
    
    
    -- print_t(ABManager.abList.sprite_country, "ABManager.abList.sprite_country")
    AlertPanel:Create(
        {
            text = "确认"  .. "吗", 
            callback = function()
                TipManager.Show("进入游戏中...")
            end
        }
    )


    -- local self = LanguagePanel

    -- local parent = self.view.buttons.transform
    -- local childCount = parent.transform.childCount
    -- if childCount <= 0 then
    --     return
    -- end
    -- -- 隐藏
    -- for i = 1, childCount, 1 do
    --     local child = parent.transform:GetChild(i - 1)
    --     child.gameObject:SetActive(false)
    -- end

    -- local prefab = parent.transform:GetChild(0)
    -- for i = 1, #self.dataList, 1 do
    --     local cellData = self.dataList[i]
    --     local gameObject = nil

    --     if i <= childCount then
    --         gameObject = parent.transform:GetChild(i - 1).gameObject
    --     else
    --         gameObject = UnityEngine.Object.Instantiate(prefab)
    --     end
    --     gameObject.gameObject:SetActive(true)
    --     gameObject.transform:SetParent(parent.transform, false)
        
    --     local Text_1 = gameObject:GetComponentInChildren(typeof(UnityEngine.UI.Text))
    --     local Image_1 = gameObject:GetComponent(typeof(UnityEngine.UI.Image))
    --     local Button_1 = gameObject:GetComponent(typeof(UnityEngine.UI.Button))
        
    --     Text_1.text = cellData.name
    --     Image_1.sprite = ABManager.abList.sprite_country:LoadAsset(cellData.image, typeof(UnityEngine.Sprite))
        
    --     UnityEngine.EventTriggerListener.Get(Button_1.gameObject, i).onClick = function()
    --         TipManager.Show(cellData.name)
    --     end
    -- end

    -- if #self.dataList then
    --     -- body
    -- end



    -- local args = { ... }
    -- return xpcall(function() func(table.unpack(args)) end, tools.__TRACKBACK__)

    -- tools.trycatch(ShuaiTest.Refresh, {params = {keyCode = "Q"}, errorMode = true})

    -- function func(...)
    --     local arg = {...}
    --     local tbl = table.unpack(arg)
    --     print(tbl)
    -- end

    -- func(1, 2)

end

function _M.TestW()
    -- print_t("WWW", "ShuaiTest")
    TipManager.Show("TestW")

    LoadingPanel:Destroy()
end

function _M.TestE()
    -- print_t("EEE", "ShuaiTest")
    TipManager.Show("TestE")

end

function _M.TestR()
    -- print_t("RRR", "ShuaiTest")
    TipManager.Show("TestR")


    -- local canvas = UnityEngine.GameObject.Find("Canvas").transform
    -- local go = UnityEngine.ResourceManager.NewGameObject(tostring("Text"))
    -- go.transform:SetParent(canvas, false)
    -- local rt = go:AddComponent(typeof(UnityEngine.RectTransform))
    -- local text = go:AddComponent(typeof(UnityEngine.UI.Text))
    -- text.text = 123
    -- text.fontSize = 100
    -- text.horizontalOverflow = 1
    -- text.verticalOverflow = 1
    -- text.color = 0xFF0000FF
    -- print_t(text.horizontalOverflow, "horizontalOverflow")
    -- print_t(text.verticalOverflow, "verticalOverflow")
    -- print_t(text.font, "font")

    -- text.font = customFont;
end

_M.__init__()

-- return _M