functions = functions or {}
local _M = functions


function print_t(t, name, indent)
    if t == nil then
        return print(string.format("%s = %s", name or "value", "nil" ))
    end

    --- 数字 字符串 nil 直接打印
    if t == nil or type(t) == "string" or type(t)=="number" then
        return print(string.format("%s = %s", name or "value", t ))
    end

    --- table 或者 function？ 使用方式打印
    local tableList = {}   
    function table_r (t, name, indent, full)   
        local id = not full and name or type(name)~="number" and tostring(name) or '['..name..']'   
        local tag = indent .. id .. ' = '   
        local out = {}  -- result   
        if type(t) == "table" then   
            if tableList[t] ~= nil then   
                table.insert(out, tag .. '{} -- ' .. tableList[t] .. ' (self reference)')   
            else  
                tableList[t]= full and (full .. '.' .. id) or id  
                if next(t) then -- Table not empty   
                    table.insert(out, tag .. '{')   
                    for key,value in pairs(t) do   
                        table.insert(out,table_r(value,key,indent .. '   ',tableList[t]))   
                    end   
                    table.insert(out,indent .. '}')   
                else table.insert(out,tag .. '{}') end   
            end   
        else  
            local val = type(t)~="number" and type(t)~="boolean" and '"'..tostring(t)..'"' or tostring(t)   
            table.insert(out, tag .. val)   
        end   
        return table.concat(out, '\n')   
    end

    return print(string.format("%s", tostring(table_r(t,name or 'Value', indent or ''))))
end


function table.getIndex(myTable, object)
    local key_index = -1

    for key, value in pairs(myTable) do
        if value == object then
            key_index = key
        end
    end

    return key_index
end