RandomBossManager = {}

--buttonid
local MAP_BUTTON_ID_1 = 101
local MAP_BUTTON_ID_2 = 102
local MAP_BUTTON_ID_3 = 103

--functionid
local INNER_BUTTONFUNC_ID_1 = 1    --�������BOSS����ʾ�� ȡ�� ������
local INNER_BUTTONFUNC_ID_2 = 2    --�������BOSS����ʾ�� ȷ�� ����
local INNER_BUTTONFUNC_ID_3 = 3    --���BOSS�Ľ���� �سǣ����
local INNER_BUTTONFUNC_ID_4 = 4    --���BOSS�Ľ���� ԭ�ظ���

local NPCPANEL_BUTTONFUNC_ID_1 = 1	--������ս

--��ͼ������ҵ�ʱ��bossѪ�����ڶ��ٲ��ɽ���
RandomBossManager.MIN_CAN_JOIN_BOSS_HPPERCENT = 30

--ɱ�ֿɴ������boss�ĵ�ͼ
local VALID_TRIGGER_RANDOMBOSS_MAPIDSTR = {
	'0', '1', '2', '3', 
}

--��ҵ�һ�δ��������boss����ֻ�ܴ���һ��
local FIRST_TRIGGER_RANDOMBOSS_MONNAME = 'ս������0'

--��ҵ�һ�λ�ɱ���boss��õĽ���
local FIRST_KILL_RANDOMBOSS_REWARD = {{name='��Ԫ��',num=100},{name='���',num=200000},{name='ǿ��ʯ',num=100},{name='С�;�����',num=10},{name='30��װ�������',num=10}}

--ɱ�ִ������boss�Ĺ��Ｘ�ʣ���ֱȷ��ӣ����չ�����ɫ����
local KILL_MON_TRIGGER_RANDOMBOSS = {
	{moncolor=CommonDefine.MON_NAME_COLOR_WHITE, rate=500},
	{moncolor=253, rate=500},
	{moncolor=CommonDefine.MON_NAME_COLOR_GOLD, rate=1000},
	{moncolor=CommonDefine.MON_NAME_COLOR_RED, rate=2000},
}

--���BOSS��Ӧ��ս����ͼ��Ϣ
local RANDOM_BOSS_FIGHTING_MAPINFO = {
    {id=1, mapidstr='randboss_1', posx=10, posy=10, maxplayer=5},
    {id=2, mapidstr='randboss_2', posx=10, posy=10, maxplayer=5},
    {id=3, mapidstr='randboss_3', posx=10, posy=10, maxplayer=5},
    {id=4, mapidstr='randboss_4', posx=10, posy=10, maxplayer=5},
    {id=5, mapidstr='randboss_5', posx=10, posy=10, maxplayer=5},
    {id=6, mapidstr='randboss_6', posx=10, posy=10, maxplayer=5},
    {id=7, mapidstr='randboss_7', posx=10, posy=10, maxplayer=5},
    {id=8, mapidstr='randboss_8', posx=10, posy=10, maxplayer=5},
    {id=9, mapidstr='randboss_9', posx=10, posy=10, maxplayer=5},
    {id=10, mapidstr='randboss_10', posx=10, posy=10, maxplayer=5},
	{id=11, mapidstr='randboss_11', posx=10, posy=10, maxplayer=5},
	{id=12, mapidstr='randboss_12', posx=10, posy=10, maxplayer=5},
	{id=13, mapidstr='randboss_13', posx=10, posy=10, maxplayer=5},
	{id=14, mapidstr='randboss_14', posx=10, posy=10, maxplayer=5},
	{id=15, mapidstr='randboss_15', posx=10, posy=10, maxplayer=5},
}

function RandomBossManager.TestClearAllFightingMapInfo()
	for _, value in ipairs(RANDOM_BOSS_FIGHTING_MAPINFO) do
		RandomBossManager.ClearFightingMap(value.mapidstr)
	end
end

local function GetTriggerPoolInfo(poolid)
	for _, value in pairs(cfgRandomBossTriggerPool) do
		if value.poolid == poolid then
			return value
		end
	end
	return nil
end

local function IsRandomBossMap(mapidstr)
	for _, value in ipairs(RANDOM_BOSS_FIGHTING_MAPINFO) do
		if value.mapidstr == mapidstr then
			return true
		end
	end
	return false
end

function RandomBossManager.GetCurrFightingInfoList(currpower, min, max)
	local infoListTab = {}
	local bFinished = true

	local nValidCounter = 0
	for _, fightinginfo in ipairs(RANDOM_BOSS_FIGHTING_MAPINFO) do
		local triggerid = getenvirintvar(fightinginfo.mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_ID)		
		if triggerid and triggerid > 0 then
			local triggerPoolInfo = GetTriggerPoolInfo(triggerid)
			if triggerPoolInfo and (currpower >= triggerPoolInfo.minpower) and (currpower <= triggerPoolInfo.maxpower) then
				nValidCounter = nValidCounter + 1
				if nValidCounter >= min then
					if nValidCounter > max then
						bFinished = false
						break
					end
					local name = getenvirstrvar(fightinginfo.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_TRIGGER_NAME)
					local count = getplaycountinmap('0', fightinginfo.mapidstr, 0)
					local monuniqueidstr = getenvirstrvar(fightinginfo.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONUNIQUEID)
					local bossname = getenvirstrvar(fightinginfo.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONNAME)
					local bossmon = getmonbyuserid(fightinginfo.mapidstr, monuniqueidstr)
					local hppercent = 100
					if not BF_IsNullObj(bossmon) then		
						hppercent = Player.GetCurHPPercent(bossmon)
					end
					local rec = {fightingid=fightinginfo.id, bossname=bossname, triggername=name, currcount=count, maxcount=fightinginfo.maxplayer, bosshppercent=hppercent}
					infoListTab[#infoListTab+1] = rec				
				end				
			end
		end
	end
	return infoListTab, bFinished
end

function RandomBossManager.DoMapButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end    

    local funcid = tonumber(sid)
    if funcid == INNER_BUTTONFUNC_ID_1 then
        --�رնԻ���
        close(actor)
    elseif funcid == INNER_BUTTONFUNC_ID_2 then
        --���ͽ���Ҵ������BOSS�ĵ�ͼ��
		local fightingid = getplaydef(actor, CommonDefine.VAR_N_CURR_RANDOMBOSS_FIGHTING_ID)
		RandomBossManager.GoToTriggerBossMap(actor, fightingid)
	elseif funcid == INNER_BUTTONFUNC_ID_3 then
        --������ذ�ȫ��
        if Player.IsDead(actor) then
            realive(actor)                       
        end        
        Player.GoHome(actor)
	elseif funcid == INNER_BUTTONFUNC_ID_4 then
        if Player.IsDead(actor) then
            realive(actor)                       
        end		
    end
end

--�������BOSS����ʾ��
function RandomBossManager.TriggerRandomBossTip(actor)
    local msg = '<Img|children={0,1,2,3,4}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
        '<Layout|id=0|width=348|height=200>'..
        '<Text|id=1|x=30|y=25|size=18|color='..CSS.NPC_WHITE..'|text=���ⷢ����ս�����죬�Ƿ�>'..
        '<Text|id=2|x=60|y=55|size=16|color='..CSS.NPC_WHITE..'|text=����������ս?>'..        
        '<Button|id=3|x=45|y=90|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȡ��|link=@randomboss_button,'..INNER_BUTTONFUNC_ID_1..'>'..
        '<Button|id=4|x=170|y=90|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȷ��|link=@randomboss_button,'..INNER_BUTTONFUNC_ID_2..'>'
    say(actor, msg)
end

--���봥�������boss��ͼ
function RandomBossManager.GoToTriggerBossMap(actor, fightingid)
	if (fightingid==nil) or (fightingid <= 0) then
		return
	end
	for _, info in ipairs(RANDOM_BOSS_FIGHTING_MAPINFO) do
		if info.id == fightingid then
			local triggername = getenvirstrvar(info.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_TRIGGER_NAME)
			local triggerid = getenvirintvar(info.mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_ID)
			local triggerPoolInfo = GetTriggerPoolInfo(triggerid)
			if triggerPoolInfo then
				local currpower = Player.GetPlayerPower(actor)
				if (triggername == Player.GetName(actor)) or ((currpower >= triggerPoolInfo.minpower) and (currpower <= triggerPoolInfo.maxpower)) then
					local count = getplaycountinmap('0', info.mapidstr, 0)
					if count < info.maxplayer then
						map(actor, info.mapidstr)
					else
						Player.SendSelfMsg(actor, '��ǰ��ͼ�������Ѵﵽ���ޣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
					end
				else
					Player.SendSelfMsg(actor, '���ս�������Ͻ���������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
				end				
			end
			break
		end
	end
end

--��������ս�����죬��������㲥��ʾ
function RandomBossManager.CreateNewRandomBoss(actor)
	local nPoolIdx = -1
	local monname = ''
	local monuniqueidstr = ''
	local currpower = Player.GetPlayerPower(actor)
	for _, info in ipairs(RANDOM_BOSS_FIGHTING_MAPINFO) do
		local triggername = getenvirstrvar(info.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_TRIGGER_NAME)	
		if triggername == '' then			
			--�������boss		
			for _, triggerinfo in pairs(cfgRandomBossTriggerPool) do			
				if (currpower >= triggerinfo.minpower) and (currpower <= triggerinfo.maxpower) then
					local bossinfo = BF_GetRandomTab(triggerinfo.bosslist_tab, -1)
					if bossinfo and bossinfo.name then				
						local monname = bossinfo.name
						if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_IS_FIRST_RANDOMBOSS_TRIGGER) == 0 then
							setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_IS_FIRST_RANDOMBOSS_TRIGGER, 1)
							monname = FIRST_TRIGGER_RANDOMBOSS_MONNAME
						end
						local montab = genmon(info.mapidstr, info.posx, info.posy, monname, 3, 1)						
						if (montab~=nil) and (#montab > 0) then
							nPoolIdx = triggerinfo.poolid
							monuniqueidstr = Player.GetPlayerID(montab[1])
						end						
					end
					break
				end
			end

			if nPoolIdx > 0 then
				setenvirintvar(info.mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_ID, nPoolIdx)
				setenvirintvar(info.mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_STARTTIME, os.time())				
				setenvirstrvar(info.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_TRIGGER_NAME, Player.GetName(actor))								
				setenvirstrvar(info.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONNAME, monname)
				setenvirstrvar(info.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONUNIQUEID, monuniqueidstr)
				setplaydef(actor, CommonDefine.VAR_N_CURR_RANDOMBOSS_FIGHTING_ID, info.id)
				--�ȵ���֪ͨ��ҽ���
				RandomBossManager.TriggerRandomBossTip(actor)
				--�ӳٷ�����Ϣ֪ͨ�������������	
				Player.SendServerMsg(actor, Player.GetName(actor)..'�Ѽ�����BOSS����ȥ����ʡ���������ߡ�������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
			end
			break
		end
	end
	return nPoolIdx
end

--�������BOSSָ����ս����ͼ
function RandomBossManager.ClearFightingMap(mapidstr)
	if mapidstr ~= '' then		
		setenvirintvar(mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_ID, 0)
		setenvirintvar(mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_STARTTIME, 0)		
		setenvirstrvar(mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_TRIGGER_NAME, '')	
		setenvirstrvar(mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONNAME, '')
		setenvirstrvar(mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONUNIQUEID, '')		

		local mapplayers = getplaycount(mapidstr,0,0)
		for _, player in ipairs(type(mapplayers) == "table" and mapplayers or {}) do
			Player.GoHome(player)
		end		
	end
end

local function InitMapUI(actor)
    if not Player.IsPCClient(actor) then
        --�ֻ���
        addbutton(actor, 104, MAP_BUTTON_ID_1, '<Button|text=�뿪��ͼ|x=-300|y=-520|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@randomboss_button,'..
            INNER_BUTTONFUNC_ID_3..'>')
    end
end

local function ClearMapUI(actor)
    delbutton(actor, 104, MAP_BUTTON_ID_1)
end

--����ͼ�Ļص�
function RandomBossManager.OnEnterMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not IsRandomBossMap(mapidstr)) then
        return
    end
    InitMapUI(actor)
end

--�뿪��ͼ�Ļص�
function RandomBossManager.OnLeaveMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not IsRandomBossMap(mapidstr)) then
        return
    end    
    ClearMapUI(actor)	
end

--�����ͼ��ɱ���ﴥ��
function RandomBossManager.OnKillMon(actor, mon, killtype, monobjidstr, monname, mapidstr)
	if BF_IsNullObj(actor) or BF_IsNullObj(mon) then
		return
	end	
	--������һ�ɱ�Ĳ�����
	if killtype ~= 2 then
		return
	end
	--���մ��������Ѵﵽ����
	local triggertimes = getplaydef(actor, CommonDefine.VAR_J_DAY_RANDOMBOSS_TRIGGERTIMES)
	if triggertimes >= CommonDefine.DAY_RANDOMBOSS_TRIGGER_MAXTIMES then
		return
	end

	--��ͼ������Ч��ͼ
	local isValidMap = false
	for i = 1, #VALID_TRIGGER_RANDOMBOSS_MAPIDSTR, 1 do
		if VALID_TRIGGER_RANDOMBOSS_MAPIDSTR[i] == mapidstr then
			isValidMap = true
			break
		end
	end
	if not isValidMap then
		return
	end

	if Player.GetLevel(actor) < 20 then
		return
	end

	--ɱ�ִ������������߼�	
	local ncolor = getbaseinfo(mon, CommonDefine.INFO_NAMECOLOR)
	for _, value in ipairs(KILL_MON_TRIGGER_RANDOMBOSS) do
		if value.moncolor == ncolor then
			if math.random(1, 10000) <= value.rate then				
				if RandomBossManager.CreateNewRandomBoss(actor) > 0 then
					setplaydef(actor, CommonDefine.VAR_J_DAY_RANDOMBOSS_TRIGGERTIMES, triggertimes+1)
				end
			end 
			break
		end
	end	
end

local function SendSuccessDialogue(actor, rewarditems)
    local msg = '<Text|id=1|x=150|y=25|size=20|color='..CSS.NPC_LIGHTGREEN..'|text=��ý���>'..
        '<Text|id=2|x=45|y=55|size=16|color='..CSS.NPC_WHITE..'|text=�������챻��ɱ����ϲ����ã�>'
    local currX = 45
    local currY = 55 + 40
    local currid = 2
    local idstr = '0,1,2'
    local currcount = 0
    local linecount = 4
    for seq, value in ipairs(rewarditems) do
        local itemidx = getstditeminfo(value.name, CommonDefine.STDITEMINFO_IDX)
        currcount = currcount + 1                
        currid = currid + 1
        if idstr ~= '' then
            idstr = idstr..','
        end
        idstr = idstr..currid
        msg = msg..'<ItemShow|id='..currid..'|x='..currX..'|y='..currY..'|itemid='..itemidx..'|itemcount='..value.num..'|bgtype=1|showtips=1>'
        currX = currX + 75
        if (currcount >= linecount) and (seq < #rewarditems) then
            currcount = 0
            currX = 45
            currY = currY + 75
        end
    end
    currY = currY + 80
    currid = currid + 1
    idstr = idstr..','..currid
    msg = msg..'<Button|id='..currid..'|x=160|y='..currY..'|pimg=public/btn_bbgm_01.png|nimg=public/btn_bbgm_02.png|color='..CSS.NPC_WHITE..'|link=@randomboss_button,'..INNER_BUTTONFUNC_ID_3..'>'
	currY = currY + 60
    msg = msg..'<Img|children={'..idstr..'}|a=1|x=800|y=200|width=400|height='..currY..'|scale9t=10|scale9b=10|reset=1|move=1|img=public/1900000605.png|bg=1>'..
        '<Layout|id=0|width=400|height='..currY..'>'
	BF_ShowSpecialUI(actor, msg)	
end

--���ﱻ��ɱ�ص�
function RandomBossManager.OnMonKilled(hitter, mon)
    if BF_IsNullObj(mon) then
        return
    end
    local mapidstr = Player.GetMapIDStr(mon)
    if not IsRandomBossMap(mapidstr) then
        return
    end
	local uniqueidstr = getenvirstrvar(mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_MONUNIQUEID)
	if uniqueidstr ~= Player.GetPlayerID(mon) then
		return
	end

	--ʤ������ ���Ӵ���
	local rewardtimes = getplaydef(hitter, CommonDefine.VAR_J_DAY_RANDOMBOSS_REWARDTIMES)
	if rewardtimes < CommonDefine.DAY_RANDOMBOSS_GETREWARD_MAXTIMES then
		setplaydef(hitter, CommonDefine.VAR_J_DAY_RANDOMBOSS_REWARDTIMES, rewardtimes+1)

		local triggerid = getenvirintvar(mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_ID)
		local triggerPoolInfo = GetTriggerPoolInfo(triggerid)
		if triggerPoolInfo then
			local rewarditems = BF_GetRandomRewardItems(triggerPoolInfo.rewardlist_tab)
			if not table.isempty(rewarditems) then						
				if getflagstatus(hitter, CommonDefine.VAR_HUM_BITFLAG_IS_FIRST_RANDOMBOSS_REWARD) == 0 then
					setflagstatus(hitter, CommonDefine.VAR_HUM_BITFLAG_IS_FIRST_RANDOMBOSS_REWARD, 1)
					rewarditems = FIRST_KILL_RANDOMBOSS_REWARD
				end
				Player.GiveItemsToBagOrMail(hitter, rewarditems, '���BOSS����')
				SendSuccessDialogue(hitter, rewarditems)

				--ÿ�ձ�������        
				EverydayTask.AddTaskCounter(hitter, CommonDefine.FUNC_ID_RANDOMBOSS, 1)  				
			end
		end	
	else
		Player.SendSelfMsg(hitter, '����ջ�ý��������Ѵﵽ���ޣ�������������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
	end

	--������ɱ���BOSS
	FreeVIPManager.TriggerChgTaskCounter(hitter, FreeVIPManager.TASK_TYPE_RANDOMBOSS_KILLTIMES, '+', 1)

	--10�������ս����ͼ
	Player.SendMapMsg(hitter, 'BOSS�ѱ���ɱ��10����Զ�������ͼ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)

	grobaldelaygoto(10*1000, 'g_delay_RandomBossManager_ClearFightingMap,'..mapidstr)
end

--��������ص�
function RandomBossManager.OnPlayerDie(actor, killer)
    if BF_IsNullObj(actor) then
        return
    end
    local mapid = Player.GetMapIDStr(actor)
    if not IsRandomBossMap(mapid) then
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
        '<Button|id=3|x=45|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=�˳�����|link=@randomboss_button,'..INNER_BUTTONFUNC_ID_3..'>'..
        '<Button|id=4|x=170|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ԭ�ظ���|link=@randomboss_button,'..INNER_BUTTONFUNC_ID_4..'>'..
        '<COUNTDOWN|id=5|x=70|y=110|time=30|count=1|size=16|color='..CSS.NPC_RED..'|link=@randomboss_button,'..INNER_BUTTONFUNC_ID_3..'>'
	Player.ShowReliveDialogue(actor, msg)
end


GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERMAP, RandomBossManager.OnEnterMap, CommonDefine.FUNC_ID_RANDOMBOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_LEAVEMAP, RandomBossManager.OnLeaveMap, CommonDefine.FUNC_ID_RANDOMBOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_KILL_MON, RandomBossManager.OnKillMon, CommonDefine.FUNC_ID_RANDOMBOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_MON_KILLED, RandomBossManager.OnMonKilled, CommonDefine.FUNC_ID_RANDOMBOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_DIE, RandomBossManager.OnPlayerDie, CommonDefine.FUNC_ID_RANDOMBOSS)




--------------------------------------------------------��������--------------------------------------------------------------------
function RandomBossManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26,27,28,29}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=ս���������˵��:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1��ս������Ϊ��ɫ�ڳ�����ͼ�ϻ�ɱ����֮���ʴ�����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=2������ս���������ҽ�����5���ר������ʱ�䣬5��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=֮��ȫ��������ҿɼ���|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3��ֻ���봥��ս����������ս��������������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=26|text=���ܽ��븱������ս������Ĺ������ᡣ|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=27|text=4��ÿ�����ÿ����Ի��ս������Ľ������������ޣ�|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=28|text=����ʹ��ȡ�����Ĵ����ﵽ������Ҳ��Ȼ���Լ�������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'		
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=29|text=�����������ᣬֻ���������ٻ�ù���������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'			

    BF_ShowSpecialUI(actor, strPanelInfo)	
end

local function CanEnterBossMap(actor, fightingid)
	if (fightingid==nil) or (fightingid <= 0) then
		return false
	end
	for _, info in ipairs(RANDOM_BOSS_FIGHTING_MAPINFO) do
		if info.id == fightingid then
			local triggername = getenvirstrvar(info.mapidstr, CommonDefine.MAP_STRVAR_RANDOMBOSS_TRIGGER_NAME)
			local triggerid = getenvirintvar(info.mapidstr, CommonDefine.MAP_INTVAR_RANDOMBOSS_TRIGGER_ID)
			local triggerPoolInfo = GetTriggerPoolInfo(triggerid)
			if triggerPoolInfo then
				local currpower = Player.GetPlayerPower(actor)
				if (triggername == Player.GetName(actor)) or ((currpower >= triggerPoolInfo.minpower) and (currpower <= triggerPoolInfo.maxpower)) then
					local count = getplaycountinmap('0', info.mapidstr, 0)
					if count < info.maxplayer then
						return true
					end
				end				
			end
			break
		end
	end
	return false
end

function RandomBossManager.ShowBasePanel(actor)    
    local leftentertimes = math.max(0, CommonDefine.DAY_RANDOMBOSS_GETREWARD_MAXTIMES - getplaydef(actor, CommonDefine.VAR_J_DAY_RANDOMBOSS_REWARDTIMES))
    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15}|x=205.0|y=31.0|height=448|bg=1|reset=1|img=private/cc_bosslist_ex/3.png|loadDelay=0|show=0|move=0|esc=1>'..
		'<Layout|id=11|x=693.0|y=14.0|width=80|height=80|link=@exit>'..
		'<Button|id=12|x=696.0|y=15.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..		
		'<Text|id=13|x=278.0|y=399.0|color=151|size=20|text=����ʣ�ཱ������:'..leftentertimes..'>'..
		'<Button|id=15|x=550.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

	local itemidstr = ''
	local currpower = Player.GetPlayerPower(actor)
	local currFightingInfoList, _ = RandomBossManager.GetCurrFightingInfoList(currpower, 0, 999)
	if #currFightingInfoList == 0 then
		strPanelInfo = strPanelInfo..'<Text|id=14|text=��ǰû�п�����ս������|size=25|x=240|y=200|color='..CSS.NPC_WHITE..'>'
	else
		local baseid = 400
		for seq, info in ipairs(currFightingInfoList) do
			local picid = baseid + seq * 10			
			if itemidstr ~= '' then
				itemidstr = itemidstr..','
			end
			itemidstr = itemidstr..picid
			local childstr = (picid+1)..','..(picid+2)..','..(picid+3)..','..(picid+4)..','..(picid+5)..','..(picid+6)..','..(picid+7)
			strPanelInfo = strPanelInfo..'<Img|id='..picid..'|children={'..childstr..'}|x=0.0|y=0.0|reset=1|img=private/cc_bosslist_ex/2.png>'..
				'<Text|id='..(picid+1)..'|text='..info.bossname..'|size=18|x=10|y=10|color='..CSS.NPC_RED..'>'..
				'<Text|id='..(picid+2)..'|text=(Ѫ��ʣ��:'..info.bosshppercent..'%)|size=18|x=150|y=10|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|id='..(picid+3)..'|text=(������:'..info.triggername..')|size=15|x=300|y=12|color='..CSS.NPC_YELLOW..'>'..                
                '<Text|id='..(picid+4)..'|text=��������:�ɻ�ø��ȼ���ֱ����ʯ��ϡ�в���!|size=18|x=10|y=50|color='..CSS.NPC_WHITE..'>'

			strPanelInfo = strPanelInfo..'<Text|id='..(picid+5)..'|text=��������:|size=18|x=470|y=10|color='..CSS.NPC_WHITE..'>'..                
                '<Text|id='..(picid+6)..'|text='..info.currcount..'/'..info.maxcount..'|size=18|x=560|y=10|color='..CSS.NPC_WHITE..'>'

            if info.bosshppercent < RandomBossManager.MIN_CAN_JOIN_BOSS_HPPERCENT then
                strPanelInfo = strPanelInfo..'<Text|id='..(picid+7)..'|text=����Ѫ������|size=18|x=480|y=40|color='..CSS.NPC_RED..'>'
            else
                strPanelInfo = strPanelInfo..'<Button|id='..(picid+7)..'|x=480|y=40|mimg=private/cc_bosslist_ex/4.png|nimg=private/cc_bosslist_ex/4.png|size=18|color='..
					CSS.NPC_WHITE..'|text=ǰ����ս|link=@function_button,'..NPCPANEL_BUTTONFUNC_ID_1..','..info.fightingid..'>'
				if CanEnterBossMap(actor, info.fightingid) and (info.currcount < info.maxcount) then
					Player.AddRedPoint(actor, 0, (picid+7), 10, 10)
				end
            end				

		end
		strPanelInfo = strPanelInfo..'<ListView|id=14|children={'..itemidstr..'}|x=60.0|y=50.0|width=600|height=330|direction=1|margin=0>'
	end
		
    BF_ShowSpecialUI(actor, strPanelInfo)
end

--����button�ص�
function RandomBossManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end    
    local funcid = tonumber(sid)
    local nparam = 0
    if BF_IsNumberStr(sparam) then
        nparam = tonumber(sparam)
    end

    if funcid == NPCPANEL_BUTTONFUNC_ID_1 then
		RandomBossManager.GoToTriggerBossMap(actor, nparam)
    end
end

--�Ƿ��п����ʾ
function RandomBossManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_RANDOMBOSS, false) then
        return false
    end

	local currpower = Player.GetPlayerPower(actor)
	local currFightingInfoList, _ = RandomBossManager.GetCurrFightingInfoList(currpower, 0, 999)
	for _, info in ipairs(currFightingInfoList) do
		if info.bosshppercent >= RandomBossManager.MIN_CAN_JOIN_BOSS_HPPERCENT then			
			if CanEnterBossMap(actor, info.fightingid) and (info.currcount < info.maxcount) then
				return true
			end
		end
	end

    return false
end

return RandomBossManager