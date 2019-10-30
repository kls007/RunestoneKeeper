---@class 工具类
tools = tools or {}

function tools.__TRACKBACK__(errmsg)
    local track_text = debug.traceback(tostring(errmsg), 6)
    print("---------------------------------------- TRACKBACK ----------------------------------------")
    print(track_text, "LUA ERROR")
    print("---------------------------------------- TRACKBACK ----------------------------------------")
    local exception_text = "LUA EXCEPTION\n" .. track_text
    return false
end

function tools.trycatch(func, args)
    if args.errorMode == true then
        return xpcall(function() func(args.params) end, tools.__TRACKBACK__)
    else
        return xpcall(function() func(args.params) end, function(errmsg)
            -- nothing
            return false
        end)
    end
end

-- function tools.trycatch(func, ...)
--     local args = { ... }
--     return xpcall(function() func(table.unpack(args)) end, tools.__TRACKBACK__)
-- end