require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

local HUWEI_TYPE = 3

function main(actor)
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)
    OfflineHuWeiManager.ShowRulePanel(actor, HUWEI_TYPE)  
end

--��ʾ�������
function show_base_panel(actor)
    OfflineHuWeiManager.ShowBasePanel(actor, HUWEI_TYPE)
end

--���ܲ���
function function_button(actor, sid, sparam)
    OfflineHuWeiManager.DoOperButton(actor, sid, sparam)
end
