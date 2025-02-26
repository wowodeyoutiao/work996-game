OfflineHuWeiManager = {}

--buttonid
local MAP_BUTTON_ID_1 = 101

--functionid
local ZCD_BUTTONFUNC_ID_1 = 1    --地图中的功能按键-退出地图

local NPCPANEL_BUTTONFUNC_ID_1 = 1      --升级
local NPCPANEL_BUTTONFUNC_ID_2 = 2      --领取离线奖励

local ZCD_MAP_ID = '0114'
local ZCD_MAP_NAME = '紫宸殿'
local ZCD_MAP_TIME = 3600
local ZCD_NPC_SCRIPT_DIR = '../QuestDiary/CCLua/NPC/'
local ZCD_NPC_NAME_LIST = {'武卫', '御卫', '虎卫', '禁卫', '宿卫'}
local ZCD_NPC_LIST = {
    {hwtype=1, dynnpcbaseid=CommonDefine.DYN_NPC_ZCD_HUWEI1, npcname=ZCD_NPC_NAME_LIST[1], appear=237, time=ZCD_MAP_TIME, mapx=4, mapy=12, script=ZCD_NPC_SCRIPT_DIR..'zcd_dyn_npc1',
     levelvar=CommonDefine.VAR_U_ZCDHW_LEVEL1, abilitygroup=CommonDefine.ABIL_GROUP_HUWEI1},
    {hwtype=2, dynnpcbaseid=CommonDefine.DYN_NPC_ZCD_HUWEI2, npcname=ZCD_NPC_NAME_LIST[2], appear=26, time=ZCD_MAP_TIME, mapx=8, mapy=8, script=ZCD_NPC_SCRIPT_DIR..'zcd_dyn_npc2',
     levelvar=CommonDefine.VAR_U_ZCDHW_LEVEL2, abilitygroup=CommonDefine.ABIL_GROUP_HUWEI2},
    {hwtype=3, dynnpcbaseid=CommonDefine.DYN_NPC_ZCD_HUWEI3, npcname=ZCD_NPC_NAME_LIST[3], appear=51, time=ZCD_MAP_TIME, mapx=11, mapy=6, script=ZCD_NPC_SCRIPT_DIR..'zcd_dyn_npc3',
     levelvar=CommonDefine.VAR_U_ZCDHW_LEVEL3, abilitygroup=CommonDefine.ABIL_GROUP_HUWEI3},
    {hwtype=4, dynnpcbaseid=CommonDefine.DYN_NPC_ZCD_HUWEI4, npcname=ZCD_NPC_NAME_LIST[4], appear=30, time=ZCD_MAP_TIME, mapx=13, mapy=8, script=ZCD_NPC_SCRIPT_DIR..'zcd_dyn_npc4',
     levelvar=CommonDefine.VAR_U_ZCDHW_LEVEL4, abilitygroup=CommonDefine.ABIL_GROUP_HUWEI4},
    {hwtype=5, dynnpcbaseid=CommonDefine.DYN_NPC_ZCD_HUWEI5, npcname=ZCD_NPC_NAME_LIST[5], appear=32, time=ZCD_MAP_TIME, mapx=15, mapy=10, script=ZCD_NPC_SCRIPT_DIR..'zcd_dyn_npc5',
     levelvar=CommonDefine.VAR_U_ZCDHW_LEVEL5, abilitygroup=CommonDefine.ABIL_GROUP_HUWEI5},
}

local function GetHuWeiNpcCfg(huweitype)
    for _, value in ipairs(ZCD_NPC_LIST) do
        if value.hwtype == huweitype then
            return value
        end
    end
    return nil
end

local function GetOfflineHuWeiCfgKey(hwtype, hwlevel)
    return hwtype * 1000 + hwlevel
end

local function GetOfflineRewardInfoTab(actor)
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_OFFLINE_REWARD_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    return infoTab
end

function OfflineHuWeiManager.CreateZCDMirrorMapAndEnter(actor)
    local lasttime = getplaydef(actor, CommonDefine.VAR_N_LAST_OPER_TIME1)
    local currtime = os.time()
    local leftcdtime = 5 - math.abs(currtime - lasttime)
    if leftcdtime > 0 then
        return
    end
    setplaydef(actor, CommonDefine.VAR_N_LAST_OPER_TIME1, currtime)

    local newmapid = ZCD_MAP_ID..'_'..Player.GetPlayerID(actor)
    local newmapname = ZCD_MAP_NAME
    local maptime = ZCD_MAP_TIME
    delmirrormap(newmapid)    
    addmirrormap(ZCD_MAP_ID, newmapid, newmapname, maptime, CommonDefine.BACK_MAP_POSITION.mapid, 0, CommonDefine.BACK_MAP_POSITION.x, CommonDefine.BACK_MAP_POSITION.y)

    local dynnpcgroupid = getplaydef(actor, CommonDefine.VAR_N_CURR_DYNNPC_GROUPID)
    --创建NPC        
    for _, value in ipairs(ZCD_NPC_LIST) do
        local npcid = value.dynnpcbaseid + dynnpcgroupid * 10000
        local npcInfo = {
            ["Idx"] =  npcid,
            ["npcname"] = value.npcname,
            ["appr"] = value.appear,
            ["script"] = value.script,
            ["limit"] = value.time,
        }
        local tempstr = tbl2json(npcInfo)
        createnpc(newmapid, value.mapx, value.mapy, tempstr)   
    end

    --进入地图
    map(actor, newmapid)
end

function OfflineHuWeiManager.OnPlayerEnterGame(actor)
    local currgroupid = getsysvar(CommonDefine.VAR_I_CURR_DYNNPC_GROUPID) + 1
    setsysvar(CommonDefine.VAR_I_CURR_DYNNPC_GROUPID, currgroupid)
    setplaydef(actor, CommonDefine.VAR_N_CURR_DYNNPC_GROUPID, currgroupid)

    --[[
    local infoTab = GetOfflineRewardInfoTab(actor)
    local bChanged = false
    for _, value in ipairs(ZCD_NPC_LIST) do
        local hwtype = value.hwtype
        local hwlevel = getplaydef(actor, value.levelvar)
        if hwlevel > 0 then
            local cfgKey = GetOfflineHuWeiCfgKey(hwtype, hwlevel)
            if cfgOfflineHuWei[cfgKey] and (cfgOfflineHuWei[cfgKey].offlineitemname~='') and (cfgOfflineHuWei[cfgKey].offlineitemnum>0) then
                local sHWType = ''..hwtype
                if infoTab[sHWType] == nil then
                    infoTab[sHWType] = {hwtype=hwtype, totalnum=0, offlinetime=0, lastfetchtime=0}
                else
                    if infoTab[sHWType].totalnum < cfgOfflineHuWei[cfgKey].offlinemaxnum then
                        local passseconds = math.max(0, os.time() - infoTab[sHWType].offlinetime)
                        infoTab[sHWType].totalnum = infoTab[sHWType].totalnum + cfgOfflineHuWei[cfgKey].offlineitemnum * math.floor(passseconds / 60)
                        infoTab[sHWType].totalnum = math.min(infoTab[sHWType].totalnum, cfgOfflineHuWei[cfgKey].offlinemaxnum)                  
                    end                    
                end
                bChanged = true
            end
        end
    end
    if bChanged then
        local infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_OFFLINE_REWARD_INFO, infoStr)
    end
    ]]--
end

function OfflineHuWeiManager.OnPlayerLeaveGame(actor)
    --[[
    local infoTab = GetOfflineRewardInfoTab(actor)
    local bChanged = false
    for _, value in ipairs(ZCD_NPC_LIST) do
        local hwtype = value.hwtype
        local hwlevel = getplaydef(actor, value.levelvar)
        if hwlevel > 0 then
            local cfgKey = GetOfflineHuWeiCfgKey(hwtype, hwlevel)
            if cfgOfflineHuWei[cfgKey] and (cfgOfflineHuWei[cfgKey].offlineitemname~='') and (cfgOfflineHuWei[cfgKey].offlineitemnum>0) then
                local sHWType = ''..hwtype
                if infoTab[sHWType] == nil then
                    infoTab[sHWType] = {hwtype=hwtype, totalnum=0, offlinetime=os.time(), lastfetchtime=0}
                else
                    infoTab[sHWType].offlinetime = os.time()                    
                end
                bChanged = true
            end
        end
    end
    if bChanged then
        local infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_OFFLINE_REWARD_INFO, infoStr)
    end
    ]]--
end

function OfflineHuWeiManager.OnResetDay(actor)
    local infoTab = GetOfflineRewardInfoTab(actor)
    local bChanged = false
    for _, value in ipairs(ZCD_NPC_LIST) do
        local hwtype = value.hwtype
        local hwlevel = getplaydef(actor, value.levelvar)
        if hwlevel > 0 then
            local cfgKey = GetOfflineHuWeiCfgKey(hwtype, hwlevel)
            if cfgOfflineHuWei[cfgKey] and (cfgOfflineHuWei[cfgKey].offlineitemname~='') and (cfgOfflineHuWei[cfgKey].offlineitemnum>0) then
                local sHWType = ''..hwtype
                if infoTab[sHWType] ~= nil then
                    infoTab[sHWType].daytotalnum = 0
                    bChanged = true
                end                
            end
        end
    end
    if bChanged then
        local infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_OFFLINE_REWARD_INFO, infoStr)
    end
end

local function ClearZCDNpc(mapid)
    for _, value in ipairs(ZCD_NPC_LIST) do
        delnpc(value.npcname, mapid)
    end
end

local function InitMapUI(actor)
    if not Player.IsPCClient(actor) then
        --手机端
        addbutton(actor, 104, MAP_BUTTON_ID_1, '<Button|text=离开地图|x=-300|y=-520|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@zcdmap_button,'..
            ZCD_BUTTONFUNC_ID_1..'>')
    end
end

local function ClearMapUI(actor)
    delbutton(actor, 104, MAP_BUTTON_ID_1)
end

function OfflineHuWeiManager.DoMapButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end

    local funcid = tonumber(sid)
    if funcid == ZCD_BUTTONFUNC_ID_1 then
		gohome(actor)
    end
end

--进地图的回调
function OfflineHuWeiManager.OnEnterMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) then
        return
    end
    local zcdmapid = ZCD_MAP_ID..'_'..Player.GetPlayerID(actor)
    if mapidstr == zcdmapid then
        InitMapUI(actor)
    end
end

--离开地图的回调
function OfflineHuWeiManager.OnLeaveMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) then
        return
    end
    local zcdmapid = ZCD_MAP_ID..'_'..Player.GetPlayerID(actor)
    if mapidstr == zcdmapid then
        ClearZCDNpc(mapidstr)
        delmirrormap(mapidstr)
        ClearMapUI(actor)
    end
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERGAME, OfflineHuWeiManager.OnPlayerEnterGame, CommonDefine.FUNC_ID_OFFLINE)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_LEAVEGAME, OfflineHuWeiManager.OnPlayerLeaveGame, CommonDefine.FUNC_ID_OFFLINE)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERMAP, OfflineHuWeiManager.OnEnterMap, CommonDefine.FUNC_ID_OFFLINE)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_LEAVEMAP, OfflineHuWeiManager.OnLeaveMap, CommonDefine.FUNC_ID_OFFLINE)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_RESETDAY, OfflineHuWeiManager.OnResetDay, CommonDefine.FUNC_ID_OFFLINE)



---------------------------通用npc对话----------------------------------------

function OfflineHuWeiManager.ShowRulePanel(actor, huweitype)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=紫宸殿规则说明:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1、紫宸殿有5个护卫可供升级。|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=2、不同的护卫升级之后除了带来属性提升之外，还会给|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=角色带来不同道具的离线奖励。|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3、护卫的升级条件除了受到角色的等级限制之外，还受|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=26|text=到其他护卫的等级限制。|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    BF_ShowSpecialUI(actor, strPanelInfo)
end

local function IsFitUpgradeCondition(actor, conditionstr)
    if (conditionstr == nil) or (conditionstr == '') then
        return false, ''
    end
    local strConditionTab = string.split(conditionstr, '|')
    if strConditionTab == false then
        return false, ''
    end
    
    for _, value in ipairs(strConditionTab) do
        if value ~= '' then
            local strParamList = string.split(value, '#')
            if (strParamList ~= false) and (#strParamList >= 2) then
                local conditionid = tonumber(strParamList[1])
                local conditionvalue = tonumber(strParamList[2])
                if conditionid == 0 then
                    if Player.GetLevel(actor) < conditionvalue then
                        return false, '玩家等级'
                    end
                else
                    local cfgNpc = GetHuWeiNpcCfg(conditionid)
                    if cfgNpc ~= nil then
                        local huweilevel = getplaydef(actor, cfgNpc.levelvar)    
                        if huweilevel < conditionvalue then
                            return false, ZCD_NPC_NAME_LIST[cfgNpc.hwtype]..'等级'
                        end
                    end                    
                end
            end
        end
    end   

    return true
end

local function GetConditionDescStr(actor, conditionstr)
    local descstr = ''
    if (conditionstr == nil) or (conditionstr == '') then
        return descstr
    end
    local strConditionTab = string.split(conditionstr, '|')
    if strConditionTab == false then
        return descstr
    end

    for _, value in ipairs(strConditionTab) do
        if value ~= '' then
            local strParamList = string.split(value, '#')
            if (strParamList ~= false) and (#strParamList >= 2) then
                local tempconstr = ''
                local conditionid = tonumber(strParamList[1])
                local conditionvalue = tonumber(strParamList[2])
                if conditionid == 0 then
                    local currlv = Player.GetLevel(actor)
                    tempconstr = '角色'..conditionvalue..'级/'..currlv..'级'
                else
                    local cfgNpc = GetHuWeiNpcCfg(conditionid)
                    if cfgNpc ~= nil then
                        local huweilevel = getplaydef(actor, cfgNpc.levelvar)  
                        tempconstr = ZCD_NPC_NAME_LIST[conditionid]..conditionvalue..'级/'..huweilevel..'级'
                    end                    
                end
                if descstr ~= '' then
                    descstr = descstr..';'
                end
                descstr = descstr..tempconstr
            end
        end
    end                
    return descstr    
end

function OfflineHuWeiManager.ShowBasePanel(actor, huweitype)
    local cfgHuWeiNpc = GetHuWeiNpcCfg(huweitype)
    if cfgHuWeiNpc == nil then
        return
    end

    local currlv = getplaydef(actor, cfgHuWeiNpc.levelvar)
    local currKey = GetOfflineHuWeiCfgKey(huweitype, currlv)
    local nextlv = currlv + 1
    local nextKey = GetOfflineHuWeiCfgKey(huweitype, nextlv)
    local bCurrIsMaxLv = false
    local cfgCurrLv = cfgOfflineHuWei[currKey]
    if cfgCurrLv == nil then
        release_print("OfflineHuWei no config hwtype:"..huweitype.." level:"..currlv)
        return
    end
    local cfgNextLv = cfgOfflineHuWei[nextKey]
    if cfgNextLv == nil then
        bCurrIsMaxLv = true
    end        

    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15,16,17,18}|x=150.0|y=50.0|height=448|show=0|move=0|reset=1|bg=1|img=private/cc_offline/1.png|esc=1|loadDelay=0>'..
        '<Layout|id=11|x=812.0|y=12.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=813.0|y=13.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..        
        '<Text|id=13|x=380.0|y=18.0|size=20|color=161|text='..cfgHuWeiNpc.npcname..'>'..
        '<Button|id=18|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'
    
    --当前等级属性
    local tempLeftX = 20
    local tempLeftY = 15
    local idstr = '21,22,23,24,25,26'
    strPanelInfo = strPanelInfo..'<Text|id=21|text=当前等级：|size=20|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'..
                           '<Text|id=22|text='..currlv..'|size=20|x='..(tempLeftX+100)..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'
    tempLeftY = tempLeftY + 30
    local currPropDescTable = cfgCurrLv.addprop_desctab
    if #currPropDescTable == 0 then
        strPanelInfo = strPanelInfo..'<Text|id=23|text=无|size=18|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
        tempLeftY = tempLeftY + 25
    else
        local currid = 30
        for _, descItem in ipairs(currPropDescTable) do
            currid = currid + 1
            idstr = idstr..','..currid
            strPanelInfo = strPanelInfo..'<Text|id='..currid..'|text='..descItem.desc..'|size=18|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
            tempLeftY = tempLeftY + 25
        end
        if cfgCurrLv.offlineitemname and cfgCurrLv.offlineitemnum then
            currid = currid + 1
            idstr = idstr..','..currid
            strPanelInfo = strPanelInfo..'<Text|id='..currid..'|text=离线收益:'..cfgCurrLv.offlineitemname..'+'..cfgCurrLv.offlineitemnum..'/分钟'..
                '|size=18|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_LIGHTGREEN..'>'            
        end
        tempLeftY = tempLeftY + 25
    end

    --下一等级属性
    local tempRightX = 250
    local tempRightY = 15
    if bCurrIsMaxLv then
        strPanelInfo = strPanelInfo..'<Text|id=24|text=已达到最高等级|size=20|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
        tempRightY = tempRightY + 30
    else
        strPanelInfo = strPanelInfo..'<Text|id=25|text=下一等级：|size=20|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'..
                               '<Text|id=26|text='..nextlv..'|size=20|x='..(tempRightX+100)..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
        tempRightY = tempRightY + 30
        local nextPropDescTable = cfgNextLv.addprop_desctab
        local currid = 40
        for _, descItem in ipairs(nextPropDescTable) do
            currid = currid + 1
            idstr = idstr..','..currid
            strPanelInfo = strPanelInfo..'<Text|id='..currid..'|text='..descItem.desc..'|size=18|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
            tempRightY = tempRightY + 25
        end
        currid = currid + 1
        idstr = idstr..','..currid        
        strPanelInfo = strPanelInfo..'<Text|id='..currid..'|text=离线收益:'..cfgNextLv.offlineitemname..'+'..cfgNextLv.offlineitemnum..'/分钟'..
            '|size=18|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_LIGHTGREEN..'>'        
        tempRightY = tempRightY + 25
    end       
    strPanelInfo = strPanelInfo..'<Layout|id=15|children={'..idstr..'}|x=72.0|y=100.0|width=480|height=180>'



    idstr = '51,52,53'
    local tempCurrX = 0
    local tempCurrY = 0
    if bCurrIsMaxLv then
        strPanelInfo = strPanelInfo..'<Text|id=51|text=已达到最高等级|size=20|x='..(tempCurrX+200)..'|y='..(tempCurrY+20)..'|color='..CSS.NPC_YELLOW..'>'
    else
        local sConditionDesc = GetConditionDescStr(actor, cfgCurrLv.condition)
        strPanelInfo = strPanelInfo..'<Text|id=51|text=升级条件:  '..sConditionDesc..'|size=18|x='..(tempCurrX+20)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
        tempCurrY = tempCurrY + 30
        local sConsumeInfo = BF_GetItemTableDescStr(actor, cfgCurrLv.needitems_tab)
        strPanelInfo = strPanelInfo..'<Text|id=52|text=升级消耗:  '..sConsumeInfo..'|size=18|x='..(tempCurrX+20)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
        tempCurrY = tempCurrY + 50
        strPanelInfo = strPanelInfo..'<Button|id=53|x='..(tempCurrX+200)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=升    级|link=@function_button,'..
            NPCPANEL_BUTTONFUNC_ID_1..','..huweitype..'>'
    end
    strPanelInfo = strPanelInfo..'<Layout|id=17|children={'..idstr..'}|x=72.0|y=290.0|width=480|height=120>'



    idstr = '61,62,63,64'
    local offlineitemdesc = ''
    if cfgCurrLv.offlineitemname and (cfgCurrLv.offlineitemname ~= '') then    
        local infoTab = GetOfflineRewardInfoTab(actor)
        local sHWType = ''..huweitype
        if infoTab[sHWType] then    
            local dayleftnum = cfgCurrLv.offlinemaxnum - infoTab[sHWType].daytotalnum
            local passseconds = math.max(0, os.time() - infoTab[sHWType].starttime)
            local currnum = cfgCurrLv.offlineitemnum * math.floor(passseconds / 60)
            currnum = math.min(dayleftnum, currnum)    
            offlineitemdesc = cfgCurrLv.offlineitemname..'*'..currnum..'/'..dayleftnum           
        end
    end

    tempCurrX = 5
    tempCurrY = 30
    if offlineitemdesc ~= '' then
        strPanelInfo = strPanelInfo..'<Text|id=61|text=当前离线收益:|size=18|x='..tempCurrX..'|y='..(tempCurrY+20)..'|color='..CSS.NPC_WHITE..'>'
        strPanelInfo = strPanelInfo..'<Text|id=62|text='..offlineitemdesc..' |size=18|x='..tempCurrX..'|y='..(tempCurrY+50)..'|color='..CSS.NPC_WHITE..'>'
        strPanelInfo = strPanelInfo..'<Text|id=63|text=(收益达到上限后不再累计)|size=15|x='..tempCurrX..'|y='..(tempCurrY+80)..'|color='..CSS.NPC_LIGHTGREEN..'>'       
        strPanelInfo = strPanelInfo..'<Button|id=64|x='..(tempCurrX+40)..'|y='..(tempCurrY+120)..'|color='..CSS.NPC_WHITE..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=收    取|link=@function_button,'..
            NPCPANEL_BUTTONFUNC_ID_2..','..huweitype..'>'
    else
        strPanelInfo = strPanelInfo..'<Text|id=61|text=升级后领取离线收益|size=18|x='..tempCurrX..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'>'
    end
    strPanelInfo = strPanelInfo..'<Layout|id=16|children={'..idstr..'}|x=580.0|y=100.0|width=200|height=300>'

    
    BF_ShowSpecialUI(actor, strPanelInfo)
end

local function DoUpgrade(actor, huweitype)
    local cfgHuWeiNpc = GetHuWeiNpcCfg(huweitype)
    if cfgHuWeiNpc == nil then
        return
    end
    local currlv = getplaydef(actor, cfgHuWeiNpc.levelvar)
    local currKey = GetOfflineHuWeiCfgKey(huweitype, currlv)
    local nextlv = currlv + 1
    local nextKey = GetOfflineHuWeiCfgKey(huweitype, nextlv)
    local cfgCurrLv = cfgOfflineHuWei[currKey]
    if cfgCurrLv == nil then
        return
    end
    local cfgNextLv = cfgOfflineHuWei[nextKey]
    if cfgNextLv == nil then
        Player.SendSelfMsg(actor, cfgHuWeiNpc.npcname..'已达到等级上限！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --条件判断
    local bConditionFlag, sTip = IsFitUpgradeCondition(actor, cfgCurrLv.condition)
    if not bConditionFlag then
        Player.SendSelfMsg(actor, '升级所需的'..sTip..'不足！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --升级消耗
    if not Player.CheckItemsEnough(actor, cfgCurrLv.needitems_tab, '护卫升级') then
        return
    end
    --扣除消耗
    Player.TakeItems(actor, cfgCurrLv.needitems_tab, '护卫升级')

    --每日必做计数        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_OFFLINE, 1)      

    setplaydef(actor, cfgHuWeiNpc.levelvar, nextlv)
    addattlist(actor, cfgHuWeiNpc.abilitygroup, "=", cfgGuanZhi[nextlv].addprop_abstr)
    recalcabilitys(actor)    

    --升1级开启记录
    if nextlv == 1 then
        local infoTab = GetOfflineRewardInfoTab(actor)

        for _, value in ipairs(ZCD_NPC_LIST) do
            if value.hwtype == huweitype then
                local hwtype = value.hwtype
                local hwlevel = getplaydef(actor, value.levelvar)
                if hwlevel > 0 then
                    local cfgKey = GetOfflineHuWeiCfgKey(hwtype, hwlevel)
                    if cfgOfflineHuWei[cfgKey] and (cfgOfflineHuWei[cfgKey].offlineitemname~='') and (cfgOfflineHuWei[cfgKey].offlineitemnum>0) then
                        local sHWType = ''..hwtype
                        if infoTab[sHWType] == nil then
                            infoTab[sHWType] = {hwtype=hwtype, daytotalnum=0, starttime=os.time()}                
                        end
                    end
                end
                break
            end
        end

        local infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_OFFLINE_REWARD_INFO, infoStr)
    end
end

local function DoGetOfflineReward(actor, huweitype)
    if getbagblank(actor) < 1 then
        Player.SendSelfMsg(actor, '请整理出至少1个背包空格！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local cfgHuWeiNpc = GetHuWeiNpcCfg(huweitype)
    if cfgHuWeiNpc == nil then
        return
    end
    local currlv = getplaydef(actor, cfgHuWeiNpc.levelvar)
    local currKey = GetOfflineHuWeiCfgKey(huweitype, currlv)
    local cfgCurrLv = cfgOfflineHuWei[currKey]
    if cfgCurrLv == nil then
        return
    end
    if (cfgCurrLv.offlineitemname == '') or (cfgCurrLv.offlineitemnum <= 0) then
        return
    end

    local infoTab = GetOfflineRewardInfoTab(actor)
    local sHWType = ''..huweitype
    if infoTab[sHWType] == nil then
        return
    end

    local difftime = os.time() - infoTab[sHWType].starttime

    if math.abs(os.time() - infoTab[sHWType].starttime) < CommonDefine.OFFLINE_FETCH_MIN_INTERVAL then
        Player.SendSelfMsg(actor, '领取奖励需间隔3分钟！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local dayleftnum = cfgCurrLv.offlinemaxnum - infoTab[sHWType].daytotalnum
    local passseconds = math.max(0, os.time() - infoTab[sHWType].starttime)
    local currnum = cfgCurrLv.offlineitemnum * math.floor(passseconds / 60)
    currnum = math.min(dayleftnum, currnum)    

    if currnum <= 0 then
        Player.SendSelfMsg(actor, '当前无可领取奖励！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return        
    end

    giveitem(actor, cfgCurrLv.offlineitemname, currnum)
    infoTab[sHWType].daytotalnum = infoTab[sHWType].daytotalnum + currnum
    infoTab[sHWType].starttime = os.time()
    local infoStr = tbl2json(infoTab)
    setplaydef(actor, CommonDefine.VAR_T_OFFLINE_REWARD_INFO, infoStr)
    Player.SendSelfMsg(actor, '领取离线奖励！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
end

--处理button回调
function OfflineHuWeiManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    
    local funcid = tonumber(sid)
    local nparam = 0
    if BF_IsNumberStr(sparam) then
        nparam = tonumber(sparam)
    end

    if funcid == NPCPANEL_BUTTONFUNC_ID_1 then
        DoUpgrade(actor, nparam)
        OfflineHuWeiManager.ShowBasePanel(actor, nparam)
    elseif funcid == NPCPANEL_BUTTONFUNC_ID_2 then
        DoGetOfflineReward(actor, nparam)
        OfflineHuWeiManager.ShowBasePanel(actor, nparam)
    end    
end

--是否有快捷提示--升级
function OfflineHuWeiManager.IsHaveQuickTipUpgrade(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_OFFLINE, false) then
        return false
    end

    for _, value in ipairs(ZCD_NPC_LIST) do
        local huweitype = value.hwtype
        local cfgHuWeiNpc = GetHuWeiNpcCfg(huweitype)
        if cfgHuWeiNpc then
            local currlv = getplaydef(actor, cfgHuWeiNpc.levelvar)
            local currKey = GetOfflineHuWeiCfgKey(huweitype, currlv)
            local nextlv = currlv + 1
            local nextKey = GetOfflineHuWeiCfgKey(huweitype, nextlv)
            local cfgCurrLv = cfgOfflineHuWei[currKey]
            local cfgNextLv = cfgOfflineHuWei[nextKey]
            if cfgCurrLv and cfgNextLv then
                --条件判断 以及 升级消耗
                local bConditionFlag = IsFitUpgradeCondition(actor, cfgCurrLv.condition)
                if bConditionFlag and Player.CheckItemsEnough(actor, cfgCurrLv.needitems_tab, '') then
                    return true
                end
            end
        end
    end
    return false
end

--是否有快捷提示--每日奖励
function OfflineHuWeiManager.IsHaveQuickTipReward(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_OFFLINE, false) then
        return false
    end

    for _, value in ipairs(ZCD_NPC_LIST) do
        local huweitype = value.hwtype
        local cfgHuWeiNpc = GetHuWeiNpcCfg(huweitype)
        if cfgHuWeiNpc then
            local currlv = getplaydef(actor, cfgHuWeiNpc.levelvar)
            local currKey = GetOfflineHuWeiCfgKey(huweitype, currlv)
            local cfgCurrLv = cfgOfflineHuWei[currKey]
            if cfgCurrLv and cfgCurrLv.offlineitemname and cfgCurrLv.offlineitemnum and (cfgCurrLv.offlineitemname ~= '') and (cfgCurrLv.offlineitemnum > 0) then
                local infoTab = GetOfflineRewardInfoTab(actor)
                local sHWType = ''..huweitype
                if infoTab[sHWType] ~= nil then
                    local dayleftnum = cfgCurrLv.offlinemaxnum - infoTab[sHWType].daytotalnum
                    local passseconds = math.max(0, os.time() - infoTab[sHWType].starttime)
                    local currnum = cfgCurrLv.offlineitemnum * math.floor(passseconds / 60)
                    currnum = math.min(dayleftnum, currnum)            
                    if currnum > 0 then
                        return true
                    end
                end             
            end
        end
    end
    
    return false
end

return OfflineHuWeiManager