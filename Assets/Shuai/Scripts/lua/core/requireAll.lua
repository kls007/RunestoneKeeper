requireAll = requireAll or {}
local _M = requireAll

function _M.__init__()
    _M.require()
end

function _M.require()
    require "define"

    require "tools/functions"
    require "tools/Easing"
    require "tools/tools"
    

    require "core/Event"
    require "core/GameUpdate"
    require "core/actions"
    require "core/GlobalObject"

    require "manager/GameManager"
    require "manager/ABManager"
    require "manager/UIManager"
    require "manager/TipManager"
    require "manager/AgentManager"
    
    
    require "ShuaiTest"

    -- require "test"

    _M.requireGUI()
end

function _M.requireGUI()
    require "gui/PanelClass" -- Panel父类


    require "gui/AlertPanel" -- 二级确认弹窗界面

    require "gui/LoadingPanel" -- 加载界面
    require "gui/StartPanel" -- 开始界面
    require "gui/LanguagePanel" -- 多语言界面
    require "gui/GameRecordPanel" -- 游戏存档界面
    require "gui/GamePanel" -- 游戏主界面
    
    
    
end

_M.__init__()