require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

local HUWEI_TYPE = 1

function main(actor)
    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)
    OfflineHuWeiManager.ShowRulePanel(actor, HUWEI_TYPE)  
end

--显示基础面板
function show_base_panel(actor)
    OfflineHuWeiManager.ShowBasePanel(actor, HUWEI_TYPE)
end

--功能操作
function function_button(actor, sid, sparam)
    OfflineHuWeiManager.DoOperButton(actor, sid, sparam)
end
