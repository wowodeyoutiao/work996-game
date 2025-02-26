TopIcon = {}

local ICON_GATHER = '1'                         --收缩面板
local ICON_EXTEND = '2'                         --展开面板
local ICON_REFRESHBAG = '3'                     --刷新背包
local ICON_GMMODE = '4'                         --管理模式
local ICON_FIRSTRECHARGE = '5'                  --首充
local ICON_NEWPLAYER_RECHARGEACTIVITY = '6'     --新人充值返利
local ICON_OPENSERVERACTIVITY = '7'             --开服活动
local ICON_EXTENDGIFT = '8'                     --进阶礼包
local ICON_OPENSTORAGE = '9'                    --打开仓库
local ICON_RECYCLE = '10'                       --打开回收界面
local ICON_EVERYDAY_TASK = '11'                 --每日必做
local ICON_EXTEND_STORAGE_SHOW = '12'           --仓库扩容
local ICON_EXTEND_STORAGE_MAKESURE = '13'       --仓库扩容，确认
local ICON_SHOW_QUICK_TIP_PANEL = '14'          --打开有红点功能对应的快捷提示框
local ICON_QUICK_TIP_GOTO = '15'                --对应红点功能提示的快捷前往
local ICON_HIDE_QUICK_TIP_PANEL = '16'          --关闭有红点功能对应的快捷提示框

local MAINICON_ID_1 = 'mainicon_1'              --进阶礼包 iconid
local MAINICON_ID_2 = 'mainicon_2'              --开服活动 iconid
local MAINICON_ID_3 = 'mainicon_3'              --新人充值返利 iconid
local MAINICON_ID_4 = 'mainicon_4'              --首充 iconid
local MAINICON_ID_5 = 'mainicon_5'              --每日必做 iconid


function TopIcon.InitUI(actor)
    --主界面入口icon
    TopIcon.InnerExtendPanel(actor)

    --背包界面增加的按钮        
    addbutton(actor, 7, 10, '<Button|x=260|y=343|text=仓库|nimg=public/1900000652.png|pimg=public/1900000653.png|link=@topicon_openpanel,'..ICON_OPENSTORAGE..'>')
    addbutton(actor, 7, 11, '<Button|x=350|y=343|text=回收|nimg=public/1900000652.png|pimg=public/1900000653.png|link=@topicon_openpanel,'..ICON_RECYCLE..'>')
    addbutton(actor, 7, 12, '<Button|x=440|y=343|text=整理|nimg=public/1900000652.png|pimg=public/1900000653.png|link=@topicon_openpanel,'..ICON_REFRESHBAG..'>')    

    --仓库界面增加的按钮
    addbutton(actor, 16, 13, '<Button|x=220|y=414|text=仓库扩容|nimg=public/1900000652.png|pimg=public/1900000653.png|link=@topicon_openpanel,'..ICON_EXTEND_STORAGE_SHOW..'>')

    --gm 测试模式
    if getgmlevel(actor) > 0 then
        addbutton(actor, 104, 999, '<Button|x=-200|y=-400|nimg=official/top/1900012530.png|link=@topicon_openpanel,'..ICON_GMMODE..'>')
    end

    setontimer(actor, CommonDefine.TIMER_ID_CHECK_TOPICON_REDPOINT, 10, 0, 0)
    setontimer(actor, CommonDefine.TIMER_ID_CHECK_QUICK_GOTO_TIP, 30, 0, 0)
end

function TopIcon.OpenPanel(actor, sid, sparam)
    if (actor == nil) or (sid == nil) then
        return
    end
    
    local nparam = 0 
    if BF_IsNumberStr(sparam) then
        nparam = tonumber(sparam)
    end

    if sid == ICON_GATHER then
        TopIcon.InnerGatherPanel(actor)
    elseif sid == ICON_EXTEND then
        TopIcon.InnerExtendPanel(actor)
    elseif sid == ICON_REFRESHBAG then
        refreshbag(actor)
    elseif sid == ICON_OPENSTORAGE then
        openstorage(actor, 0)
    elseif sid == ICON_GMMODE then
        TopIcon.InnerGMModePanel(actor)        
    elseif sid == ICON_FIRSTRECHARGE then
        --首充
        FirstRecharge.OpenPanel(actor)
    elseif sid == ICON_NEWPLAYER_RECHARGEACTIVITY then
        --新人充值返利活动
        ActivityNewPlayerRecharge.OpenPanel(actor)
    elseif sid == ICON_OPENSERVERACTIVITY then
        --开服活动
        ActivityOpenServer.OpenPanel(actor)
    elseif sid == ICON_EXTENDGIFT then
        --进阶礼包
        ActivityExtendGift.OpenPanel(actor)
    elseif sid == ICON_RECYCLE then
        --打开回收界面
        RecycleManager.ShowRecycleEnterUI(actor)
    elseif sid == ICON_EVERYDAY_TASK then
        --每日必做
        EverydayTask.OpenPanel(actor)
    elseif sid == ICON_EXTEND_STORAGE_SHOW then
        --扩容仓库 显示
        TopIcon.ShowExtendStorageDialog(actor)
    elseif sid == ICON_EXTEND_STORAGE_MAKESURE then
        --扩容仓库 确定
        TopIcon.DoExtendStorage(actor)
    elseif sid == ICON_SHOW_QUICK_TIP_PANEL then
        --打开有红点功能对应的快捷提示框
        TopIcon.ShowQuickInfoTipPanel(actor)
    elseif sid == ICON_HIDE_QUICK_TIP_PANEL then
        TopIcon.HideQuickInfoTipPanel(actor)
    elseif sid == ICON_QUICK_TIP_GOTO then
        --对应红点功能提示的快捷前往
        TopIcon.DoQuickInfoTipGoTo(actor, nparam)        
    end
end

--仓库扩容提示框
function TopIcon.ShowExtendStorageDialog(actor)
    local needitemstr = BF_GetSimpleItemTableDescStr(CommonDefine.EXTEND_STORAGE_ONCE_NEEDITEMS)
    local msg = '<Img|children={10,11,12,13,14}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
        '<Layout|id=10|width=348|height=200>'..
        '<Text|id=11|x=50|y=25|size=18|color='..CSS.NPC_WHITE..'|text=是否开启一排仓库格子？>'..
        '<Text|id=12|x=50|y=55|size=15|color='..CSS.NPC_YELLOW..'|text=需要：'..needitemstr..'>'..        
        '<Button|id=13|x=45|y=90|nimg=public/1900000652.png|mimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=取消|link=@exit>'..
        '<Button|id=14|x=170|y=90|nimg=public/1900000652.png|mimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=确定|link=@topicon_openpanel,'..ICON_EXTEND_STORAGE_MAKESURE..'>'
    BF_ShowSpecialUI(actor, msg)
end

--进行一次仓库扩容
function TopIcon.DoExtendStorage(actor)
    local cursize = getssize(actor)
    local maxsize = cfg_game_data["warehouse_max_num"].value
    local closedgridnum = maxsize - cursize 
    if closedgridnum <= 0 then
        Player.SendSelfMsg(actor, '所有仓库格子已解锁！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local addnum = math.min(CommonDefine.EXTEND_STORAGE_ONCE_ADDNUM, closedgridnum)
    if addnum <= 0 then
        return
    end
    
    --条件判断
    if not Player.CheckItemsEnough(actor, CommonDefine.EXTEND_STORAGE_ONCE_NEEDITEMS, '仓库扩容') then
        return
    end
    --扣除材料消耗
    Player.TakeItems(actor, CommonDefine.EXTEND_STORAGE_ONCE_NEEDITEMS, '仓库扩容')
    changestorage(actor, addnum)
    openstorage(actor, 0)
end

function TopIcon.InnerGatherPanel(actor)
    delbutton(actor, 102, 2)
    addbutton(actor, 102, 2, '<Button|x=-240|a=3|y=35|rotate=180|nimg=official/top/1900012531.png|link=@topicon_openpanel,'..ICON_EXTEND..'>')
end

function TopIcon.InnerExtendPanel(actor)
    delbutton(actor, 102, 2)
    local currIconX = -240
    local buttonstr = '<Button|x='..currIconX..'|y=35|nimg=official/top/1900012531.png|link=@topicon_openpanel,'..ICON_GATHER..'>'
    if ActivityExtendGift.CanShowIcon(actor) then
        currIconX = currIconX - 80
        buttonstr = buttonstr..'<Button|id='..MAINICON_ID_1..'|x='..currIconX..'|y=35|nimg=private/cc_func_icon/2.png|link=@topicon_openpanel,'..ICON_EXTENDGIFT..'>'        
    end
    if ActivityOpenServer.CanShowIcon(actor) then
        currIconX = currIconX - 80
        buttonstr = buttonstr..'<Button|id='..MAINICON_ID_2..'|x='..currIconX..'|y=35|nimg=private/cc_func_icon/1.png|link=@topicon_openpanel,'..ICON_OPENSERVERACTIVITY..'>'
    end        
    if ActivityNewPlayerRecharge.CanShowIcon(actor) then
        currIconX = currIconX - 80
        buttonstr = buttonstr..'<Button|id='..MAINICON_ID_3..'|x='..currIconX..'|y=35|nimg=private/cc_func_icon/3.png|link=@topicon_openpanel,'..ICON_NEWPLAYER_RECHARGEACTIVITY..'>'
    end        
    if FirstRecharge.CanShowIcon(actor) then
        currIconX = currIconX - 80
        buttonstr = buttonstr..'<Button|id='..MAINICON_ID_4..'|x='..currIconX..'|y=35|nimg=private/cc_func_icon/4.png|link=@topicon_openpanel,'..ICON_FIRSTRECHARGE..'>'
    end
    if EverydayTask.CanShowIcon(actor) then
        currIconX = currIconX - 80
        buttonstr = buttonstr..'<Button|id='..MAINICON_ID_5..'|x='..currIconX..'|y=35|nimg=private/cc_func_icon/5.png|link=@topicon_openpanel,'..ICON_EVERYDAY_TASK..'>'        
    end

    addbutton(actor, 102, 2, buttonstr)
end

function TopIcon.CheckRedPoint(actor)
    if ActivityExtendGift.IsTopIconHaveRedPoint(actor) then
        Player.AddRedPoint(actor, 102, MAINICON_ID_1, 10, 10)    
    else
        Player.DelRedPoint(actor, 102, MAINICON_ID_1)    
    end
    
    if ActivityOpenServer.IsTopIconHaveRedPoint(actor) then
        Player.AddRedPoint(actor, 102, MAINICON_ID_2, 10, 10)    
    else
        Player.DelRedPoint(actor, 102, MAINICON_ID_2)    
    end

    if ActivityNewPlayerRecharge.IsTopIconHaveRedPoint(actor) then
        Player.AddRedPoint(actor, 102, MAINICON_ID_3, 10, 10)    
    else
        Player.DelRedPoint(actor, 102, MAINICON_ID_3)    
    end

    if FirstRecharge.IsTopIconHaveRedPoint(actor) then
        Player.AddRedPoint(actor, 102, MAINICON_ID_4, 10, 10)    
    else
        Player.DelRedPoint(actor, 102, MAINICON_ID_4)    
    end

    if EverydayTask.IsTopIconHaveRedPoint(actor) then    
        Player.AddRedPoint(actor, 102, MAINICON_ID_5, 10, 10)    
    else
        Player.DelRedPoint(actor, 102, MAINICON_ID_5)    
    end
end

function TopIcon.HideQuickInfoTipPanel(actor)
    delbutton(actor, 108, 996)
end

local function FillRedPointFunctionInfoList(actor, infolist)
    if EquipPosStrengthManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_EQUIP_STRENGTH, name='槽位强化'}
    end
    if SoulStoneManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_SOULSTONE, name='魂石镶嵌'}
    end
    if BaoZhuManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_BAOZHU, name='灵玉提升'}
    end
    if YunBiaoManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_YUNBIAO, name='运镖'}
    end
    if SingleBossManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_SINGLEBOSS, name='个人首领'}
    end
    if BaoZhuBossManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_KILL_BAOZHUBOSS, name='灵玉副本'}
    end
    if RandomBossManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_KILL_RANDOMBOSS, name='战力首领'}
    end
    if MoFangZhenManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_KILL_RANDOMBOSS, name='战力首领'}
    end
    if GuanZhiManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_GUANZHI, name='提升官职'}
    end
    if FreeVIPManager.IsHaveQuickTip(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_FREEVIP, name='VIP奖励'}
    end
    if OfflineHuWeiManager.IsHaveQuickTipUpgrade(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_ZCD, name='护卫升级'}
    end
    if OfflineHuWeiManager.IsHaveQuickTipReward(actor) then
        infolist[#infolist+1] = {id=CommonDefine.QUICK_GOTO_ZCD, name='离线奖励'}
    end
end

function TopIcon.ShowQuickInfoTipPanel(actor)
    local funcinfolist = {}
    FillRedPointFunctionInfoList(actor, funcinfolist)

    delbutton(actor, 108, 996)
    local idstr1 = ''
    local strPanelInfo = '<Img|id=5100|children={5101,5102,5110}|x=160|y=-430|img=private/cc_quicktip/2.png>'..
        '<Layout|id=5101|x=130|y=0|width=80|height=80|link=@topicon_openpanel,'..ICON_HIDE_QUICK_TIP_PANEL..'>'..
        '<Button|id=5102|x=130|y=0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@topicon_openpanel,'..ICON_HIDE_QUICK_TIP_PANEL..'>'
    for seq, value in ipairs(funcinfolist) do
        local currid = 5110 + seq
        if idstr1 ~= '' then
            idstr1 = idstr1..','
        end
        idstr1 = idstr1..currid       
        strPanelInfo = strPanelInfo..'<Button|id='..currid..'|text='..value.name..'|size=18|x=4|y=0|nimg=private/cc_quicktip/3.png|mimg=private/cc_quicktip/3.png|link=@topicon_openpanel,'..
            ICON_QUICK_TIP_GOTO..','..value.id..'>'    
    end
    strPanelInfo = strPanelInfo..'<ListView|id=5110|children={'..idstr1..'}|x=4.0|y=4.0|width=120|height=180|margin=0|direction=1>'        
    addbutton(actor, 108, 996, strPanelInfo)
end

function TopIcon.DoQuickInfoTipGoTo(actor, gotoid) 
    if BF_IsNullObj(actor) or (gotoid == nil) then
        return
    end
    Player.QuickGoTo(actor, gotoid)
    TopIcon.HideQuickInfoTipPanel(actor)
end

function TopIcon.CheckQuickInfoTip(actor)
    if Player.GetLevel(actor) < CommonDefine.SHOW_QUICK_TIP_MIN_LEVEL then
        return
    end

    delbutton(actor, 108, 997)
    if EquipPosStrengthManager.IsHaveQuickTip(actor) or 
        SoulStoneManager.IsHaveQuickTip(actor) or 
        BaoZhuManager.IsHaveQuickTip(actor) or
        YunBiaoManager.IsHaveQuickTip(actor) or
        SingleBossManager.IsHaveQuickTip(actor) or
        BaoZhuBossManager.IsHaveQuickTip(actor) or
        RandomBossManager.IsHaveQuickTip(actor) or
        MoFangZhenManager.IsHaveQuickTip(actor) or
        GuanZhiManager.IsHaveQuickTip(actor) or
        FreeVIPManager.IsHaveQuickTip(actor) or
        OfflineHuWeiManager.IsHaveQuickTipUpgrade(actor) or
        OfflineHuWeiManager.IsHaveQuickTipReward(actor) then

        local buttonstr = '<Button|x=210|y=-240|nimg=private/cc_quicktip/1.png|link=@topicon_openpanel,'..ICON_SHOW_QUICK_TIP_PANEL..'>'
        addbutton(actor, 108, 997, buttonstr)    
    end
end

function TopIcon.InnerGMModePanel(actor)
    if getgmlevel(actor) == 0 then
        return
    end
    local sPanelStr = '<Button|x=40|y=30|nimg=public/bg_hhzy_01_3.png|text=等级加10级|link=@topicon_dogmoper,1>'..
                      '<Button|x=40|y=60|nimg=public/bg_hhzy_01_3.png|text=100w金币10w元宝5k绑元|link=@topicon_dogmoper,2>'..                      
                      '<Button|x=40|y=90|nimg=public/bg_hhzy_01_3.png|text=给五星魂石|link=@topicon_dogmoper,3>'..
                      '<Button|x=40|y=120|nimg=public/bg_hhzy_01_3.png|text=无敌|link=@topicon_dogmoper,4>'..
                      '<Button|x=40|y=150|nimg=public/bg_hhzy_01_3.png|text=各种升级材料加2000|link=@topicon_dogmoper,5>'..
                      '<Button|x=40|y=180|nimg=public/bg_hhzy_01_3.png|text=给粉色灵玉|link=@topicon_dogmoper,6>'..
                      '<Button|x=40|y=210|nimg=public/bg_hhzy_01_3.png|text=学习职业技能|link=@topicon_dogmoper,13>'..                      
                      '<Button|x=40|y=240|nimg=public/bg_hhzy_01_3.png|text=赠送洗炼测试装备|color=253|link=@topicon_dogmoper,999>'..
                      '<Button|x=40|y=270|nimg=public/bg_hhzy_01_3.png|text=增加8000攻击|color=253|link=@topicon_dogmoper,998>'..

                      '<Button|x=200|y=30|nimg=public/bg_hhzy_01_3.png|text=删除主线任务|link=@topicon_dogmoper,102>'..
                      '<Button|x=200|y=60|nimg=public/bg_hhzy_01_3.png|text=初始主线任务|link=@topicon_dogmoper,101>'..                      
                      '<Button|x=200|y=90|nimg=public/bg_hhzy_01_3.png|text=接受主线任务|link=@topicon_dogmoper,103>'..
                      '<Button|x=200|y=120|nimg=public/bg_hhzy_01_3.png|text=完成主线任务|link=@topicon_dogmoper,104>'..
                      '<Button|x=200|y=150|nimg=public/bg_hhzy_01_3.png|text=领奖主线任务|link=@topicon_dogmoper,105>'..
                      '<Button|x=200|y=180|nimg=public/bg_hhzy_01_3.png|text=刷新任务怪|link=@topicon_dogmoper,106>'..
                      '<Button|x=200|y=210|nimg=public/bg_hhzy_01_3.png|text=增加100官职经验|link=@topicon_dogmoper,107>'..
                      
                      '<Button|x=350|y=30|nimg=public/bg_hhzy_01_3.png|text=3次魔方阵|link=@topicon_dogmoper,15>'..                      
                      '<Button|x=350|y=60|nimg=public/bg_hhzy_01_3.png|text=免费VIP升级|link=@topicon_dogmoper,30>'..
                      '<Button|x=350|y=90|nimg=public/bg_hhzy_01_3.png|text=恢复灵玉副本|link=@topicon_dogmoper,17>'..
                      '<Button|x=350|y=120|nimg=public/bg_hhzy_01_3.png|text=刷出战力首领|link=@topicon_dogmoper,18>'..
                      '<Button|x=350|y=150|nimg=public/bg_hhzy_01_3.png|text=设置空血|link=@topicon_dogmoper,31>'..
                      '<Button|x=350|y=180|nimg=public/bg_hhzy_01_3.png|text=未激活回收|link=@topicon_dogmoper,32>'..
                      '<Button|x=350|y=210|nimg=public/bg_hhzy_01_3.png|text=回主城|link=@topicon_dogmoper,9>'..
                      '<Button|x=350|y=240|nimg=public/bg_hhzy_01_3.png|text=打开充值界面|link=@topicon_dogmoper,33>'..
                      '<Button|x=350|y=270|nimg=public/bg_hhzy_01_3.png|text=清空进阶礼包|link=@topicon_dogmoper,34>'..

                      '<Button|x=500|y=30|nimg=public/bg_hhzy_01_3.png|text=设置首充第一天|link=@topicon_dogmoper,150>'..
                      '<Button|x=500|y=60|nimg=public/bg_hhzy_01_3.png|text=设置首充第二天|link=@topicon_dogmoper,151>'..
                      '<Button|x=500|y=90|nimg=public/bg_hhzy_01_3.png|text=设置首充第三天|link=@topicon_dogmoper,152>'..
                      '<Button|x=500|y=120|nimg=public/bg_hhzy_01_3.png|text=设置首充第四天|link=@topicon_dogmoper,153>'..
                      '<Button|x=500|y=150|nimg=public/bg_hhzy_01_3.png|text=清空首充|link=@topicon_dogmoper,154>'..
                      '<Button|x=500|y=180|nimg=public/bg_hhzy_01_3.png|text=模拟充值1元|link=@topicon_dogmoper,155>'..
                      '<Button|x=500|y=210|nimg=public/bg_hhzy_01_3.png|text=模拟充值10元|link=@topicon_dogmoper,156>'..
                      '<Button|x=500|y=240|nimg=public/bg_hhzy_01_3.png|text=模拟充值100元|link=@topicon_dogmoper,157>'

                    --[[                      
                      '<Button|x=200|y=180|nimg=public/bg_hhzy_01_3.png|text=武器升星10级|link=@topicon_dogmoper,7>'..
                      '<Button|x=40|y=210|nimg=public/bg_hhzy_01_3.png|text=清空官职|link=@topicon_dogmoper,8>'..    
                      '<Button|x=40|y=240|nimg=public/bg_hhzy_01_3.png|text=穿戴装备可洗炼|link=@topicon_dogmoper,10>'..
                      
                      '<Button|x=200|y=60|nimg=public/bg_hhzy_01_3.png|text=清空装备小极品|link=@topicon_dogmoper,11>'..
                      '<Button|x=200|y=90|nimg=public/bg_hhzy_01_3.png|text=测试自定义属性|link=@topicon_dogmoper,12>'..                      
                      '<Button|x=200|y=150|nimg=public/bg_hhzy_01_3.png|text=增加500战功|link=@topicon_dogmoper,14>'..                      
                      '<Button|x=350|y=60|nimg=public/bg_hhzy_01_3.png|text=增加八格背包|link=@topicon_dogmoper,16>'..                      
                      
                      '<Button|x=350|y=150|nimg=public/bg_hhzy_01_3.png|text=随机清空地图|link=@topicon_dogmoper,19>'..
                      '<Button|x=350|y=180|nimg=public/bg_hhzy_01_3.png|text=VIP任务变量100|link=@topicon_dogmoper,20>'..
                      '<Button|x=350|y=210|nimg=public/bg_hhzy_01_3.png|text=增加测试属性组|link=@topicon_dogmoper,21>'..
                      '<Button|x=350|y=240|nimg=public/bg_hhzy_01_3.png|text=删除测试属性组|link=@topicon_dogmoper,22>'
                    ]]--
    BF_NPCSayExt(actor, sPanelStr, 650, 350)
end

function TopIcon.DoGmOper(actor, sid)
    if (actor == nil) or (sid == nil) then
        return
    end
    if getgmlevel(actor) == 0 then
        return
    end

    if sid == '1' then
        changelevel(actor, '+', 10)
        Player.FullHPMP(actor)
    elseif sid == '2' then
        changemoney(actor, CommonDefine.ITEMID_GOLD, '+', 1000000, 'DoGmOper', true)
        changemoney(actor, CommonDefine.ITEMID_YB, '+', 100000, 'DoGmOper', true)
        changemoney(actor, CommonDefine.ITEMID_BINDYB, '+', 5000, 'DoGmOper', true)
        changemoney(actor, CommonDefine.ITEMID_MOFANGZHEN_JIFEN, '+', 5000, 'DoGmOper', true)
    elseif sid == '3' then  
        giveitem(actor, '5级红魂石', 12)
        giveitem(actor, '5级绿魂石', 12)
        giveitem(actor, '5级蓝魂石', 12)
        giveitem(actor, '5级黄魂石', 12)  
    elseif sid == '4' then
        gmexecute(actor, 'Superman')
    elseif sid == '5' then
        giveitem(actor, '强化石', 2000)
        giveitem(actor, '升星石', 2000)
        giveitem(actor, '书页', 2000)
        giveitem(actor, '技能秘籍', 2000)
        giveitem(actor, '祝福油', 2000)
        giveitem(actor, '幸运符', 200)
        giveitem(actor, '保底符', 200)        
    elseif sid == '6' then
        giveitem(actor, '鼠灵玉·粉1星', 1)
        giveitem(actor, '牛灵玉·粉1星', 1)
        giveitem(actor, '虎灵玉·粉1星', 1)
        giveitem(actor, '兔灵玉·粉1星', 1)
        giveitem(actor, '龙灵玉·粉1星', 1)
        giveitem(actor, '蛇灵玉·粉1星', 1)
        giveitem(actor, '马灵玉·粉1星', 1)
        giveitem(actor, '羊灵玉·粉1星', 1)
        giveitem(actor, '猴灵玉·粉1星', 1)
        giveitem(actor, '鸡灵玉·粉1星', 1)
        giveitem(actor, '狗灵玉·粉1星', 1)
        giveitem(actor, '猪灵玉·粉1星', 1)
    elseif sid == '7' then
        local equipitem = linkbodyitem(actor, CommonDefine.EQUIPPOS_WEAPON)
        if equipitem ~= '0' then
            local starnum = getitemaddvalue(actor, equipitem, 2, 3, 0)
            setitemaddvalue(actor, equipitem, 2, 3, starnum + 10);
        end 
    elseif sid == '8' then        
        setplaydef(actor, CommonDefine.VAR_U_GUANZHI_LEVEL, 0)
        setplaydef(actor, CommonDefine.VAR_U_GUANZHI_CURREXP, 0)
        delattlist(actor, CommonDefine.ABILITY_GROUP_GUANZHI)
        GuanZhiManager.SetTitle(actor, '')
        recalcabilitys(actor)
    elseif sid == '9' then
        Player.GoMZHome(actor)
    elseif sid == '10' then
        for i = CommonDefine.EQUIPPOS_DRESS, CommonDefine.EQUIPPOS_BOOTS, 1 do       
            if EquipRandomABManager.IsValidEquipPosForRandomAB(i) then
                local equipitem = linkbodyitem(actor, i)
                if not BF_IsNullObj(equipitem) then
                    EquipRandomABManager.InitEquipRandomAB(actor, equipitem, 1)
                end
            end
        end
        recalcabilitys(actor)
    elseif sid == '11' then
        for i = CommonDefine.EQUIPPOS_DRESS, CommonDefine.EQUIPPOS_BOOTS, 1 do
            if EquipRandomABManager.IsValidEquipPosForRandomAB(i) then
                local equipitem = linkbodyitem(actor, i)
                if not BF_IsNullObj(equipitem) then
                    clearitemcustomabil(actor, equipitem, CommonDefine.ITEM_CUSTOMEAB_GROUP_2)
                    refreshitem(actor, equipitem)
                end
            end
        end        
        recalcabilitys(actor)
    elseif sid == '12' then
        local equipitem = linkbodyitem(actor, CommonDefine.EQUIPPOS_WEAPON)
        if not BF_IsNullObj(equipitem) then
            local createABTab = {
                {id=3, value=3, savepos=3, color=250, captionid=1},{id=4, value=10, savepos=4, color=250, captionid=1},
                {id=5, value=3, savepos=5, color=251, captionid=2},{id=6, value=10, savepos=6, color=251, captionid=2},
                {id=7, value=3, savepos=7, color=252, captionid=3},{id=8, value=10, savepos=8, color=252, captionid=3}
            }
            BF_SetCustomEquipABGroup(actor, equipitem, createABTab, CommonDefine.ITEM_CUSTOMEAB_GROUP_2, '[极品属性]:', CSS.CUSTOM_AB_GROUP_COLOR)       
            refreshitem(actor, equipitem)
            recalcabilitys(actor)
        end
    elseif sid == '13' then
        local bJob = Player.GetJob(actor)
        if bJob == CommonDefine.JOB_Z then
            addskill(actor, 3, 0)
            addskill(actor, 7, 0)
            addskill(actor, 12, 0)            
            addskill(actor, 25, 0)
            addskill(actor, 26, 0)
            addskill(actor, 27, 0)
        elseif bJob == CommonDefine.JOB_F then
            addskill(actor, 1, 0)
            addskill(actor, 5, 0)
            addskill(actor, 9, 0)
            addskill(actor, 10, 0)
            addskill(actor, 11, 0)
            addskill(actor, 22, 0)
            addskill(actor, 23, 0)
            addskill(actor, 24, 0)
            addskill(actor, 31, 0)
        elseif bJob == CommonDefine.JOB_D then
            addskill(actor, 2, 0)
            addskill(actor, 6, 0)
            addskill(actor, 13, 0)
            addskill(actor, 14, 0)
            addskill(actor, 15, 0)
            addskill(actor, 17, 0)          
        end
    elseif sid == '14' then
        GuanZhiManager.AddExp(actor, 500)
    elseif sid == '15' then
        local times = getplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES)
        setplaydef(actor, CommonDefine.VAR_J_DAY_MOFANG_LEFT_FREETIMES, times+3)
    elseif sid == '16' then
        local totalbagcount = getbaseinfo(actor, CommonDefine.INFO_BAGCOUNT)
        if totalbagcount < 126 then
            local tempcount = math.min(146, totalbagcount + 8)
            setbagcount(actor, tempcount)
        end
    elseif sid == '17' then
        setplaydef(actor, CommonDefine.VAR_J_DAY_BAOZHU_BOSS_TIMES, 0)
    elseif sid == '18' then
        if RandomBossManager.CreateNewRandomBoss(actor) ~= -1 then
            Player.SendSelfMsg(actor, '战力首领已刷出，请前往首领尊者查看！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        else
            Player.SendSelfMsg(actor, '战力首领已达上限或者玩家战力超过界限！', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
    elseif sid == '19' then
        RandomBossManager.TestClearAllFightingMapInfo()
    elseif sid == '20' then
        for i = 1, FreeVIPManager.MAX_TASK_NUM, 1 do
            local counter = getplaydef(actor, FreeVIPManager.TASK_COUNTER_VARLIST[i]) + 100
            setplaydef(actor, FreeVIPManager.TASK_COUNTER_VARLIST[i], counter)
        end
    elseif sid == '21' then
        addattlist(actor, 'ceshigroup', '=', '3#23#10')
        recalcabilitys(actor)
    elseif sid == '22' then
        delattlist(actor, 'ceshigroup')
        recalcabilitys(actor)
    elseif sid == '30' then
        local currVIPLv = getplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL)
        if currVIPLv < FreeVIPManager.MAX_LEVEL then
            currVIPLv = currVIPLv + 1
            FreeVIPManager.SetVIPLevel(actor, currVIPLv)            
            Player.SendSelfMsg(actor, 'VIP升级到'..currVIPLv, CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        else
            setplaydef(actor, CommonDefine.VAR_U_FREEVIP_LEVEL, 0)
            Player.SendSelfMsg(actor, 'VIP回到'..0, CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
    elseif sid == '31' then
        addhpper(actor, '=', 1)
    elseif sid == '32' then
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_ACTIVATED_AUTORECYCLE, 0)
    elseif sid == '33' then
        Player.QuickGoTo(actor, CommonDefine.QUICK_GOTO_RECHARGE)
    elseif sid == '34' then
        setplaydef(actor, CommonDefine.VAR_T_EXTENDGIFT_REWARDDATA, '')
    elseif sid == '101' then
        TaskManager.AddNewTask(actor, CommonDefine.TASK_LINE_ID_MAIN, 0)
    elseif sid == '102' then
        TaskManager.DeleteTask(actor, CommonDefine.TASK_LINE_ID_MAIN)
    elseif sid == '103' then
        TaskManager.AcceptTask(actor, CommonDefine.TASK_LINE_ID_MAIN)
    elseif sid == '104' then
        TaskManager.FinishTask(actor, CommonDefine.TASK_LINE_ID_MAIN)        
    elseif sid == '105' then
        TaskManager.EndTask(actor, CommonDefine.TASK_LINE_ID_MAIN) 
    elseif sid == '106' then
        local mapidstr = Player.GetMapIDStr(actor)
        local x, y = Player.GetMapXY(actor)
        genmon(mapidstr, x, y, '鸡', 5, 10)
        genmon(mapidstr, x, y, '鹿1', 5, 10)
    elseif sid == '107' then
        GuanZhiManager.AddExp(actor, 100)
    elseif sid == '150' then
        local currday = BF_GetDay(os.time())
        setplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY, currday)
        FirstRecharge.AutoGiveFirstRechargeRewardAtOnce(actor)
    elseif sid == '151' then
        local currday = BF_GetDay(os.time()) - 1
        setplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY, currday)        
    elseif sid == '152' then
        local currday = BF_GetDay(os.time()) - 2
        setplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY, currday)                
    elseif sid == '153' then
        local currday = BF_GetDay(os.time()) - 3
        setplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY, currday)                
    elseif sid == '154' then
        setplaydef(actor, CommonDefine.VAR_U_FIRST_RECHARGE_DAY, 0)        
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD1, 0)
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD2, 0)
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_FIRSTRECHARGE_REWARD3, 0)
    elseif sid == '155' then
        RechargeManager.DoRecharge(actor, 1, 1)
    elseif sid == '156' then
        RechargeManager.DoRecharge(actor, 10, 1)
    elseif sid == '157' then
        RechargeManager.DoRecharge(actor, 100, 1)
    elseif sid == '998' then
        addattlist(actor, CommonDefine.ABILITY_GROUP_TEMPTEST, "=", "3#3#800000|3#4#800000|3#5#8000|3#6#8000|3#7#8000|3#8#8000|")      
        recalcabilitys(actor)
        setplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_COUNTER_DATA, '')        
        setplaydef(actor, CommonDefine.VAR_J_DAY_TREASUREMAP_NO_PANELTIP_FLAG, 0)
        setplaydef(actor, CommonDefine.VAR_J_DAY_BIAOCHE_ACCEPT_TIMES, 0)
    elseif sid == '999' then
        Player.TestSuperInitPlayer(actor)
    end      
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_RESETDAY, TopIcon.InnerExtendPanel, CommonDefine.FUNC_ID_TOPICON)

return TopIcon