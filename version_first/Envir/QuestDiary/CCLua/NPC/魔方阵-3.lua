require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_MOFANGZHEN, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)
    MoFangZhenManager.ShowRulePanel(actor)
end

--显示基础面板
function show_base_panel(actor)
    MoFangZhenManager.ShowBasePanel(actor)
end

--功能操作
function function_button(actor, sid, sparam)
    MoFangZhenManager.DoOperButton(actor, sid, sparam)
end