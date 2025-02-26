require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()


function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_BAOZHU, true) then
        return
    end

    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=灵玉尊者:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=凝聚了十二生肖之力的灵玉你都集齐了吗？|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Button|text=灵玉宝盒|size=20|x='..(tempCurrX+80)..'|y='..(tempCurrY+100)..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@baozhu_box_panel>'..
               '<Button|text=灵玉强化|size=20|x='..(tempCurrX+300)..'|y='..(tempCurrY+100)..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@baozhu_strength_panel>'
    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=规则说明|x='..(tempCurrX+400)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_RED..'|link=@show_rule_panel>'

    BF_NPCSayExt(actor,msg)
end

--规则说明面板
function show_rule_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y    
    local msg = '<Text|text=灵玉系统规则说明：|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    msg = msg..'<Text|text=返回上一层|x='..(tempCurrX+400)..'|y='..tempCurrY..'|size=15|color='..CSS.NPC_YELLOW..'|link=@main>'
    tempCurrY = tempCurrY + 35
    msg = msg..'<Text|text=1、灵玉共分为{白绿蓝紫粉橙红}七种品质，每种品质分为|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=三种星级，每种星级分为12种生肖的部位。|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25    
    msg = msg..'<Text|text=2、相同品质相同星级的灵玉可以每3、6、9、12件穿戴激|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25    
    msg = msg..'<Text|text=活对应的套装属性。|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=3、灵玉为独立的属性加成系统，其所增加的属性将会直接|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=加成到主角面板。|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    BF_NPCSayExt(actor,msg)
end


--灵玉宝盒的面板
function baozhu_box_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=灵玉尊者:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=可在包裹中单独穿戴灵玉，也可在这进行一键操作！|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Button|text=快捷穿戴|size=20|x='..(tempCurrX+20)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@do_quick_takon_baozhu>'..
                '<Button|text=全部卸下|size=20|x='..(tempCurrX+140)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@do_quick_takeoff_baozhu>'..
                '<Button|text=开关界面|size=20|x='..(tempCurrX+260)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@do_open_baozhu>'..
                '<Button|text=回收灵玉|size=20|x='..(tempCurrX+380)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@recycle_baozhu_panel>'

    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=返回上一层|x='..(tempCurrX+400)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_ORANGE..'|link=@main>'
    BF_NPCSayExt(actor,msg)

    openhyperlink(actor, 6)
end

--打开界面
function do_open_baozhu(actor)
    openhyperlink(actor, 6)
end

--快捷穿戴
function do_quick_takon_baozhu(actor)
    BaoZhuManager.QuickTakeOn(actor)
end

--全部卸下
function do_quick_takeoff_baozhu(actor)
    BaoZhuManager.QuickTakeOff(actor)
end

--回收宝珠
function recycle_baozhu_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=灵玉尊者:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=你可以在这里进行灵玉的自动回收设置！|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'
    msg = msg..BaoZhuManager.GetRecycleCheckBoxInfo(actor, tempCurrX, tempCurrY+40)
    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(CSS.NPC_TOP_START_Y+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=返回上一层|x='..(CSS.NPC_LEFT_START_X+400)..'|y='..(CSS.NPC_TOP_START_Y+220)..'|color='..CSS.NPC_ORANGE..'|link=@baozhu_box_panel>'
    BF_NPCSayExt(actor,msg)
end

local function IsValidRecycleID(sid)
    if not BF_IsNumberStr(sid) then
        return false
    end

    local id = tonumber(sid)
    return BaoZhuManager.IsValidRecycleID(id)
end

--设置回收的品质
function set_recycle_quality(actor, sid)
    if BF_IsNullObj(actor) or (sid == nil) then
        return
    end
    if not IsValidRecycleID(sid) then
        return
    end

    BaoZhuManager.SetRecycleQuality(actor, tonumber(sid))
    recycle_baozhu_panel(actor)
end

--设置保留更好的宝珠
function set_keep_better(actor)
    if BF_IsNullObj(actor) then
        return
    end
    local tempvar = getplaydef(actor, CommonDefine.VAR_N_NPC_CHECKBOX_10)
    if (tempvar==1) or (tempvar==0) then
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_RECYCLE_BAOZHU_KEEPBETTER, tempvar)
    end  
    recycle_baozhu_panel(actor)
end

--灵玉强化的面板
function baozhu_strength_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=灵玉尊者:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=放心强化，灵玉替换会自动继承！|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'   

    local yInterval = 40
    msg = msg..'<Text|text=鼠灵玉位|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_1..'>'..
        '<Text|text=牛灵玉位|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_2..'>'..
        '<Text|text=虎灵玉位|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_3..'>'    
    yInterval = yInterval + 35
    msg = msg..'<Text|text=兔灵玉位|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_4..'>'..
        '<Text|text=龙灵玉位|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_5..'>'..
        '<Text|text=蛇灵玉位|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_6..'>'    
    yInterval = yInterval + 35
    msg = msg..'<Text|text=马灵玉位|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_7..'>'..
        '<Text|text=羊灵玉位|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_8..'>'..
        '<Text|text=猴灵玉位|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_9..'>'    
    yInterval = yInterval + 35
    msg = msg..'<Text|text=鸡灵玉位|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_10..'>'..
        '<Text|text=狗灵玉位|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_11..'>'..
        '<Text|text=猪灵玉位|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_12..'>'        

    msg = msg..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..(tempCurrY+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=规则说明|x='..(tempCurrX)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_RED..'|link=@show_strength_rule_panel>'..
               '<Text|text=返回上一层|x='..(tempCurrX+400)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_ORANGE..'|link=@main>'
    BF_NPCSayExt(actor,msg)
end

--强化灵玉的规则说明面板
function show_strength_rule_panel(actor)
    local msg = '<Text|text=灵玉位强化的规则说明：.......|y=35|color=251>'
    BF_NPCSayExt(actor,msg)
end

local function IsValidPosStrForStrength(sid)
    if not BF_IsNumberStr(sid) then
        return false
    end

    local pos = tonumber(sid)
    return EquipPosStrengthManager.IsValidEquipPosForStrength(pos, 2)
end

--单个装备位的强化面板
function equippos_strength_panel(actor, sid)
    if (actor == nil) or (sid == nil) then
        return
    end
    if not IsValidPosStrForStrength(sid) then
        return
    end
    local equippos = tonumber(sid)
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_STRENGTH_INFO)

    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        infoTab[sid] = 0
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_STRENGTH_INFO, infoStr)
    end

    local curPosLevel = infoTab[sid]
    if curPosLevel < 0 then
        return
    end
    local nextPosLevel = curPosLevel + 1
    local bCurrIsMaxLv = false
    --记录当前npc选择的强化装备位
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, equippos)

    local bJob = Player.GetJob(actor)
    local cfgCurrKey = EquipPosStrengthManager.GetStrengthCfgKey(bJob, equippos, curPosLevel)
    if cfgEquipPosStrength[cfgCurrKey] == nil then
        --异常日志记录！！！！！怎么处理
        release_print("equippos_strength_panel no config key:"..cfgCurrKey)
        return
    end
    local cfgNextKey = EquipPosStrengthManager.GetStrengthCfgKey(bJob, equippos, nextPosLevel)
    if cfgEquipPosStrength[cfgNextKey] == nil then
        bCurrIsMaxLv = true
    end

    local tempCurrX = CSS.NPC_CENTER_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local sPanelStr = '<Text|text='..CommonDefine.EQUIPPOS_NAME[equippos]..'珠位|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    --当前等级属性
    local tempLeftX = CSS.NPC_LEFT_START_X + 30
    local tempLeftY = tempCurrY + 30    
    sPanelStr = sPanelStr..'<Text|text=当前等级：|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'..
                           '<Text|text='..curPosLevel..'|x='..(tempLeftX+100)..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
    tempLeftY = tempLeftY + 30
    local currPropDescTable = cfgEquipPosStrength[cfgCurrKey].addprop_desctab    
  
    for _, descItem in ipairs(currPropDescTable) do
        sPanelStr = sPanelStr..'<Text|text='..descItem.desc..'|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
        tempLeftY = tempLeftY + 30
    end
    --下一等级属性
    local tempRightX = CSS.NPC_LEFT_START_X + 300
    local tempRightY = tempCurrY + 30
    if bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=已达到等级上限|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
        tempRightY = tempRightY + 30
    else
        sPanelStr = sPanelStr..'<Text|text=下一等级：|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'..
                                '<Text|text='..nextPosLevel..'|x='..(tempRightX+100)..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
        tempRightY = tempRightY + 30
        local nextPropDescTable =  cfgEquipPosStrength[cfgNextKey].addprop_desctab
        for _, descItem in ipairs(nextPropDescTable) do
            sPanelStr = sPanelStr..'<Text|text='..descItem.desc..'|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
            tempRightY = tempRightY + 30
        end
    end

    --等级限制和强化消耗
    local tempCurrY = math.max(tempLeftY, tempRightY)
    sPanelStr = sPanelStr..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..tempCurrY..'|color='..CSS.NPC_BLUE_LINE..'>'
    tempCurrX = CSS.NPC_LEFT_START_X + 30
    tempCurrY = tempCurrY + 20       
    local currPlayerLv = Player.GetLevel(actor)
    if not bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=等级限制：角色达到'..cfgEquipPosStrength[cfgCurrKey].needlv..'级/'..currPlayerLv..'级|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'
    end
    tempCurrY = tempCurrY + 30
    if not bCurrIsMaxLv then
        local sConsumeInfo = BF_GetItemTableDescStr(actor, cfgEquipPosStrength[cfgCurrKey].needitems_tab)
        sPanelStr = sPanelStr..'<Text|text=强化消耗：'..sConsumeInfo..'|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'
    end
    tempCurrY = tempCurrY + 20
    sPanelStr = sPanelStr..'<Text|text= - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - —— - |x=15|y='..tempCurrY..'|color='..CSS.NPC_BLUE_LINE..'>'
    tempCurrY = tempCurrY + 50
    --升级按钮
    if bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=已达到最高强化等级！|x=100|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'    
    else
        sPanelStr = sPanelStr..'<Text|text=升级一次|x=50|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_upgrade_once>'..
            --'<Text|text=一键至顶|x=220|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_upgrade_currtop>'..
            '<Text|text=返回上一页|x=400|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@main>'
    end

    BF_NPCSayExt(actor, sPanelStr)
end


--装备位 强化一次
function equippos_strength_upgrade_once(actor)
    if BF_IsNullObj(actor) then
        return
    end
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_BAOZHU, false) then
        return
    end

    local equippos = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID) 
    if not EquipPosStrengthManager.IsValidEquipPosForStrength(equippos, 2) then
        return
    end
    local sid = ''..equippos
    
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_STRENGTH_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        infoTab[sid] = 0
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_STRENGTH_INFO, infoStr)
    end

    local curPosLevel = infoTab[sid]
    if curPosLevel < 0 then
        return
    end

    local nextPosLevel = curPosLevel + 1
    local bJob = Player.GetJob(actor)
    local cfgCurrKey = EquipPosStrengthManager.GetStrengthCfgKey(bJob, equippos, curPosLevel)
    if cfgEquipPosStrength[cfgCurrKey] == nil then
        return
    end
    local cfgNextKey = EquipPosStrengthManager.GetStrengthCfgKey(bJob, equippos, nextPosLevel)
    if cfgEquipPosStrength[cfgNextKey] == nil then
        Player.SendSelfMsg(actor, '当前强化等级已达到上限！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --条件判断
    local currPlayerLv = Player.GetLevel(actor)
    if currPlayerLv < cfgEquipPosStrength[cfgCurrKey].needlv then
        Player.SendSelfMsg(actor, '强化所需角色等级不足！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    if not Player.CheckItemsEnough(actor, cfgEquipPosStrength[cfgCurrKey].needitems_tab, '强化') then
        return
    end

    --扣除消耗
    Player.TakeItems(actor, cfgEquipPosStrength[cfgCurrKey].needitems_tab, '装备强化')
    --升级
    infoTab[sid] = nextPosLevel;
    infoStr = tbl2json(infoTab)
    setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_STRENGTH_INFO, infoStr)
    equippos_strength_panel(actor, sid)
    Player.SendSelfMsg(actor, '强化成功！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)

    --每日必做计数        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_SOUL_STONE, 1)              

    --更新当前装备位的强化状态
    EquipPosStrengthManager.UpdateEquipStrengthLvInPos(actor, equippos)  
end
