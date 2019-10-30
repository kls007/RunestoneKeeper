---@class Event : 事件分发器 @lua事件分发
Event = Event or {}
local _M = Event

Event.events = {}
-- local listenerTable = {}

function _M.__init__()
    _M.require()
end

function _M.require()
    
end

---@type 增加监听
function Event.AddListener(e, handler)
    if e == nil then
        return
    end
    if type(handler) ~= "function" then
        return
    end

    if Event.events[e] == nil then
        Event.events[e] = {} -- TODO:
    end

    local key_index = table.getIndex(Event.events[e], handler)
    if key_index == -1 then
        table.insert(Event.events[e], handler)
    end
end

---@type 移除监听
function Event.RemoveListener(e, handler)
    if e == nil then
        return
    end
    if type(handler) ~= "function" then
        return
    end
    if type(Event.events[e]) ~= "table" then
        return
    end

    local key_index = table.getIndex(Event.events[e], handler)

    if key_index == -1 then
        return
    end

    if type(key_index) == "number" then
        table.remove(Event.events[e], key_index)
    elseif type(key_index) == "string" then
        Event.events[e][key_index] = nil
    end
end

---@type 触发监听
function Event.Dispatch(e, params)
    if e == nil then
        return
    end
    if type(Event.events[e]) ~= "table" then
        return
    end

    for key, handler in pairs(Event.events[e]) do
        if type(handler) == "function" then
            handler(params)
        end
    end
end

_M.__init__()