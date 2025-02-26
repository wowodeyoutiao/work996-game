require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_COMPOSE, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, 0)
    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)
    ItemComposeManager.ShowRulePanel(actor)
end

--显示基础面板
function show_base_panel(actor)
    ItemComposeManager.ShowBasePanel(actor)
end

--合成对应的功能操作
function itemcompose_button(actor, sid, sparam)
    ItemComposeManager.DoOperButton(actor, sid, sparam)
end

