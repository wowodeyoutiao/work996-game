EquipPosStarManager = {}

--functionid
local EQUIPPOS_STAR_BUTTONFUNC_ID_1 = 1           --�л����ǵ�װ��λ
local EQUIPPOS_STAR_BUTTONFUNC_ID_2 = 2           --����һ��
local EQUIPPOS_STAR_BUTTONFUNC_ID_3 = 3           --�Զ�����
local EQUIPPOS_STAR_BUTTONFUNC_ID_4 = 4           --ֹͣ����
local EQUIPPOS_STAR_BUTTONFUNC_ID_5 = 5           --�����Զ����ǵ�Ŀ���Ǽ�

EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN = 4      --�Զ����ǵ���СĿ��
EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX = 15     --�Զ����ǵ����Ŀ��

--�Ƿ�Ϊ��Ч������װ��λ
function EquipPosStarManager.IsValidEquipPosForUpgradeStar(pos)
    if pos == nil then
        return false
    end
	for _, value in pairs(CommonDefine.BASE_EQUIPMENT_POS) do
		if value == pos then
			return true
		end
	end    
    return false
end

function EquipPosStarManager.GetUpgradeStarCfgKey(job, pos, level)
    return job * 100000 + pos * 1000 + level
end

--���ز�λ�Ǽ��ļӳ������ַ���,  '#job#id#value|#job#id#value'
local function GetEquipPosStarAddAbilityStr(actor, pos, equipitem, cfgStarCurrKey)
    local strAddAbility = ''
    if (actor==nil) or (pos==nil) or (equipitem==nil) then
        return strAddAbility
    end
    --ȡװ���Ļ�������    
    local baseABTab = {}
    local itemid = getiteminfo(actor, equipitem, CommonDefine.ITEMINFO_ITEMIDX)
    for i = CommonDefine.ABILITYID_MIN_DC, CommonDefine.ABILITYID_MAX_MAC, 1 do
        local abvalue = getstditematt(itemid, i)
        if abvalue > 0 then
            local skey = ''..i
            baseABTab[skey] = {id=i, value=abvalue}
        end
    end

    --ȡװ��λ��ǿ������
    local finalABTab = {}
    local currStrengthKey = EquipPosStrengthManager.GetPlayerCfgKey(actor, pos)
    if currStrengthKey >= 0 then    
        if (cfgEquipPosStrength[currStrengthKey] ~= nil) and (cfgEquipPosStrength[currStrengthKey].addprop_tab ~= nil) then
            finalABTab = BF_MergeAbilityTables(baseABTab, cfgEquipPosStrength[currStrengthKey].addprop_tab)
        end
    end
    
    for _, abinfo in pairs(cfgEquipPosUpgradeStar[cfgStarCurrKey].addprop_tab) do
        local addPercentPairTab = CommonDefine.ADD_PERCENT_ABILITY_PAIR[abinfo.id]
        if (addPercentPairTab ~= nil) and (not table.isempty(addPercentPairTab)) then
            for _, baseABInfo in pairs(finalABTab) do
                for i = 1, #addPercentPairTab, 1 do
                    if addPercentPairTab[i] == baseABInfo.id then
                        local addvalue = math.floor(baseABInfo.value * abinfo.value / 100)                 
                        if addvalue > 0 then
                            if strAddAbility ~= '' then
                                strAddAbility = strAddAbility..'|'
                            end
                            strAddAbility = strAddAbility..'#3#'..baseABInfo.id..'#'..addvalue
                        end                        
                    end
                end
            end
        end          
    end    

    return strAddAbility
end

--����ָ��װ��λ��װ���Ǽ�������
function EquipPosStarManager.UpdateEquipStarLvInPos(actor, pos)
	if (actor == nil) or (pos == nil) then
		return
	end		
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    if infoStr == '' then
		return        
    end
	if not EquipPosStarManager.IsValidEquipPosForUpgradeStar(pos) then
		return
	end
	local equipitem = linkbodyitem(actor, pos)
	if equipitem == '0' then
		return
	end
	local infoTab = json2tbl(infoStr)
	if (infoTab == nil) or table.isempty(infoTab) then
		return
	end

	local sid = ''..pos
	local curPosLevel = 0
    if infoTab[sid] ~= nil then
        curPosLevel = infoTab[sid]
    end
    if curPosLevel <= 0 then
        return
    end

    local bJob = Player.GetJob(actor)
    local cfgCurrKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, pos, curPosLevel)
    if cfgEquipPosUpgradeStar[cfgCurrKey] == nil then
        return
    end

	--�����Զ�����Ǽ�����չ����
    local sGroupShowName = '['..CommonDefine.EQUIPPOS_NAME[pos]..'��λ�Ǽ�]: +'..curPosLevel	
	BF_SetCustomEquipABGroup(actor, equipitem, cfgEquipPosUpgradeStar[cfgCurrKey].addprop_tab, CommonDefine.ITEM_CUSTOMEAB_GROUP_1, sGroupShowName, 253)
    setitemaddvalue(actor, equipitem, 2, 3, curPosLevel);
    
    --�����Ǽ��ļӳ����Զ��ڶ�Ӧװ��λ��װ������������+ǿ�����ԡ��İٷֱ�ǿ����ʵ�ʼӳ����Ե�
    local strAddAbility = GetEquipPosStarAddAbilityStr(actor, pos, equipitem, cfgCurrKey)
    if strAddAbility ~= '' then
        local sGroupName = CommonDefine.EQUIPPOS_ADDAB_GROUP_NAME[pos]
        if (sGroupName ~= nil) and (sGroupName ~= '') then
            addattlist(actor, sGroupName,"=",strAddAbility)
        end                
    end

    refreshitem(actor, equipitem)
    recalcabilitys(actor)	
end

--���ָ��װ��λ��װ�����Ǽ�������
function EquipPosStarManager.ClearEquipStarLvInPos(actor, equippos)
	if (actor == nil) or (equippos == nil) then
		return
	end
	local equipitem = linkbodyitem(actor, equippos)
    EquipPosStarManager.ClearEquipStarLv(actor, equipitem, equippos)
end

--���ָ��װ��λ��װ�����Ǽ�������
function EquipPosStarManager.ClearEquipStarLv(actor, equipitem, equippos)
	if (actor == nil) or (equipitem == nil) or (equipitem == '0') or (equippos == nil) then
		return
	end

	--����Զ�����Ǽ�����չ����
	clearitemcustomabil(actor, equipitem, CommonDefine.ITEM_CUSTOMEAB_GROUP_1)
    setitemaddvalue(actor, equipitem, 2, 3, 0);
    --����ӳɵ��������ϵ�������
    local sGroupName = CommonDefine.EQUIPPOS_ADDAB_GROUP_NAME[equippos]
    if (sGroupName ~= nil) and (sGroupName ~= '') then
        delattlist(actor, sGroupName)
    end

    refreshitem(actor, equipitem)
    recalcabilitys(actor)    
end

--�������ָ��װ��λ��Ӧ����������key
function EquipPosStarManager.GetPlayerCfgKey(actor, pos)
	if (actor == nil) or (pos == nil) then
		return -1
	end		
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    if infoStr == '' then
		return -1     
    end
	if not EquipPosStarManager.IsValidEquipPosForUpgradeStar(pos) then
		return -1
	end
	local infoTab = json2tbl(infoStr)
	if (infoTab == nil) or table.isempty(infoTab) then
		return -1
	end

	local sid = ''..pos
	local curPosLevel = 0
    if infoTab[sid] ~= nil then
        curPosLevel = infoTab[sid]
    end
    if curPosLevel <= 0 then
        return -1
    end

    local bJob = Player.GetJob(actor)
    return EquipPosStarManager.GetUpgradeStarCfgKey(bJob, pos, curPosLevel)
end

--��ҵ�¼ʱ����
function EquipPosStarManager.OnPlayerEnterGame(actor)
    for pos, groupname in pairs(CommonDefine.EQUIPPOS_ADDAB_GROUP_NAME) do
        local equipitem = linkbodyitem(actor, pos)
        if equipitem ~= '0'then
            local itemid = getiteminfo(actor, equipitem, CommonDefine.ITEMINFO_ITEMIDX) 
            local cfgCurrKey = EquipPosStarManager.GetPlayerCfgKey(actor, pos)
            if cfgCurrKey ~= -1 then
                local strAddAbility = GetEquipPosStarAddAbilityStr(actor, pos, equipitem, cfgCurrKey)
                if strAddAbility ~= '' then
                    addattlist(actor, groupname, "=", strAddAbility)
                end                 
            end          
        end
    end
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERGAME, EquipPosStarManager.OnPlayerEnterGame, CommonDefine.FUNC_ID_EQUIPPOS_STAR)







--��ʾ�������
function EquipPosStarManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=��λ���ǹ���˵��:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1�����ǵ����Ի����װ����λ�ϣ�����װ����������Ч|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=2�����ĸ���װ����װ���ĸ�������Ӱ�����е���������Ч��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=3�����Ǿ��гɹ��ʣ�ʧ�ܽ�����ǣ�ʹ�����Ƿ�����������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    BF_ShowSpecialUI(actor, strPanelInfo)
end

local function GetSingleEquipPosShowInfo(actor, equippos)
    local sPanelStr = ''
    if (not BF_IsNullObj(actor)) then   
        local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)

        local infoTab = {}
        if infoStr ~= '' then
            infoTab = json2tbl(infoStr)
        end
        local sid = equippos..''
        if infoTab[sid] == nil then
            infoTab[sid] = 0
            infoStr = tbl2json(infoTab)
            setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
        end
        local curPosLevel = infoTab[sid]
        if curPosLevel < 0 then
            return sPanelStr
        end
        local nextPosLevel = curPosLevel + 1
        local bCurrIsMaxLv = false       
        local bJob = Player.GetJob(actor)
        local cfgCurrKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, equippos, curPosLevel)
        if cfgEquipPosUpgradeStar[cfgCurrKey] == nil then
            release_print("GetSingleEquipPosShowInfo no config key:"..cfgCurrKey)
            return sPanelStr
        end
        local cfgNextKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, equippos, nextPosLevel)
        if cfgEquipPosUpgradeStar[cfgNextKey] == nil then
            bCurrIsMaxLv = true
        end        
        
        sPanelStr = sPanelStr..'<Layout|id=15|children={101,102,120,140,160,500}|x=200.0|y=65.0|width=580|height=420>'..
            '<Img|id=101|x=-4.0|y=200.0|height=5|img=private/cc_common/pic_line_1.png>'..
            '<Img|id=102|x=-4.0|y=300.0|height=5|img=private/cc_common/pic_line_1.png>'

        --��ǰ�Ǽ�
        local startid = 120
        local idstr = startid..','..(startid+1)..','..(startid+2)..','..(startid+3)
        local tempLeftX = 40
        local tempLeftY = 20
        sPanelStr = sPanelStr..'<Text|id='..(startid+1)..'|text=��ǰ�Ǽ���|size=20|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_YELLOW..'>'..
                               '<Text|id='..(startid+2)..'|text='..curPosLevel..'��|size=20|x='..(tempLeftX+100)..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
        tempLeftY = tempLeftY + 40
        sPanelStr = sPanelStr..'<Text|id='..(startid+3)..'|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'|size=18|text=���Լӳɣ�>'
        local currPropDescTable = cfgEquipPosUpgradeStar[cfgCurrKey].addprop_desctab
        for seq, descItem in ipairs(currPropDescTable) do
            local textid = startid + 10 + seq
            idstr = idstr..','..textid
            tempLeftY = tempLeftY + 30
            sPanelStr = sPanelStr..'<Text|id='..textid..'|text='..descItem.desc..'|size=18|x='..tempLeftX..'|y='..tempLeftY..'|color='..CSS.NPC_WHITE..'>'
        end
        sPanelStr = sPanelStr..'<Layout|id='..startid..'|children={'..idstr..'}|x=30.0|y=0|width=240|height=180>'                    

        --��һ�Ǽ�
        startid = 140
        idstr =  startid..','..(startid+1)..','..(startid+2)..','..(startid+3)
        local tempRightX = 40
        local tempRightY = 20
        if bCurrIsMaxLv then
            sPanelStr = sPanelStr..'<Text|id='..(startid+1)..'|text=�Ѵﵽ�Ǽ�����|size=20|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'
            tempRightY = tempRightY + 30
        else
            sPanelStr = sPanelStr..'<Text|id='..(startid+1)..'|text=��һ�Ǽ���|size=20|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_YELLOW..'>'..
                                   '<Text|id='..(startid+2)..'|text='..nextPosLevel..'��|size=20|x='..(tempRightX+100)..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
            tempRightY = tempRightY + 40
            sPanelStr = sPanelStr..'<Text|id='..(startid+3)..'|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'|size=18|text=���Լӳɣ�>'         
            local nextPropDescTable =  cfgEquipPosUpgradeStar[cfgNextKey].addprop_desctab
            for seq, descItem in ipairs(nextPropDescTable) do
                local textid = startid + 10 + seq
                idstr = idstr..','..textid
                tempRightY = tempRightY + 30
                sPanelStr = sPanelStr..'<Text|id='..textid..'|size=18|text='..descItem.desc..'|x='..tempRightX..'|y='..tempRightY..'|color='..CSS.NPC_WHITE..'>'
            end
        end
        sPanelStr = sPanelStr..'<Layout|id='..startid..'|children={'..idstr..'}|x=330.0|y=0|width=240|height=180>'       

        --����
        local tempX = 150
        local tempY = 30
        sPanelStr = sPanelStr..'<Layout|id=160|children={161,162}|x=0|y=200.0|width=580|height=110>'
        if not bCurrIsMaxLv then            
            sPanelStr = sPanelStr..'<Text|id=161|text=���ǳɹ����ʣ�'..cfgEquipPosUpgradeStar[cfgCurrKey].successrate ..'%|size=20|x='..tempX..'|y='..tempY..'|color='..CSS.NPC_YELLOW..'>'
            tempY = tempY + 30
            local sConsumeInfo = BF_GetItemTableDescStr(actor, cfgEquipPosUpgradeStar[cfgCurrKey].needitems_tab)
            sPanelStr = sPanelStr..'<Text|id=162|text=�������ģ�'..sConsumeInfo..'|size=20|x='..tempX..'|y='..tempY..'|color='..CSS.NPC_YELLOW..'>'
        end

        --���ǰ�ť
        idstr = '501,502'
        if bCurrIsMaxLv then
            sPanelStr = sPanelStr..'<Text|id=501|text=����������״̬��|x=200|y=30|color='..CSS.NPC_LIGHTGREEN..'>'
        else
            local tempCurrY = 10
            sPanelStr = sPanelStr..'<Button|id=501|x=120|y='..tempCurrY..'|mimg=private/cc_equip_star/1.png|nimg=private/cc_equip_star/1.png|link=@equippos_star_button,'..            
                EQUIPPOS_STAR_BUTTONFUNC_ID_2..'>'
            if getflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG) == 0 then
                sPanelStr = sPanelStr..'<Button|id=502|x=350|y='..tempCurrY..'|mimg=private/cc_equip_star/2.png|nimg=private/cc_equip_star/2.png|link=@equippos_star_button,'..
                    EQUIPPOS_STAR_BUTTONFUNC_ID_3..'>'
            else
                sPanelStr = sPanelStr..'<Button|id=502|x=350|y='..tempCurrY..'|mimg=private/cc_equip_star/4.png|nimg=private/cc_equip_star/4.png|link=@equippos_star_button,'..
                    EQUIPPOS_STAR_BUTTONFUNC_ID_4..'>'
            end

            local nStartX = 80    
            local nStartY = tempCurrY + 40      
            local startid = 510
            for i = EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX, 1 do
                local seq = i - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1
                if i == 10 then
                    nStartX = 80
                    nStartY = nStartY + 30
                end
                local boxid = startid + (2 * seq)
                local textid = startid + (2 * seq) + 1
                idstr = idstr..','..boxid..','..textid
                local checkvar = CommonDefine.CHECK_BOX_VAR[seq]
                local flag = getplaydef(actor, checkvar)
                sPanelStr = sPanelStr..'<CheckBox|id='..boxid..'|x='..nStartX..'|y='..nStartY..'|nimg=private/cc_common/checkbox_1.png|pimg=private/cc_common/checkbox_2.png|checkboxid='..
                    checkvar..'|default='..flag..'|delay=0|count=1|link=@equippos_star_button,'..EQUIPPOS_STAR_BUTTONFUNC_ID_5..','..i..'>'..
                    '<Text|id='..textid..'|text='..i..'��|x='..(nStartX+30)..'|y='..(nStartY+5)..'|color='..CSS.NPC_YELLOW..'>'            
                nStartX = nStartX + 80
            end
        end
        sPanelStr = sPanelStr..'<Layout|id=500|children={'..idstr..'}|x=0|y=310.0|width=580|height=110>'
    end
    return sPanelStr
end

--��ʾ��ʼ���
function EquipPosStarManager.ShowBasePanel(actor)
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end

    local posTab = {}
    local bChanged = false
    for pos, posname in pairs(CommonDefine.EQUIPPOS_NAME) do
        if EquipPosStarManager.IsValidEquipPosForUpgradeStar(pos) then
            local sid = pos..''
            if infoTab[sid] == nil then
                infoTab[sid] = 0
                bChanged = true
            end
            local tab = {pos=pos, name=posname, level=infoTab[sid]}
            posTab[#posTab + 1] = tab                                                
        end   
    end

    if bChanged == true then
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
    end

    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15,16}|x=20.0|y=16.0|reset=1|img=private/cc_equip_star/8.png|show=0|esc=1|move=0|bg=1|loadDelay=0>'..
        '<Layout|id=11|x=813.0|y=14.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=814.0|y=14.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
        '<Text|id=13|x=72.0|y=70.0|size=18|color=151|text=ѡ���λ>'..
        '<Button|id=16|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

    local idstr1 = ''
    for seq, _ in ipairs(posTab) do
        if idstr1 ~= '' then
            idstr1 = idstr1..','
        end
        idstr1 = idstr1..(30+seq)
    end
    strPanelInfo = strPanelInfo..'<ListView|id=14|children={'..idstr1..'}|x=65.0|y=110.0|width=130|height=350|margin=0|direction=1>'
    local choosepos = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)   

    for seq, value in ipairs(posTab) do
        local baseid = 30 + seq
        local textid1 = baseid * 10 + 1
        local textid2 = baseid * 10 + 2
        if choosepos == -1 then          
            choosepos = value.pos         
            setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, choosepos)
        end
        if choosepos == value.pos then
            strPanelInfo = strPanelInfo..'<Img|id='..baseid..'|children={'..textid1..','..textid2..'}x=-6.0|y=0.0|img=private/cc_equip_star/5.png|link=@equippos_star_button,'..
                EQUIPPOS_STAR_BUTTONFUNC_ID_1..','..value.pos..'>'
            strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|x=20.0|y=5.0|size=18|color='..CSS.NPC_YELLOW..'|text='..value.name..'��λ>'
                ..'<Text|id='..textid2..'|x=50.0|y=25.0|size=18|color='..CSS.NPC_YELLOW..'|text='..value.level..'��>'
            --��Ӧ��ǰѡ�е�װ����λ
            strPanelInfo = strPanelInfo..GetSingleEquipPosShowInfo(actor, value.pos)                
        else
            strPanelInfo = strPanelInfo..'<Img|id='..baseid..'|children={'..textid1..','..textid2..'}x=-6.0|y=0.0|img=private/cc_equip_star/6.png|link=@equippos_star_button,'..
                EQUIPPOS_STAR_BUTTONFUNC_ID_1..','..value.pos..'>'
            strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|x=20.0|y=5.0|size=18|color='..CSS.NPC_WHITE..'|text='..value.name..'��λ>'
                ..'<Text|id='..textid2..'|x=50.0|y=25.0|size=18|color='..CSS.NPC_WHITE..'|text='..value.level..'��>'
        end
    end

    BF_ShowSpecialUI(actor, strPanelInfo)
end

--װ��λ ����һ��
local function EquipPosUpgradeStarOnce(actor)
    if BF_IsNullObj(actor) then
        return
    end    
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_EQUIPPOS_STAR, false) then
        return
    end

    local equippos = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID) 
    if not EquipPosStarManager.IsValidEquipPosForUpgradeStar(equippos) then
        return
    end
    local sid = ''..equippos
    
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        infoTab[sid] = 0
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
    end

    local curPosLevel = infoTab[sid]
    if curPosLevel < 0 then
        return
    end

    local nextPosLevel = curPosLevel + 1
    local bJob = Player.GetJob(actor)
    local cfgCurrKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, equippos, curPosLevel)
    if cfgEquipPosUpgradeStar[cfgCurrKey] == nil then
        return
    end
    local cfgNextKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, equippos, nextPosLevel)
    if cfgEquipPosUpgradeStar[cfgNextKey] == nil then
        Player.SendSelfMsg(actor, '��ǰ�����Ѵﵽ���ޣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    if not Player.CheckItemsEnough(actor, cfgEquipPosUpgradeStar[cfgCurrKey].needitems_tab, '����') then
        return
    end

    --�۳�����
    Player.TakeItems(actor, cfgEquipPosUpgradeStar[cfgCurrKey].needitems_tab, 'װ������')
    
    if cfgEquipPosUpgradeStar[cfgCurrKey].successrate >= math.random(1, 100) then
        --���ǳɹ�
        Player.SendSelfMsg(actor, '���ǳɹ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)

        infoTab[sid] = nextPosLevel;
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)

        --���µ�ǰװ��λ���Ǽ�״̬
        EquipPosStarManager.UpdateEquipStarLvInPos(actor, equippos)

        --����װ��λ����
        FreeVIPManager.TriggerChgTaskCounter(actor, FreeVIPManager.TASK_TYPE_UPGRADE_EQUIPSTAR, 'max', nextPosLevel)        
    else
        --����ʧ��
        Player.SendSelfMsg(actor, '����ʧ�ܣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        
        if (curPosLevel <= 0) or (cfgEquipPosUpgradeStar[cfgCurrKey].faildeclv <= 0) then
            return
        end

        infoTab[sid] = math.max(0, curPosLevel - cfgEquipPosUpgradeStar[cfgCurrKey].faildeclv);
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
        
        --���µ�ǰ��Ӧ��װ��״̬
        EquipPosStarManager.UpdateEquipStarLvInPos(actor, equippos)        
    end 
    
    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_EQUIPPOS_STAR, 1)          
end

--װ��λ �Զ�����
function EquipPosStarManager.EquipPosAutoUpgradeStar(actor, startflag)
    if BF_IsNullObj(actor) then
        return
    end
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_EQUIPPOS_STAR, false) then
        return
    end

    local equippos = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID) 
    if not EquipPosStarManager.IsValidEquipPosForUpgradeStar(equippos) then
        return
    end
    local sid = ''..equippos
    
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        infoTab[sid] = 0
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
    end

    local curPosLevel = infoTab[sid]
    if curPosLevel < 0 then
        return
    end

    local nextPosLevel = curPosLevel + 1
    local bJob = Player.GetJob(actor)
    local cfgCurrKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, equippos, curPosLevel)
    if cfgEquipPosUpgradeStar[cfgCurrKey] == nil then
        return
    end
    local cfgNextKey = EquipPosStarManager.GetUpgradeStarCfgKey(bJob, equippos, nextPosLevel)
    if cfgEquipPosUpgradeStar[cfgNextKey] == nil then
        Player.SendSelfMsg(actor, '��ǰ�����Ѵﵽ���ޣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    if not Player.CheckItemsEnough(actor, cfgEquipPosUpgradeStar[cfgCurrKey].needitems_tab, '����') then
        return
    end

    local targPosLevel = 0
    for i = EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX, 1 do
        local checkvar = CommonDefine.CHECK_BOX_VAR[i - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1]
        if getplaydef(actor, checkvar) == 1 then
            targPosLevel = i
            break
        end
    end

    if curPosLevel >= targPosLevel then
        if startflag and startflag==true then
            if targPosLevel == 0 then
                Player.SendSelfMsg(actor, 'δѡ���Ŀ���Ǽ���ϵͳĬ��ѡ������һ��������ȷ�ϣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            else
                Player.SendSelfMsg(actor, 'ѡ���Ŀ���Ǽ�С�ڵ�ǰ�Ǽ���ϵͳĬ��ѡ������һ��������ȷ�ϣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)            
            end
            if targPosLevel < EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX then
                targPosLevel = math.max(curPosLevel + 1, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN)
                local checkvar = CommonDefine.CHECK_BOX_VAR[targPosLevel - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1]
                setplaydef(actor, checkvar, 1)
            end
        else
            Player.SendSelfMsg(actor, '��ǰ�ѴﵽĿ���Ǽ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
    else
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 1)
        EquipPosUpgradeStarOnce(actor)

        local npcobj = getcurrnpc(actor)
        if not BF_IsNullObj(npcobj) then
            local npcid = getnpcindex(npcobj)
            callfunbynpc(actor, npcid, 1000, 'equippos_star_auto_upgrade', '') 
        end        
    end
end

local function EquipPosStopAutoUpgradeStar(actor)
    for i = EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX, 1 do
        local checkvar = CommonDefine.CHECK_BOX_VAR[i - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1]
        setplaydef(actor, checkvar, 0)        
    end
    setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 0)
end

--�����Զ����ǵ�Ŀ��
local function SetAutoUpgradeTargStar(actor, varseq)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(varseq) then
        return
    end
    local seq = tonumber(varseq)
    if (seq < EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN) or (seq > EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX) then
        return
    end

    local equippos = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID) 
    if not EquipPosStarManager.IsValidEquipPosForUpgradeStar(equippos) then
        return
    end
    local sid = ''..equippos
    
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        infoTab[sid] = 0
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
    end

    local curPosLevel = infoTab[sid]
    if curPosLevel < 0 then
        return
    end
    if curPosLevel >= seq then
        for i = EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX, 1 do            
            local checkvar = CommonDefine.CHECK_BOX_VAR[i - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1]
            setplaydef(actor, checkvar, 0)            
        end
        setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 0)

        Player.SendSelfMsg(actor, 'Ŀ���Ǽ����ڵ�ǰ�Ǽ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    for i = EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN, EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX, 1 do
        if i ~= seq then
            local checkvar = CommonDefine.CHECK_BOX_VAR[i - EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MIN + 1]
            setplaydef(actor, checkvar, 0)            
        end
    end
    setflagstatus(actor, CommonDefine.VAR_HUM_BITFLAG_NPC_TEMP_CHOOSE_FLAG, 0)
end

--�ҵ����һ������ָ���Ǽ���װ��λ���������ǵ�ָ���Ǽ�
function EquipPosStarManager.RandomUpgradePosToTargStarNum(actor, targstarnum)
    if BF_IsNullObj(actor) or (targstarnum==nil) then
        return false
    end
    if (targstarnum < 1) or (targstarnum > EquipPosStarManager.AUTO_UPGRADESTAR_TARG_MAX) then
        return false
    end

    local infoTab = {}
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO)
    if infoStr ~= '' then
		infoTab = json2tbl(infoStr)
    end
	if infoTab == nil then
		return false
	end
    local poslist = {}
	for _, value in pairs(CommonDefine.BASE_EQUIPMENT_POS) do
        local sid = value..''
        if infoTab[sid] == nil then
            infoTab[sid] = 0
        end
        if infoTab[sid] < targstarnum then
            poslist[#poslist+1] = value
        end
	end

    if table.isempty(poslist) then
        return false
    end
    local rand = math.random(1, #poslist)
    local currpos = poslist[rand]
    local sid = currpos..''
    infoTab[sid] = targstarnum
    infoStr = tbl2json(infoTab)
    setplaydef(actor, CommonDefine.VAR_T_EQUIPPOS_UPGRADESTAR_INFO, infoStr)
    EquipPosStarManager.UpdateEquipStarLvInPos(actor, poslist[rand])
    FreeVIPManager.TriggerChgTaskCounter(actor, FreeVIPManager.TASK_TYPE_UPGRADE_EQUIPSTAR, 'max', targstarnum) 
    Player.SendSelfMsg(actor, CommonDefine.EQUIPPOS_NAME[currpos]..'��λ�Ǽ�����'..targstarnum, CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    return true
end

--����button�ص�
function EquipPosStarManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end    
    local funcid = tonumber(sid)
    local param = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    if BF_IsNumberStr(sparam) then
        param = tonumber(sparam)
    end

    if funcid == EQUIPPOS_STAR_BUTTONFUNC_ID_1 then
        setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID,  param)
        EquipPosStopAutoUpgradeStar(actor)
    elseif funcid == EQUIPPOS_STAR_BUTTONFUNC_ID_2 then
        EquipPosUpgradeStarOnce(actor)
    elseif funcid == EQUIPPOS_STAR_BUTTONFUNC_ID_3 then
        EquipPosStarManager.EquipPosAutoUpgradeStar(actor, true)
    elseif funcid == EQUIPPOS_STAR_BUTTONFUNC_ID_4 then
        EquipPosStopAutoUpgradeStar(actor)
    elseif funcid == EQUIPPOS_STAR_BUTTONFUNC_ID_5 then
        SetAutoUpgradeTargStar(actor, param)
    end
    EquipPosStarManager.ShowBasePanel(actor)
end

return EquipPosStarManager