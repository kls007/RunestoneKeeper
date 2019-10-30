---@class Panel父类
PanelClass = PanelClass or {}
local _M = PanelClass

_M.view = {}

---@field @预设名字
_M.prefabName = "XXPanel"

_M.prefab = nil
_M.gameObject = nil

_M.externalParams = nil


function _M:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)

    -- o:__init__()

    return o
end

---@type 构造函数
function _M:__init__()
    
end

---@type 打开界面
function _M:Create(params)
    if type(params) == "table" then
        self.externalParams = params
    end

    if self.gameObject == nil then
        self.prefab = ABManager.abList.prefab_panel:LoadAsset(self.prefabName, typeof(UnityEngine.GameObject))
        self.gameObject = UnityEngine.Object.Instantiate(self.prefab, GlobalObject.Canvas_Panel)
        self.gameObject.name = self.prefabName

        self:InitView()
        self:Main()
    end
end

---@type 界面初始化
function _M:InitView()
    -- print_t(self, "self")
    local transform = self.gameObject.transform

end

---@type 主逻辑
function _M:Main()
    
end

---@type 关闭界面
function _M:Destroy()
    UnityEngine.Object.DestroyImmediate(self.gameObject)
    self.gameObject = nil
    self.view = {}
    self.externalParams = nil
end

-- _M.__init__()