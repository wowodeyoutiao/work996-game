require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()
function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_EQUIPPOS_STAR, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    for i = EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX, 1 do
        local checkvar = CommonDefine.CHECK_BOX_VAR[i - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1]
        setplaydef(actor, checkvar, 0)
    end


    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)    
    EquipPosStarManager.ShowRulePanel(actor)
end

--显示基础面板
function show_base_panel(actor)
    EquipPosStarManager.ShowBasePanel(actor)
end

--对应的功能操作
function equippos_star_button(actor, sid, sparam)
    EquipPosStarManager.DoOperButton(actor, sid, sparam)
end

--回调自动升星
function equippos_star_auto_upgrade(actor)
    EquipPosStarManager.EquipPosAutoUpgradeStar(actor)
    EquipPosStarManager.ShowBasePanel(actor)
end