FreeVIPManager = {}

--functionid
local NPCPANEL_BUTTONFUNC_ID_1 = 1      --切换VIP等级页签
local NPCPANEL_BUTTONFUNC_ID_2 = 2      --快捷跳转
local NPCPANEL_BUTTONFUNC_ID_3 = 3      --领取单个任务目标奖励
local NPCPANEL_BUTTONFUNC_ID_4 = 4      --领取每日的福利

FreeVIPManager.MAX_LEVEL = 15
FreeVIPManager.MAX_TASK_NUM = 5

FreeVIPManager.TASK_TYPE_CHECKLEVEL = 1                     --检测等级
FreeVIPManager.TASK_TYPE_CHECKCOMBAT = 2                    --检测战力
FreeVIPManager.TASK_TYPE_RANDOMBOSS_KILLTIMES = 3           --随机boss击杀次数【接任务后】
FreeVIPManager.TASK_TYPE_BAOZHUBOSS_KILLTIMES = 4           --宝珠boss击杀次数【接任务后】
FreeVIPManager.TASK_TYPE_MOFANGZHEN_ENTERTIMES = 5          --魔方阵进入次数【接任务后】
FreeVIPManager.TASK_TYPE_UPGRADE_EQUIPSTAR = 6              --装备升星最大星【接任务后】
FreeVIPManager.TASK_TYPE_ALL_EQUIPMENT_MINQUALITY = 7       --全身装备的最小品质
FreeVIPManager.TASK_TYPE_EQUIPRANDOMAB_GOLDTIMES = 8        --装备金币洗炼次数
FreeVIPManager.TASK_TYPE_EQUIPRANDOMAB_YBTIMES = 9          --装备元宝(钻石)洗炼次数
FreeVIPManager.TASK_TYPE_COMPOSE_EQUIP_SUCCESSTIMES = 10        --装备合成成功次数
FreeVIPManager.TASK_TYPE_COMPOSE_SOULSTONE_SUCCESSTIMES = 11    --魂石合成成功次数
FreeVIPManager.TASK_TYPE_COMPOSE_BAOZHU_SUCCESSTIMES = 12       --宝珠(灵玉)合成成功次数
FreeVIPManager.TASK_TYPE_ALL_EQUIPPOS_MINSTRENGTHLV = 13        --全身装备位的最小强化等级


FreeVIPManager.TASK_COUNTER_VARLIST = {
    CommonDefine.VAR_U_FREEVIPTASK_COUNTER1, 
    CommonDefine.VAR_U_FREEVIPTASK_COUNTER2, 
    CommonDefine.VAR_U_FREEVIPTASK_COUNTER3, 
    CommonDefine.VAR_U_FREEVIPTASK_COUNTER4, 
    CommonDefine.VAR_U_FREEVIPTASK_COUNTER5
}

FreeVIPManager.TASK_DRAWREWARD_FLAGLIST = {
    CommonDefine.VAR_HUM_BITFLAG_FREEVIP_TASK_DRAWFLAG1, 
    CommonDefine.VAR_HUM_BITFLAG_FREEVIP_TASK_DRAWFLAG2, 
    CommonDefine.VAR_HUM_BITFLAG_FREEVIP_TASK_DRAWFLAG3, 
    CommonDefine.VAR_HUM_BITFLAG_FREEVIP_TASK_DRAWFLAG4, 
    CommonDefine.VAR_HUM_BITFLAG_FREEVIP_TASK_DRAWFLAG5
}

function FreeVIPManager.GetVIPTaskCfgKey(level, taskseq)
    return level * 100 + taskseq
end

function FreeVIPManager.QuickGoTo(actor, tasktype)
    if BF_IsNullObj(actor) then
        return
    end

    if tasktype == FreeVIPManager.TASK_TYPE_CHECKLEVEL then
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_UPGRADE_LEVEL)
    elseif tasktype == FreeVIPManager.TASK_TYPE_CHECKCOMBAT then
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_INCREASE_POWER)        
    elseif tasktype == FreeVIPManager.TASK_TYPE_RANDOMBOSS_KILLTIMES then        
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_KILL_RANDOMBOSS)
    elseif tasktype == FreeVIPManager.TASK_TYPE_BAOZHUBOSS_KILLTIMES then        
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_KILL_BAOZHUBOSS)
    elseif tasktype == FreeVIPManager.TASK_TYPE_MOFANGZHEN_ENTERTIMES then        
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_ENTER_MOFANGZHEN)
    elseif tasktype == FreeVIPManager.TASK_TYPE_UPGRADE_EQUIPSTAR then   
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_UPGRADE_EQUIPSTAR)
    elseif tasktype == FreeVIPManager.TASK_TYPE_ALL_EQUIPMENT_MINQUALITY then        
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_EQUIP_QUALITY)
    elseif tasktype == FreeVIPManager.TASK_TYPE_EQUIPRANDOMAB_GOLDTIMES or tasktype == FreeVIPManager.TASK_TYPE_EQUIPRANDOMAB_YBTIMES then        
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_EQUIP_RANDOMAB)
    elseif tasktype == FreeVIPManager.TASK_TYPE_COMPOSE_EQUIP_SUCCESSTIMES then   
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_EQUIP_COMPOSE)
    elseif tasktype == FreeVIPManager.TASK_TYPE_COMPOSE_SOULSTONE_SUCCESSTIMES then 
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_SOULSTONE)
    elseif tasktype == FreeVIPManager.TASK_TYPE_COMPOSE_BAOZHU_SUCCESSTIMES then   
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_BAOZHU)
    elseif tasktype == FreeVIPManager.TASK_TYPE_ALL_EQUIPPOS_MINSTRENGTHLV then   
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_EQUIP_STRENGTH)
    end
end

function FreeVIPManager.GetCurrTaskCounter(actor, taskseq)
    if BF_IsNullObj(actor) then
        return 0
    end
    if (taskseq < 1) or (taskseq > FreeVIPManager.MAX_TASK_NUM) then
        return 0
    end    
    local counter = 0
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local taskcfgkey = FreeVIPManager.GetVIPTaskCfgKey(currVIPLv, taskseq)
    local taskconfig = cfgFreeVIPTask[taskcfgkey]
    if taskconfig then
        if taskconfig.tasktype == FreeVIPManager.TASK_TYPE_CHECKLEVEL then
            counter = Player.GetLevel(actor)
        elseif taskconfig.tasktype == FreeVIPManager.TASK_TYPE_CHECKCOMBAT then
            counter = math.floor(Player.GetPlayerPower(actor) / 10000)
        elseif taskconfig.tasktype == FreeVIPManager.TASK_TYPE_ALL_EQUIPMENT_MINQUALITY then
            counter = Player.GetAllEquipmentMinQualityLv(actor)
        elseif taskconfig.tasktype == FreeVIPManager.TASK_TYPE_ALL_EQUIPPOS_MINSTRENGTHLV then
            counter = EquipPosStrengthManager.GetAllCommonEquipPosMinLevel(actor)
        else
            counter = getplaydef(actor, FreeVIPManager.TASK_COUNTER_VARLIST[taskseq])
        end
    end
    counter = math.max(0, counter)
    return counter
end

function FreeVIPManager.TriggerChgTaskCounter(actor, tasktype, oper, num)
    if BF_IsNullObj(actor) then
        return
    end
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    if currVIPLv >= FreeVIPManager.MAX_LEVEL then
        return
    end
    for i = 1, FreeVIPManager.MAX_TASK_NUM, 1 do
        local taskcfgkey = FreeVIPManager.GetVIPTaskCfgKey(currVIPLv, i)
        local taskconfig = cfgFreeVIPTask[taskcfgkey]        
        if taskconfig and (taskconfig.tasktype == tasktype) then
            if (tasktype == FreeVIPManager.TASK_TYPE_RANDOMBOSS_KILLTIMES) or (tasktype == FreeVIPManager.TASK_TYPE_BAOZHUBOSS_KILLTIMES) or
               (tasktype == FreeVIPManager.TASK_TYPE_MOFANGZHEN_ENTERTIMES) or (tasktype == FreeVIPManager.TASK_TYPE_UPGRADE_EQUIPSTAR) or
               (tasktype == FreeVIPManager.TASK_TYPE_EQUIPRANDOMAB_GOLDTIMES) or (tasktype == FreeVIPManager.TASK_TYPE_EQUIPRANDOMAB_YBTIMES) or
               (tasktype == FreeVIPManager.TASK_TYPE_COMPOSE_EQUIP_SUCCESSTIMES) or (tasktype == FreeVIPManager.TASK_TYPE_COMPOSE_SOULSTONE_SUCCESSTIMES) or
               (tasktype == FreeVIPManager.TASK_TYPE_COMPOSE_BAOZHU_SUCCESSTIMES) then
                local currcounter = getplaydef(actor, FreeVIPManager.TASK_COUNTER_VARLIST[i])
                if oper == '+' then
                    currcounter = currcounter + num
                elseif oper == '=' then
                    currcounter = num
                elseif oper == 'max' then
                    if num > currcounter then
                        currcounter = num
                    end
                end
                setplaydef(actor, FreeVIPManager.TASK_COUNTER_VARLIST[i], currcounter)
            end
        end
    end
end

function FreeVIPManager.IsTaskFinished(actor, taskseq)
    if BF_IsNullObj(actor) then
        return false
    end
    if (taskseq < 1) or (taskseq > FreeVIPManager.MAX_TASK_NUM) then
        return false
    end    
    local currnum = FreeVIPManager.GetCurrTaskCounter(actor, taskseq)
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local taskcfgkey = FreeVIPManager.GetVIPTaskCfgKey(currVIPLv, taskseq)
    local taskconfig = cfgFreeVIPTask[taskcfgkey]
    if taskconfig then
        if currnum >= taskconfig.tasktargnum then
            return true
        end
    end
    return false
end

function FreeVIPManager.FetchTaskReward(actor, taskseq)
    if BF_IsNullObj(actor) then
        return
    end
    if (taskseq < 1) or (taskseq > FreeVIPManager.MAX_TASK_NUM) then
        return
    end     
    if getflagstatus(actor, FreeVIPManager.TASK_DRAWREWARD_FLAGLIST[taskseq]) == 1 then
        Player.SendSelfMsg(actor, '任务奖励已领取过！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return 
    end
    if not FreeVIPManager.IsTaskFinished(actor, taskseq) then
        Player.SendSelfMsg(actor, '任务尚未完成！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local taskcfgkey = FreeVIPManager.GetVIPTaskCfgKey(currVIPLv, taskseq)
    local taskconfig = cfgFreeVIPTask[taskcfgkey]
    if taskconfig == nil then
        return
    end
    if #taskconfig.finishrewards_tab == 0 then
        Player.SendSelfMsg(actor, '当前无可领取奖励！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    setflagstatus(actor, FreeVIPManager.TASK_DRAWREWARD_FLAGLIST[taskseq], 1)
    Player.GiveItemsToBagOrMail(actor, taskconfig.finishrewards_tab, '免费VIP任务奖励')
    Player.SendSelfMsg(actor, '成功领取当前任务奖励！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    FreeVIPManager.CheckUpgradeLevel(actor)
end

function FreeVIPManager.SetVIPLevel(actor, newlv)
    local currVIPLv = newlv
    setplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL, currVIPLv)
    for i = 1, FreeVIPManager.MAX_TASK_NUM, 1 do
        setflagstatus(actor, FreeVIPManager.TASK_DRAWREWARD_FLAGLIST[i], 0)
        setplaydef(actor, FreeVIPManager.TASK_COUNTER_VARLIST[i], 0)        
    end

    local cfgCurrVip = cfgFreeVIP[currVIPLv]
    if cfgCurrVip then
        if cfgCurrVip.addprop_abstr ~= '' then
            addattlist(actor, CommonDefine.ABILITY_GROUP_FREEVIP, "=", cfgCurrVip.addprop_abstr)        
        else
            delattlist(actor, CommonDefine.ABILITY_GROUP_FREEVIP)
        end
    end    
    recalcabilitys(actor)

    if newlv >= CommonDefine.ACTIVATED_AUTORECYCLE_FREEVIP_LV then
        --解锁自动回收的功能
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_ACTIVATED_AUTORECYCLE, 1)
    end

    TaskManager.OnFreeVIPChange(actor)
end

function FreeVIPManager.CheckUpgradeLevel(actor)
    if BF_IsNullObj(actor) then
        return
    end
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    if currVIPLv >= FreeVIPManager.MAX_LEVEL then
        return
    end

    for i = 1, FreeVIPManager.MAX_TASK_NUM, 1 do
        if getflagstatus(actor, FreeVIPManager.TASK_DRAWREWARD_FLAGLIST[i]) == 0 then
            return
        end        
    end

    FreeVIPManager.SetVIPLevel(actor, currVIPLv+1)
    Player.SendServerMsg(actor, Player.GetName(actor)..' 提升了VIP等级，获得了超多VIP福利', CommonDefine.MSG_POS_TYPE_TOP_ROLL, CSS.CHAT_YELLOW, CSS.CHAT_BLACK)
end

function FreeVIPManager.FetchDayReward(actor)
    if BF_IsNullObj(actor) then
        return
    end
    if getplaydef(actor, CommonDefine.VAR_J_DAY_FREEVIP_REWARDTIMES) > 0 then
        Player.SendSelfMsg(actor, '今日奖励已领取过！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return 
    end
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local cfgCurrVip = cfgFreeVIP[currVIPLv]
    if cfgCurrVip then
        setplaydef(actor, CommonDefine.VAR_J_DAY_FREEVIP_REWARDTIMES, 1)
        Player.GiveItemsToBagOrMail(actor, cfgCurrVip.dayrewards_tab, '免费VIP每日奖励')        
        Player.SendSelfMsg(actor, '成功领取每日奖励！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    end 
end

--玩家登录时触发
function FreeVIPManager.OnPlayerEnterGame(actor)	
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local cfgCurrVip = cfgFreeVIP[currVIPLv]
    if cfgCurrVip then
        if cfgCurrVip.addprop_abstr ~= '' then
            addattlist(actor, CommonDefine.ABILITY_GROUP_FREEVIP, "=", cfgCurrVip.addprop_abstr)        
        else
            delattlist(actor, CommonDefine.ABILITY_GROUP_FREEVIP)
        end
    end    
    recalcabilitys(actor)
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERGAME, FreeVIPManager.OnPlayerEnterGame, CommonDefine.FUNC_ID_FREEVIP)




--------------------------------------------------------主面板相关--------------------------------------------------------------------
function FreeVIPManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=免费VIP规则说明:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1、初始角色为vip0，只有完成对应vip的所有任务才能|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=激活对应等级的vip。|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=2、Vip1以上的玩家可以每天领取元宝福利。|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3、VIP1以上的玩家还能永久获得攻防血的全属性加成。|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    BF_ShowSpecialUI(actor, strPanelInfo)    
end

local function GetSingleShowInfo(actor, viplevel)

    local strPanelInfo = ''
    local tempCurrX = 4
    local tempCurrY = 10
    local finishtasknum = 0
    local idstr = ''
    local baseid = 100
    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)    
    for i = 1, FreeVIPManager.MAX_TASK_NUM, 1 do
        local taskcfgkey = FreeVIPManager.GetVIPTaskCfgKey((viplevel-1), i)
        local taskconfig = cfgFreeVIPTask[taskcfgkey]
        if taskconfig then
            local textid1 = baseid + i * 10 + 1
            local textid2 = baseid + i * 10 + 2
            local textid3 = baseid + i * 10 + 3
            local textid4 = baseid + i * 10 + 4
            if idstr ~= '' then
                idstr = idstr..','
            end
            idstr = idstr..textid1..','..textid2..','..textid3..','..textid4
            local currcounter = FreeVIPManager.GetCurrTaskCounter(actor, i)
            local taskdesc = ''
            if taskconfig.tasktype == FreeVIPManager.TASK_TYPE_ALL_EQUIPMENT_MINQUALITY then
                local str1 = CommonDefine.ITEM_QUALITY_COLORNAME[taskconfig.tasktargnum+1]
                taskdesc = string.format(taskconfig.taskdesc, str1)
            else
                local str1 = taskconfig.tasktargnum..''
                taskdesc = string.format(taskconfig.taskdesc, str1)
            end
            
            strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|text=VIP任务'..i..':'..taskdesc..
                '|size=17|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'                
            local color1 = CSS.NPC_WHITE
            if currcounter >= taskconfig.tasktargnum then
                color1 = CSS.NPC_LIGHTGREEN                
            end
            if currVIPLv + 1 == viplevel then
                strPanelInfo = strPanelInfo..'<Text|id='..textid2..'|text=进度:'..currcounter..'/'..taskconfig.tasktargnum..
                    '|size=15|x='..(tempCurrX+280)..'|y='..tempCurrY..'|color='..color1..'>'
            end

            tempCurrY = tempCurrY + 30

            local sRewardInfo = BF_GetItemTableDescStr(nil, taskconfig.finishrewards_tab)
            strPanelInfo = strPanelInfo..'<Text|id='..textid3..'|text=  任务奖励: '..sRewardInfo..'|size=15|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
            if currVIPLv + 1 == viplevel then
                if currcounter < taskconfig.tasktargnum then
                    strPanelInfo = strPanelInfo..'<Button|id='..textid4..'|x='..(tempCurrX+280)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..
                        '|mimg=private/cc_common/button_2.png|nimg=private/cc_common/button_2.png|size=18|text=前往|link=@function_button,'..NPCPANEL_BUTTONFUNC_ID_2..','..taskconfig.tasktype..'>'
                else 
                    if getflagstatus(actor, FreeVIPManager.TASK_DRAWREWARD_FLAGLIST[i]) == 1 then
                        strPanelInfo = strPanelInfo..'<Text|id='..textid4..'|text=已完成|size=17|x='..(tempCurrX+280)..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
                        finishtasknum = finishtasknum + 1
                    else
                        strPanelInfo = strPanelInfo..'<Button|id='..textid4..'|x='..(tempCurrX+280)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..
                            '|mimg=private/cc_common/button_2.png|nimg=private/cc_common/button_2.png|size=18|text=领奖|link=@function_button,'..NPCPANEL_BUTTONFUNC_ID_3..','..i..'>'
                    end
                end
            end
        end
        tempCurrY = tempCurrY + 40
    end
    strPanelInfo = strPanelInfo..'<Layout|id=13|children={'..idstr..'}|x=196.0|y=60.0|width=350|height=360>'

    
    local currLvConfig = cfgFreeVIP[viplevel]
    local tempLeftX = 50
    local tempLeftY = 10
    if currLvConfig and currLvConfig.addprop_desctab then        
        idstr = '310,311'
        strPanelInfo = strPanelInfo..'<Text|id=310|text=VIP'..viplevel..'特权:|size=18|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'
        tempLeftY = tempLeftY + 25
        if #currLvConfig.addprop_desctab == 0 then
            strPanelInfo = strPanelInfo..'<Text|id=311|text=无|size=15|x='..tempLeftX..'|y='..tempLeftY..'|color=w'..CSS.NPC_WHITE..'>'
            tempLeftY = tempLeftY + 25
        else            
            for seq, descItem in ipairs(currLvConfig.addprop_desctab) do
                local textid = 320 + seq
                idstr = idstr..','..textid
                strPanelInfo = strPanelInfo..'<Text|id='..textid..'|text='..descItem.desc..'|size=15|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
                tempLeftY = tempLeftY + 25
            end
        end
    end  
    strPanelInfo = strPanelInfo..'<Layout|id=14|children={'..idstr..'}|x=560.0|y=60.0|width=220|height=180>'


    tempLeftX = 50
    tempLeftY = 10
    idstr = ''
    if currLvConfig and currLvConfig.dayrewards_tab then        
        idstr = '330,331'
        strPanelInfo = strPanelInfo..'<Text|id=330|text=VIP'..viplevel..'福利:|size=18|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'
        tempLeftY = tempLeftY + 25
        local rewardtab = currLvConfig.dayrewards_tab
        if #rewardtab == 0 then
            strPanelInfo = strPanelInfo..'<Text|id=331|text=无|size=15|x='..tempLeftX..'|y='..tempLeftY..'|color=w'..CSS.NPC_WHITE..'>'
            tempLeftY = tempLeftY + 25
        else
            for seq, descItem in ipairs(rewardtab) do
                local textid = 340 + seq
                idstr = idstr..','..textid
                strPanelInfo = strPanelInfo..'<Text|id='..textid..'|text='..descItem.name..'*'..BF_NumToShowStr(descItem.num)..'|size=15|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
                tempLeftY = tempLeftY + 25
            end
        end
    end 

    tempCurrX = 20
    tempCurrY = 100
    if idstr ~= '' then
        idstr = idstr..','
    end
    idstr = idstr..'351,352,353'

    if currVIPLv == viplevel then
        if getplaydef(actor, CommonDefine.VAR_J_DAY_FREEVIP_REWARDTIMES) == 0 then
            if currVIPLv > 0 then
                strPanelInfo = strPanelInfo..'<Button|id=351|x='..(tempCurrX+30)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'|mimg=private/cc_common/button_1.png|nimg=private/cc_common/button_1.png|size=18|text=领取福利|link=@function_button,'..
                    NPCPANEL_BUTTONFUNC_ID_4..'>'
            end
        else
            strPanelInfo = strPanelInfo..'<Text|id=352|text=已领取|size=20|x='..(tempCurrX+30)..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
        end
        tempCurrY = tempCurrY + 40
        strPanelInfo = strPanelInfo..'<Text|id=353|text=提示：每日仅能领取一次！|size=15|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    end
    strPanelInfo = strPanelInfo..'<Layout|id=16|children={'..idstr..'}|x=560.0|y=240.0|width=220|height=180>'

    return strPanelInfo
end

function FreeVIPManager.ShowBasePanel(actor)    
    local strPanelInfo = '<Img|id=10|children={11,12,15,13,14,16,17}|x=80.0|y=50.0|height=448|esc=1|bg=1|img=private/cc_freevip/5.png|loadDelay=0|reset=1|show=0|move=0>'..
        '<Layout|id=11|x=812.0|y=12.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=813.0|y=13.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Button|id=17|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local chooseid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    local listitemidstr = ''
    for i = 1, FreeVIPManager.MAX_LEVEL, 1 do
        local picid = 30 + i * 2
        local textid = 30 + i * 2 + 1
        if chooseid == -1 then          
            chooseid = i
            setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, chooseid)
        end

        local tabpic = 'private/cc_freevip/2.png'
        if chooseid == i then
            tabpic = 'private/cc_freevip/3.png'
        end
        strPanelInfo = strPanelInfo..'<Img|id='..picid..'|children={'..textid..'}x=0.0|y=0.0|img='..tabpic..'|link=@function_button,'..
            NPCPANEL_BUTTONFUNC_ID_1..','..i..'>'        
        if i < currVIPLv + 1 then
            strPanelInfo = strPanelInfo..'<Text|id='..textid..'|x=10.0|y=12.0|size=18|color='..CSS.NPC_YELLOW..'|text=VIP'..i..'[已解锁]>'    
        elseif i == currVIPLv + 1 then
            strPanelInfo = strPanelInfo..'<Text|id='..textid..'|x=10.0|y=12.0|size=18|color='..CSS.NPC_YELLOW..'|text=VIP'..i..'[1/5]>'    
        elseif i > currVIPLv + 1 then
            strPanelInfo = strPanelInfo..'<Text|id='..textid..'|x=10.0|y=12.0|size=18|color='..CSS.NPC_YELLOW..'|text=VIP'..i..'[未解锁]>'    
        end
        --对应当前选中的页签
        if chooseid == i then
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

--处理button回调
function FreeVIPManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    
    local funcid = tonumber(sid)
    local nparam = 0
    if BF_IsNumberStr(sparam) then
        nparam = tonumber(sparam)
    end

    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    if funcid == NPCPANEL_BUTTONFUNC_ID_1 then
        if currVIPLv + 1 < nparam then
            Player.SendSelfMsg(actor, 'VIP等级不足！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID,  nparam)
        FreeVIPManager.ShowBasePanel(actor)
    elseif funcid == NPCPANEL_BUTTONFUNC_ID_2 then
        FreeVIPManager.QuickGoTo(actor, nparam)
	elseif funcid == NPCPANEL_BUTTONFUNC_ID_3 then
        FreeVIPManager.FetchTaskReward(actor, nparam)
        FreeVIPManager.ShowBasePanel(actor)
    elseif funcid == NPCPANEL_BUTTONFUNC_ID_4 then
        FreeVIPManager.FetchDayReward(actor)
        FreeVIPManager.ShowBasePanel(actor)
    end    
end

--是否有快捷提示
function FreeVIPManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_FREEVIP, false) then
        return false
    end
    if getplaydef(actor, CommonDefine.VAR_J_DAY_FREEVIP_REWARDTIMES) > 0 then
        return false
    end

    local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
    local cfgCurrVip = cfgFreeVIP[currVIPLv]
    if cfgCurrVip then
        return true
    end
    return false
end

return FreeVIPManager