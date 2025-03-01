require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_EQUIPPOS_STRENGTH, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)    
    EquipPosStrengthManager.ShowRulePanel(actor)
end

--显示基础面板
function show_base_panel(actor)
    EquipPosStrengthManager.ShowBasePanel(actor)
end

--对应的功能操作
function equippos_strength_button(actor, sid, sparam)
    EquipPosStrengthManager.DoOperButton(actor, sid, sparam)
end