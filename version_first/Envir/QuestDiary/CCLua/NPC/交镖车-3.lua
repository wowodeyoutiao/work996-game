require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)    
    show_panel(actor)
end

--��ʾ���ڽ���
function show_panel(actor)
    YunBiaoManager.ShowSubmitBiaoChePanel(actor)
end


--��ȡ����
function get_reward(actor)
    YunBiaoManager.GetBiaoCheReward(actor)
end