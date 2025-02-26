FirstRecharge = {}

--functionid
local FIRSTRECHARGE_BUTTONFUNC_ID_1 = 1    --�׳书�ܰ���-�����ֵ
local FIRSTRECHARGE_BUTTONFUNC_ID_2 = 2    --�׳书�ܰ���-ѡ���һ��
local FIRSTRECHARGE_BUTTONFUNC_ID_3 = 3    --�׳书�ܰ���-ѡ��ڶ���
local FIRSTRECHARGE_BUTTONFUNC_ID_4 = 4    --�׳书�ܰ���-ѡ�������
local FIRSTRECHARGE_BUTTONFUNC_ID_5 = 5    --�׳书�ܰ���-�����ȡ ��ʾ����ȷ�Ͽ�
local FIRSTRECHARGE_BUTTONFUNC_ID_6 = 6    --�׳书�ܰ���-˫����ȡ����
local FIRSTRECHARGE_BUTTONFUNC_ID_7 = 7    --�׳书�ܰ���-ȷ�������ȡ


local FIRST_RECHARGE_SHOW_VALUE_TEXT = {
    '��ֵ: 180Ԫ',
    '��ֵ: 230Ԫ',
    '��ֵ: 150Ԫ',
}

local DAY_BUTTON_PIC = {
    [1] = {pic1='private/cc_first_recharge/1.png', pic2='private/cc_first_recharge/4.png', pic3='private/cc_first_recharge/6.png'},
    [2] = {pic1='private/cc_first_recharge/2.png', pic2='private/cc_first_recharge/3.png', pic3='private/cc_first_recharge/6.png'},
    [3] = {pic1='private/cc_first_recharge/2.png', pic2='private/cc_first_recharge/4.png', pic3='private/cc_first_recharge/5.png'},
}

local MIN_FIRST_RECHARGE_GOLDNUM = 6                        --��С�׳���
local DOUBLE_REWARD_NEEDITEMS = {{name='Ԫ��', num=300}}     --��ȡ˫����Ҫ������

--���ص�ǰ���׳�����
function FirstRecharge.GetCurrRechargeDay(actor)
    local currRechargeDay = 0
    local firstRechargeDay = getplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY)
    if firstRechargeDay > 0 then
        local currday = BF_GetDay(os.time())
        if currday >= firstRechargeDay then
            currRechargeDay = currday - firstRechargeDay + 1
        end
    end
    return currRechargeDay
end

--�򿪽���
function FirstRecharge.OpenPanel(actor)
    local currRechargeDay = FirstRecharge.GetCurrRechargeDay(actor)
    if currRechargeDay < 1 then
        currRechargeDay = 1
    elseif currRechargeDay > 3 then
        currRechargeDay = 3
    end    
    FirstRecharge.ShowFirstRechargePanel(actor, currRechargeDay)
end

--�Ƿ���ʾ�������icon
function FirstRecharge.CanShowIcon(actor)
    if BF_IsNullObj(actor) then
        return false
    end

    local currRechargeDay = FirstRecharge.GetCurrRechargeDay(actor)
    if currRechargeDay > 3 then
        if (getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2) == 1) and (getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3) == 1) then
            return false
        end
    end
    return true
end

--��ʾ�׳���Ϣ
function FirstRecharge.ShowFirstRechargePanel(actor, chooseday, bShowDoubleCheckPanel)
    if BF_IsNullObj(actor) or (chooseday==nil) or (chooseday < 1) or (chooseday > 3) then
        return
    end

    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, chooseday)

    local currRechargeDay = FirstRecharge.GetCurrRechargeDay(actor)
    currRechargeDay = math.min(3, currRechargeDay)
    
    local strPanelInfo = '<Img|x=94.0|y=53.0|move=0|show=0|reset=1|esc=1|loadDelay=0|bg=1|img=private/cc_first_recharge/12.png>'..
        '<Layout|x=859.0|y=112.0|width=80|height=80|link=@exit>'..
        '<Button|x=859.0|y=112.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Button|x=417.0|y=175.0|color=255|size=18|nimg='..DAY_BUTTON_PIC[chooseday].pic1..'|mimg='..DAY_BUTTON_PIC[chooseday].pic1..'|link=@firstrecharge_button,'..FIRSTRECHARGE_BUTTONFUNC_ID_2..'>'..
        '<Button|x=547.0|y=175.0|color=255|size=18|nimg='..DAY_BUTTON_PIC[chooseday].pic2..'|mimg='..DAY_BUTTON_PIC[chooseday].pic2..'|link=@firstrecharge_button,'..FIRSTRECHARGE_BUTTONFUNC_ID_3..'>'..
        '<Button|x=677.0|y=175.0|color=255|size=18|nimg='..DAY_BUTTON_PIC[chooseday].pic3..'|mimg='..DAY_BUTTON_PIC[chooseday].pic3..'|link=@firstrecharge_button,'..FIRSTRECHARGE_BUTTONFUNC_ID_4..'>'..
        '<Text|x=540.0|y=232.0|color=215|size=20|text='..FIRST_RECHARGE_SHOW_VALUE_TEXT[chooseday]..'>'
    
    local itemShowPosList = {{x=420, y=263},{x=504, y=263},{x=583, y=263},{x=667, y=263},{x=746, y=263}}
    for seq, value in ipairs(cfgFirstRecharge[chooseday].freerewards_tab) do
        local posx = itemShowPosList[seq].x
        local posy = itemShowPosList[seq].y
        local itemidx = getstditeminfo(value.name, CommonDefine.STDITEMINFO_IDX)
        strPanelInfo = strPanelInfo..'<ItemShow|ay=1|x='..posx..'|y='..posy..'|width=70|height=70|itemid='..itemidx..'|itemcount='..value.num..'|bgtype=1|showtips=1>'
    end

    if chooseday == 1 then
        if currRechargeDay == 0 then
            strPanelInfo = strPanelInfo..'<Button|x=560.0|y=370.0|color=255|size=18|nimg=private/cc_first_recharge/7.png|mimg=private/cc_first_recharge/7.png|link=@firstrecharge_button,'..
                FIRSTRECHARGE_BUTTONFUNC_ID_1..'>'            
        else
            strPanelInfo = strPanelInfo..'<Text|x=525.0|y=372.0|size=22|color=255|text=�������ʼ�����>'
        end
    elseif chooseday == 2 then
        if currRechargeDay <= 1 then
            strPanelInfo = strPanelInfo..'<Text|x=475.0|y=372.0|size=22|color=255|text=���ս�����ú����0�����ȡ>'
        else
            if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2) == 1 then
                strPanelInfo = strPanelInfo..'<Text|x=525.0|y=372.0|size=22|color=255|text=�������ʼ�����>'
            else
                local needitemstr = BF_GetSimpleItemTableDescStr(DOUBLE_REWARD_NEEDITEMS)
                strPanelInfo = strPanelInfo..'<Button|x=460.0|y=372.0|color='..CSS.NPC_WHITE..'|text=�����ȡ|size=18|nimg=private/cc_common/button_1.png|mimg=private/cc_common/button_1.png|link=@firstrecharge_button,'..
                    FIRSTRECHARGE_BUTTONFUNC_ID_5..'><Button|x=600.0|y=372.0|color='..CSS.NPC_WHITE..'|text=˫����ȡ|size=18|nimg=private/cc_common/button_1.png|mimg=private/cc_common/button_1.png|link=@firstrecharge_button,'..
                    FIRSTRECHARGE_BUTTONFUNC_ID_6..'><Text|x=710.0|y=380.0|size=15|color='..CSS.NPC_LIGHTGREEN..'|text=��:'..needitemstr..'>'
                if bShowDoubleCheckPanel and bShowDoubleCheckPanel==true then
                    strPanelInfo = strPanelInfo..'<Layout|id=800|children={801,802,803}|x=390.0|y=238.0|width=430|height=170|color=255>'..
                        '<Img|id=801|ay=1|x=0.0|y=0.0|esc=0|img=private/cc_first_recharge/13.png>'..
                        '<Button|id=802|x=65.0|y=115.0|color=255|size=18|nimg=private/cc_first_recharge/10.png|mimg=private/cc_first_recharge/10.png|link=@firstrecharge_button,'..
                        FIRSTRECHARGE_BUTTONFUNC_ID_7..'><Button|id=803|x=260.0|y=115.0|color=255|size=18|nimg=private/cc_first_recharge/11.png|mimg=private/cc_first_recharge/11.png|link=@firstrecharge_button,'..
                        FIRSTRECHARGE_BUTTONFUNC_ID_3..'>'
                end
            end
        end
    elseif chooseday == 3 then
        if currRechargeDay <= 2 then
            strPanelInfo = strPanelInfo..'<Text|x=475.0|y=372.0|size=22|color=255|text=2�ս�����ú����0�����ȡ>'
        else
            if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3) == 1 then
                strPanelInfo = strPanelInfo..'<Text|x=525.0|y=372.0|size=22|color=255|text=�������ʼ�����>'
            else
                local needitemstr = BF_GetSimpleItemTableDescStr(DOUBLE_REWARD_NEEDITEMS)
                strPanelInfo = strPanelInfo..'<Button|x=460.0|y=372.0|color='..CSS.NPC_WHITE..'|text=�����ȡ|size=18|nimg=private/cc_common/button_1.png|mimg=private/cc_common/button_1.png|link=@firstrecharge_button,'..
                    FIRSTRECHARGE_BUTTONFUNC_ID_5..'><Button|x=600.0|y=372.0|color='..CSS.NPC_WHITE..'|text=˫����ȡ|size=18|nimg=private/cc_common/button_1.png|mimg=private/cc_common/button_1.png|link=@firstrecharge_button,'..
                    FIRSTRECHARGE_BUTTONFUNC_ID_6..'><Text|x=710.0|y=380.0|size=15|color='..CSS.NPC_LIGHTGREEN..'|text=��:'..needitemstr..'>'

                if bShowDoubleCheckPanel and bShowDoubleCheckPanel==true then
                    strPanelInfo = strPanelInfo..'<Layout|id=800|children={801,802,803}|x=390.0|y=238.0|width=430|height=170|color=255>'..
                        '<Img|id=801|ay=1|x=0.0|y=0.0|esc=0|img=private/cc_first_recharge/13.png>'..
                        '<Button|id=802|x=65.0|y=115.0|color=255|size=18|nimg=private/cc_first_recharge/10.png|mimg=private/cc_first_recharge/10.png|link=@firstrecharge_button,'..
                        FIRSTRECHARGE_BUTTONFUNC_ID_7..'><Button|id=803|x=260.0|y=115.0|color=255|size=18|nimg=private/cc_first_recharge/11.png|mimg=private/cc_first_recharge/11.png|link=@firstrecharge_button,'..
                        FIRSTRECHARGE_BUTTONFUNC_ID_4..'>'
                end                    
            end
        end
    end
    BF_ShowSpecialUI(actor, strPanelInfo)
end

--����button�ص�
function FirstRecharge.DoOperButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    local funcid = tonumber(sid)

    if funcid == FIRSTRECHARGE_BUTTONFUNC_ID_1 then
        --�����ֵ����
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_RECHARGE)
    elseif funcid == FIRSTRECHARGE_BUTTONFUNC_ID_2 then        
        --ѡ���һ��
        FirstRecharge.ShowFirstRechargePanel(actor, 1)
    elseif funcid == FIRSTRECHARGE_BUTTONFUNC_ID_3 then
        --ѡ��ڶ���
        FirstRecharge.ShowFirstRechargePanel(actor, 2)
    elseif funcid == FIRSTRECHARGE_BUTTONFUNC_ID_4 then
        --ѡ�������        
        FirstRecharge.ShowFirstRechargePanel(actor, 3)
    elseif funcid == FIRSTRECHARGE_BUTTONFUNC_ID_5 then
        --�����ȡ ��ʾ����ȷ�Ͽ�
        local chooseday = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
        FirstRecharge.ShowFirstRechargePanel(actor, chooseday, true)
    elseif funcid == FIRSTRECHARGE_BUTTONFUNC_ID_6 then
        --��ֵ˫����ȡ    
        local chooseday = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
        FirstRecharge.GetFirstRechargeDoubleReward(actor, chooseday)
    elseif funcid == FIRSTRECHARGE_BUTTONFUNC_ID_7 then
        --ȷ�������ȡ
        local chooseday = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
        FirstRecharge.GetFirstRechargeFreeReward(actor, chooseday)
    end
end

--�Զ������׳��һ�콱��
function FirstRecharge.AutoGiveFirstRechargeRewardAtOnce(actor)
    if BF_IsNullObj(actor) then
        return
    end
    local rewardconfig = cfgFirstRecharge[1].freerewards_tab
    if rewardconfig == nil then
        return
    end
    --�������ʼ�
    Player.GiveItemsByMail(actor, rewardconfig, '�׳佱��', '�׳佱��')    
    Player.SendServerMsg(actor, Player.GetName(actor)..' �������׳䣬��ù��پ޽������պ���', CommonDefine.MSG_POS_TYPE_TOP_ROLL, CSS.CHAT_YELLOW, CSS.CHAT_BLACK)
end

--�����ȡ�׳��ָ�������Ľ���
function FirstRecharge.GetFirstRechargeFreeReward(actor, chooseday)
    if BF_IsNullObj(actor) then
        return
    end
    if (chooseday~=2) and (chooseday~=3) then
        return
    end

    local currRechargeDay = 0
    local firstRechargeDay = getplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY)
    if firstRechargeDay > 0 then
        local currday = BF_GetDay(os.time())
        if currday >= firstRechargeDay then
            currRechargeDay = math.min(3, currday - firstRechargeDay + 1)
        end
    end
    if chooseday > currRechargeDay then
        if chooseday == 2 then
            Player.SendSelfMsg(actor, '�׳�����0�����ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        else
            Player.SendSelfMsg(actor, '�׳�������0�����ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
        return
    end
    local mailtitle = '�׳佱��'
    local maildesc = ''
    if chooseday == 2 then
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2) == 1 then
            Player.SendSelfMsg(actor, '��ǰ��������ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        mailtitle = '�׳�ڶ��ս���'
        maildesc = '�׳�ڶ��ս���'
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2, 1)
    else
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3) == 1 then
            Player.SendSelfMsg(actor, '��ǰ��������ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        mailtitle = '�׳�����ս���'
        maildesc = '�׳�����ս���'
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3, 1)
    end

    local rewardconfig = cfgFirstRecharge[chooseday].freerewards_tab
    if rewardconfig == nil then
        return
    end
    --ǿ�з��ʼ�
    Player.GiveItemsByMail(actor, rewardconfig, mailtitle, maildesc)    
    --����ǰ����ʾ
    FirstRecharge.ShowFirstRechargePanel(actor, chooseday)
end

--������˫���׳佱��
function FirstRecharge.GetFirstRechargeDoubleReward(actor, chooseday)
    if BF_IsNullObj(actor) then
        return
    end
    if (chooseday~=2) and (chooseday~=3) then
        return
    end

    local currRechargeDay = 0
    local firstRechargeDay = getplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY)
    if firstRechargeDay > 0 then
        local currday = BF_GetDay(os.time())
        if currday >= firstRechargeDay then
            currRechargeDay = math.min(3, currday - firstRechargeDay + 1)
        end
    end
    if chooseday > currRechargeDay then
        if chooseday == 2 then
            Player.SendSelfMsg(actor, '�׳�����0�����ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        else
            Player.SendSelfMsg(actor, '�׳�������0�����ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
        return
    end
    local mailtitle = '�׳佱��'
    local maildesc = ''
    if chooseday == 2 then
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2) == 1 then
            Player.SendSelfMsg(actor, '��ǰ��������ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        mailtitle = '�׳�ڶ��ս���-˫��'
        maildesc = '�׳�ڶ��ս���-˫��'        
        --�����ж�
        if not Player.CheckItemsEnough(actor, DOUBLE_REWARD_NEEDITEMS, mailtitle) then
            return
        end
        --�۳�����
        Player.TakeItems(actor, DOUBLE_REWARD_NEEDITEMS, mailtitle)        
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2, 1)
    else
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3) == 1 then
            Player.SendSelfMsg(actor, '��ǰ��������ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        mailtitle = '�׳�����ս���-˫��'
        maildesc = '�׳�����ս���-˫��'
        --�����ж�
        if not Player.CheckItemsEnough(actor, DOUBLE_REWARD_NEEDITEMS, mailtitle) then
            return
        end
        --�۳�����
        Player.TakeItems(actor, DOUBLE_REWARD_NEEDITEMS, mailtitle)          
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3, 1)
    end

    local rewardconfig = cfgFirstRecharge[chooseday].doublerewards_tab
    if rewardconfig == nil then
        return
    end
    --ǿ�з��ʼ�
    Player.GiveItemsByMail(actor, rewardconfig, mailtitle, maildesc)    
    --����ǰ����ʾ
    FirstRecharge.ShowFirstRechargePanel(actor, chooseday)
end

--������ֵ
function FirstRecharge.DoRecharge(actor, gold, productid, isreal)
    --�����׳��ʱ��
    if gold >= MIN_FIRST_RECHARGE_GOLDNUM then
        if getplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY) == 0 then
            local currday = BF_GetDay(os.time())
            setplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY, currday)
            FirstRecharge.AutoGiveFirstRechargeRewardAtOnce(actor)
        end           
    end   
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_DO_RECHARGE, FirstRecharge.DoRecharge, CommonDefine.FUNC_ID_FIRST_RECHARGE)


function FirstRecharge.IsTopIconHaveRedPoint(actor)
    local currRechargeDay = FirstRecharge.GetCurrRechargeDay(actor)
    currRechargeDay = math.min(3, currRechargeDay)

    if currRechargeDay > 1 then
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2) == 0 then
            return true
        end
    elseif currRechargeDay > 2 then
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3) == 0 then
            return true
        end
    end
    return false
end

return FirstRecharge