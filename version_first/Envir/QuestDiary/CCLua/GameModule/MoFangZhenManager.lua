MoFangZhenManager = {}

--buttonid
local MAP_BUTTON_ID_1 = 101
local MAP_BUTTON_ID_2 = 102
local MAP_BUTTON_ID_3 = 103

--functionid
local INNER_BUTTONFUNC_ID_1 = 1    --��ͼ�еĹ��ܰ���-�������Ƕ���ȷ��
local INNER_BUTTONFUNC_ID_2 = 2    --��ͼ�еĹ��ܰ���-���͵�ͬ��������ͼ
local INNER_BUTTONFUNC_ID_3 = 3    --��ͼ�еĹ��ܰ���-�����������
local INNER_BUTTONFUNC_ID_4 = 4    --��ͼ�еĹ��ܰ���-ԭ�ظ���
local INNER_BUTTONFUNC_ID_5 = 5    --��ͼ�еĹ��ܰ���-��������
local INNER_BUTTONFUNC_ID_6 = 6    --��ͼ�еĹ��ܰ���-�رն���ȷ�Ͽ�
local INNER_BUTTONFUNC_ID_7 = 7    --��ͼ�еĹ��ܰ���-��ʾ��ʱ�趨���
local INNER_BUTTONFUNC_ID_8 = 8    --��ͼ�еĹ��ܰ���-��ʱ�趨 ȷ��
local INNER_BUTTONFUNC_ID_9 = 9    --��ͼ�еĹ��ܰ���-��ʱ�趨 ��ѡ�趨1
local INNER_BUTTONFUNC_ID_10 = 10  --��ͼ�еĹ��ܰ���-��ʱ�趨 ��ѡ�趨2

local NPCPANEL_BUTTONFUNC_ID_1 = 1      --�л�ħ����ҳǩ
local NPCPANEL_BUTTONFUNC_ID_2 = 2      --ǰ����ս
local NPCPANEL_BUTTONFUNC_ID_3 = 3      --����һ����ս����

local MO_FANG_ZHEN_CENTER_MAP = 'mofang_0_0_0'

--�ж��Ƿ�Ϊħ�����ͼ
function MoFangZhenManager.IsMoFangZhenMap(mapidstr)
    if mapidstr == MO_FANG_ZHEN_CENTER_MAP then
        return true
    end

    for _, value in pairs(cfgMoFangZhen) do
        local mapidliststr = value.mapidlist
        local strMapTab = string.split(mapidliststr, '|')        
        if strMapTab ~= false then            
            for _, mapstr in ipairs(strMapTab) do           
                if mapstr == mapidstr then
                    return true
                end
            end 
        end
    end
    return false
end

function MoFangZhenManager.GoToRandomMap(actor, mapliststr)
    if BF_IsNullObj(actor) or (mapliststr=='') then
        return
    end
    local mapStrTab = string.split(mapliststr, '|')
    if (mapStrTab == false) or (type(mapStrTab)~='table') then
        return
    end
    local rand = math.random(1, #mapStrTab)
    map(actor, mapStrTab[rand])
end

local function UpdateCDTimeMsg(actor)
    local totalstayseconds = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_STAY_SECONDS)
    local pastseconds =  math.abs(os.time() - getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_ENTER_TIME))
    senddelaymsg(actor, 'ħ����ʣ��ʱ��:%s', math.max(0, totalstayseconds - pastseconds), CSS.NPC_YELLOW, 1, '', 550) 
end

local function InitMapUI(actor)
    if not Player.IsPCClient(actor) then
        --�ֻ���
        addbutton(actor, 104, MAP_BUTTON_ID_1, '<Button|text=��    ��|x=-300|y=-520|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@mofangzhen_button,'..
            INNER_BUTTONFUNC_ID_1..'>')
        addbutton(actor, 104, MAP_BUTTON_ID_2, '<Button|text=��    ��|x=-300|y=-480|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@mofangzhen_button,'..
            INNER_BUTTONFUNC_ID_2..'>')
        addbutton(actor, 104, MAP_BUTTON_ID_3, '<Button|text=��ʱ�趨|x=-300|y=-440|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@mofangzhen_button,'..
            INNER_BUTTONFUNC_ID_7..'>')            
    end
    UpdateCDTimeMsg(actor)
end

local function ClearMapUI(actor)
    delbutton(actor, 104, MAP_BUTTON_ID_1)
    delbutton(actor, 104, MAP_BUTTON_ID_2)    
    delbutton(actor, 104, MAP_BUTTON_ID_3)
end

--ħ�����ͼ�Ķ�ʱ���ʱ���Ƿ��ѵ������˽�����߻ذ�ȫ��
function MoFangZhenManager.OnTimerCheck(actor)
    local mapidstr = Player.GetMapIDStr(actor)
    if not MoFangZhenManager.IsMoFangZhenMap(mapidstr) then
        return
    end

    local totalstayseconds = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_STAY_SECONDS)
    local pastseconds =  math.abs(os.time() - getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_ENTER_TIME))   
    if totalstayseconds < pastseconds then
        if Player.IsDead(actor) then
            realive(actor)
        end        
        Player.GoHome(actor)
    elseif totalstayseconds < pastseconds + 60 then
        --����һ���ӣ����Ƿ������Զ���ʱ��
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG2) == 1 then
            MoFangZhenManager.DoAddTime(actor, false)
        end    
    end
end

function MoFangZhenManager.DoMapButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end    
    local mapidstr = Player.GetMapIDStr(actor)    
    if not MoFangZhenManager.IsMoFangZhenMap(mapidstr) then
        --����ң�����ħ�����ͼ����
        return
    end

    local funcid = tonumber(sid)

    if funcid == INNER_BUTTONFUNC_ID_1 then
        --����ȷ�Ͽ�
        MoFangZhenManager.ShowExitMakeSureMsgBox(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_2 then
        local lasttime = getplaydef(actor, CommonDefine.VAR_N_LAST_OPER_TIME1)
        local currtime = os.time()
        local leftcdtime = 5 - math.abs(currtime - lasttime)
        
        if leftcdtime > 0 then
            Player.SendSelfMsg(actor, '�ٴδ�����'..leftcdtime..'��CD��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        

        --������ͱ���������ͼ
        local mofangzhenid = getplaydef(actor, CommonDefine.VAR_U_MOFANGZHEN_ID)
        local mofanginfo = cfgMoFangZhen[mofangzhenid]
        if mofanginfo then
            MoFangZhenManager.GoToRandomMap(actor, mofanginfo.mapidlist)
            setplaydef(actor, CommonDefine.VAR_N_LAST_OPER_TIME1, currtime)
        end                   
    elseif funcid == INNER_BUTTONFUNC_ID_3 then
        --������ذ�ȫ��
        if Player.IsDead(actor) then
            realive(actor)           
        end        
        Player.GoHome(actor)     
    elseif funcid == INNER_BUTTONFUNC_ID_4 then
        --ԭ�ظ���        
        if not Player.IsDead(actor) then
            return
        end    
        realive(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_5 then
        --�������ǰ�ȫ��
        Player.GoHome(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_6 then
        --�رնԻ���
        close(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_7 then
        --��ʱ�趨�Ի���
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG1, 0)
        MoFangZhenManager.ShowAddTimeSettingDialogBox(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_8 then
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG1) == 1 then
            MoFangZhenManager.DoAddTime(actor, true)
            setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG1, 0)            
        end        
        close(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_9 then
        MoFangZhenManager.SetAddTimeFlag(actor, 1)
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG2, 0)
        MoFangZhenManager.ShowAddTimeSettingDialogBox(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_10 then
        MoFangZhenManager.SetAddTimeFlag(actor, 2)
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG1, 0)
        MoFangZhenManager.ShowAddTimeSettingDialogBox(actor)
    end
end

--�˳�ǰ�Ķ���ȷ�Ͽ�
function MoFangZhenManager.ShowExitMakeSureMsgBox(actor)
    local msg = '<Img|children={0,1,2,3,4}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
        '<Layout|id=0|width=348|height=200>'..
        '<Text|id=1|x=30|y=25|size=18|color='..CSS.NPC_WHITE..'|text=ħ������ʱ����δ�������˳�>'..
        '<Text|id=2|x=60|y=55|size=16|color='..CSS.NPC_WHITE..'|text=������㣬�Ƿ�����˳�?>'..        
        '<Button|id=3|x=45|y=90|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȡ��|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_6..'>'..
        '<Button|id=4|x=170|y=90|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȷ��|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_5..'>'
    say(actor, msg)
end

--��ʱ�趨�ĶԻ���
function MoFangZhenManager.ShowAddTimeSettingDialogBox(actor)
    local flag1 = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG1)
    local flag2 = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG2)

    local msg = '<Img|children={0,1,2,3,4,5,6,7,8}|a=1|x=800|y=200|reset=1|move=1|img=public/1900000605.png|bg=1>'..
        '<Layout|id=0|width=400|height=176>'..
        '<Text|id=1|x=150|y=15|size=20|color='..CSS.NPC_BLUE..'|text=��ʱ�趨>'..
        '<CheckBox|id=2|x=30|y=40|nimg=private/cc_common/checkbox_1.png|pimg=private/cc_common/checkbox_2.png|checkboxid='..CommonDefine.VAR_N_NPC_CHECKBOX_1..'|default='..flag1..
        '|delay=0|count=1|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_9..'>'..
        '<Text|id=3|text=����һ��ħ�����������30����|x=65|y=45|color='..CSS.NPC_LIGHTGREEN..'>'..

        '<CheckBox|id=4|x=30|y=70|nimg=private/cc_common/checkbox_1.png|pimg=private/cc_common/checkbox_2.png|checkboxid='..CommonDefine.VAR_N_NPC_CHECKBOX_2..'|default='..flag2..
        '|delay=0|count=1|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_10..'>'..
        '<Text|id=5|text=����ʱ1����ʱ,�Զ�����ħ�������,|x=65|y=75|color='..CSS.NPC_LIGHTGREEN..'>'..
        '<Text|id=6|text=ÿ������30����,ֱ���þ�����!|x=65|y=100|color='..CSS.NPC_LIGHTGREEN..'>'..
        '<Button|id=7|x=80|y=130|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=�ر�|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_6..'>'..
        '<Button|id=8|x=240|y=130|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȷ��|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_8..'>'        
    say(actor, msg)
end

--���ò�ʱ��ѡ��
function MoFangZhenManager.SetAddTimeFlag(actor, flagid)
    if BF_IsNullObj(actor) or (flagid==nil) then
        return
    end

    if flagid == 1 then
        local tempvar = getplaydef(actor, CommonDefine.VAR_N_NPC_CHECKBOX_1)
        if (tempvar==1) or (tempvar==0) then
            setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG1, tempvar)
        end
    elseif flagid == 2 then
        local tempvar = getplaydef(actor, CommonDefine.VAR_N_NPC_CHECKBOX_2)
        if (tempvar==1) or (tempvar==0) then
            setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_MFZ_ADDTIME_FLAG2, tempvar)
        end
    end
end

--�������в�ʱ����
function MoFangZhenManager.DoAddTime(actor, bNotify)
    local leftfreetimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES)
    local leftbuytimes = getplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES)
    if (leftfreetimes + leftbuytimes) <= 0 then
        if bNotify and (bNotify == true) then
            Player.SendSelfMsg(actor, '��ǰ�޿�ת��������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
        return
    end

    local currstayseconds = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_STAY_SECONDS)
    if leftfreetimes > 0 then
        setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES, leftfreetimes-1)        
        setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_STAY_SECONDS, currstayseconds + CommonDefine.MOFANGZHEN_ONCE_FOR_STAY_SECONDS)
    elseif leftbuytimes > 0 then
        setplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES, leftbuytimes-1)
        setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_STAY_SECONDS, currstayseconds + CommonDefine.MOFANGZHEN_ONCE_FOR_STAY_SECONDS)
    end 
    UpdateCDTimeMsg(actor)

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_MOFANGZHEN, 1)    
end

--����ͼ�Ļص�
function MoFangZhenManager.OnEnterMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not MoFangZhenManager.IsMoFangZhenMap(mapidstr)) then
        return
    end
    InitMapUI(actor)
    setontimer(actor, CommonDefine.TIMER_ID_MOFANGZHEN, 5, 0, 0)
    setplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES, 0)

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_MOFANGZHEN, 1)
end

--�뿪��ͼ�Ļص�
function MoFangZhenManager.OnLeaveMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not MoFangZhenManager.IsMoFangZhenMap(mapidstr)) then
        return
    end
    ClearMapUI(actor)
    setofftimer(actor, CommonDefine.TIMER_ID_MOFANGZHEN)
end

--��������ص�
function MoFangZhenManager.OnPlayerDie(actor, killer)
    if BF_IsNullObj(actor) then
        return
    end
    local mapid = Player.GetMapIDStr(actor)
    if not MoFangZhenManager.IsMoFangZhenMap(mapid) then
        return
    end
    local killername = 'BOSS'
    if not BF_IsNullObj(killer) then
        killername = Player.GetName(killer)
    end

    local msg = '<Img|children={0,1,2,3,4,5}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
        '<Layout|id=0|width=348|height=200>'..
        '<Text|id=1|x=110|y=15|size=18|color='..CSS.NPC_WHITE..'|text=��������>'..
        '<Text|id=2|x=77|y=45|size=16|color='..CSS.NPC_WHITE..'|text=�㱻 '..killername..' ɱ���ˣ�>'..        
        '<Button|id=3|x=45|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=�˳�����|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_3..'>'..
        '<Button|id=4|x=170|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ԭ�ظ���|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_4..'>'..
        '<COUNTDOWN|id=5|x=70|y=110|time=30|count=1|size=16|color='..CSS.NPC_RED..'|link=@mofangzhen_button,'..INNER_BUTTONFUNC_ID_3..'>'
    Player.ShowReliveDialogue(actor, msg)
end

--��ҿ���ص�
function MoFangZhenManager.OnResetDay(actor)
    setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES, CommonDefine.DAY_FREE_ENTER_MOFANGZHEN_TIMES)
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERMAP, MoFangZhenManager.OnEnterMap, CommonDefine.FUNC_ID_MOFANGZHEN)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_LEAVEMAP, MoFangZhenManager.OnLeaveMap, CommonDefine.FUNC_ID_MOFANGZHEN)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_DIE, MoFangZhenManager.OnPlayerDie, CommonDefine.FUNC_ID_MOFANGZHEN)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_RESETDAY, MoFangZhenManager.OnResetDay, CommonDefine.FUNC_ID_MOFANGZHEN)



--------------------------------------------------------��������--------------------------------------------------------------------
function MoFangZhenManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26,27,28,29}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=ħ�������˵��:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1��ħ����ÿ��Ľ�������Ϊ�ȼ�������������Ϊս����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=2��ħ����ÿһ�����֮�󣬾�����ͨ����ݵĴ��Ͱ�ť����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=������ͣ�ÿһ��ĸ����ж������Ϳɽ�����ս��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3��ÿ�ν���ħ�������������ս������ÿ�յ���ս����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=26|text=�����ޣ�0�����ÿ�յĴ����ָ���|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=27|text=4����ս������������Ԫ�����򣬵�����Ĵ���Ҳ������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=28|text=5��ÿ����һ����ս������������ħ�����ڵ�30������սʱ�䣬|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=29|text=��ҿ���ͨ�������ڵĿ�ݰ�ť���п����Զ���ʱ��һ���|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    BF_ShowSpecialUI(actor, strPanelInfo)    
end

local function GetSingleShowInfo(actor, infoid)
    local strPanelInfo = ''
    local mofanginfo = cfgMoFangZhen[infoid]
    if (not BF_IsNullObj(actor)) and (mofanginfo ~= nil) then           
        local currpower = Player.GetPlayerPower(actor)
        local currlevel = Player.GetLevel(actor)
        local idstr = '20,21,22,23,24,25,26'
        strPanelInfo = strPanelInfo..'<Text|id=20|x=0.0|y=10.0|size=18|color=151|text=����˵����>'..
            '<Text|id=21|x=0.0|y=100.0|size=18|color=151|text=����˵����>'..
            '<Text|id=22|x=0.0|y=190.0|size=18|color=151|text=ս�����ƣ�  '..BF_NumToShowStr(mofanginfo.needscore)..'/'..BF_NumToShowStr(currpower)..'>'

        for seq, value in ipairs(mofanginfo.desc1_tab) do
            if seq > 3 then
                break
            end
            local textid = 30 + seq
            local curry = 10 + (seq-1) * 30
            idstr = idstr..','..textid
            strPanelInfo = strPanelInfo..'<Text|id='..textid..'|x=100.0|y='..curry..'|size=18|color=255|text='..value..'>'
        end

        for seq, value in ipairs(mofanginfo.desc2_tab) do
            if seq > 3 then
                break
            end
            local textid = 40 + seq
            local curry = 100 + (seq-1) * 30
            idstr = idstr..','..textid
            strPanelInfo = strPanelInfo..'<Text|id='..textid..'|x=100.0|y='..curry..'|size=18|color=255|text='..value..'>'
        end        

        if currlevel >= mofanginfo.needlevel then
            strPanelInfo = strPanelInfo..'<Button|id=23|x=400.0|y=280.0|color=255|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=������ս|link=@function_button,'..
                NPCPANEL_BUTTONFUNC_ID_2..','..infoid..'>'
        else
            strPanelInfo = strPanelInfo..'<Text|id=23|text=��ɫ'..mofanginfo.needlevel..'������|size=20|x=400|y=280|color='..CSS.NPC_RED..'>'
        end

        local currbuytimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_BUYTIMES)
        local leftbuytimes = math.max(0, CommonDefine.MOFANGZHEN_DAY_MAX_BUY_TIMES - currbuytimes)
        strPanelInfo = strPanelInfo..'<Button|id=24|x=60.0|y=280.0|color=255|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=����һ��|link=@function_button,'..
                NPCPANEL_BUTTONFUNC_ID_3..'>'
        local needitemdesc = BF_GetItemTableDescStr(nil, CommonDefine.MOFANGZHEN_DAY_BUY_NEEDITEMS)
        strPanelInfo = strPanelInfo..'<Text|id=25|text=(��Ҫ��'..needitemdesc..')|size=18|x=170|y=286|color='..CSS.NPC_WHITE..'>'..
            '<Text|id=26|text=(����ʣ��'..leftbuytimes..'��)|size=18|x=60|y=256|color='..CSS.NPC_WHITE..'>'

        strPanelInfo = strPanelInfo..'<Layout|id=16|children={'..idstr..'}|x=200.0|y=100.0|width=580|height=300>'
    end
    return strPanelInfo
end

function MoFangZhenManager.ShowBasePanel(actor)    
    local leftentertimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES) + getplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES)
    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15,16,17}|x=188.0|y=31.0|height=448|loadDelay=1|bg=1|show=0|reset=1|move=0|img=private/cc_mofangzhen/6.png|esc=1>'..
        '<Layout|id=11|x=812.0|y=12.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=813.0|y=13.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Text|id=13|x=200.0|y=60.0|color=161|size=18|text=������:���籾������һ������ħ����>'..
        '<Text|id=14|x=600.0|y=60.0|size=18|color=215|text=���տ���ս����:'..leftentertimes..'>'..
        '<Button|id=17|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

    local chooseid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    local listitemidstr = ''
    for seq, mofanginfo in ipairs(cfgMoFangZhen) do
        local picid = 50 + seq * 2
        local textid = 50 + seq * 2 + 1
        if chooseid == -1 then          
            chooseid = mofanginfo.id
            setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, chooseid)
        end

        local tabpic = 'private/cc_mofangzhen/2.png'
        if chooseid == mofanginfo.id then
            tabpic = 'private/cc_mofangzhen/1.png'
        end
        strPanelInfo = strPanelInfo..'<Img|id='..picid..'|children={'..textid..'}x=0.0|y=0.0|img='..tabpic..'|link=@function_button,'..
            NPCPANEL_BUTTONFUNC_ID_1..','..mofanginfo.id..'>'
        strPanelInfo = strPanelInfo..'<Text|id='..textid..'|x=10.0|y=10.0|size=20|color='..CSS.NPC_YELLOW..'|text='..mofanginfo.showname..'>'
        --��Ӧ��ǰѡ�е�ҳǩ
        if chooseid == mofanginfo.id then
            strPanelInfo = strPanelInfo..GetSingleShowInfo(actor, chooseid)
        end

        if listitemidstr ~= '' then
            listitemidstr = listitemidstr..','
        end
        listitemidstr = listitemidstr..picid
    end
    strPanelInfo = strPanelInfo..'<ListView|id=15|children={'..listitemidstr..'}|x=62.0|y=60.0|width=130|height=360|direction=1>'

    BF_ShowSpecialUI(actor, strPanelInfo)
end

local function DoBuyTimes(actor)
    --�����߼�
    local currbuytimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_BUYTIMES)
    if currbuytimes >= CommonDefine.MOFANGZHEN_DAY_MAX_BUY_TIMES then
        Player.SendSelfMsg(actor, '���չ�����������꣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    if not Player.CheckItemsEnough(actor, CommonDefine.MOFANGZHEN_DAY_BUY_NEEDITEMS, '����ħ�������') then
        return
    end
    --�۳�����
    Player.TakeItems(actor, CommonDefine.MOFANGZHEN_DAY_BUY_NEEDITEMS, '����ħ�������')       

    setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_BUYTIMES, currbuytimes + 1)
    local totalbuytimes = getplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES) + 1
    setplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES, totalbuytimes)
    Player.SendSelfMsg(actor, '����1��ħ������ս������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
end

--ʹ��ħ����ƾ֤���Ӵ���
function MoFangZhenManager.DoAddTimesByItem(actor)
    local currbuytimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_BUYTIMES)
    if currbuytimes >= CommonDefine.MOFANGZHEN_DAY_MAX_BUY_TIMES then
        Player.SendSelfMsg(actor, '����ħ�������Ӵ��������꣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return false
    end

    setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_BUYTIMES, currbuytimes + 1)
    local totalbuytimes = getplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES) + 1
    setplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES, totalbuytimes)
    Player.SendSelfMsg(actor, '����1��ħ������ս������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    return true
end

--ǰ��ħ����ͼ
local function GoToMoFang(actor, id)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_MOFANGZHEN, false) then
        return
    end    
    if (id < 1) or (id > #cfgMoFangZhen) then
        return
    end

    local leftfreetimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES)
    local leftbuytimes = getplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES)
    if (leftfreetimes + leftbuytimes) <= 0 then
        Player.SendSelfMsg(actor, '��ս���������꣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local mofanginfo = cfgMoFangZhen[id]
    if mofanginfo == nil then
        return
    end
    if Player.GetLevel(actor) < mofanginfo.needlevel then
        Player.SendSelfMsg(actor, 'δ�ﵽ����õ�ͼ�ĵȼ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    if Player.GetPlayerPower(actor) < mofanginfo.needscore then
        Player.SendSelfMsg(actor, 'δ�ﵽ����õ�ͼ��ս���ż���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    if leftfreetimes > 0 then
        setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES, leftfreetimes-1)
    elseif leftbuytimes > 0 then
        setplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES, leftbuytimes-1)
    else
        return
    end    
    setplaydef(actor, CommonDefine.VAR_U_MOFANGZHEN_ID, id)
    setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_ENTER_TIME, os.time())
    setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_STAY_SECONDS, CommonDefine.MOFANGZHEN_ONCE_FOR_STAY_SECONDS)
    MoFangZhenManager.GoToRandomMap(actor, mofanginfo.mapidlist)

    --��������ħ����
	FreeVIPManager.TriggerChgTaskCounter(actor, FreeVIPManager.TASK_TYPE_MOFANGZHEN_ENTERTIMES, '+', 1)
end

--����button�ص�
function MoFangZhenManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    
    local funcid = tonumber(sid)
    local nparam = 0
    if BF_IsNumberStr(sparam) then
        nparam = tonumber(sparam)
    end

    if funcid == NPCPANEL_BUTTONFUNC_ID_1 then
        setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID,  nparam)
        MoFangZhenManager.ShowBasePanel(actor)
    elseif funcid == NPCPANEL_BUTTONFUNC_ID_2 then
        GoToMoFang(actor, nparam)
	elseif funcid == NPCPANEL_BUTTONFUNC_ID_3 then
        DoBuyTimes(actor)
        MoFangZhenManager.ShowBasePanel(actor)
    end    
end


--�Ƿ��п����ʾ
function MoFangZhenManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_MOFANGZHEN, false) then
        return false
    end

    local leftfreetimes = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES)
    local leftbuytimes = getplaydef(actor, CommonDefine.VAR_U_MOFANG_LEFT_BUYTIMES)
    if (leftfreetimes + leftbuytimes) > 0 then
        return true
    end

    return false
end


return MoFangZhenManager