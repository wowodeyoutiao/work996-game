require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_YUNBIAO, true) then
        return
    end

    show_panel(actor)
end

--��ʾ���ڽ���
function show_panel(actor)
    YunBiaoManager.ShowAcceptBiaoChePanel(actor)
end

--�����ڳ�
function accept_biaoche(actor)
    YunBiaoManager.AcceptBiaoChe(actor)
end

--ˢ���ڳ�
function refresh_biaoche(actor)
    YunBiaoManager.RefreshBiaoChe(actor)
end