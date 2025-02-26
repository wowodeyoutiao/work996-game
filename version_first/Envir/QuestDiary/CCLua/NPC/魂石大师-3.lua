require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()


function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_SOUL_STONE, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, 0)        --���ѡ��ĵ���
    setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, 1)        --��������ҳ����Ϊ1    
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)    
    SoulStoneManager.ShowRulePanel(actor)
end

--��ʾ�������
function show_base_panel(actor)
    SoulStoneManager.ShowBasePanel(actor)
end

--��Ӧ�Ĺ��ܲ���
function soulstone_button(actor, sid, sparam)
    SoulStoneManager.DoOperButton(actor, sid, sparam)
end