require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_COMPOSE, true) then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, 0)
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)
    ItemComposeManager.ShowRulePanel(actor)
end

--��ʾ�������
function show_base_panel(actor)
    ItemComposeManager.ShowBasePanel(actor)
end

--�ϳɶ�Ӧ�Ĺ��ܲ���
function itemcompose_button(actor, sid, sparam)
    ItemComposeManager.DoOperButton(actor, sid, sparam)
end

