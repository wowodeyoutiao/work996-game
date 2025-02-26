YunBiaoManager = {}

--��ͬ�����ڳ������ã��߼����䵽���
local RANDOM_BIAOCHE_CONFIG = {
    {
        level=1, prop=6000, monid=2201, showname='��ͨ�ڳ�', showcolor=CSS.NPC_LIGHTGREEN, appr=290,
        rewarditems={{name='��Ԫ��', num=100}, {name='����ʯ', num=50}, {name='����', num=500000}},
        extrewarditems={{name='��Ԫ��', num=100}, {name='����ʯ', num=50}, {name='����', num=500000}},
    },
    {
        level=2, prop=3000, monid=2202, showname='�߼��ڳ�', showcolor=CSS.NPC_PURPLE, appr=291, 
        rewarditems={{name='��Ԫ��', num=200}, {name='����ʯ', num=100}, {name='����', num=1000000}},
        extrewarditems={{name='��Ԫ��', num=200}, {name='����ʯ', num=100}, {name='����', num=1000000}},
    },
    {
        level=3, prop=1000, monid=2203, showname='�����ڳ�', showcolor=CSS.NPC_ORANGE, appr=292,
        rewarditems={{name='��Ԫ��', num=300}, {name='����ʯ', num=200}, {name='����', num=1500000}},
        extrewarditems={{name='��Ԫ��', num=300}, {name='����ʯ', num=200}, {name='����', num=1500000}},
    },
}
--ˢ����Ҫ�ĵ���
local REFRESH_BIAOCHE_NEEDITEMS = {{name='Ԫ��', num=100}}
--ÿ�������ڴ���
local DAY_MAX_ACCEPT_BIAOCHE_TIMES = 2
--���ٴ�ˢ�±���ߵȼ��ڳ�
local TOP_BIAOCHE_NEED_MAX_REFRESH_TIMES = 10
--�ڳ�����ʱ�䣬��
local BIAOCHE_LAST_SECONDS = 20 * 60
--�ڳ���ʼ����
local BIAOCHE_INIT_POS = {mapid='3', x=322, y=342}
--�ڳ����ڵ�����
local BIAOCHE_TARG_MAPID = '3'
--�ڳ���Ѱ·��
local BIAOCHE_TARG_POS = {x=409, y=329}
--�ڳ���Ҫ�˵ľ���
local BIAOCHE_NEED_MASTER_DISTANCE = 10
--���ڼӳɽ�����ʱ��  ��Ӧextrewarditems
local EXT_REWARD_TIME = {starthour=10, endhour=13}



local function GetBiaoCheConfig(id)
    if (id > 0) and (id <= #RANDOM_BIAOCHE_CONFIG) then
        return RANDOM_BIAOCHE_CONFIG[id]
    end
    return nil
end

local function GetCurrBiaoCheMon(actor, biaocheid)
    local ncount = getbaseinfo(actor,CommonDefine.INFO_SLAVECOUNT)
    local config = GetBiaoCheConfig(biaocheid)
    if config == nil then
        return nil
    end

    for i=0, ncount-1 do
        local mon = getslavebyindex(actor, i)
        if not BF_IsNullObj(mon) then
            local monid = Player.GetMonIdx(mon)
            if (monid == config.monid) then
                return mon
            end
        end
    end
    return nil
end

function YunBiaoManager.ShowAcceptBiaoChePanel(actor)
    local showname = ''
    local showcolor = CSS.NPC_WHITE
    local appr = 290
    local currid = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID)
    if currid == 0 then
        currid = 1
        setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID, currid)
    end
    local biaocheinfo = GetBiaoCheConfig(currid)
    if biaocheinfo == nil then
        return
    end

    showname = biaocheinfo.showname
    showcolor = biaocheinfo.showcolor
    appr = biaocheinfo.appr
    local accepttimes = getplaydef(actor, CommonDefine.VAR_J_DAY_BIAOCHE_ACCEPT_TIMES)
    local needitemdesc = BF_GetSimpleItemTableDescStr(REFRESH_BIAOCHE_NEEDITEMS)
    local lefttimes = 0
    if accepttimes < DAY_MAX_ACCEPT_BIAOCHE_TIMES then
        lefttimes = DAY_MAX_ACCEPT_BIAOCHE_TIMES - accepttimes
    end

    if lefttimes == 0 then
        local strPanelInfo = '<Img|id=10|children={11,12,13}|x=150.0|y=21.0|move=0|show=0|loadDelay=1|bg=1|img=private/cc_yunbiao/4.png|esc=1|reset=1>'..
        '<Layout|id=11|x=687.0|y=15.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=688.0|y=15.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Text|id=13|x=85.0|y=98.0|size=18|color=255|text=����ͷ���������ڴ����Ѵ����ޣ����������ɣ�>'        
        BF_ShowSpecialUI(actor, strPanelInfo)
        return
    end

    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15,16,17,18,19,20,30}|x=150.0|y=21.0|move=0|show=0|loadDelay=1|bg=1|img=private/cc_yunbiao/4.png|esc=1|reset=1>'..
        '<Layout|id=11|x=687.0|y=15.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=688.0|y=15.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Text|id=13|x=85.0|y=98.0|size=18|color=255|text=����ͷ��ÿ���10�㵽13�����ڿ��Ի��˫��������>'..
        '<Text|id=14|x=85.0|y=140.0|size=22|color=255|text=��ǰ�ڳ���>'..
        '<Text|id=15|x=190.0|y=140.0|size=22|color='..showcolor..'|text='..showname..'>'..
        '<Effect|id=30|x=460|y=300|effecttype=2|effectid='..appr..'|dir=2|act=1>'

--[[
�� �� <Effect|effectid=xxxx|effecttype=xx|scale=xx>
�� �� ��Ч
�� �� effectid ��Чid
�� �� effecttype ��Ч���� 0.��Ч 1.npc 2.���� 3.���� 4.���� 5.���� 6.��� 7.����
�� �� count ���Ŵ���
�� �� act ��Ч���� 0.���� 1.�� 2.������
�� �� dir ��Ч���� 0.�� 1.���� 2.�� ��
�� �� speed ��Ч�ٶ� 1.�����ٶ�
�� �� scale ���ű��� 1.��������
]]--

    local biaochemon = GetCurrBiaoCheMon(actor, currid)
    if biaochemon then
        strPanelInfo = strPanelInfo..'<Text|id=18|x=85.0|y=325.0|size=18|color=255|text=�뻤������ڳ���Ŀ��㣡>'
        BF_ShowSpecialUI(actor, strPanelInfo)
        return
    end        

    strPanelInfo = strPanelInfo..'<Button|id=16|x=85.0|y=360.0|pimg=private/cc_yunbiao/1.png|size=18|mimg=private/cc_yunbiao/1.png|color=255|nimg=private/cc_yunbiao/1.png|link=@accept_biaoche>'..        
            '<Text|id=18|x=85.0|y=325.0|size=17|color=255|text=ʣ�����:'..lefttimes..'/'..DAY_MAX_ACCEPT_BIAOCHE_TIMES..'>'        

    if currid < #RANDOM_BIAOCHE_CONFIG then
        strPanelInfo = strPanelInfo..'<Button|id=18|x=240.0|y=360.0|size=18|pimg=private/cc_yunbiao/2.png|mimg=private/cc_yunbiao/2.png|color=255|nimg=private/cc_yunbiao/2.png|link=@refresh_biaoche>'..
        '<Text|id=19|x=235.0|y=325.0|size=18|color=255|text=�裺'..needitemdesc..'>'..
        '<Text|id=20|x=235.0|y=400.0|size=18|color=215|text=10�α�ȻΪ�߼��ڳ�>'        
    else
        strPanelInfo = strPanelInfo..'<Text|id=17|x=240.0|y=360.0|size=20|color=215|text=������ߵȼ��ڳ�>'
    end

    BF_ShowSpecialUI(actor, strPanelInfo)
end

function YunBiaoManager.ShowSubmitBiaoChePanel(actor)
    local currid = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID)
    local biaochemon = GetCurrBiaoCheMon(actor, currid)
    local strPanelInfo = ''    
    if biaochemon and (BF_GetDistanceFromMapPoint(biaochemon, BIAOCHE_TARG_MAPID, BIAOCHE_TARG_POS.x, BIAOCHE_TARG_POS.y) <= 3) then
        local curhour = BF_GetHour(os.time())
        local config = GetBiaoCheConfig(currid)
        if config then
            local rewarditems = config.rewarditems
            if (curhour >= EXT_REWARD_TIME.starthour) and (curhour < EXT_REWARD_TIME.endhour) then
                rewarditems = config.extrewarditems
            end

            local nStartID = 20
            local idstr = ''
            for seq, _ in ipairs(rewarditems) do
                if idstr ~= '' then
                    idstr = idstr..','
                end
                idstr = idstr..(nStartID + seq)   
            end   

            strPanelInfo = '<Img|id=10|children={11,12,13,14,'..idstr..'}|x=188.0|y=135.0|move=0|loadDelay=1|bg=1|reset=1|esc=1|show=0|img=private/cc_yunbiao/8.png>'..
                '<Layout|id=11|x=583.0|y=43.0|width=80|height=80|link=@exit>'..
                '<Button|id=12|x=583.0|y=44.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
                '<Text|id=13|x=160.0|y=71.0|size=18|color=255|text=����ͷ���������ˣ�������Ľ�����>'..
                '<Button|id=14|x=246.0|y=214.0|pimg=private/cc_yunbiao/5.png|color=255|size=18|mimg=private/cc_yunbiao/5.png|nimg=private/cc_yunbiao/5.png|link=@get_reward>'

            for seq, value in ipairs(rewarditems) do
                local currid = nStartID + seq
                local currx = 100 + 100 * (seq - 1)
                local curry = 125
                local itemidx = getstditeminfo(value.name, CommonDefine.STDITEMINFO_IDX)
                strPanelInfo = strPanelInfo..'<ItemShow|id='..currid..'|x='..currx..'|y='..curry..'|width=70|height=70|itemid='..itemidx..'|itemcount='..value.num..'|bgtype=1|showtips=1>'
            end            
        end
    else
        strPanelInfo = '<Img|id=10|children={11,12,13}|x=188.0|y=135.0|reset=1|show=0|img=private/cc_yunbiao/8.png|move=0|esc=1|bg=1|loadDelay=1>'..
            '<Layout|id=11|x=583.0|y=43.0|width=80|height=80|link=@exit>'..
            '<Button|id=12|x=583.0|y=44.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
            '<Text|id=13|x=106.0|y=69.0|size=18|color=255|text=����ͷ��������ͷ�������ڹ������ܻ�ý����ˣ�>'
    end
    BF_ShowSpecialUI(actor, strPanelInfo)
end

function YunBiaoManager.AcceptBiaoChe(actor)
    local currid = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID)
    local biaocheinfo = GetBiaoCheConfig(currid)
    if biaocheinfo == nil then
        Player.SendSelfMsg(actor, '����ˢ�³���Ч�ڳ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local accepttimes = getplaydef(actor, CommonDefine.VAR_J_DAY_BIAOCHE_ACCEPT_TIMES)
    if accepttimes >= DAY_MAX_ACCEPT_BIAOCHE_TIMES then
        Player.SendSelfMsg(actor, '�������ڴ����Ѵ����ޣ�������������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    
    local biaochemon = GetCurrBiaoCheMon(actor, currid)
    if biaochemon ~= nil then
        Player.SendSelfMsg(actor, '�������ڳ�������ɵ�ǰ���ں�������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local monname = getmonbaseinfo(biaocheinfo.monid, 1)
    biaochemon = recallmob(actor, monname, 0, 3600, 0, 0, 1)
    if biaochemon == nil then
        Player.SendSelfMsg(actor, 'ϵͳ��æ�����Ժ����ԣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    mapmove(biaochemon, BIAOCHE_INIT_POS.mapid, BIAOCHE_INIT_POS.x, BIAOCHE_INIT_POS.y)
    --�ڳ�ʱ�䵽�˲���ʧ���������߲���ʧ
    darttime(actor, BIAOCHE_LAST_SECONDS, 1)
    --�����ڳ���Ŀ�� �� �����˾���
    dartmap(actor, BIAOCHE_TARG_POS.x, BIAOCHE_TARG_POS.y, BIAOCHE_NEED_MASTER_DISTANCE)    
    setplaydef(actor, CommonDefine.VAR_J_DAY_BIAOCHE_ACCEPT_TIMES, accepttimes+1)
    setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_REFRESH_TIMES, 0)
    Player.SendSelfMsg(actor, '�ڳ���ˢ����', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    close(actor)

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_YUNBIAO, 1)       
end

function YunBiaoManager.RefreshBiaoChe(actor)
    local accepttimes = getplaydef(actor, CommonDefine.VAR_J_DAY_BIAOCHE_ACCEPT_TIMES)
    if accepttimes >= DAY_MAX_ACCEPT_BIAOCHE_TIMES then
        Player.SendSelfMsg(actor, '�������ڴ����Ѵ����ޣ�������������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    local currid = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID)
    if currid >= #RANDOM_BIAOCHE_CONFIG then
        Player.SendSelfMsg(actor, '��ǰ�ڳ��ȼ�������ѣ�������ˢ�£�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end 

    if not Player.CheckItemsEnough(actor, REFRESH_BIAOCHE_NEEDITEMS, '�ڳ�ˢ��') then
        return
    end
    Player.TakeItems(actor, REFRESH_BIAOCHE_NEEDITEMS, '�ڳ�ˢ��')        

    local refreshtimes = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_REFRESH_TIMES) + 1
    if refreshtimes >= TOP_BIAOCHE_NEED_MAX_REFRESH_TIMES then
        local id = #RANDOM_BIAOCHE_CONFIG
        setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID, id)
    else
        local biaocheinfo, id = BF_GetRandomTab(RANDOM_BIAOCHE_CONFIG, -1)
        if biaocheinfo then
            setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID, id)
        end
    end
    setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_REFRESH_TIMES, refreshtimes)
    Player.SendSelfMsg(actor, '�ڳ���ˢ�£�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    YunBiaoManager.ShowAcceptBiaoChePanel(actor)
end

--��ȡ�ڳ�����
function YunBiaoManager.GetBiaoCheReward(actor)
    local currid = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID)
    local config = GetBiaoCheConfig(currid)
    if config == nil then
        Player.SendSelfMsg(actor, '��ǰ�ڳ������ڣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local biaochemon = GetCurrBiaoCheMon(actor, currid)
    if biaochemon == nil then
        Player.SendSelfMsg(actor, '��ǰ�ڳ������ڣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local curhour = BF_GetHour(os.time())
    local rewarditems = config.rewarditems
    if (curhour >= EXT_REWARD_TIME.starthour) and (curhour < EXT_REWARD_TIME.endhour) then
        rewarditems = config.extrewarditems
    end

    setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID, 0)
    killmonbyobj(actor, biaochemon, false, false, false)
    Player.GiveItemsToBagOrMail(actor, rewarditems, '�ڳ�����:'..currid)
    Player.SendSelfMsg(actor, '��ϲ�����ڳ�������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    close(actor)    
end

--�ڳ����ﵱǰĿ��
function YunBiaoManager.OnArriveTargetPos(actor)
    Player.SendSelfMsg(actor, '�ڳ��ѵ����յ㣬�뼰ʱǰ�����ڣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
end

--��Ҷ�ʧ�ڳ�����
function YunBiaoManager.LostBiaoChe(actor, biaoche)
    Player.SendSelfMsg(actor, '���ź�������ڳ��Ѷ�ʧ��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    setplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID, 0)
end

--�Ƿ��п����ʾ
function YunBiaoManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_YUNBIAO, false) then
        return false
    end

    local currid = getplaydef(actor, CommonDefine.VAR_U_BIAOCHE_CURRID)
    local accepttimes = getplaydef(actor, CommonDefine.VAR_J_DAY_BIAOCHE_ACCEPT_TIMES)
    if accepttimes >= DAY_MAX_ACCEPT_BIAOCHE_TIMES then
        return false
    end    
    local biaochemon = GetCurrBiaoCheMon(actor, currid)
    if biaochemon ~= nil then       
        return false
    end    

    return true
end

return YunBiaoManager