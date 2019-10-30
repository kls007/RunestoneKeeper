UIManager = UIManager or {}
local _M = UIManager

function _M.__init__()
    _M.require()

end

function _M.require()
    
end

-- C#Button数组转换成LuaButton数组
function _M.ToLuaButtonArray(csButtonArray)
    local luaButtonArray = {}

    for i = 1, csButtonArray.Length, 1 do
        luaButtonArray[i] = csButtonArray[i - 1]
    end

    return luaButtonArray
end

---@ type 显示或隐藏所有一级子物体
function _M.SetChildrenActive(parent, active)
    if parent == nil then
        return
    end

    parent = parent.transform
    local childCount = parent.childCount
    if childCount <= 0 then
        return
    end

    -- 隐藏
    for i = 1, childCount, 1 do
        local child = parent:GetChild(i - 1)
        child.gameObject:SetActive(active)
    end
end

_M.__init__()