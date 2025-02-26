GuanZhiManager = {}

--functionid
local NPCPANEL_BUTTONFUNC_ID_1 = 1      --��ȡս������



GuanZhiManager.KILL_PLAYER_ADDEXP_PER = 100         --ÿ�λ�ɱ���ս��
GuanZhiManager.DAY_ADD_GUANZHI_EXP_MAX = 1000       --ÿ����Ի�õ����ս��

function GuanZhiManager.SetTitle(actor, titleitemname)
    for _, cfginfo in ipairs(cfgGuanZhi) do
        if checktitle(actor, cfginfo.titleitemname) then
            deprivetitle(actor, cfginfo.titleitemname)
        end
    end
    if titleitemname ~= '' then
        confertitle(actor, titleitemname, 1)
    end
end

function GuanZhiManager.AddExp(actor, addexp, daylimit)
    if BF_IsNullObj(actor) then
        return
    end

    local currlv = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL)    
    local nextlv = currlv + 1
    if (cfgGuanZhi[currlv] == nil) or (cfgGuanZhi[nextlv] == nil) then
        return
    end

    if (daylimit ~= nil) and (daylimit == 1) then
        local dayaddexp = getplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_ADDEXP)
        if dayaddexp >= GuanZhiManager.DAY_ADD_GUANZHI_EXP_MAX then
            return
        end
        if addexp > GuanZhiManager.DAY_ADD_GUANZHI_EXP_MAX - dayaddexp then
            addexp = GuanZhiManager.DAY_ADD_GUANZHI_EXP_MAX - dayaddexp
        end
        dayaddexp = dayaddexp + addexp
        setplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_ADDEXP, dayaddexp)

        --ÿ�ձ�������        
        EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_GUANZHI, addexp)  
    end

    local currexp = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_CURREXP) + addexp
    if currexp >= cfgGuanZhi[currlv].upgradeneedexp then
        currexp = currexp - cfgGuanZhi[currlv].upgradeneedexp
        currlv = currlv + 1
        setplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL, currlv)
        addattlist(actor, CommonDefine.ABILITY_GROUP_GUANZHI, "=", cfgGuanZhi[currlv].addprop_abstr)
        recalcabilitys(actor)
        GuanZhiManager.SetTitle(actor, cfgGuanZhi[currlv].titleitemname)
    end
    setplaydef(actor, CommonDefine.VAR_U_GUANZHI_CURREXP, currexp)
end

--��ҵ�¼ʱ����
function GuanZhiManager.OnPlayerEnterGame(actor)	  
    local currlv = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL)
    if currlv <= 0 then
        return
    end
    if cfgGuanZhi[currlv] == nil then
        return
    end
    addattlist(actor, CommonDefine.ABILITY_GROUP_GUANZHI, "=", cfgGuanZhi[currlv].addprop_abstr)
end

--��ɱ���ʱ����
function GuanZhiManager.OnKillPlayer(killer, deather)
    if BF_IsNullObj(killer) or BF_IsNullObj(deather) then
        return
    end
    if (not Player.IsPlayer(killer)) or (not Player.IsPlayer(deather)) then
        return
    end

    GuanZhiManager.AddExp(killer, GuanZhiManager.KILL_PLAYER_ADDEXP_PER, 1)
end


GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERGAME, GuanZhiManager.OnPlayerEnterGame, CommonDefine.FUNC_ID_GUANZHI)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_KILL_PLAYER, GuanZhiManager.OnKillPlayer, CommonDefine.FUNC_ID_GUANZHI)





---------------------------ͨ��npc�Ի�----------------------------------------

function GuanZhiManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=��ְϵͳ����˵��:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1����ְ��Ҫͨ������Ϸ�л��������������ù�ѫֵ��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=�ۻ���������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=2�����ÿ�������Ϸ�л�õĹ�ѫֵ�����������趨��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3����ְ����֮����˴������������Լӳ�֮�⣬�����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=26|text=���������ְ�ȼ���������Ҵ���������˺��ӳɡ�|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    BF_ShowSpecialUI(actor, strPanelInfo)    
end

function GuanZhiManager.ShowBasePanel(actor)
    local currlv = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL)
    local nextlv = currlv + 1    
    if cfgGuanZhi[currlv] == nil then
        release_print("GuanZhi no config level:"..currlv)
        return
    end
    local bCurrIsMaxLv = false
    if cfgGuanZhi[nextlv] == nil then
        bCurrIsMaxLv = true
    end    
    local playerjob = Player.GetJob(actor)


    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15,16}|x=105.0|y=50.0|height=448|show=0|bg=1|move=0|reset=1|esc=1|loadDelay=0|img=private/cc_guanzhi/2.png>'..
        '<Layout|id=11|x=812.0|y=12.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=813.0|y=13.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Button|id=16|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

    local tempLeftX = 20
    local tempLeftY = 10
    local idstr = '21,22,23'
    strPanelInfo = strPanelInfo..'<Text|id=21|text=��ǰ�ٽף�|size=20|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'..
                            '<Text|id=22|text='..cfgGuanZhi[currlv].name..'|size=20|x='..(tempLeftX+100)..'|y='..tempLeftY..'|color='..cfgGuanZhi[currlv].namecolor..'>'
    tempLeftY = tempLeftY + 30
    local currPropDescTable = cfgGuanZhi[currlv].addprop_desctab[playerjob]
    if #currPropDescTable == 0 then
        strPanelInfo = strPanelInfo..'<Text|id=23|text=��|size=20|x='..(tempLeftX+40)..'|y='..(tempLeftY+50)..'|color='..CSS.NPC_WHITE..'>'
        tempLeftY = tempLeftY + 20
    else
        local currid = 30
        for _, descItem in ipairs(currPropDescTable) do
            currid = currid + 1
            idstr = idstr..','..currid
            strPanelInfo = strPanelInfo..'<Text|id='..currid..'|text='..descItem.desc..'|size=15|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
            tempLeftY = tempLeftY + 20
        end
        strPanelInfo = strPanelInfo..'<Text|id=23|text=�Ե����Լ��ٽ׵�Ŀ������10%|size=15|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_LIGHTGREEN..'>'
        tempLeftY = tempLeftY + 20
    end
    strPanelInfo = strPanelInfo..'<Layout|id=13|children={'..idstr..'}|x=80.0|y=100.0|width=180|height=200>'


    local tempRightX = 20
    local tempRightY = 10
    local idstr = '41,42,43'
    if bCurrIsMaxLv then
        strPanelInfo = strPanelInfo..'<Text|id=41|text=�Ѵﵽ��߹ٽ�|size=20|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
        tempRightY = tempRightY + 30
    else
        strPanelInfo = strPanelInfo..'<Text|id=41|text=��һ�ٽף�|size=20|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'..
                                '<Text|id=42|text='..cfgGuanZhi[nextlv].name..'|size=20|x='..(tempRightX+100)..'|y='..tempRightY..'|color='..cfgGuanZhi[nextlv].namecolor..'>'
        tempRightY = tempRightY + 30
        local nextPropDescTable =  cfgGuanZhi[nextlv].addprop_desctab[playerjob]
        local currid = 50
        for _, descItem in ipairs(nextPropDescTable) do
            currid = currid + 1
            idstr = idstr..','..currid            
            strPanelInfo = strPanelInfo..'<Text|id='..currid..'|text='..descItem.desc..'|size=15|x='..(tempRightX+40)..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
            tempRightY = tempRightY + 20
        end
        strPanelInfo = strPanelInfo..'<Text|id=43|text=�Ե����Լ��ٽ׵�Ŀ������10%|size=15|x='..(tempRightX-20)..'|y='..tempRightY..'|color='..CSS.NPC_LIGHTGREEN..'>'
        tempRightY = tempRightY + 20
    end    
    strPanelInfo = strPanelInfo..'<Layout|id=14|children={'..idstr..'}|x=580.0|y=100.0|width=180|height=200>'



    local currexp = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_CURREXP)
    local tempCurrX = 20
    local tempCurrY = 10
    idstr = '61,62,63,64,65,66,71,72'
    if bCurrIsMaxLv then
        strPanelInfo = strPanelInfo..'<Text|id=61|text=���Ѵﵽ��߹ٽ�|size=20|x='..(tempCurrX+200)..'|y='..(tempCurrY+20)..'|color='..CSS.NPC_YELLOW..'>'
    else
        local leftexp = math.max(0, cfgGuanZhi[currlv].upgradeneedexp-currexp)
        local dayaddexp = getplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_ADDEXP)
        strPanelInfo = strPanelInfo..'<Text|id=61|text=ս������:|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'..
                    '<Text|id=62|text='..currexp..'/'..cfgGuanZhi[currlv].upgradeneedexp..'|size=18|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'..
                    '<Text|id=63|text=(������һ������Ҫ'..leftexp..'��ս��)|size=18|x='..(tempCurrX+240)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
        tempCurrY = tempCurrY + 30
        strPanelInfo = strPanelInfo..'<Text|id=64|text=�ɻ�ȡս��:|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'..
                    '<Text|id=65|text='..dayaddexp..'/'..GuanZhiManager.DAY_ADD_GUANZHI_EXP_MAX..'|size=18|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'..
                    '<Text|id=66|text=(����ս����ô����޺�������)|size=18|x='..(tempCurrX+240)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    end
    tempCurrX = 200
    tempCurrY = tempCurrY + 40
    local rewarditemdesc = BF_GetItemTableDescStr(nil, cfgGuanZhi[currlv].dayrewards_tab)  
    if rewarditemdesc ~= '' then
        local getrewardflag = getplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_GETREWARD)
        if getrewardflag == 1 then
            tempCurrX = tempCurrX - 40
            strPanelInfo = strPanelInfo..'<Text|id=71|text=���չ�ٺ����|size=20|x='..(tempCurrX-20)..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'..
                    '<Text|id=72|text=('..rewarditemdesc..')|size=20|x='..(tempCurrX+120)..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'
        else
            tempCurrX = tempCurrX - 40
            strPanelInfo = strPanelInfo..'<Button|id=71|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..
                '|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=��ȡ��ٺ|link=@function_button,'..NPCPANEL_BUTTONFUNC_ID_1..'>'..
                '<Text|id=72|text=('..rewarditemdesc..')|x='..(tempCurrX+120)..'|y='..(tempCurrY+6)..'|size=20|color='..CSS.NPC_YELLOW..'>'
            Player.AddRedPoint(actor, 0, 71, 10, 10)
        end
    else
        strPanelInfo = strPanelInfo..'<Text|id=71|text=���׺�ÿ�տ���ȡ��ٺ|x='..(tempCurrX-50)..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    end    
    strPanelInfo = strPanelInfo..'<Layout|id=15|children={'..idstr..'}|x=190.0|y=300.0|width=480|height=120>'

    BF_ShowSpecialUI(actor, strPanelInfo)
end

--��ȡÿ�ս���
local function GetDayReward(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_GUANZHI, false) then
        return
    end

    local getrewardflag = getplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_GETREWARD)
    if getrewardflag == 1 then
        Player.SendSelfMsg(actor, '���յĹ�ٺ��������ȡ��������������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local currlv = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL)
    if cfgGuanZhi[currlv] == nil then
        return
    end

    Player.GiveItemsToBagOrMail(actor, cfgGuanZhi[currlv].dayrewards_tab, '��ٺÿ�ս���')
    setplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_GETREWARD, 1)

    main(actor)
end

--����button�ص�
function GuanZhiManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    
    local funcid = tonumber(sid)
    local nparam = 0
    if BF_IsNumberStr(sparam) then
        nparam = tonumber(sparam)
    end

    if funcid == NPCPANEL_BUTTONFUNC_ID_1 then
        GetDayReward(actor)
        GuanZhiManager.ShowBasePanel(actor)
    end    
end

--�Ƿ��п����ʾ
function GuanZhiManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_RANDOMBOSS, false) then
        return false
    end

    local getrewardflag = getplaydef(actor, CommonDefine.VAR_J_DAY_GUAZHI_GETREWARD)
    if getrewardflag == 1 then
        return false
    end

    local currlv = getplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL)
    if (currlv <= 0) or (cfgGuanZhi[currlv] == nil) then
        return false
    end

    return true
end

return GuanZhiManager