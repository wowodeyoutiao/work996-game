require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_EQUIPPOS_STRENGTH, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)    
    EquipPosStrengthManager.ShowRulePanel(actor)
end

--��ʾ�������
function show_base_panel(actor)
    EquipPosStrengthManager.ShowBasePanel(actor)
end

--��Ӧ�Ĺ��ܲ���
function equippos_strength_button(actor, sid, sparam)
    EquipPosStrengthManager.DoOperButton(actor, sid, sparam)
end