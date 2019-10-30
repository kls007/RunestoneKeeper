---@class 运动曲线类
Easing = Easing or {}
local _M = Easing

function _M.__init__()
    
end


local function clamp(value, min, max)
	if value < min then
		value = min
	elseif value > max then
		value = max    
	end
	
	return value
end

function Easing.LerpEasing(from, to, t, easing)
    if(easing == nil) then
        t = clamp(t, 0, 1)
    else
        t = clamp(easing(t,0,1,1), 0, 1)
    end
    
	return UnityEngine.Vector3(from.x + (to.x - from.x) * t, from.y + (to.y - from.y) * t, from.z + (to.z - from.z) * t)
end

function Easing.outCubic(t, b, c, d)
    t = t / d - 1
    -- return c * (math.pow(t, 3) + 1) + b
    return c * ((t ^ 3) + 1) + b
end

function Easing.inOutCubic(t, b, c, d)
    t = t / d * 2
    if t < 1 then
        return c / 2 * t * t * t + b
    else
        t = t - 2
        return c / 2 * (t * t * t + 2) + b
    end
end

function Easing.outExpo(t, b, c, d)
	if t == d then
	  	return b + c
	else
        -- return c * 1.001 * (-math.pow(2, -10 * t / d) + 1) + b
        return c * 1.001 * (-(2 ^ (-10 * t / d)) + 1) + b
	end
end



_M.__init__()