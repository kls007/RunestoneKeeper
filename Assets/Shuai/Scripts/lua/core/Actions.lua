---@class 动作管理类
Actions = Actions or {}
local _M = Actions

_M.actions = {}

local time = 0
local duration = 0

function _M.__init__()
    Event.AddListener("LuaUpdate", _M.onLuaUpdate)
end

function _M.onLuaUpdate()
    -- print_t(1)
    for key, value in pairs(_M.actions) do
        local action = value
        if action.isPlay then
            -- print("更新~~~")

            -- time = time + UnityEngine.Time.deltaTime
            -- if time >= 1 then
            --     print(time)
            --     time = 0
            -- end
            
            action.time = action.time + UnityEngine.Time.deltaTime
            action:act(UnityEngine.Time.deltaTime)
            if action.time >= action.duration then
                action.isPlay = false
                action.time = 0
                action:Complete()
            end
        end
        
    end
end

function _M.New(name, o)
    local action = ActionClass:new(o)
    if name == "Timer" then
        action = ActionClass:new(o)
    elseif name == "Move" then
        action = MoveClass:new(o)
    end

    table.insert(_M.actions, action)
    return action
end

---@class 定时
ActionClass = {time = 0, duration = 1, isPlay = false, completeCallback = nil}
function ActionClass:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)

    return o
end

function ActionClass:Start()
    self.isPlay = true
    self.time = 0

    -- print("开始") -- TODO:
end

function ActionClass:Stop()
    self.isPlay = false
    self.time = 0
end

function ActionClass:Complete()
    -- print("over~~~") -- TODO:
    if type(self.completeCallback) == "function" then
        self.completeCallback()
    end
end

---@class 移动
MoveClass = {time = 0, duration = 1, isPlay = false, completeCallback = nil}
function MoveClass:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)

    return o
end

function MoveClass:Start()
    self.isPlay = true
    self.time = 0

    -- print("开始") -- TODO:
end

function MoveClass:Stop()
    self.isPlay = false
    self.time = 0
end

function MoveClass:Complete()
    -- print("over~~~") -- TODO:
    if type(self.completeCallback) == "function" then
        self.completeCallback()
    end
end

function MoveClass:act(delta)
	self.time = self.time + delta
	local percent = self.time / self.duration

    local x = (self.endPos.x - self.beginPos.x) * percent
    local y = (self.endPos.y - self.beginPos.y) * percent
    local z = (self.endPos.z - self.beginPos.z) * percent
	-- self.target.localPosition = UnityEngine.Vector3(x, y, z) -- LerpEasing(self.beginPos, self.endPos, percent, self.easing)
    self.target.localPosition = Easing.LerpEasing(self.beginPos, self.endPos, percent, Easing.outCubic)

	return percent >= 1
end


_M.__init__()