require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

local AUTO_ADDLUCK_TARG_MIN = 5     --�Զ�ף������СĿ��
local AUTO_ADDLUCK_TARG_MAX = 9     --�Զ�ף�������Ŀ��
local FAIL_DECLUCK_RATE = 90        --ף��ʧ�ܿ۵ȼ��ĸ��� �ٷֱȷ���

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_WEAPON_ADDLUCK, true) then
        return
    end

    setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 0)
    for i = AUTO_ADDLUCK_TARG_MIN, AUTO_ADDLUCK_TARG_MAX, 1 do
        local checkvar = CommonDefine.CHECK_BOX_VAR[i - AUTO_ADDLUCK_TARG_MIN + 1]
        setplaydef(actor, checkvar, 0)        
    end    
    inner_show_page(actor)
end

--����˵�����
function show_rule_panel(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y    
    local msg = '<Text|text=����ף���Ĺ���˵����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    msg = msg..'<Text|text=������һ��|x='..(tempCurrX+400)..'|y='..tempCurrY..'|size=15|color='..CSS.NPC_YELLOW..'|link=@main>'
    tempCurrY = tempCurrY + 35
    msg = msg..'<Text|text=1������ף��ֻ��Ե�ǰ�Ѿ�������װ�����ܽ��в�����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25    
    msg = msg..'<Text|text=2��ף������ף���ͣ����гɹ����ʵ��趨���ɹ�������+1��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=ʧ�����м��ʵ����˵ȼ���|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25    
    msg = msg..'<Text|text=3��������ֵԽ�ߣ����ɫ�ڹ���ʱԽ�ܷ�����������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'    
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=4������ʹ�����˷������ӳɹ����ʻ���ʹ�ñ��׷�������ʧ|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 25
    msg = msg..'<Text|text=�ܺ�����˽��͡�|x='..(tempCurrX+26)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'        
    BF_NPCSayExt(actor,msg)
end

function inner_show_page(actor)
    local strPanelInfo = '';
    local weaponitem = linkbodyitem(actor, CommonDefine.EQUIPPOS_WEAPON)
    if (weaponitem == nil) or (weaponitem == '0') then
        strPanelInfo = '<Img|id=10|children={11,12,13}|x=4.0|y=5.0|show=0|loadDelay=0|move=0|img=private/cc_weaponaddluck/1.png|esc=1|reset=1|bg=1>'..
            '<Layout|id=11|x=813.0|y=14.0|width=80|height=80|link=@exit>'..
            '<Button|id=12|x=814.0|y=14.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
            '<Text|id=13|text=��    ʾ:   ֻ�д����������ܽ���ף��|x=200|y=240|size=22|color='..CSS.NPC_WHITE..'>'        
    else
        strPanelInfo = weapon_addluck_str(actor, weaponitem)
    end
    BF_ShowSpecialUI(actor, strPanelInfo)
end

--������ף�������Ϣ
function weapon_addluck_str(actor, weaponitem)
    local currLuckLevel = getitemintparam(actor, CommonDefine.EQUIPPOS_WEAPON, CommonDefine.ITEM_INTVAR_ADDLUCK_LV)
    if (currLuckLevel==nil) or (currLuckLevel < 0) then
        currLuckLevel = 0
    end
    local nextLuckLevel = currLuckLevel + 1
    local bCurrIsMaxLv = false
    local cfgCurrKey = currLuckLevel
    if cfgWeaponLuck[cfgCurrKey] == nil then
        release_print("weapon_addluck_str no config key:"..cfgCurrKey)
        return ''
    end
    local cfgNextKey = nextLuckLevel
    if cfgWeaponLuck[cfgNextKey] == nil then
        bCurrIsMaxLv = true
    end

    local weaponname = getiteminfo(actor, weaponitem, CommonDefine.ITEMINFO_SRCNAME)
    local weaponcolor = Item.GetItemQualityColor(actor, weaponitem)
    local sPanelStr = '<Img|id=10|children={11,12,13,14,15,16,17}|x=4.0|y=5.0|show=0|loadDelay=0|move=0|img=private/cc_weaponaddluck/1.png|esc=1|reset=1|bg=1>'..
        '<Layout|id=11|x=813.0|y=14.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=814.0|y=14.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
        '<Layout|id=13|children={30,31,32,33,35,36,37,41,42,43,45,46,47}|x=64.0|y=56.0|width=728|height=240|color=47>'
        
    sPanelStr = sPanelStr..'<Text|id=17|text='..weaponname..'|size=22|x=360|y=60|color='..weaponcolor..'>'
    --��ǰף���ȼ�������    
    local tempLeftX = 120
    local tempLeftY = 50
    sPanelStr = sPanelStr..'<Text|id=31|text=��ǰף���ȼ���|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'..
                           '<Text|id=32|text='..currLuckLevel..'|x='..(tempLeftX+120)..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
    tempLeftY = tempLeftY + 30
    sPanelStr = sPanelStr..'<Text|id=33|text=����ֵ:'..currLuckLevel..'|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
    --��һף���ȼ�������
    local tempRightX = 460
    local tempRightY = 50
    if bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|text=�Ѵﵽ����|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
        tempRightY = tempRightY + 30
    else
        sPanelStr = sPanelStr..'<Text|id=35|text=��һף���ȼ���|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'..
                               '<Text|id=36|text='..nextLuckLevel..'|x='..(tempRightX+120)..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'    
        tempRightY = tempRightY + 30
        sPanelStr = sPanelStr..'<Text|id=37|text=����ֵ:'..nextLuckLevel..'|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
    end

    --�ȼ����ƺ�ǿ������
    local tempCurrY = math.max(tempLeftY, tempRightY)
    tempCurrY = tempCurrY + 40    
    sPanelStr = sPanelStr..'<Img|id=30|x=15|y='..tempCurrY..'|width=700|height=4|esc=0|img=private/cc_common/line_1.png>'
    local tempCurrX = 100    
    tempCurrY = tempCurrY + 30  
    if not bCurrIsMaxLv then
        local sConsumeInfo = BF_GetItemTableDescStr(actor, cfgWeaponLuck[cfgCurrKey].needitems_tab)
        sPanelStr = sPanelStr..'<Text|id=41|text=ף�����ģ�'..sConsumeInfo..'|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'

        local currNum = Player.GetItemNumInBag(actor, CommonDefine.ITEMID_XINYUNFU)
        local strTemp1 = ''
        local strTemp2 = ''
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_XYF) == 1 then
            strTemp1 = '������'
            strTemp2 = 'ͣ��'
        else
            strTemp1 = 'ͣ����'
            strTemp2 = '����'
        end
        sPanelStr = sPanelStr..'<Text|id=42|text=���˷�('..CommonDefine.ADDLUCK_USE_XYF_NUM..'/'..currNum..') '..strTemp1..'|x='..(tempCurrX+350)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'..
                    '<Button|id=43|text='..strTemp2..'|x='..(tempCurrX+550)..'|y='..(tempCurrY-6)..'|mimg=private/cc_common/button_2.png|nimg=private/cc_common/button_2.png|color='..
                    CSS.NPC_LIGHTGREEN..'|link=@switch_xyf_flag>'
    end
    tempCurrY = tempCurrY + 40

    if not bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|id=45|text=�ɹ����ʣ�'..cfgWeaponLuck[cfgCurrKey].successrate ..'% |x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'>'

        local currNum = Player.GetItemNumInBag(actor, CommonDefine.ITEMID_BAODIFU)
        local strTemp1 = ''
        local strTemp2 = ''
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_BDF) == 1 then
            strTemp1 = '������'
            strTemp2 = 'ͣ��'
        else
            strTemp1 = 'ͣ����'
            strTemp2 = '����'
        end
        sPanelStr = sPanelStr..'<Text|id=46|text=���׷�('..CommonDefine.ADDLUCK_USE_BDF_NUM..'/'..currNum..') '..strTemp1..'|x='..(tempCurrX+350)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'..
                    '<Button|id=47|text='..strTemp2..'|x='..(tempCurrX+550)..'|y='..(tempCurrY-6)..'|mimg=private/cc_common/button_2.png|nimg=private/cc_common/button_2.png|color='..
                    CSS.NPC_LIGHTGREEN..'|link=@switch_bdf_flag>'        
    end
    tempCurrY = tempCurrY + 20

    --��ⰴť
    tempCurrY = 30
    local nStartX = 80    
    local nStartY = tempCurrY + 25
    for i = AUTO_ADDLUCK_TARG_MIN, AUTO_ADDLUCK_TARG_MAX, 1 do
        local seq = i - AUTO_ADDLUCK_TARG_MIN + 1
        local checkvar = CommonDefine.CHECK_BOX_VAR[seq]
        local flag = getplaydef(actor, checkvar)
        local checkboxid = 50 + seq
        local textid = 60 + seq
        sPanelStr = sPanelStr..'<CheckBox|id='..checkboxid..'|x='..nStartX..'|y='..nStartY..'|nimg=private/cc_common/checkbox_1.png|pimg=private/cc_common/checkbox_2.png|checkboxid='..
            checkvar..'|default='..flag..'|delay=0|count=1|link=@set_autoaddluck_targ,'..i..'>'..
            '<Text|id='..textid..'|text=����+'..i..'|x='..(nStartX+30)..'|y='..(nStartY+5)..'|color='..CSS.NPC_YELLOW..'>'
        nStartX = nStartX + 120
    end
    sPanelStr = sPanelStr..'<Text|id=50|text=�Զ�ף��ѡ�|x=30|y=10|size=20|color='..CSS.NPC_WHITE..'>'
    sPanelStr = sPanelStr..'<Img|id=14|children={50,51,52,53,54,55,61,62,63,64,65}|x=64.0|y=296.0|width=728|esc=0|img=private/cc_weaponaddluck/5.png>'

    --������ť
    tempCurrY = 430
    if bCurrIsMaxLv then
        sPanelStr = sPanelStr..'<Text|id=15|text=�Ѵﵽ���ף���ȼ���|x=300|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    else
        --sPanelStr = sPanelStr..'<Text|text=ף��һ��|x=100|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@weapon_addluck_once>'
        sPanelStr = sPanelStr..'<Button|id=15|x=200|y='..tempCurrY..'|mimg=private/cc_common/button_1.png|color=255|nimg=private/cc_common/button_1.png|size=18|text=ף��һ��|link=@weapon_addluck_once>'        
        
        if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG) == 0 then
            --sPanelStr = sPanelStr..'<Text|text=�Զ�ף��|x=300|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@weapon_auto_addluck>'            
            sPanelStr = sPanelStr..'<Button|id=16|x=500|y='..tempCurrY..'|mimg=private/cc_common/button_1.png|color=255|nimg=private/cc_common/button_1.png|size=18|text=�Զ�ף��|link=@weapon_auto_addluck>'
        else
            --sPanelStr = sPanelStr..'<Text|text=ֹͣף��|x=300|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'|link=@weapon_auto_addluck_stop>'
            sPanelStr = sPanelStr..'<Button|id=16|x=500|y='..tempCurrY..'|mimg=private/cc_common/button_1.png|color=255|nimg=private/cc_common/button_1.png|size=18|text=ֹͣף��|link=@weapon_auto_addluck_stop>'
        end
    end

    return sPanelStr
end

--�л����˷�ʹ��״̬
function switch_xyf_flag(actor)
    local status = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_XYF)
    if status == 1 then
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_XYF, 0)
    else
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_XYF, 1)
    end
    inner_show_page(actor)
end

--�л����׷�ʹ��״̬
function switch_bdf_flag(actor)
    local status = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_BDF)
    if status == 1 then
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_BDF, 0)
    else
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_BDF, 1)
    end
    inner_show_page(actor)
end

--�����Զ�ף����Ŀ��
function set_autoaddluck_targ(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    local seq = tonumber(sid)
    if (seq < AUTO_ADDLUCK_TARG_MIN) or (seq > AUTO_ADDLUCK_TARG_MAX) then
        return
    end

    for i = AUTO_ADDLUCK_TARG_MIN, AUTO_ADDLUCK_TARG_MAX, 1 do
        if i ~= seq then
            local checkvar = CommonDefine.CHECK_BOX_VAR[i - AUTO_ADDLUCK_TARG_MIN + 1]
            setplaydef(actor, checkvar, 0)            
        end
    end
    inner_show_page(actor)
end

--����ף��һ��
function weapon_addluck_once(actor)
    if BF_IsNullObj(actor) then
        return
    end
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_WEAPON_ADDLUCK, false) then
        return
    end
    local weaponitem = linkbodyitem(actor, CommonDefine.EQUIPPOS_WEAPON)
    if BF_IsNullObj(weaponitem) then
        return
    end

    local currLuckLevel = getitemintparam(actor, CommonDefine.EQUIPPOS_WEAPON, CommonDefine.ITEM_INTVAR_ADDLUCK_LV)
    if (currLuckLevel==nil) or (currLuckLevel < 0) then
        currLuckLevel = 0
    end
    local nextLuckLevel = currLuckLevel + 1
    local cfgCurrKey = currLuckLevel
    if cfgWeaponLuck[cfgCurrKey] == nil then
        return
    end
    local cfgNextKey = nextLuckLevel
    if cfgWeaponLuck[cfgNextKey] == nil then
        Player.SendSelfMsg(actor, '��ǰף���Ѵﵽ���ޣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    if not Player.CheckItemsEnough(actor, cfgWeaponLuck[cfgCurrKey].needitems_tab, 'ף��') then
        return
    end
    --�ж����˷�
    local bUseXinYunFuFlag = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_XYF)
    if bUseXinYunFuFlag == 1 then
        if Player.GetItemNumInBag(actor, CommonDefine.ITEMID_XINYUNFU) < CommonDefine.ADDLUCK_USE_XYF_NUM then
            Player.SendSelfMsg(actor, '���˷����㣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
    end
    --�жϱ��׷�
    local bUseBaoDiFuFlag = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_BDF)
    if bUseBaoDiFuFlag == 1 then
        if Player.GetItemNumInBag(actor, CommonDefine.ITEMID_BAODIFU) < CommonDefine.ADDLUCK_USE_BDF_NUM then
            Player.SendSelfMsg(actor, '���׷����㣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
    end    

    --�۳�����
    Player.TakeItems(actor, cfgWeaponLuck[cfgCurrKey].needitems_tab, '����ף��')

    if bUseXinYunFuFlag == 1 then
        local itemname = getstditeminfo(CommonDefine.ITEMID_XINYUNFU, CommonDefine.STDITEMINFO_NAME)
        takeitem(actor, itemname, CommonDefine.ADDLUCK_USE_XYF_NUM)
    end

    if bUseBaoDiFuFlag == 1 then
        local itemname = getstditeminfo(CommonDefine.ITEMID_BAODIFU, CommonDefine.STDITEMINFO_NAME)
        takeitem(actor, itemname, CommonDefine.ADDLUCK_USE_BDF_NUM)
    end    

    local successrate = cfgWeaponLuck[cfgCurrKey].successrate
    if bUseXinYunFuFlag == 1 then
        successrate = successrate + CommonDefine.ADDLUCK_USE_XYF_ADDRATE
    end
    if successrate >= math.random(1, 100) then
        --ף���ɹ�    
        currLuckLevel = currLuckLevel + 1
        setitemintparam(actor, CommonDefine.EQUIPPOS_WEAPON, CommonDefine.ITEM_INTVAR_ADDLUCK_LV, currLuckLevel)
        updatecustitemparam(actor, CommonDefine.EQUIPPOS_WEAPON)
        setitemaddvalue(actor, weaponitem, 1, CommonDefine.ITEMADDVALUE_TYPE1_LUCK, currLuckLevel)  
        refreshitem(actor, weaponitem)
        recalcabilitys(actor)        

        Player.SendSelfMsg(actor, 'ף���ɹ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    else
        --ף��ʧ��
        if bUseBaoDiFuFlag ~= 1 then
            --û�б��׻ή�� �����ʿ�����
            if math.random(1, 100) <= FAIL_DECLUCK_RATE then
                currLuckLevel = math.max(currLuckLevel - 1, 0)            
                setitemintparam(actor, CommonDefine.EQUIPPOS_WEAPON, CommonDefine.ITEM_INTVAR_ADDLUCK_LV, currLuckLevel)
                updatecustitemparam(actor, CommonDefine.EQUIPPOS_WEAPON)
                setitemaddvalue(actor, weaponitem, 1, CommonDefine.ITEMADDVALUE_TYPE1_LUCK, currLuckLevel)  
                refreshitem(actor, weaponitem)
                recalcabilitys(actor)             
            end
        end
        Player.SendSelfMsg(actor, 'ף��ʧ�ܣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)                     
    end

    inner_show_page(actor)
end

--�����Զ�ף��
function weapon_auto_addluck(actor)
    if BF_IsNullObj(actor) then
        return
    end
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_WEAPON_ADDLUCK, false) then
        return
    end

    local weaponitem = linkbodyitem(actor, CommonDefine.EQUIPPOS_WEAPON)
    if BF_IsNullObj(weaponitem) then
        return
    end    

    local currLuckLevel = getitemintparam(actor, CommonDefine.EQUIPPOS_WEAPON, CommonDefine.ITEM_INTVAR_ADDLUCK_LV)
    if (currLuckLevel==nil) or (currLuckLevel < 0) then
        currLuckLevel = 0
    end
    
    local nextLuckLevel = currLuckLevel + 1
    local cfgCurrKey = currLuckLevel
    if cfgWeaponLuck[cfgCurrKey] == nil then
        return
    end
    local cfgNextKey = nextLuckLevel
    if cfgWeaponLuck[cfgNextKey] == nil then
        Player.SendSelfMsg(actor, '��ǰף���Ѵﵽ���ޣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    if not Player.CheckItemsEnough(actor, cfgWeaponLuck[cfgCurrKey].needitems_tab, 'ף��') then
        return
    end

    --�ж����˷�
    local bUseXinYunFuFlag = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_XYF)
    if bUseXinYunFuFlag == 1 then
        if Player.GetItemNumInBag(actor, CommonDefine.ITEMID_XINYUNFU) < CommonDefine.ADDLUCK_USE_XYF_NUM then
            Player.SendSelfMsg(actor, '���˷����㣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
    end

    --�жϱ��׷�
    local bUseBaoDiFuFlag = getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_USE_BDF)
    if bUseBaoDiFuFlag == 1 then
        if Player.GetItemNumInBag(actor, CommonDefine.ITEMID_BAODIFU) < CommonDefine.ADDLUCK_USE_BDF_NUM then
            Player.SendSelfMsg(actor, '���׷����㣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
    end 

    
    local targLuckLevel = 0
    for i = AUTO_ADDLUCK_TARG_MIN, AUTO_ADDLUCK_TARG_MAX, 1 do
        local checkvar = CommonDefine.CHECK_BOX_VAR[i - AUTO_ADDLUCK_TARG_MIN + 1]
        if getplaydef(actor, checkvar) == 1 then
            targLuckLevel = i
            break
        end
    end

    if currLuckLevel < targLuckLevel then
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 1)
        weapon_addluck_once(actor) 

        local npcobj = getcurrnpc(actor)
        if not BF_IsNullObj(npcobj) then
            local npcid = getnpcindex(npcobj)
            callfunbynpc(actor, npcid, 1000, 'weapon_auto_addluck', '') 
        end        
    end
end

--ֹͣ�����Զ�ף��
function weapon_auto_addluck_stop(actor)
    for i = AUTO_ADDLUCK_TARG_MIN, AUTO_ADDLUCK_TARG_MAX, 1 do
        local checkvar = CommonDefine.CHECK_BOX_VAR[i - AUTO_ADDLUCK_TARG_MIN + 1]
        setplaydef(actor, checkvar, 0)        
    end
    setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 0)
    inner_show_page(actor)
end