require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_EQUIP_RANDOMAB, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)    
    EquipRandomABManager.ShowRulePanel(actor)
end

--��ʾ�������
function show_base_panel(actor)
    EquipRandomABManager.ShowBasePanel(actor)
end

--��Ӧ�Ĺ��ܲ���
function equip_randomab_button(actor, sid, sparam)
    EquipRandomABManager.DoOperButton(actor, sid, sparam)
end
