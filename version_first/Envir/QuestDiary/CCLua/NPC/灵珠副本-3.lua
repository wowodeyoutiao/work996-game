require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_BAOZHU_BOSS, true) then
        return
    end
    show_base_panel(actor)
end

--����˵�����
function show_rule_panel(actor)
    BaoZhuBossManager.ShowRulePanel(actor)
end

--��ʾ�������
function show_base_panel(actor)
    BaoZhuBossManager.ShowBasePanel(actor)
end

--���ܲ���
function function_button(actor, sid, sparam)
    BaoZhuBossManager.DoOperButton(actor, sid, sparam)
end



