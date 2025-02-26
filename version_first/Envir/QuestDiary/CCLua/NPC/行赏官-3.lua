require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()


function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_GUANZHI, true) then
        return
    end    
    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)
    GuanZhiManager.ShowRulePanel(actor)  
end

--显示基础面板
function show_base_panel(actor)
    GuanZhiManager.ShowBasePanel(actor)
end

--功能操作
function function_button(actor, sid, sparam)
    GuanZhiManager.DoOperButton(actor, sid, sparam)
end