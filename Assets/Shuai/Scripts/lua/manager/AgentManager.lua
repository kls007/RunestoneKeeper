---@class CStoLua中间件
AgentManager = AgentManager or {}
local _M = AgentManager

function _M.__init__()
    Event.AddListener("KeyboardEvent", function(params)
        -- print_t(params, "params")

        local keyCode = params.keyCode

        local move = 1
        if keyCode == "UpArrow" then
            -- TipManager.Show("上")
            local pos = GameManager.player.transform.position
            GameManager.player.transform.position = UnityEngine.Vector3(pos.x, pos.y + move, pos.z)
        
        elseif keyCode == "DownArrow" then
            -- TipManager.Show("下")
            local pos = GameManager.player.transform.position
            GameManager.player.transform.position = UnityEngine.Vector3(pos.x, pos.y - move, pos.z)
        
        elseif keyCode == "LeftArrow" then
            -- TipManager.Show("左")
            local pos = GameManager.player.transform.position
            GameManager.player.transform.position = UnityEngine.Vector3(pos.x - move, pos.y, pos.z)
        
        elseif keyCode == "RightArrow" then
            -- TipManager.Show("右")
            local pos = GameManager.player.transform.position
            GameManager.player.transform.position = UnityEngine.Vector3(pos.x + move, pos.y, pos.z)
        end

    end)
end

function _M.CsCallLua(keyCode)
    -- print(params)
    -- TipManager.Show(keyCode)

    Event.Dispatch("KeyboardEvent", {keyCode = keyCode})

    tools.trycatch(ShuaiTest.Refresh, {params = {keyCode = keyCode}, errorMode = true})
end

_M.__init__()