SingleBossManager = {}

--buttonid
local MAP_BUTTON_ID_1 = 101

--functionid
local SINGLEBOSS_BUTTONFUNC_ID_1 = 1    --���������ͼ�еĹ��ܰ���-�˳���ͼ
local SINGLEBOSS_BUTTONFUNC_ID_3 = 3    --���������ͼ�еĹ��ܰ���-����˳���ͼ
local SINGLEBOSS_BUTTONFUNC_ID_4 = 4    --���������ͼ�еĹ��ܰ���-ԭ�ظ���

local DAY_FREE_TIMES = 10               --ÿ�����Ѵ���
local DAY_MAX_BUY_TIMES = 5             --ÿ����������
local BUY_ONE_KILLTIME_NEEDITMES = {{name='Ԫ��', num=200}}     --���ι�������

--�ж��Ƿ�Ϊ���������ͼ
function SingleBossManager.IsBossMap(mapidstr)
    for _, value in pairs(cfgSingleBossInfo) do
        --�����������mapid��ʱ�������ֵ����
        local idstr = value.mapid..''        
        if idstr == mapidstr then
            return true
        end
    end
    return false
end

--���ظ�������ʣ�����
function SingleBossManager.GetLeftKillTimes(actor)
    local buytimes = getplaydef(actor, CommonDefine.VAR_J_DAY_SINGLEBOSS_BUYTIMES)
    local killtimes = getplaydef(actor, CommonDefine.VAR_J_DAY_SINGLEBOSS_KILLTIMES)
    if DAY_FREE_TIMES + buytimes >= killtimes then
        return DAY_FREE_TIMES + buytimes - killtimes
    else
        return 0
    end
end

--���ص��ι��������
function SingleBossManager.GetBuyOnceNeedItems()
    return BUY_ONE_KILLTIME_NEEDITMES
end

--���ظ�������ÿ�տ��Թ���������
function SingleBossManager.GetMaxBuyTimes(actor)
    return DAY_MAX_BUY_TIMES
end

--���ظ�������ʣ����Թ������
function SingleBossManager.GetLeftBuyTimes(actor)
    local buytimes = getplaydef(actor, CommonDefine.VAR_J_DAY_SINGLEBOSS_BUYTIMES)
    if DAY_MAX_BUY_TIMES >= buytimes then
        return DAY_MAX_BUY_TIMES - buytimes
    else
        return 0
    end
end

local function InitMapUI(actor)
    addbutton(actor, 104, MAP_BUTTON_ID_1, '<Button|text=�뿪��ͼ|x=-300|y=-520|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@singleboss_button,'..
        SINGLEBOSS_BUTTONFUNC_ID_1..'>')      
end

local function ClearMapUI(actor)
    delbutton(actor, 104, MAP_BUTTON_ID_1)
end

function SingleBossManager.DoMapButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    local funcid = tonumber(sid)
    if funcid == SINGLEBOSS_BUTTONFUNC_ID_1 then
        --���ذ�ȫ��
        gohome(actor)
    elseif funcid == SINGLEBOSS_BUTTONFUNC_ID_3 then
        --������ذ�ȫ��
        if Player.IsDead(actor) then
            realive(actor)                       
        end        
        gohome(actor) 
    elseif funcid == SINGLEBOSS_BUTTONFUNC_ID_4 then
        --ԭ�ظ���        
        if not Player.IsDead(actor) then
            return
        end

        local relivetimes = getplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES) + 1
        local needitems = Player.GetCommonLocalReliveNeedItems(relivetimes)
        if not Player.CheckItemsEnough(actor, needitems, '����') then
            return
        end        
        --�۳�����
        Player.TakeItems(actor, needitems, '���������ͼ����')
        setplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES, relivetimes + 1)        
        realive(actor)
    end
end

--����ͼ�Ļص�
function SingleBossManager.OnEnterMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not SingleBossManager.IsBossMap(mapidstr)) then
        return
    end
    InitMapUI(actor)
    local attackmode = getattackmode(actor)
    setplaydef(actor, CommonDefine.VAR_N_LAST_ATTACK_MODE, attackmode)
    setattackmode(actor, CommonDefine.ATTACK_MODE_ALL, 36000) 
    setplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES, 0)
end

--�뿪��ͼ�Ļص�
function SingleBossManager.OnLeaveMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not SingleBossManager.IsBossMap(mapidstr)) then
        return
    end    
    ClearMapUI(actor)    
    setattackmode(actor, -1, 0)        
    local attackmode = getplaydef(actor, CommonDefine.VAR_N_LAST_ATTACK_MODE)
    changeattackmode(actor, attackmode)
end

--��������ص�
function SingleBossManager.OnPlayerDie(actor, killer)
    if BF_IsNullObj(actor) then
        return
    end
    local mapid = Player.GetMapIDStr(actor)
    if not SingleBossManager.IsBossMap(mapid) then
        return
    end
    local killername = 'BOSS'
    if not BF_IsNullObj(killer) then
        killername = Player.GetName(killer)
    end

    local relivetimes = getplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES)
    local needitems = Player.GetCommonLocalReliveNeedItems(relivetimes+1)
    local needitemstr = BF_GetItemTableDescStr(nil, needitems)
    local msg = '<Img|children={0,1,2,3,4,5,6}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
        '<Layout|id=0|width=348|height=200>'..
        '<Text|id=1|x=110|y=15|size=18|color='..CSS.NPC_WHITE..'|text=��������>'..
        '<Text|id=2|x=77|y=45|size=16|color='..CSS.NPC_WHITE..'|text=�㱻 '..killername..' ɱ���ˣ�>'..        
        '<Button|id=3|x=45|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=��������|link=@singleboss_button,'..SINGLEBOSS_BUTTONFUNC_ID_3..'>'..
        '<Button|id=4|x=170|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ԭ�ظ���|link=@singleboss_button,'..SINGLEBOSS_BUTTONFUNC_ID_4..'>'..
        '<COUNTDOWN|id=5|x=70|y=110|time=30|count=1|size=16|color='..CSS.NPC_RED..'|link=@singleboss_button,'..SINGLEBOSS_BUTTONFUNC_ID_3..'>'..
        '<Text|id=6|x=170|y=110|size=16|color='..CSS.NPC_WHITE..'|text='..needitemstr..'>'
    Player.ShowReliveDialogue(actor, msg)
end

--���ﱻ��ɱ�ص�
function SingleBossManager.OnMonKilled(hitter, mon)
    if BF_IsNullObj(mon) then
        return
    end
    local mapidstr = Player.GetMapIDStr(mon)
    if not SingleBossManager.IsBossMap(mapidstr) then
        return
    end

    local idx = Player.GetMonIdx(mon)
    local cfgBossInfo = nil
    for _, value in pairs(cfgSingleBossInfo) do
        if value.monidx == idx then
            cfgBossInfo = value
            break
        end
    end
    if cfgBossInfo == nil then
        return
    end

    if Player.IsPlayer(hitter) then
        --��һ�ɱ�����Ӵ���
        local killtimes = getplaydef(hitter, CommonDefine.VAR_J_DAY_SINGLEBOSS_KILLTIMES) + 1
        setplaydef(hitter, CommonDefine.VAR_J_DAY_SINGLEBOSS_KILLTIMES, killtimes)
        --ÿ�ձ�������        
        EverydayTask.AddTaskCounter(hitter, CommonDefine.FUNC_ID_SINGLE_BOSS, 1)
    end

	--10�������ս����ͼ
	Player.SendMapMsg(hitter, 'BOSS�ѱ���ɱ��60����Զ�������ͼ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
	grobaldelaygoto(60*1000, 'g_delay_SingleBossManager_ClearFightingMap,'..mapidstr)    
end

--����������ָ����ս����ͼ
function SingleBossManager.ClearFightingMap(mapidstr)
	if mapidstr ~= '' then
		local mapplayers = getplaycount(mapidstr,0,0)
		for _, player in ipairs(type(mapplayers) == "table" and mapplayers or {}) do
			gohome(player)
		end
	end
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERMAP, SingleBossManager.OnEnterMap, CommonDefine.FUNC_ID_SINGLE_BOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_LEAVEMAP, SingleBossManager.OnLeaveMap, CommonDefine.FUNC_ID_SINGLE_BOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_DIE, SingleBossManager.OnPlayerDie, CommonDefine.FUNC_ID_SINGLE_BOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_MON_KILLED, SingleBossManager.OnMonKilled, CommonDefine.FUNC_ID_SINGLE_BOSS)


--�Ƿ��п����ʾ
function SingleBossManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_SINGLE_BOSS, false) then
        return false
    end

    local lefttimes = SingleBossManager.GetLeftKillTimes(actor)
    if lefttimes <= 0 then
        return false
    end

    local currlv = Player.GetLevel(actor)
    for i = 1, #cfgSingleBossInfo, 1 do
        local info = cfgSingleBossInfo[i]
        local lefthprate = BF_GetMapBossInfo(info.mapid, info.monidx)
        if info.needlevel <= currlv then
            if lefthprate > 0 then
                return true
            end
        end
    end

    return false
end

return SingleBossManager