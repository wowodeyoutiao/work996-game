require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, -1)
    setplaydef(actor, CommonDefine.VAR_N_CHOOSE_OPER_TYPE, 0)
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)
    SkillUpgrade.ShowRulePanel(actor)
end

--��ʾ�������
function show_base_panel(actor)
    SkillUpgrade.ShowBasePanel(actor)
end

--���ܲ���
function function_button(actor, sid, sparam)
    SkillUpgrade.DoOperButton(actor, sid, sparam)
end