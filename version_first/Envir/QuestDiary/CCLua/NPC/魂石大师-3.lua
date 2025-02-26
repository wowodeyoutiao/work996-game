require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()


function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_SOUL_STONE, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, 0)        --清空选择的道具
    setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, 1)        --设置数据页面编号为1    
    show_base_panel(actor)
end

--规则说明面板
function show_rule_panel(actor)    
    SoulStoneManager.ShowRulePanel(actor)
end

--显示基础面板
function show_base_panel(actor)
    SoulStoneManager.ShowBasePanel(actor)
end

--对应的功能操作
function soulstone_button(actor, sid, sparam)
    SoulStoneManager.DoOperButton(actor, sid, sparam)
end