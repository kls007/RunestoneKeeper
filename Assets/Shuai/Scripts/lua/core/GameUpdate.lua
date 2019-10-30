GameUpdate = GameUpdate or {}
local _M = GameUpdate

function _M.__init__()
    -- print_t("GameUpdate.__init__")

end

-- local time = 0
-- local isPlay = false
function _M.Update()
    Event.Dispatch("LuaUpdate")

    -- if isPlay == true then
    --     time = time + UnityEngine.Time.deltaTime
    --     if time >= 1 then
    --         print_t(time)
    --         time = 0
    --     end
    -- end
end

-- function _M.Start()
--     isPlay = true
--     time = 0
-- end

-- function _M.Stop()
--     isPlay = false    
-- end

_M.__init__()