ItemComposeManager = {}

--functionid
local COMPOSE_BUTTONFUNC_ID_1 = 1           --�л��ϳ�ҳǩ
local COMPOSE_BUTTONFUNC_ID_2 = 2           --��ǰ��һҳ
local COMPOSE_BUTTONFUNC_ID_3 = 3           --��ǰ��һҳ
local COMPOSE_BUTTONFUNC_ID_4 = 4			--ѡ��ϳɵĳ�ʼ����
local COMPOSE_BUTTONFUNC_ID_5 = 5			--���ٷ���ʣ�µ���--���ɵ��ӵ�����
local COMPOSE_BUTTONFUNC_ID_6 = 6			--���кϳ�--���ɵ��ӵ�����

local COMPOSE_BUTTONFUNC_ID_11 = 11			--����һ��--�ɵ��ӵ�����
local COMPOSE_BUTTONFUNC_ID_12 = 12			--��������--�ɵ��ӵ�����
local COMPOSE_BUTTONFUNC_ID_13 = 13			--���кϳ�--���ɵ��ӵ�����


local COMPOSE_TYPE_1 = 1 	--��ɫװ��
local COMPOSE_TYPE_2 = 2 	--���Ǳ�ʯ
local COMPOSE_TYPE_3 = 3 	--��ʯ
local COMPOSE_TYPE_4 = 4 	--����
local COMPOSE_TYPE_5 = 5 	--����
local COMPOSE_TYPE_6 = 6 	--����

local COMPOSE_TYPE_INFO = {
	{ctype=COMPOSE_TYPE_1, showname='��ɫװ��'},
	{ctype=COMPOSE_TYPE_2, showname='���Ǳ�ʯ'},
	{ctype=COMPOSE_TYPE_3, showname='��ʯ'},
	{ctype=COMPOSE_TYPE_4, showname='����'},
	{ctype=COMPOSE_TYPE_5, showname='����'},
	{ctype=COMPOSE_TYPE_6, showname='����'},
}

--ÿҳ�ĸ�������
local BAG_ITEM_COUNT_PER_PAGE = 25
--������Ʒÿ�����ϳ�����
local PILED_ITEM_COMPOSE_MAX_ONCE = 10

local function IsPiledItemComposeType(composetype)
	if composetype == COMPOSE_TYPE_1 then
		return false
	end
	return true
end

--���ر�����[min,max]��, �������Ϳ��Խ��кϳɵĵ���ID�ַ���  ,  �ָ�
--�����Ƿ���������ϵı��
local function GetBagItemIDCanComposeStr(actor, composetype, min, max)
	local strItemList = ''
	local bFinished = true
	if BF_IsNullObj(actor) then
		return strItemList, bFinished	
	end

	local currValidItemIDList = {}
	local nValidItemCounter = 0
	local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
   	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		if not BF_IsNullObj(itemobj) then
			local itemidx = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
			if cfgItemValidComposeList[composetype] and  cfgItemValidComposeList[composetype][itemidx] == true then
				nValidItemCounter = nValidItemCounter + 1
				if nValidItemCounter >= min then
					if nValidItemCounter > max then
						bFinished = false
						break
					end					
					if not currValidItemIDList[itemidx] then
						currValidItemIDList[itemidx] = true
						if strItemList ~= '' then
							strItemList = strItemList..','
						end
						strItemList = strItemList..itemidx						
					end	
				end
			end		
		end
   	end

	return strItemList, bFinished
end

--���ݵ�һ��װ��itemid������ʣ�����ϳɵ�װ��ID�ַ���  ,�ָ�
local function GetBagItemIDCanComposeStr2(firstitemid)
	local strItemList = ''
	local composeCfgTab = {}
	if firstitemid == nil then		
		return strItemList, composeCfgTab, nil	
	end
	local currItemList = nil
	for _, value in pairs(cfgItemCompose) do
		for _, value1 in pairs(value.srcitemlist_tab) do
			if value1.id == firstitemid then			
				currItemList = value.srcitemlist_tab
				composeCfgTab = value
				break
			end
		end
		if currItemList ~= nil then
			break
		end
	end
	if currItemList == nil then					
		return strItemList, composeCfgTab, nil
	end
	
	local idlist = {}
	for _, value in pairs(currItemList) do
		if strItemList ~= '' then
			strItemList = strItemList..','
		end
		strItemList = strItemList..value.id			
		idlist[#idlist+1] = value.id
	end
	return strItemList, composeCfgTab, idlist	
end

--���ݵ��ߵ�table ���غϳɵ�����
local function GetCfgComposeTab(actor, itemobjtablist)
	if BF_IsNullObj(actor) or (itemobjtablist==nil) or (table.isempty(itemobjtablist)) then
		return nil
	end
	if #itemobjtablist < CommonDefine.ITEM_COMPOSE_NEED_NUM then
		return nil
	end	
	local cfgCurrTab = nil
	local firstitemid = getiteminfo(actor, itemobjtablist[1], CommonDefine.ITEMINFO_ITEMIDX)

	for _, value in pairs(cfgItemCompose) do		
		for _, value1 in pairs(value.srcitemlist_tab) do		
			if value1.id == firstitemid then
				cfgCurrTab = value
				break
			end
		end
		if cfgCurrTab ~= nil then
			break
		end
	end
	if cfgCurrTab == nil then
		return nil
	end
	for _, itemobj in ipairs(itemobjtablist) do
		local bFind = false
		local itemid = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
		for _, value in pairs(cfgCurrTab.srcitemlist_tab) do			
			if itemid == value.id then
				bFind = true
				break
			end
		end
		if not bFind then
			return nil
		end
	end
	return cfgCurrTab
end

--���յ�װ���ϳɶ��������ؽ����ǣ�������ʾ
local function DoFinalEquipCompose(actor, cfgComposeTab)
	local bSuccessFlag = false
	local newMakeIndex = 0
	if BF_IsNullObj(actor) or (cfgComposeTab==nil) or (table.isempty(cfgComposeTab)) then
		return bSuccessFlag, newMakeIndex
	end

    if cfgComposeTab.successrate >= math.random(1, 10000) then
        --�ϳɳɹ�
        Player.SendSelfMsg(actor, '�ϳɳɹ���', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)        
		local targInfo = BF_GetRandomTab(cfgComposeTab.composetarginfo_tab, -1)
		if (targInfo ~= nil) and (targInfo.id ~= nil) and (cfg_equip[targInfo.id] ~= nil) then
			--�ϳɺ��װ����������ô���壿������������������
			local newitemobj = giveitem(actor, cfg_equip[targInfo.id].Name, 1, 0, 'װ���ϳ�')
			if not BF_IsNullObj(newitemobj) then
				--����װ���ĳ�ʼϴ������
				EquipRandomABManager.InitEquipRandomAB(actor, newitemobj)
				--װ�����츳����
				EquipInitGift.InitEquipGiftAB(actor, newitemobj)
				refreshitem(actor, newitemobj)
				newMakeIndex = getiteminfo(actor, newitemobj, CommonDefine.ITEMINFO_UNIQUEID)
				bSuccessFlag = true				
			end
		end        
    else
        --�ϳ�ʧ��
        Player.SendSelfMsg(actor, '�ϳ�ʧ�ܣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)        
    end	
	return bSuccessFlag, newMakeIndex
end

--���յĿɵ��ӵ��ߺϳ�
local function DoFinalPiledItemCompose(actor, cfgComposeTab)
	local bSuccessFlag = false
	local newitemid = 0
	if BF_IsNullObj(actor) or (cfgComposeTab==nil) or (table.isempty(cfgComposeTab)) then
		return bSuccessFlag, newitemid
	end

    if cfgComposeTab.successrate >= math.random(1, 10000) then
		local targInfo = BF_GetRandomTab(cfgComposeTab.composetarginfo_tab, -1)
		if (targInfo ~= nil) and (targInfo.id ~= nil) and (cfg_item[targInfo.id] ~= nil) then
			giveitem(actor, cfg_item[targInfo.id].Name, 1, 0, '���ߺϳ�')
			bSuccessFlag = true	
			newitemid = targInfo.id
		end           
    end	
	return bSuccessFlag, newitemid
end

function ItemComposeManager.ShowBasePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,13,21,22,23,24,25,26,40,51,52,53,61,62,63,71,72}|x=31.0|y=19.0|img=private/cc_compose/12.png|move=0|show=0|reset=1|esc=1|bg=1|loadDelay=0>'..
        '<Layout|id=11|x=813.0|y=14.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=814.0|y=14.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
		'<Button|id=13|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

	local composetype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
	if composetype == 0 then
		composetype = COMPOSE_TYPE_1
		setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, composetype)
	end
	local startid = 20
	for seq, value in ipairs(COMPOSE_TYPE_INFO) do
		local currid = startid + seq
		local currx = 67
		local curry = 86 + (seq - 1) * 50
		if value.ctype == composetype then
			strPanelInfo = strPanelInfo..'<Button|id='..currid..'|x='..currx..'|y='..curry..'|mimg=private/cc_compose/2.png|nimg=private/cc_compose/2.png|size=20|color=255|text='..value.showname..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..','..value.ctype..'>'
		else
			strPanelInfo = strPanelInfo..'<Button|id='..currid..'|x='..currx..'|y='..curry..'|mimg=private/cc_compose/1.png|nimg=private/cc_compose/1.png|size=20|color=255|text='..value.showname..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..','..value.ctype..'>'
		end
	end

    local currPageNo = getplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1)
    if currPageNo <= 0 then
        currPageNo = 1
        setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, currPageNo)
    end

    local strSelectItem1 = getplaydef(actor, CommonDefine.VAR_S_SELECT_ITEM)
    local nTempMin = (currPageNo - 1) * BAG_ITEM_COUNT_PER_PAGE + 1
    local nTempMax = currPageNo * BAG_ITEM_COUNT_PER_PAGE
    local sValidItemIDList, bDataFinished = GetBagItemIDCanComposeStr(actor, composetype, nTempMin, nTempMax)
    if sValidItemIDList ~= '' then
    	strPanelInfo = strPanelInfo..'<BAGITEMS|id=40|x=195|y=90|select='..strSelectItem1..'|filter3='..sValidItemIDList..'|count='..BAG_ITEM_COUNT_PER_PAGE..
			'|showtips=1|selecttype=1|row=5|dblink=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_4..'>'
    else
        strPanelInfo = strPanelInfo..'<Text|text=���޶�Ӧ�ɺϳɵĵ��ߣ�|x=250|y=120|color='..CSS.NPC_WHITE..'>'
    end

	local itemmakeidx1 = getplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1)
	if itemmakeidx1 > 0 then
		local itemidx = Bag.GetItemidxByMakeindex(actor, itemmakeidx1)
		strPanelInfo = strPanelInfo..'<ItemShow|id=51|x=637.0|y=94.0|width=70|height=70|itemid='..itemidx..'|itemcount=1|bgtype=1|showtips=1>'..
			'<ItemShow|id=52|x=559.0|y=227.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'..
			'<ItemShow|id=53|x=717.0|y=227.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'

		if IsPiledItemComposeType(composetype) then
			strPanelInfo = strPanelInfo..'<Text|id=61|text=�������뽫�Զ���������|x=570|y=420|size=18|color='..CSS.NPC_WHITE..'>'..
				'<Button|id=62|x=560|y=370|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|text=����һ��|size=18|color='..CSS.NPC_WHITE..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_11..'>'..
				'<Button|id=63|x=680|y=370|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|text=��������|size=18|color='..CSS.NPC_WHITE..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_12..'>'
		else
			strPanelInfo = strPanelInfo..'<Text|id=61|text=�Զ�����ɺϳɵ��ߣ�|x=570|y=420|size=20|color='..CSS.NPC_WHITE..'>'..
				'<Button|id=62|x=620|y=370|mimg=private/cc_compose/7.png|nimg=private/cc_compose/7.png|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_5..'>'
		end
	else
		strPanelInfo = strPanelInfo..'<ItemShow|id=51|x=637.0|y=94.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'..
			'<ItemShow|id=52|x=559.0|y=227.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'..
			'<ItemShow|id=53|x=717.0|y=227.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'		
		strPanelInfo = strPanelInfo..'<Text|id=61|text=˫��ѡ��Ҫ�ϳɵ���Ʒ��|x=570|y=420|size=20|color='..CSS.NPC_YELLOW..'>'
	end	

    if currPageNo > 1 then
        strPanelInfo = strPanelInfo..'<Text|id=71|text=��һҳ|x=210|y=460|color='..CSS.NPC_WHITE..'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_2..'>'
    end
    if not bDataFinished then
        strPanelInfo = strPanelInfo..'<Text|id=72|text=��һҳ|x=460|y=460|color='..CSS.NPC_WHITE..'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_3..'>'
    end	

    BF_ShowSpecialUI(actor, strPanelInfo)
end

function ItemComposeManager.ChooseOtherItemPanel(actor)
     --չ����Ϣ�Ű��ѡ��������������
     local chooseItemMakeIdx = getplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1)
     if chooseItemMakeIdx <= 0 then
         Player.SendSelfMsg(actor, '��˫��ѡ�����ϳɵĵ�һ��װ����', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
         return
     end   
    --Ч���Ƿ�Ϊ��������
    local firstitemid = Bag.GetItemidxByMakeindex(actor, chooseItemMakeIdx)
    if (firstitemid == nil) or (firstitemid == 0) then
        return
    end	

    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26,40,51,52,53,61,62,63,80}|x=31.0|y=19.0|img=private/cc_compose/12.png|move=0|show=0|reset=1|esc=1|bg=1|loadDelay=0>'..
        '<Layout|id=11|x=813.0|y=14.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=814.0|y=14.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'

	local composetype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
	if composetype == 0 then
		composetype = COMPOSE_TYPE_1
		setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, composetype)
	end

	local startid = 20
	for seq, value in ipairs(COMPOSE_TYPE_INFO) do
		local currid = startid + seq
		local currx = 67
		local curry = 86 + (seq - 1) * 50
		if value.ctype == composetype then
			strPanelInfo = strPanelInfo..'<Button|id='..currid..'|x='..currx..'|y='..curry..'|mimg=private/cc_compose/2.png|nimg=private/cc_compose/2.png|size=20|color=255|text='..value.showname..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..','..value.ctype..'>'
		else
			strPanelInfo = strPanelInfo..'<Button|id='..currid..'|x='..currx..'|y='..curry..'|mimg=private/cc_compose/1.png|nimg=private/cc_compose/1.png|size=20|color=255|text='..value.showname..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..','..value.ctype..'>'
		end
	end

    local sValidItemIDList, cfgCurrComposeTab, _ = GetBagItemIDCanComposeStr2(firstitemid)
    local strSelectItemList = getplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS)
    strPanelInfo = strPanelInfo..'<BAGITEMS|id=40|x=195|y=90|select='..strSelectItemList..'|filter3='..sValidItemIDList..'|count='..BAG_ITEM_COUNT_PER_PAGE..'|showtips=1|selecttype=1|row=5>'

    local strMakeIdxTab = string.split(strSelectItemList, ',')
    if strMakeIdxTab and (#strMakeIdxTab == CommonDefine.ITEM_COMPOSE_NEED_NUM) then
		local itemidx2 = 0
		if strMakeIdxTab[2] ~= nil then
			itemidx2 = Bag.GetItemidxByMakeindex(actor, tonumber(strMakeIdxTab[2]))
		end
		local itemidx3 = 0
		if strMakeIdxTab[3] ~= nil then
			itemidx3 = Bag.GetItemidxByMakeindex(actor, tonumber(strMakeIdxTab[3]))
		end				

		if strMakeIdxTab and strMakeIdxTab[2] and strMakeIdxTab[3] then
			strPanelInfo = strPanelInfo..'<ItemShow|id=51|x=637.0|y=94.0|width=70|height=70|itemid='..firstitemid..'|itemcount=1|bgtype=1|showtips=1>'..
				'<ItemShow|id=52|x=559.0|y=227.0|width=70|height=70|itemid='..itemidx2..'|itemcount=1|bgtype=1|showtips=1>'..
				'<ItemShow|id=53|x=717.0|y=227.0|width=70|height=70|itemid='..itemidx3..'|itemcount=1|bgtype=1|showtips=1>'
		end

		if sValidItemIDList ~= '' then
			local sConsumeInfo = BF_GetSimpleItemTableDescStr(cfgCurrComposeTab.needitems_tab)
			local showrate = math.floor(cfgCurrComposeTab.successrate / 100)
			strPanelInfo = strPanelInfo..'<Text|id=61|text=�ɹ����ʣ�'..showrate..'%|x=590|y=360|color='..CSS.NPC_WHITE..'>'..
				'<Text|id=62|text=�ϳ����ģ�'..sConsumeInfo..'|x=590|y=390|color='..CSS.NPC_WHITE..'>'..
				'<Button|id=63|x=620|y=420|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|text=��ʼ�ϳ�|size=18|color='..CSS.NPC_WHITE..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_6..'>'
		end	
	else	
		local pilenum = getplaydef(actor, CommonDefine.VAR_N_SELECT_COMPOSE_PILE_NUM)	
		if IsPiledItemComposeType(composetype) and (pilenum > 0) then			
			strPanelInfo = strPanelInfo..'<ItemShow|id=51|x=637.0|y=94.0|width=70|height=70|itemid='..firstitemid..'|itemcount='..pilenum..'|bgtype=1|showtips=1>'..
				'<ItemShow|id=52|x=559.0|y=227.0|width=70|height=70|itemid='..firstitemid..'|itemcount='..pilenum..'|bgtype=1|showtips=1>'..
				'<ItemShow|id=53|x=717.0|y=227.0|width=70|height=70|itemid='..firstitemid..'|itemcount='..pilenum..'|bgtype=1|showtips=1>'

			local needitems = BF_GetItemTabMulti(cfgCurrComposeTab.needitems_tab, pilenum)
			local sConsumeInfo = BF_GetSimpleItemTableDescStr(needitems)
			local showrate = math.floor(cfgCurrComposeTab.successrate / 100)
			strPanelInfo = strPanelInfo..'<Text|id=61|text=�ɹ����ʣ�'..showrate..'%|x=590|y=360|color='..CSS.NPC_WHITE..'>'..
				'<Text|id=62|text=�ϳ����ģ�'..sConsumeInfo..'|x=590|y=390|color='..CSS.NPC_WHITE..'>'..
				'<Button|id=63|x=620|y=420|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|text=��ʼ�ϳ�|size=18|color='..CSS.NPC_WHITE..
				'|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_13..'>'				
		else
			strPanelInfo = strPanelInfo..'<ItemShow|id=51|x=637.0|y=94.0|width=70|height=70|itemid='..firstitemid..'|itemcount=1|bgtype=1|showtips=1>'..
				'<ItemShow|id=52|x=559.0|y=227.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'..
				'<ItemShow|id=53|x=717.0|y=227.0|width=70|height=70|itemid=0|itemcount=1|bgtype=1|showtips=1>'
		end
    end

    BF_ShowSpecialUI(actor, strPanelInfo)
end

function ItemComposeManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26,27}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=���ߺϳɹ���˵��:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1��װ���ϳɺ���м��ʻ�ø��ߵȼ�װ����ͬʱ������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=�츳���Ի��߼�Ʒ����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=2�����Ǳ�ʯ�ϳɳɹ�֮�󽫻�ø�һ�������Ǳ�ʯ��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3����ʯ�ϳɳɹ�֮�󽫻�ø�һ���Ļ�ʯ|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=26|text=4�����еĺϳ���Ʒ������ϳ�ʧ�ܣ������᷵���ϳ�|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
	tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=27|text=���Ϻͺϳ�����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    BF_ShowSpecialUI(actor, strPanelInfo)   
end

local function DoSelectItem1(actor)
	local strSelectItem1 = getplaydef(actor, CommonDefine.VAR_S_SELECT_ITEM)
	if not BF_IsNumberStr(strSelectItem1) then
		Player.SendSelfMsg(actor, '��˫��ѡ�����ϳɵĵ�һ�����ߣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
		return
	end
	setplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1, tonumber(strSelectItem1))
end

--���ڲ��ɵ��ӵ��ߵĺϳɣ�ѡ�������ϳɶ���
local function DoAutoSelectOtherItems(actor)
	local composetype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
	if IsPiledItemComposeType(composetype) then
		return false
	end

    local chooseItemMakeIdx = getplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1)
    if chooseItemMakeIdx <= 0 then
        Player.SendSelfMsg(actor, '��˫��ѡ�����ϳɵĵ�һ�����ߣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return false
    end
    --Ч���Ƿ�Ϊ��������
    local firstitemid = Bag.GetItemidxByMakeindex(actor, chooseItemMakeIdx)
    if (firstitemid == nil) or (firstitemid == 0) then
        return false
    end

    local strSelectItemList = ''..chooseItemMakeIdx
    setplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS, strSelectItemList)

	local chooseCounter = 0
	local _, _, itemidTab = GetBagItemIDCanComposeStr2(firstitemid)
	if itemidTab and (type(itemidTab)=="table") then
		local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)		
		for i=0, item_num-1 do
			local itemobj = getiteminfobyindex(actor, i)
			local itemidx = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
			if table.indexof(itemidTab, itemidx) ~= false then			
				local makeindex = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_UNIQUEID)
				if makeindex ~= chooseItemMakeIdx then
					if strSelectItemList ~= '' then
						strSelectItemList = strSelectItemList..','
					end
					strSelectItemList = strSelectItemList..makeindex
					chooseCounter = chooseCounter + 1
				end
				if chooseCounter >= CommonDefine.ITEM_COMPOSE_NEED_NUM-1 then
					break
				end
			end
		end
	else
		Player.SendSelfMsg(actor, '��ǰ�޳���ĵ��߹��ϳ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
		return false
	end
	
	if chooseCounter< CommonDefine.ITEM_COMPOSE_NEED_NUM-1 then
		Player.SendSelfMsg(actor, '��ǰ�޳���ĵ��߹��ϳ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
		return false
	end

	setplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS, strSelectItemList)
	return true
end

--���ڿɵ��ӵ��ߵĺϳɣ�ѡ�������ϳɶ���  selecttype=0��ʾѡ�񵥸� =1��ʾѡ�����
local function DoAutoSelectOtherPiledItems(actor, selecttype)
	local composetype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
	if not IsPiledItemComposeType(composetype) then
		return false
	end

    local chooseItemMakeIdx = getplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1)
    if chooseItemMakeIdx <= 0 then
        Player.SendSelfMsg(actor, '��˫��ѡ�����ϳɵĵ�һ�����ߣ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return false
    end	
    --Ч���Ƿ�Ϊ��������
	local chooseitemobj = Bag.GetItemByMakeindex(actor, chooseItemMakeIdx)
	if chooseitemobj == nil then
		return false
	end
    local firstitemid = getiteminfo(actor, chooseitemobj, CommonDefine.ITEMINFO_ITEMIDX)
    if (firstitemid == nil) or (firstitemid == 0) then
        return false
    end
	--��ǰ ���ߵ����������ڵ���3���ſɽ��кϳ�
	local pilecount = getiteminfo(actor, chooseitemobj, CommonDefine.ITEMINFO_OVERLAP)
	if pilecount < CommonDefine.ITEM_COMPOSE_NEED_NUM then
		Player.SendSelfMsg(actor, 'ѡ��ĵ����������㣬�޷��ϳ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
		return false
	end

    local strSelectItemList = ''..chooseItemMakeIdx
    setplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS, strSelectItemList)
	local singlecount = 1
	if selecttype == 1 then
		singlecount = math.floor(pilecount / CommonDefine.ITEM_COMPOSE_NEED_NUM)
		singlecount = math.min(PILED_ITEM_COMPOSE_MAX_ONCE, singlecount)
	end
	setplaydef(actor, CommonDefine.VAR_N_SELECT_COMPOSE_PILE_NUM, singlecount)

	return true
end

--���غϳɳɹ��ĵ���װ��
local function show_success_panel(actor, makeindex)
	local strPanelInfo = '<Img|id=80|children={81,82,83,84}|x=300.0|y=180.0|img=private/cc_compose/11.png|move=0|show=0|reset=1|esc=1|bg=1|loadDelay=0>'..
		'<Text|id=81|x=160.0|y=15.0|color=151|size=20|text=�ϳɽ��>'..
		'<Text|id=82|x=40.0|y=60.0|color=255|size=18|text=��ϲ��ã�>'..
		'<Button|id=83|x=150.0|y=155.0|color=255|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|size=18|text=ȷ��|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..'>'..
		'<MKItemShow|id=84|x=160|y=80|makeindex='..makeindex..'|count=1|showtips=1|bgtype=1|canmove=0>'	
	BF_ShowSpecialUI(actor, strPanelInfo)
end

--���غϳɳɹ��ĵ����б�
local function show_success_panel_ex(actor, itemlist)
	local idstr = ''
	for key, _ in ipairs(itemlist) do
		idstr = idstr..','..(90+key)
	end
	local strPanelInfo = '<Img|id=80|children={81,82,83'..idstr..'}|x=300.0|y=180.0|img=private/cc_compose/11.png|move=0|show=0|reset=1|esc=1|bg=1|loadDelay=0>'..
		'<Text|id=81|x=160.0|y=15.0|color=151|size=20|text=�ϳɽ��>'..
		'<Text|id=82|x=40.0|y=60.0|color=255|size=18|text=��ϲ��ã�>'..
		'<Button|id=83|x=150.0|y=155.0|color=255|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|size=18|text=ȷ��|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..'>'
	for key, value in ipairs(itemlist) do
		local currx = 40 + 70 * (key-1)
		strPanelInfo = strPanelInfo..'<ItemShow|id='..(90+key)..'|x='..currx..'|y=80|itemid='..value.id..'|itemcount='..value.num..'|bgtype=1|showtips=1>'
	end			
	BF_ShowSpecialUI(actor, strPanelInfo)
end

local function show_fail_panel(actor)
	local strPanelInfo = '<Img|id=80|children={81,82,83,84}|x=300.0|y=180.0|img=private/cc_compose/11.png|move=0|show=0|reset=1|esc=1|bg=1|loadDelay=0>'..
		'<Text|id=81|x=160.0|y=15.0|color=151|size=20|text=�ϳɽ��>'..
		'<Text|id=82|x=70.0|y=80.0|color=255|size=18|text=�ϳ�ʧ�ܣ���Ҫ���ģ��´λ��к��ˣ�>'..
		'<Button|id=83|x=150.0|y=155.0|color=255|mimg=private/cc_compose/3.png|nimg=private/cc_compose/3.png|size=18|text=ȷ��|link=@itemcompose_button,'..COMPOSE_BUTTONFUNC_ID_1..'>'
	BF_ShowSpecialUI(actor, strPanelInfo)
end

--�ϳɲ��ɵ��ӵ���
local function DoCompose(actor)
	local composetype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
	if IsPiledItemComposeType(composetype) then
		Player.SendSelfMsg(actor, 'ѡ��ĺϳ����Ͳ�����', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
		return
	end

    local strSelectItemList = getplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS)
    if strSelectItemList == '' then
        return
    end
    local strSelectTable = string.split(strSelectItemList, ',')
    if #strSelectTable ~= CommonDefine.ITEM_COMPOSE_NEED_NUM then
        Player.SendSelfMsg(actor, 'ѡ��ĺϳɵ��ߵ���������'..CommonDefine.ITEM_COMPOSE_NEED_NUM..'����', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    local itemMakeidxList = {}
    if strSelectTable ~= false then
        for _, value in ipairs(strSelectTable) do
            if not BF_IsNumberStr(value) then
                return
            end
            itemMakeidxList[#itemMakeidxList+1] = tonumber(value)
        end        
    end
    if BF_HasDuplicates(itemMakeidxList) then
        --���
        return
    end
    local chooseItemObjList = {}
    for _, value in ipairs(itemMakeidxList) do
        local itemobj = Bag.GetItemByMakeindex(actor, value)
        if BF_IsNullObj(itemobj) then
            --���
            return
        else
            chooseItemObjList[#chooseItemObjList+1] = itemobj
        end
    end
    local cfgCurrComposeTab = GetCfgComposeTab(actor, chooseItemObjList)
    if cfgCurrComposeTab == nil then
        Player.SendSelfMsg(actor, 'δ�ҵ���Ч�ĺϳ����ã�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    --�����ж�
    if not Player.CheckItemsEnough(actor, cfgCurrComposeTab.needitems_tab, '�ϳ�') then
        return
    end
    --�۳���������
    Player.TakeItems(actor, cfgCurrComposeTab.needitems_tab, 'װ���ϳ�')
    --�۳�װ������
    for _, value in ipairs(itemMakeidxList) do
        delitembymakeindex(actor, value)
    end

    --���պϳ�
    local bComposeFlag, newItemMakeIdx = DoFinalEquipCompose(actor, cfgCurrComposeTab)
    if bComposeFlag then
        --����װ���ϳɳɹ�
        FreeVIPManager.TriggerChgTaskCounter(actor, FreeVIPManager.TASK_TYPE_COMPOSE_EQUIP_SUCCESSTIMES, '+', 1)       
		show_success_panel(actor, newItemMakeIdx)
    else
		show_fail_panel(actor)
    end

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_COMPOSE, 1)       	
end

--�ϳɿɵ��ӵ���
local function DoComposeEx(actor)
	local composetype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
	if not IsPiledItemComposeType(composetype) then
		Player.SendSelfMsg(actor, 'ѡ��ĺϳ����Ͳ�����', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
		return
	end

	local chooseItemMakeIdx = getplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1)
	if chooseItemMakeIdx <= 0 then
		return
	end   
	local firstitemid = Bag.GetItemidxByMakeindex(actor, chooseItemMakeIdx)
	if (firstitemid == nil) or (firstitemid == 0) then
		return
	end
	local pilecount = getplaydef(actor, CommonDefine.VAR_N_SELECT_COMPOSE_PILE_NUM)
	if pilecount <= 0 then
		return
	end

	local cfgCurrComposeTab = nil
	for _, value in pairs(cfgItemCompose) do		
		for _, value1 in pairs(value.srcitemlist_tab) do		
			if value1.id == firstitemid then
				cfgCurrComposeTab = value
				break
			end
		end
		if cfgCurrComposeTab ~= nil then
			break
		end
	end
	if cfgCurrComposeTab == nil then
		return
	end

	--���ϳɵ�������
	local needitemlist1 = {{id=firstitemid, num=pilecount*CommonDefine.ITEM_COMPOSE_NEED_NUM}}
    if not Player.CheckItemsEnough(actor, needitemlist1, '���ӵ��ߺϳ�') then
        return
    end
	--���ϳɲ�������
	local needitemlist2 = BF_GetItemTabMulti(cfgCurrComposeTab.needitems_tab, pilecount)
    if not Player.CheckItemsEnough(actor, needitemlist2, '���ӵ��ߺϳ�') then
        return
    end	
	--�۵���
	Player.TakeItems(actor, needitemlist1, '���ߺϳ�1')
	Player.TakeItems(actor, needitemlist2, '���ߺϳ�2')

	--���кϳ�
	local resultinfo = {}
	for i = 1, pilecount, 1 do
		local bComposeFlag, newItemID = DoFinalPiledItemCompose(actor, cfgCurrComposeTab)
		if bComposeFlag == true then
			local bFind = false
			for _, value in ipairs(resultinfo) do
				if value.id == newItemID then
					bFind = true
					value.num = value.num + 1
				end
			end
			if bFind == false then
				local rec = {id=newItemID, num=1}
				resultinfo[#resultinfo+1] = rec
			end
		end
	end
	
	if #resultinfo > 0 then
		show_success_panel_ex(actor, resultinfo)
	else	
		show_fail_panel(actor)
	end

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_COMPOSE, pilecount)       	
end

--����button�ص�
function ItemComposeManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end    
    local funcid = tonumber(sid)
    local ctype = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    if BF_IsNumberStr(sparam) then
        ctype = tonumber(sparam)
    end

    if funcid == COMPOSE_BUTTONFUNC_ID_1 then
		setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, ctype)
		setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, 0)
		setplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1, 0)
		setplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS, '')
		setplaydef(actor, CommonDefine.VAR_N_SELECT_COMPOSE_PILE_NUM, 0)
		ItemComposeManager.ShowBasePanel(actor)
    elseif funcid == COMPOSE_BUTTONFUNC_ID_2 then
		local currPageNo = getplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1)
		if currPageNo > 1 then
			setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, currPageNo - 1)
		end
		ItemComposeManager.ShowBasePanel(actor)
	elseif funcid == COMPOSE_BUTTONFUNC_ID_3 then
		local currPageNo = getplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1)
		setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, currPageNo + 1)
		ItemComposeManager.ShowBasePanel(actor)		
	elseif funcid == COMPOSE_BUTTONFUNC_ID_4 then
		DoSelectItem1(actor)
		ItemComposeManager.ShowBasePanel(actor)
	elseif funcid == COMPOSE_BUTTONFUNC_ID_5 then
		if DoAutoSelectOtherItems(actor) == true then
			ItemComposeManager.ChooseOtherItemPanel(actor)
		end
	elseif funcid == COMPOSE_BUTTONFUNC_ID_6 then
		--����Ĵ�����ȷ��?????????	
		DoCompose(actor)
		setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, 0)
		setplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1, 0)
		setplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS, '')	
		setplaydef(actor, CommonDefine.VAR_N_SELECT_COMPOSE_PILE_NUM, 0)
	elseif funcid == COMPOSE_BUTTONFUNC_ID_11 then
		if DoAutoSelectOtherPiledItems(actor, 0) == true then
			ItemComposeManager.ChooseOtherItemPanel(actor)
		end
	elseif funcid == COMPOSE_BUTTONFUNC_ID_12 then
		if DoAutoSelectOtherPiledItems(actor, 1) == true then
			ItemComposeManager.ChooseOtherItemPanel(actor)
		end
	elseif funcid == COMPOSE_BUTTONFUNC_ID_13 then
		--����Ĵ�����ȷ��?????????	
		DoComposeEx(actor)
		setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, 0)
		setplaydef(actor, CommonDefine.VAR_N_ITEM_COMPOSE_CHOOSE_ITEM1, 0)
		setplaydef(actor, CommonDefine.VAR_S_SELECT_COMPOSE_ITEMS, '')	
		setplaydef(actor, CommonDefine.VAR_N_SELECT_COMPOSE_PILE_NUM, 0)
    end
end

return ItemComposeManager