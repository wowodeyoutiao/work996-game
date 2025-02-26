TreasureMap = {}

--���ղر�ͼ���Ѱ������
local TREASURE_MAP_DAY_MAX_TIMES = 10
--�ڲر�ͼ����
local TREASURE_MAP_NEEDITEMS = {{name='�ر�ͼ', num=1}}
--�ڱ��صĽ����� ��������
local TREASURE_MAP_DIG_NEED_SECONDS = 8
--�ر�ͼ�����λ��
local TREASURE_MAP_POSITION_CONFIG = {
    {prop=100, mapidstr='3', x=120, y=200},
    {prop=100, mapidstr='3', x=220, y=800},
    {prop=100, mapidstr='3', x=180, y=400},
    {prop=100, mapidstr='3', x=320, y=600},
    {prop=100, mapidstr='3', x=420, y=270},
    {prop=100, mapidstr='3', x=120, y=200},
    {prop=100, mapidstr='3', x=220, y=600},
    {prop=100, mapidstr='3', x=180, y=400},
    {prop=100, mapidstr='3', x=320, y=600},
    {prop=100, mapidstr='3', x=420, y=270},
}
--����ս��boss�ĸ��ʣ��ٷֱ�
local TRIGGER_RANDOMBOSS_RATE = 10
--�ر�ͼ�ڳ��Ľ���
local TREASURE_MAP_RANDOM_REWARDS = {
    {prop=100, items={{name='ǿЧ̫��ˮ', num=5}}},
	{prop=100, items={{name='ǿ��ʯ', num=100}}},
	{prop=100, items={{name='��Ԫ��', num=200}}},
	{prop=75, items={{name='����ʯ', num=50}}},
	{prop=100, items={{name='��ҳ', num=100}}},
	{prop=100, items={{name='ף����', num=20}}},
	{prop=75, items={{name='���˷�', num=1}}},
	{prop=80, items={{name='���׷�', num=1}}},
	{prop=80, items={{name='��˫������', num=2}}},
	{prop=100, items={{name='��ש', num=1}}},
	{prop=60, items={{name='ħ����ƾ֤', num=1}}},
	{prop=60, items={{name='��������', num=5}}},
	{prop=60, items={{name='��������', num=5}}},
	{prop=60, items={{name='��������', num=5}}},
	{prop=60, items={{name='��������', num=5}}},
	{prop=60, items={{name='�����ؼ�', num=30}}},
}
local CHECKBOX_VAR = 'N4'

--���ܰ���
local TREASUREMAP_BUTTONFUNC_ID_1 = 1
local TREASUREMAP_BUTTONFUNC_ID_2 = 2

local function ShowAutoGotoPanel(actor)
    local curridx = getplaydef(actor, CommonDefine.VAR_U_TREASUREMAP_CURRID)
    local posinfo = TREASURE_MAP_POSITION_CONFIG[curridx]
    if posinfo == nil then  
        return
    end 
    local mapname = getmapname(posinfo.mapidstr) 

    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15}|x=395.0|y=191.0|show=0|bg=1|img=private/cc_treasuremap/1.png|esc=1|reset=1|move=0>'..
        '<Layout|id=11|x=392.0|y=2.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=395.0|y=3.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
        '<Text|id=13|x=40.0|y=70.0|size=18|color=151|text=���βر�������Ϊ��'..mapname..'��'..posinfo.x..','..posinfo.y..'��>'..
        '<Text|id=14|x=120.0|y=100.0|size=18|color=151|text=�Ƿ�����ǰ���ڱ���>'..
        '<Button|id=15|x=140.0|y=150.0|color=255|mimg=private/cc_common/button_1.png|pimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=����ǰ��|link=@treasuremap_button,'..
        TREASUREMAP_BUTTONFUNC_ID_1..'>'

    --[[
    local flag = getplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_NO_PANELTIP_FLAG)
    strPanelInfo = strPanelInfo..'<CheckBox|id=17|x=22.0|y=125.0|checkboxid='..CHECKBOX_VAR..'|default='..flag..'|nimg=private/cc_common/checkbox_1.png|pimg=private/cc_common/checkbox_2.png|link=@treasuremap_button,'..
        TREASUREMAP_BUTTONFUNC_ID_2..'>'
    ]]--

    BF_ShowSpecialUI(actor, strPanelInfo)
end

--����button�ص�
function TreasureMap.DoOperButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    local funcid = tonumber(sid)
    if funcid == TREASUREMAP_BUTTONFUNC_ID_1 then    
        local curridx = getplaydef(actor, CommonDefine.VAR_U_TREASUREMAP_CURRID)
        local posinfo = TREASURE_MAP_POSITION_CONFIG[curridx]
        if posinfo then            
            Player.AutoGoToTargMapXY(actor, posinfo.mapidstr, posinfo.x, posinfo.y)
        end
    elseif funcid == TREASUREMAP_BUTTONFUNC_ID_2 then
        local value = getplaydef(actor, CHECKBOX_VAR)
        if value==0 or value==1 then
            setplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_NO_PANELTIP_FLAG, value)
            ShowAutoGotoPanel(actor)
        end
    end
end

function TreasureMap.DoUseItem(actor)
    if BF_IsNullObj(actor) then
        return false
    end
    local currtimes = getplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_USETIMES)
    if currtimes >= TREASURE_MAP_DAY_MAX_TIMES then
        Player.SendSelfMsg(actor, '�ر�ͼ����ʹ�ô����Ѵﵽ���ޣ�������������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return false
    end

    local curridx = getplaydef(actor, CommonDefine.VAR_U_TREASUREMAP_CURRID)
    local posinfo = TREASURE_MAP_POSITION_CONFIG[curridx]
    if posinfo == nil then        
        posinfo, curridx = BF_GetRandomTab(TREASURE_MAP_POSITION_CONFIG, -1)      
        if posinfo == nil then
            Player.SendSelfMsg(actor, '��ʱ�޷�ʹ�ã����Ժ����ԣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return false
        end
        setplaydef(actor, CommonDefine.VAR_U_TREASUREMAP_CURRID, curridx)
    end
    
    local distance = BF_GetDistanceFromMapPoint(actor, posinfo.mapidstr, posinfo.x, posinfo.y)
    if distance == 0 then
        showprogressbardlg(actor, TREASURE_MAP_DIG_NEED_SECONDS, '@treasuremap_dig_callback', '�ڱ���...', 0, '')
        return false
    else
        local mapname = getmapname(posinfo.mapidstr)        
        Player.SendSelfMsg(actor, '������['..mapname..', '..posinfo.x..','..posinfo.y..']', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        if getplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_NO_PANELTIP_FLAG) == 0 then
            ShowAutoGotoPanel(actor)
        end
        return false
    end
end

function TreasureMap.DigCallBack(actor)
    if BF_IsNullObj(actor) then
        return
    end
    local currtimes = getplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_USETIMES)
    if currtimes >= TREASURE_MAP_DAY_MAX_TIMES then
        Player.SendSelfMsg(actor, '�ر�ͼ����ʹ�ô����Ѵﵽ���ޣ�������������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local curridx = getplaydef(actor, CommonDefine.VAR_U_TREASUREMAP_CURRID)
    local posinfo = TREASURE_MAP_POSITION_CONFIG[curridx]
    if posinfo == nil then        
        return
    end

    if not Player.CheckItemsEnough(actor, TREASURE_MAP_NEEDITEMS, '�ڲر�ͼ') then        
        return
    end

    local distance = BF_GetDistanceFromMapPoint(actor, posinfo.mapidstr, posinfo.x, posinfo.y)
    if distance <= 3 then        
        --�۳�����
        Player.TakeItems(actor, TREASURE_MAP_NEEDITEMS, '�ڲر�ͼ')        
        setplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_USETIMES, currtimes + 1)
        setplaydef(actor, CommonDefine.VAR_U_TREASUREMAP_CURRID, 0)

        --ÿ�ձ�������        
        EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_TREASUREMAP, 1)        

        if math.random(1, 100) <= TRIGGER_RANDOMBOSS_RATE then
            --����ս��boss
            if RandomBossManager.CreateNewRandomBoss(actor) > 0 then
                Player.SendSelfMsg(actor, '��ǰ�ر�ͼ�д���ս�����죬ǰ����ս�о�ϲ��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)        
                return
            end
        end

        --�����������        
        Player.SendSelfMsg(actor, '��ϲ���ڵ����أ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        local rewardtab = BF_GetRandomTab(TREASURE_MAP_RANDOM_REWARDS, -1)
        if rewardtab ~= nil then
            Player.GiveItemsToBagOrMail(actor, rewardtab.items, '��ȡ�ر�ͼ����')
        end        
    else
        Player.SendSelfMsg(actor, '��ǰ���뱦��λ��̫Զ��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    end
end

return TreasureMap