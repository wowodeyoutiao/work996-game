require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()


function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_BAOZHU, true) then
        return
    end

    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=��������:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=������ʮ����Ф֮���������㶼��������|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Button|text=���񱦺�|size=20|x='..(tempCurrX+80)..'|y='..(tempCurrY+100)..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@baozhu_box_panel>'..
               '<Button|text=����ǿ��|size=20|x='..(tempCurrX+300)..'|y='..(tempCurrY+100)..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@baozhu_strength_panel>'
    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=����˵��|x='..(tempCurrX+400)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_RED..'|link=@show_rule_panel>'

    BF_NPCSayExt(actor,msg)
end

--����˵�����
function show_rule_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y    
    local msg = '<Text|text=����ϵͳ����˵����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    msg = msg..'<Text|text=������һ��|x='..(tempCurrX+400)..'|y='..tempCurrY..'|size=15|color='..CSS.NPC_YELLOW..'|link=@main>'
    tempCurrY = tempCurrY + 35
    msg = msg..'<Text|text=1�����񹲷�Ϊ{�������Ϸ۳Ⱥ�}����Ʒ�ʣ�ÿ��Ʒ�ʷ�Ϊ|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=�����Ǽ���ÿ���Ǽ���Ϊ12����Ф�Ĳ�λ��|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25    
    msg = msg..'<Text|text=2����ͬƷ����ͬ�Ǽ����������ÿ3��6��9��12��������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25    
    msg = msg..'<Text|text=���Ӧ����װ���ԡ�|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=3������Ϊ���������Լӳ�ϵͳ���������ӵ����Խ���ֱ��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=�ӳɵ�������塣|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    BF_NPCSayExt(actor,msg)
end


--���񱦺е����
function baozhu_box_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=��������:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=���ڰ����е�����������Ҳ���������һ��������|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Button|text=��ݴ���|size=20|x='..(tempCurrX+20)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@do_quick_takon_baozhu>'..
                '<Button|text=ȫ��ж��|size=20|x='..(tempCurrX+140)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@do_quick_takeoff_baozhu>'..
                '<Button|text=���ؽ���|size=20|x='..(tempCurrX+260)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@do_open_baozhu>'..
                '<Button|text=��������|size=20|x='..(tempCurrX+380)..'|y='..(tempCurrY+100)..'|color='..CSS.NPC_LIGHTGREEN..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|link=@recycle_baozhu_panel>'

    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=������һ��|x='..(tempCurrX+400)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_ORANGE..'|link=@main>'
    BF_NPCSayExt(actor,msg)

    openhyperlink(actor, 6)
end

--�򿪽���
function do_open_baozhu(actor)
    openhyperlink(actor, 6)
end

--��ݴ���
function do_quick_takon_baozhu(actor)
    BaoZhuManager.QuickTakeOn(actor)
end

--ȫ��ж��
function do_quick_takeoff_baozhu(actor)
    BaoZhuManager.QuickTakeOff(actor)
end

--���ձ���
function recycle_baozhu_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=��������:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=��������������������Զ��������ã�|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'
    msg = msg..BaoZhuManager.GetRecycleCheckBoxInfo(actor, tempCurrX, tempCurrY+40)
    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(CSS.NPC_TOP_START_Y+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=������һ��|x='..(CSS.NPC_LEFT_START_X+400)..'|y='..(CSS.NPC_TOP_START_Y+220)..'|color='..CSS.NPC_ORANGE..'|link=@baozhu_box_panel>'
    BF_NPCSayExt(actor,msg)
end

local function IsValidRecycleID(sid)
    if not BF_IsNumberStr(sid) then
        return false
    end

    local id = tonumber(sid)
    return BaoZhuManager.IsValidRecycleID(id)
end

--���û��յ�Ʒ��
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

--���ñ������õı���
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

--����ǿ�������
function baozhu_strength_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=��������:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                '<Text|text=����ǿ���������滻���Զ��̳У�|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+20)..'|color='..CSS.NPC_BLUE_LINE..'>'   

    local yInterval = 40
    msg = msg..'<Text|text=������λ|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_1..'>'..
        '<Text|text=ţ����λ|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_2..'>'..
        '<Text|text=������λ|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_3..'>'    
    yInterval = yInterval + 35
    msg = msg..'<Text|text=������λ|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_4..'>'..
        '<Text|text=������λ|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_5..'>'..
        '<Text|text=������λ|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_6..'>'    
    yInterval = yInterval + 35
    msg = msg..'<Text|text=������λ|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_7..'>'..
        '<Text|text=������λ|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_8..'>'..
        '<Text|text=������λ|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_9..'>'    
    yInterval = yInterval + 35
    msg = msg..'<Text|text=������λ|x='..tempCurrX..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_10..'>'..
        '<Text|text=������λ|x='..(tempCurrX+180)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_11..'>'..
        '<Text|text=������λ|x='..(tempCurrX+360)..'|y='..(tempCurrY+yInterval)..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_panel,'..CommonDefine.EQUIPPOS_SSH_12..'>'        

    msg = msg..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..(tempCurrY+200)..'|color='..CSS.NPC_BLUE_LINE..'>'    
    msg = msg..'<Text|text=����˵��|x='..(tempCurrX)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_RED..'|link=@show_strength_rule_panel>'..
               '<Text|text=������һ��|x='..(tempCurrX+400)..'|y='..(tempCurrY+220)..'|color='..CSS.NPC_ORANGE..'|link=@main>'
    BF_NPCSayExt(actor,msg)
end

--ǿ������Ĺ���˵�����
function show_strength_rule_panel(actor)
    local msg = '<Text|text=����λǿ���Ĺ���˵����.......|y=35|color=251>'
    BF_NPCSayExt(actor,msg)
end

local function IsValidPosStrForStrength(sid)
    if not BF_IsNumberStr(sid) then
        return false
    end

    local pos = tonumber(sid)
    return EquipPosStrengthManager.IsValidEquipPosForStrength(pos, 2)
end

--����װ��λ��ǿ�����
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
    --��¼��ǰnpcѡ���ǿ��װ��λ
    setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, equippos)

    local bJob = Player.GetJob(actor)
    local cfgCurrKey = EquipPosStrengthManager.GetStrengthCfgKey(bJob, equippos, curPosLevel)
    if cfgEquipPosStrength[cfgCurrKey] == nil then
        --�쳣��־��¼������������ô����
        release_print("equippos_strength_panel no config key:"..cfgCurrKey)
        return
    end
    local cfgNextKey = EquipPosStrengthManager.GetStrengthCfgKey(bJob, equippos, nextPosLevel)
    if cfgEquipPosStrength[cfgNextKey] == nil then
        bCurrIsMaxLv = true
    end

    local tempCurrX = CSS.NPC_CENTER_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local sPanelStr = '<Text|text='..CommonDefine.EQUIPPOS_NAME[equippos]..'��λ|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    --��ǰ�ȼ�����
    local tempLeftX = CSS.NPC_LEFT_START_X + 30
    local tempLeftY = tempCurrY + 30    
    sPanelStr = sPanelStr..'<Text|text=��ǰ�ȼ���|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'..
                           '<Text|text='..curPosLevel..'|x='..(tempLeftX+100)..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
    tempLeftY = tempLeftY + 30
    local currPropDescTable = cfgEquipPosStrength[cfgCurrKey].addprop_desctab    
  
    for _, descItem in ipairs(currPropDescTable) do
        sPanelStr = sPanelStr..'<Text|text='..descItem.desc..'|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
        tempLeftY = tempLeftY + 30
    end
    --��һ�ȼ�����
    local tempRightX = CSS.NPC_LEFT_START_X + 300
    local tempRightY = tempCurrY + 30
    if bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=�Ѵﵽ�ȼ�����|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
        tempRightY = tempRightY + 30
    else
        sPanelStr = sPanelStr..'<Text|text=��һ�ȼ���|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'..
                                '<Text|text='..nextPosLevel..'|x='..(tempRightX+100)..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
        tempRightY = tempRightY + 30
        local nextPropDescTable =  cfgEquipPosStrength[cfgNextKey].addprop_desctab
        for _, descItem in ipairs(nextPropDescTable) do
            sPanelStr = sPanelStr..'<Text|text='..descItem.desc..'|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
            tempRightY = tempRightY + 30
        end
    end

    --�ȼ����ƺ�ǿ������
    local tempCurrY = math.max(tempLeftY, tempRightY)
    sPanelStr = sPanelStr..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..tempCurrY..'|color='..CSS.NPC_BLUE_LINE..'>'
    tempCurrX = CSS.NPC_LEFT_START_X + 30
    tempCurrY = tempCurrY + 20       
    local currPlayerLv = Player.GetLevel(actor)
    if not bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=�ȼ����ƣ���ɫ�ﵽ'..cfgEquipPosStrength[cfgCurrKey].needlv..'��/'..currPlayerLv..'��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'
    end
    tempCurrY = tempCurrY + 30
    if not bCurrIsMaxLv then
        local sConsumeInfo = BF_GetItemTableDescStr(actor, cfgEquipPosStrength[cfgCurrKey].needitems_tab)
        sPanelStr = sPanelStr..'<Text|text=ǿ�����ģ�'..sConsumeInfo..'|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'
    end
    tempCurrY = tempCurrY + 20
    sPanelStr = sPanelStr..'<Text|text= - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - ���� - |x=15|y='..tempCurrY..'|color='..CSS.NPC_BLUE_LINE..'>'
    tempCurrY = tempCurrY + 50
    --������ť
    if bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=�Ѵﵽ���ǿ���ȼ���|x=100|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'    
    else
        sPanelStr = sPanelStr..'<Text|text=����һ��|x=50|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_upgrade_once>'..
            --'<Text|text=һ������|x=220|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@equippos_strength_upgrade_currtop>'..
            '<Text|text=������һҳ|x=400|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@main>'
    end

    BF_NPCSayExt(actor, sPanelStr)
end


--װ��λ ǿ��һ��
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
        Player.SendSelfMsg(actor, '��ǰǿ���ȼ��Ѵﵽ���ޣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    local currPlayerLv = Player.GetLevel(actor)
    if currPlayerLv < cfgEquipPosStrength[cfgCurrKey].needlv then
        Player.SendSelfMsg(actor, 'ǿ�������ɫ�ȼ����㣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    if not Player.CheckItemsEnough(actor, cfgEquipPosStrength[cfgCurrKey].needitems_tab, 'ǿ��') then
        return
    end

    --�۳�����
    Player.TakeItems(actor, cfgEquipPosStrength[cfgCurrKey].needitems_tab, 'װ��ǿ��')
    --����
    infoTab[sid] = nextPosLevel;
    infoStr = tbl2json(infoTab)
    setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_STRENGTH_INFO, infoStr)
    equippos_strength_panel(actor, sid)
    Player.SendSelfMsg(actor, 'ǿ���ɹ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_SOUL_STONE, 1)              

    --���µ�ǰװ��λ��ǿ��״̬
    EquipPosStrengthManager.UpdateEquipStrengthLvInPos(actor, equippos)  
end
