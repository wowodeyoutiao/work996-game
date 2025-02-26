SoulStoneManager = {}

--functionid
local SOULSTONE_BUTTONFUNC_ID_1 = 1           --��ʾ��ʯ�
local SOULSTONE_BUTTONFUNC_ID_2 = 2           --���ػ�ʯ����������
local SOULSTONE_BUTTONFUNC_ID_3 = 3           --�л���ʯ��λ
local SOULSTONE_BUTTONFUNC_ID_4 = 4           --��Ƕ���滻��ʯ
local SOULSTONE_BUTTONFUNC_ID_5 = 5           --ѡ�񱳰��еĻ�ʯ
local SOULSTONE_BUTTONFUNC_ID_6 = 6           --�����еĻ�ʯ��һҳ
local SOULSTONE_BUTTONFUNC_ID_7 = 7           --�����еĻ�ʯ��һҳ
local SOULSTONE_BUTTONFUNC_ID_8 = 8           --ȫ��ж��
local SOULSTONE_BUTTONFUNC_ID_9 = 9           --һ����Ƕ
local SOULSTONE_BUTTONFUNC_ID_10 = 10         --��ʾ��������


--��ʯ�ĵ���shape��Ӧ��ɫ
SoulStoneManager.STONE_SHAPE = {
    RED = 1,
    BLUE = 2,
    GREEN = 3,
    YELLOW = 4,
}

--��ʯ��Ӧ����Ԫ��
SoulStoneManager.STONE_WX = {
    WX_NONE = 0,
    WX_GOLD = 1,
    WX_WOOD = 2,
    WX_WATER = 3,
    WX_FIRE = 4,
    WX_SOIL = 5,
}

--��ʯ�Ĳ�λ
SoulStoneManager.SLOT_ID = {
    SLOT_RED_1 = 1,
    SLOT_RED_2 = 2,
    SLOT_RED_3 = 3,
    SLOT_BLUE_1 = 4,
    SLOT_BLUE_2 = 5,
    SLOT_GREEN_1 = 6,
    SLOT_GREEN_2 = 7,
    SLOT_YELLOW_1 = 8,
    SLOT_YELLOW_2 = 9,
    SLOT_YELLOW_3 = 10,
} 

SoulStoneManager.SLOT_CFG_INFO = {
    [SoulStoneManager.SLOT_ID.SLOT_RED_1] = {id = SoulStoneManager.SLOT_ID.SLOT_RED_1, name = '���ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.RED, color = CSS.QUALITY_RED},
    [SoulStoneManager.SLOT_ID.SLOT_RED_2] = {id = SoulStoneManager.SLOT_ID.SLOT_RED_2, name = '���ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.RED, color = CSS.QUALITY_RED},
    [SoulStoneManager.SLOT_ID.SLOT_RED_3] = {id = SoulStoneManager.SLOT_ID.SLOT_RED_3, name = '���ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.RED, color = CSS.QUALITY_RED},
    [SoulStoneManager.SLOT_ID.SLOT_BLUE_1] = {id = SoulStoneManager.SLOT_ID.SLOT_BLUE_1, name = '����ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.BLUE, color = CSS.QUALITY_BLUE},
    [SoulStoneManager.SLOT_ID.SLOT_BLUE_2] = {id = SoulStoneManager.SLOT_ID.SLOT_BLUE_2, name = '����ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.BLUE, color = CSS.QUALITY_BLUE},
    [SoulStoneManager.SLOT_ID.SLOT_GREEN_1] = {id = SoulStoneManager.SLOT_ID.SLOT_GREEN_1, name = '�̻�ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.GREEN, color = CSS.QUALITY_GREEN},
    [SoulStoneManager.SLOT_ID.SLOT_GREEN_2] = {id = SoulStoneManager.SLOT_ID.SLOT_GREEN_2, name = '�̻�ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.GREEN, color = CSS.QUALITY_GREEN},
    [SoulStoneManager.SLOT_ID.SLOT_YELLOW_1] = {id = SoulStoneManager.SLOT_ID.SLOT_YELLOW_1, name = '�ƻ�ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.YELLOW, color = CSS.QUALITY_ORANGE},
    [SoulStoneManager.SLOT_ID.SLOT_YELLOW_2] = {id = SoulStoneManager.SLOT_ID.SLOT_YELLOW_2, name = '�ƻ�ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.YELLOW, color = CSS.QUALITY_ORANGE},
    [SoulStoneManager.SLOT_ID.SLOT_YELLOW_3] = {id = SoulStoneManager.SLOT_ID.SLOT_YELLOW_3, name = '�ƻ�ʯ��λ��', shape = SoulStoneManager.STONE_SHAPE.YELLOW, color = CSS.QUALITY_ORANGE},    
}

--��ʯ�����
SoulStoneManager.JI_BAN_CFG_INFO = {
    {level=1, minlv=3, addprop_tab={{id=3,value=9},{id=4,value=20},{id=5,value=7},{id=6,value=16},{id=7,value=7},{id=8,value=16},{id=9,value=5},{id=10,value=13},{id=11,value=5},{id=12,value=13},{id=30,value=1}}},
    {level=2, minlv=5, addprop_tab={{id=3,value=27},{id=4,value=62},{id=5,value=22},{id=6,value=50},{id=7,value=22},{id=8,value=50},{id=9,value=18},{id=10,value=41},{id=11,value=18},{id=12,value=41},{id=30,value=2}}},
    {level=3, minlv=7, addprop_tab={{id=3,value=66},{id=4,value=147},{id=5,value=54},{id=6,value=120},{id=7,value=54},{id=8,value=120},{id=9,value=44},{id=10,value=98},{id=11,value=44},{id=12,value=98},{id=30,value=3}}},
    {level=4, minlv=9, addprop_tab={{id=3,value=135},{id=4,value=301},{id=5,value=110},{id=6,value=246},{id=7,value=110},{id=8,value=246},{id=9,value=90},{id=10,value=200},{id=11,value=90},{id=12,value=200},{id=30,value=4}}},
    {level=5, minlv=11, addprop_tab={{id=3,value=197},{id=4,value=439},{id=5,value=161},{id=6,value=359},{id=7,value=161},{id=8,value=359},{id=9,value=131},{id=10,value=292},{id=11,value=131},{id=12,value=292},{id=30,value=5}}},
    {level=6, minlv=13, addprop_tab={{id=3,value=423},{id=4,value=940},{id=5,value=346},{id=6,value=770},{id=7,value=346},{id=8,value=770},{id=9,value=281},{id=10,value=626},{id=11,value=281},{id=12,value=626},{id=30,value=6}}},
    {level=7, minlv=15, addprop_tab={{id=3,value=556},{id=4,value=1236},{id=5,value=455},{id=6,value=1013},{id=7,value=455},{id=8,value=1013},{id=9,value=370},{id=10,value=824},{id=11,value=370},{id=12,value=824},{id=30,value=7}}},
}

--��ʯ��λ��������
SoulStoneManager.WU_XING_CFG_INFO = {
    {wxtype=SoulStoneManager.STONE_WX.WX_GOLD, wxname='��', desc='����ʱ2%����ʹĿ�괦�������״̬5��,�����״̬��Ŀ���������25%'},
    {wxtype=SoulStoneManager.STONE_WX.WX_WOOD, wxname='ľ', desc='����ʱ2%����ʹ�Լ��ָ�Ѫ�����޵�5%������,��ȴ10��'},
    {wxtype=SoulStoneManager.STONE_WX.WX_WATER, wxname='ˮ', desc='����ʱ2%����ʹĿ�괦����ħ��״̬5��,��ħ��״̬��Ŀ��ħ������25%'},
    {wxtype=SoulStoneManager.STONE_WX.WX_FIRE, wxname='��', desc='����ʱ2%����ʹĿ�괦������״̬5��,����״̬��Ŀ��ÿ���Ѫ1%��Ѫ��'},
    {wxtype=SoulStoneManager.STONE_WX.WX_SOIL, wxname='��', desc='����ʱ2%����ʹĿ�괦�ڿ־�״̬5��,�־�״̬��Ŀ�깥��������10%'},
}

function SoulStoneManager.IsValidPos(id)
    if (id >= SoulStoneManager.SLOT_ID.SLOT_RED_1) and (id <= SoulStoneManager.SLOT_ID.SLOT_YELLOW_3) then
        return true
    end
    return false
end

function SoulStoneManager.GetWuXingType(stoneitemidx)
    local sParam = getstditeminfo(stoneitemidx, CommonDefine.STDITEMINFO_PARAM1)
    local wxtype = 0
    if BF_IsNumberStr(sParam) then
        wxtype = tonumber(sParam)
    end
    return wxtype
end

function SoulStoneManager.GetStoneLevel(stoneitemidx)
    local sParam = getstditeminfo(stoneitemidx, CommonDefine.STDITEMINFO_PARAM2)
    local stonelv = 0
    if BF_IsNumberStr(sParam) then
        stonelv = tonumber(sParam)
    end
    return stonelv
end

--���ٴ�����ʯ
--[[
function SoulStoneManager.QuickTakeOn(actor, slotid)
    local cfgSlot = SoulStoneManager.SLOT_CFG_INFO[slotid]
    if cfgSlot == nil then
        return
    end

    local sid = "".. slotid
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= "" then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil or infoTab[sid].holelist == nil then
        return
    end

    local currSlotStoneLv = {0, 0, 0, 0}
    for i = 1, #infoTab[sid].holelist do
        if infoTab[sid].holelist[i] <= 0 then
            currSlotStoneLv[i] = 0
        else
            currSlotStoneLv[i] = SoulStoneManager.GetStoneLevel(infoTab[sid].holelist[i])
        end
    end

    -- �ҵ������иû�ʯ��λ����Ƕ����ߵȼ����ĸ���ʯ
    local changestonelist = {
        {seq = 1, stoneidx = 0, stonelv = 0},
        {seq = 2, stoneidx = 0, stonelv = 0},
        {seq = 3, stoneidx = 0, stonelv = 0},
        {seq = 4, stoneidx = 0, stonelv = 0}
    }

    local eligibleStones = {}  -- �����ռ����������ı�����ʯ��Ϣ
    local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
    for i = 0, item_num - 1 do
        local itemobj = getiteminfobyindex(actor, i)
        if not BF_IsNullObj(itemobj) then
            local itemidx = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
            local itemStdmode = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_STDMODE)
            local itemShape = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_SHAPE)
            if (itemStdmode == CommonDefine.ITEM_STDMODE_SOULSTONE) and (itemShape == cfgSlot.shape) then
                local itemOverlap = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_OVERLAP)
                local stoneLevel = SoulStoneManager.GetStoneLevel(itemidx)

                -- �����û�ʯ��ÿһ����ʹ����������Ϊÿ����Ƕֻ��һ����ʯ������������ǣ�
                local num1 = math.min(4, itemOverlap)
                for j = 1, num1 do
                    -- ���ռ��Ļ�ʯ����С��4��ʱ��ֱ�����
                    if #eligibleStones < 4 then
                        table.insert(eligibleStones, {idx = i, stoneLevel = stoneLevel, itemidx = itemidx})
                    else
                        -- �ҵ���ǰ���ռ���ʯ�еȼ���͵Ļ�ʯ�Լ�������
                        local minLevelIndex = 1
                        local minLevel = eligibleStones[1].stoneLevel
                        for j = 2, 4 do
                            local currLevel = eligibleStones[j].stoneLevel
                            if currLevel < minLevel then
                                minLevel = currLevel
                                minLevelIndex = j
                            end
                        end
                        -- �Ƚϵ�ǰ������ʯ�ȼ������ռ���ʯ����͵ȼ���ʯ�ȼ���ͬʱ��Ҫ�Ͷ�Ӧ��λ����Ƕ��ʯ�ȼ��Ƚ�
                        local currSlotIndex = minLevelIndex
                        if (stoneLevel > minLevel) and (currSlotStoneLv[currSlotIndex] == 0 or stoneLevel > currSlotStoneLv[currSlotIndex]) then
                            eligibleStones[minLevelIndex] = {idx = i, stoneLevel = stoneLevel, itemidx = itemidx}
                        end
                    end
                end
            end
        end
    end

    -- ���ռ����Ļ�ʯ��Ϣ���յȼ���������ȷ��˳����ȷ����ʹ����4��Ҳ����
    table.sort(eligibleStones, function(a, b)
        return a.stoneLevel > b.stoneLevel
    end)

    local maxCount = math.min(#eligibleStones, 4)  -- ȷ��ʵ��Ҫѡȡ�Ļ�ʯ���������ȡ4��
    for i = 1, maxCount do
        local stoneInfo = eligibleStones[i]
        changestonelist[i].stoneidx = stoneInfo.itemidx
        changestonelist[i].stonelv = stoneInfo.stoneLevel
    end

    local bChanged = false
    for _, value in ipairs(changestonelist) do
        if value.stoneidx > 0 then
            bChanged = true
            local newitemidx = value.stoneidx
            local newitemname = getstditeminfo(newitemidx, CommonDefine.STDITEMINFO_NAME)
            local newitemwxtype = SoulStoneManager.GetWuXingType(newitemidx)
            local olditemidx = infoTab[sid].holelist[value.seq]
            local olditemname = ""
            if olditemidx > 0 then
                olditemname = getstditeminfo(olditemidx, CommonDefine.STDITEMINFO_NAME)
            end
            takeitem(actor, newitemname, 1)
            if olditemname ~= "" then
                giveitem(actor, olditemname, 1)
            end
            infoTab[sid].holelist[value.seq] = newitemidx
            infoTab[sid].wxlist[value.seq] = newitemwxtype

            -- ���Ը���
            local cfgOldStone = cfg_item[olditemidx]
            local cfgNewStone = cfg_item[newitemidx]
            if cfgOldStone and cfgOldStone.Attribute and (cfgOldStone.Attribute ~= "") then
                local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME.. sid
                addattlist(actor, groupname, "-", cfgOldStone.Attribute)
            end
            if cfgNewStone and cfgNewStone.Attribute and (cfgNewStone.Attribute ~= "") then
                local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME.. sid
                addattlist(actor, groupname, "+", cfgNewStone.Attribute)
            end
        end
    end

    if bChanged then
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO, infoStr)
        SoulStoneManager.RecalJiBan(actor)
        recalcabilitys(actor)
    end
end
]]--

function SoulStoneManager.QuickTakeOn(actor, slotid)
    local cfgSlot = SoulStoneManager.SLOT_CFG_INFO[slotid]
    if cfgSlot == nil then
        return
    end

    local sid = ''..slotid
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid]==nil or infoTab[sid].holelist==nil then
        return
    end    
    local currSlotStoneLv = {0, 0, 0, 0}
    for i = 1, #infoTab[sid].holelist, 1 do
        if infoTab[sid].holelist[i] <= 0 then
            currSlotStoneLv[i] = 0
        else
            currSlotStoneLv[i] = SoulStoneManager.GetStoneLevel(infoTab[sid].holelist[i])
        end
    end

    --�ҵ������иû�ʯ��λ����Ƕ����ߵȼ����ĸ���ʯ
    local changestonelist = {{seq=1, stoneidx=0, stonelv=0},{seq=2, stoneidx=0, stonelv=0},{seq=3, stoneidx=0, stonelv=0},{seq=4, stoneidx=0, stonelv=0}}
	local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
   	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		if not BF_IsNullObj(itemobj) then
			local itemidx = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)                        
			local itemStdmode = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_STDMODE)
			local itemShape = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_SHAPE)                 
			if (itemStdmode==CommonDefine.ITEM_STDMODE_SOULSTONE) and (itemShape==cfgSlot.shape) then
                local itemOverlap = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_OVERLAP)
                local stoneLevel = SoulStoneManager.GetStoneLevel(itemidx)

                local curritemnum = math.max(1,itemOverlap)
                for j = 1, CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM, 1 do
                    if stoneLevel > currSlotStoneLv[j] then
                        if changestonelist[j].stonelv and (stoneLevel > changestonelist[j].stonelv) then
                            changestonelist[j].stoneidx = itemidx
                            changestonelist[j].stonelv = stoneLevel
                            curritemnum = curritemnum - 1                          
                        end
                    end
                    if curritemnum <= 0 then
                        break
                    end                      
                end
			end
		end
   	end

    local bChanged = false
    for _, value in ipairs(changestonelist) do
        if value.stoneidx > 0 then
            bChanged = true
            local newitemidx = value.stoneidx
            local newitemname = getstditeminfo(newitemidx, CommonDefine.STDITEMINFO_NAME)
            local newitemwxtype = SoulStoneManager.GetWuXingType(newitemidx)
            local olditemidx = infoTab[sid].holelist[value.seq]
            local olditemname = ''
            if olditemidx > 0 then
                olditemname = getstditeminfo(olditemidx, CommonDefine.STDITEMINFO_NAME)
            end
            takeitem(actor, newitemname, 1)
            if olditemname ~= '' then
                giveitem(actor, olditemname, 1)
            end
            infoTab[sid].holelist[value.seq] = newitemidx
            infoTab[sid].wxlist[value.seq] = newitemwxtype

            --���Ը���
            local cfgOldStone = cfg_item[olditemidx]
            local cfgNewStone = cfg_item[newitemidx]
            if cfgOldStone and cfgOldStone.Attribute and (cfgOldStone.Attribute ~= '') then     
                local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME..sid
                addattlist(actor, groupname, "-", cfgOldStone.Attribute) 
            end
            if cfgNewStone and cfgNewStone.Attribute and (cfgNewStone.Attribute ~= '') then
                local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME..sid
                addattlist(actor, groupname, "+", cfgNewStone.Attribute) 
            end
        end    
    end

    if bChanged then
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO, infoStr)        
        SoulStoneManager.RecalJiBan(actor)
        recalcabilitys(actor)            
    end
end

--�������»�ʯ
function SoulStoneManager.QuickTakeOff(actor, slotid)
    local cfgSlot = SoulStoneManager.SLOT_CFG_INFO[slotid]
    if cfgSlot == nil then
        return
    end

    local sid = ''..slotid
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        return
    end

    local takeoffitems = {}
    for i = 1, CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM, 1 do
        local stoneitemidx = infoTab[sid].holelist[i]
        if stoneitemidx > 0 then
            local itemname = getstditeminfo(stoneitemidx, CommonDefine.STDITEMINFO_NAME)
            if itemname ~= '' then
                local bFind = false
                for j = 1, #takeoffitems, 1 do
                    if takeoffitems[j].name == itemname then
                        takeoffitems[j].num = takeoffitems[j].num + 1
                        bFind = true
                        break
                    end
                end
                if not bFind then
                    local rec = {name = itemname, num = 1}
                    takeoffitems[#takeoffitems+1] = rec
                end
                infoTab[sid].holelist[i] = 0
                infoTab[sid].wxlist[i] = 0
            end
        end
    end

    if not table.isempty(takeoffitems) then
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO, infoStr)
        Player.GiveItemsToBagOrMail(actor, takeoffitems, '�������»�ʯ')

        local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME..sid
        delattlist(actor, groupname)        
        delattlist(actor, CommonDefine.ABILITY_GROUP_STONE_JIBAN)
        recalcabilitys(actor)
    end
end

--������ҵĻ�ʯ�����
function SoulStoneManager.RecalJiBan(actor)
    if BF_IsNullObj(actor) then
        return
    end

    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if table.isempty(infoTab) then
        return
    end

    local soulminlv = 999
    local slotcount = 0
    for _, value in pairs(infoTab) do
        slotcount = slotcount + 1
        for i = 1, CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM, 1 do
            local stoneitemidx = value.holelist[i]            
            if stoneitemidx == 0 then       
                soulminlv = 0
                break
            else
                local stonelv = SoulStoneManager.GetStoneLevel(stoneitemidx)
                if stonelv < SoulStoneManager.JI_BAN_CFG_INFO[1].minlv then
                    soulminlv = 0
                    break
                elseif stonelv < soulminlv then
                    soulminlv = stonelv
                end
            end
        end
        if soulminlv == 0 then
            break
        end
    end 

    local jibanlevel = 0;
    if (soulminlv==0) or (soulminlv==999) or (slotcount < #SoulStoneManager.SLOT_ID) then
        delattlist(actor, CommonDefine.ABILITY_GROUP_STONE_JIBAN)
    else
        local abstr = ''
        for _, value in ipairs(SoulStoneManager.JI_BAN_CFG_INFO) do
            if soulminlv >= value.minlv then
                abstr = value.addprop_abstr
                jibanlevel = value.level
            else
                break
            end
        end
        if (abstr == nil) or (abstr == '') then
            delattlist(actor, CommonDefine.ABILITY_GROUP_STONE_JIBAN)
        else
            addattlist(actor, CommonDefine.ABILITY_GROUP_STONE_JIBAN, '=', abstr)
            Player.SendSelfMsg(actor, '��ǰ����'..jibanlevel..'����ʯ�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
    end
    setplaydef(actor, CommonDefine.VAR_N_SOULSTONE_JBLEVEL, jibanlevel)
end

--��ҵ�¼ʱ����
function SoulStoneManager.OnPlayerEnterGame(actor)	  
    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end

    for _, value in pairs(infoTab) do
        local slotid = value.slotid
        local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME..slotid
        for i = 1, CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM, 1 do
            local stoneitemidx = value.holelist[i]            
            if stoneitemidx > 0 then       
                local cfgStone = cfg_item[stoneitemidx]
                if cfgStone and cfgStone.Attribute and (cfgStone.Attribute~='') then
                    addattlist(actor, groupname, '+', cfgStone.Attribute)
                end
            end
        end
    end

    SoulStoneManager.RecalJiBan(actor)
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERGAME, SoulStoneManager.OnPlayerEnterGame, CommonDefine.FUNC_ID_SOUL_STONE)



------------------------------------------------------------------------------
--��ʾ�������
function SoulStoneManager.ShowRulePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,21,22,23,24,25,26,27,28,29}|x=268.0|y=69.0|show=0|esc=1|reset=1|img=private/cc_common/rule_panel.png|bg=1|move=0>'..
        '<Layout|id=11|x=525.0|y=-1.0|width=80|height=80|link=@show_base_panel>'..
        '<Button|id=12|x=528.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@show_base_panel>'

    local tempCurrX = 20
    local tempCurrY = 50
    strPanelInfo = strPanelInfo..'<Text|id=21|text=��ʯϵͳ����˵��:|size=20|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    tempCurrY = tempCurrY + 35
    strPanelInfo = strPanelInfo..'<Text|id=22|text=1����ʯ����Ϊ�����̻�������ɫ��ÿ����ɫ����15���ȼ���|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=23|text=2����ɫ��ʯ���ӹ����������ԣ���ɫ��ʯ���ӷ������ԣ�|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=24|text=��ɫ��ʯ����ħ�����ԣ���ɫ��ʯ�����������ԡ�|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=25|text=3����λ��10������ɫ�ͻ�ɫ��3������ɫ����ɫ��2��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=26|text=4��ÿһ����ʯ��λ��������Ƕ4�Ż�ʯ�����������Ƕ��4��|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'		
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=27|text=��ʯ��������ͬ���������ԣ������⼤����������Ч����|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'			
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=28|text=5��������в�λ��Ƕ�Ļ�ʯ�ﵽָ���ĵȼ������������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'		
    tempCurrY = tempCurrY + 30
    strPanelInfo = strPanelInfo..'<Text|id=29|text=���⼤���ʯ����ԣ��������ߵ�����������|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'	

    BF_ShowSpecialUI(actor, strPanelInfo)	    
end

local function GetSingleSoulStoneShowInfo(actor, slotid)
    local strPanelInfo = ''
    if BF_IsNullObj(actor) or not SoulStoneManager.IsValidPos(slotid) then
        return strPanelInfo
    end
    local config = SoulStoneManager.SLOT_CFG_INFO[slotid]
    if config == nil then
        return strPanelInfo
    end

    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    local sid = slotid..''
    if infoTab[sid] == nil then
        return strPanelInfo
    end    

    strPanelInfo = strPanelInfo..'<Layout|id=15|children={501,502,503,504}|x=200.0|y=65.0|width=580|height=420>'..
        '<Text|id=501|x=240.0|y=10.0|size=22|color='..CSS.NPC_YELLOW..'|text='..config.name..'>'..
        '<Layout|id=502|children={511,512,513,514}|x=0|y=60|width=580|height=120>'..
        '<Layout|id=503|children={521,522,523,524,525}|x=0|y=180|width=580|height=240>'..
        '<Button|id=504|x=450|y=10|mimg=private/cc_soulstone/2.png|nimg=private/cc_soulstone/2.png|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_10..'>'
     
    --����Ƕ�Ļ�ʯ
    for i = 1, CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM, 1 do
        local stoneidx = infoTab[sid].holelist[i]    
        local cfgstoneitem = nil
        if stoneidx > 0 then
            cfgstoneitem = cfg_item[stoneidx]
        end
        local tempx = 30 + (i-1) * 144
        local tempy = 10
        local imgid = 510 + i
        local showid = 510 + 20 + i
        local textid = 510 + 40 + i
        if cfgstoneitem == nil then
            strPanelInfo = strPanelInfo..'<Img|id='..imgid..'|x='..tempx..'|y='..tempy..'|move=0|show=0|bg=1|esc=1|reset=1|img=private/cc_soulstone/13.png|link=@soulstone_button,'..            
                SOULSTONE_BUTTONFUNC_ID_4..','..i..'>'
        else
            strPanelInfo = strPanelInfo..'<Img|id='..imgid..'|children={'..showid..','..textid..'}|x='..tempx..'|y='..tempy..'|move=0|show=0|bg=1|esc=1|reset=1|img=private/cc_soulstone/13.png>'            
            strPanelInfo = strPanelInfo..'<ItemShow|id='..showid..'|x=15|y=15|itemid='..stoneidx..'|itemcount=1|showtips=1|dblink=@soulstone_button,'..            
                SOULSTONE_BUTTONFUNC_ID_4..','..i..'>'

            local wxtype = infoTab[sid].wxlist[i]
            if wxtype > 0 then
                local wxname = SoulStoneManager.WU_XING_CFG_INFO[wxtype].wxname
                strPanelInfo = strPanelInfo..'<Text|id='..textid..'|text=['..wxname..']|size=18|x=96|y=70|color='..CSS.NPC_LIGHTGREEN..'>'
            end                
        end
    end

    --�����п���Ƕ��ʯ    
    local currPageNo = getplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1)
    if currPageNo <= 0 then
        currPageNo = 1
        setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, currPageNo)
    end

    local nBagItemCountPerPage = 12
    local strSelect = getplaydef(actor, CommonDefine.VAR_S_SELECT_ITEM)
    local nTempMin = (currPageNo - 1) * nBagItemCountPerPage + 1
    local nTempMax = currPageNo * nBagItemCountPerPage    
    local sValidItemIDList, bDataFinished = Bag.GetBagItemIDInStdmodeStr(actor, CommonDefine.ITEM_STDMODE_SOULSTONE, config.shape, nTempMin, nTempMax)
    strPanelInfo = strPanelInfo..'<BAGITEMS|id=521|x=80|y=20|select='..strSelect..'|filter3='..sValidItemIDList..
        '|count='..nBagItemCountPerPage..'|showtips=1|selecttype=1|row=2|dblink=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_5..'>'      
 
    if currPageNo > 1 then
        strPanelInfo = strPanelInfo..'<Text|id=522|text=��һҳ|size=18|x=20|y=130|color='..CSS.NPC_YELLOW..'|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_6..'>'
    end
    if not bDataFinished then
        strPanelInfo = strPanelInfo..'<Text|id=523|text=��һҳ|size=18|x=510|y=130|color='..CSS.NPC_YELLOW..'|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_7..'>'
    end

    strPanelInfo = strPanelInfo..'<Button|id=524|x=110|y=190|mimg=private/cc_soulstone/3.png|nimg=private/cc_soulstone/3.png|link=@soulstone_button,'..            
        SOULSTONE_BUTTONFUNC_ID_8..'>'..
        '<Button|id=525|x=380|y=190|mimg=private/cc_soulstone/4.png|nimg=private/cc_soulstone/4.png|link=@soulstone_button,'..            
        SOULSTONE_BUTTONFUNC_ID_9..'>'    

    return strPanelInfo
end

local function IsSlotHaveBetterStone(actor, slotid, infoTab)
    if BF_IsNullObj(actor) then
        return false
    end

    local cfgSlot = SoulStoneManager.SLOT_CFG_INFO[slotid]
    if cfgSlot == nil then
        return false
    end
    local sid = ''..slotid
    if infoTab[sid]==nil or infoTab[sid].holelist==nil then
        return false
    end    

    local currSlotStoneLv = {0, 0, 0, 0}
    for i = 1, #infoTab[sid].holelist, 1 do
        if infoTab[sid].holelist[i] <= 0 then
            currSlotStoneLv[i] = 0
        else
            currSlotStoneLv[i] = SoulStoneManager.GetStoneLevel(infoTab[sid].holelist[i])
        end
    end

    --�ҵ������иû�ʯ��λ����Ƕ����ߵȼ����ĸ���ʯ
    local changestonelist = {{seq=1, stoneidx=0, stonelv=0},{seq=2, stoneidx=0, stonelv=0},{seq=3, stoneidx=0, stonelv=0},{seq=4, stoneidx=0, stonelv=0}}
	local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
   	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		if not BF_IsNullObj(itemobj) then
			local itemidx = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)                        
			local itemStdmode = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_STDMODE)
			local itemShape = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_SHAPE)                 
			if (itemStdmode==CommonDefine.ITEM_STDMODE_SOULSTONE) and (itemShape==cfgSlot.shape) then
                local stoneLevel = SoulStoneManager.GetStoneLevel(itemidx)
                for j = 1, CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM, 1 do
                    if stoneLevel > currSlotStoneLv[j] then
                        if changestonelist[j].stonelv and (stoneLevel > changestonelist[j].stonelv) then
                            return true
                        end
                    end
                end
			end
		end
   	end

    return false
end

--��ʾ��ʼ���
function SoulStoneManager.ShowBasePanel(actor)
    local strPanelInfo = '<Img|id=10|children={11,12,13,14,15,16}|x=20.0|y=16.0|reset=1|img=private/cc_soulstone/9.png|show=0|esc=1|move=0|bg=1|loadDelay=0>'..
        '<Layout|id=11|x=813.0|y=14.0|width=80|height=80|link=@exit>'..
        '<Button|id=12|x=814.0|y=14.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>'..
        '<Button|id=13|x=72|y=70|mimg=private/cc_soulstone/1.png|nimg=private/cc_soulstone/1.png|link=@soulstone_button,'..            
        SOULSTONE_BUTTONFUNC_ID_1..'>'..
        '<Button|id=16|x=700.0|y=14.0|esc=0|nimg=private/cc_common/button_help.png|pimg=private/cc_common/button_help.png|link=@show_rule_panel>'

    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end 

    local idstr1 = ''
    for seq, _ in ipairs(SoulStoneManager.SLOT_CFG_INFO) do
        if idstr1 ~= '' then
            idstr1 = idstr1..','
        end
        idstr1 = idstr1..(30+seq)
    end
    strPanelInfo = strPanelInfo..'<ListView|id=14|children={'..idstr1..'}|x=65.0|y=110.0|width=130|height=350|margin=0|direction=1>'
    local chooseid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)   
    local bDataChg = false
    for seq, value in ipairs(SoulStoneManager.SLOT_CFG_INFO) do
        local sid = value.id..''
        if infoTab[sid] == nil then
            infoTab[sid] = {slotid=value.id, holelist={0, 0, 0, 0}, wxlist={0, 0, 0, 0}}
            bDataChg = true
        end
        local stonenum = 0
        if infoTab[sid] and infoTab[sid].holelist then
            for i = 1, #infoTab[sid].holelist, 1 do
                if infoTab[sid].holelist[i] > 0 then
                    stonenum = stonenum + 1
                end
            end
        end

        local baseid = 30 + seq
        local textid1 = baseid * 10 + 1
        local textid2 = baseid * 10 + 2
        if chooseid == -1 then          
            chooseid = value.id         
            setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID, chooseid)
        end        
        if chooseid == value.id then
            strPanelInfo = strPanelInfo..'<Img|id='..baseid..'|children={'..textid1..','..textid2..'}x=-6.0|y=0.0|img=private/cc_soulstone/7.png|link=@soulstone_button,'..
                SOULSTONE_BUTTONFUNC_ID_3..','..value.id..'>'
            strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|x=10.0|y=5.0|size=18|color='..CSS.NPC_YELLOW..'|text='..value.name..'>'
                ..'<Text|id='..textid2..'|x=40.0|y=25.0|size=18|color='..CSS.NPC_YELLOW..'|text=('..stonenum..'/4)>'
            --��Ӧ��ǰѡ�е�װ����λ
            strPanelInfo = strPanelInfo..GetSingleSoulStoneShowInfo(actor, value.id)                
        else
            strPanelInfo = strPanelInfo..'<Img|id='..baseid..'|children={'..textid1..','..textid2..'}x=-6.0|y=0.0|img=private/cc_soulstone/8.png|link=@soulstone_button,'..
                SOULSTONE_BUTTONFUNC_ID_3..','..value.id..'>'
            strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|x=10.0|y=5.0|size=18|color='..CSS.NPC_WHITE..'|text='..value.name..'>'
                ..'<Text|id='..textid2..'|x=40.0|y=25.0|size=18|color='..CSS.NPC_WHITE..'|text=('..stonenum..'/4)>'
        end

        if IsSlotHaveBetterStone(actor, value.id, infoTab) then
            Player.AddRedPoint(actor, 0, baseid, 10, 10)
            if chooseid == value.id then
                Player.AddRedPoint(actor, 0, 525, 10, 10)
            end
        else
            Player.DelRedPoint(actor, 0, baseid)
            if chooseid == value.id then
                Player.DelRedPoint(actor, 0, 525)
            end            
        end
    end 
    if bDataChg == true then
        infoStr = tbl2json(infoTab)
        setplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO, infoStr)
    end

    local tempparam1 = getplaydef(actor, CommonDefine.VAR_N_NPC_TEMPPARAM1)
    if tempparam1 == 1 then
        --��ʾ��ʯ����
        local currlv = getplaydef(actor, CommonDefine.VAR_N_SOULSTONE_JBLEVEL)
        strPanelInfo = strPanelInfo..'<Img|id=50|children={51,52,53,54}|x=273.0|y=27.0|img=private/cc_soulstone/11.png|reset=1|bg=1|esc=1|loadDelay=0|move=0|show=0>'..
            '<Layout|id=51|x=394.0|y=1.0|width=80|height=80|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_2..'>'..
            '<Button|id=52|x=395.0|y=2.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_2..'>'..            
            '<Text|id=53|x=150.0|y=12.0|size=22|color=215|text=��ʯ�>'
        local tempCurrX = 0
        local tempCurrY = 0
        local idstr1 = ''
        for i = 1, #SoulStoneManager.JI_BAN_CFG_INFO, 1 do        
            local jibaninfo = SoulStoneManager.JI_BAN_CFG_INFO[i]            
            if jibaninfo ~= nil then
                local color = CSS.NPC_WHITE
                if jibaninfo.level == currlv then
                    color = CSS.NPC_LIGHTGREEN
                end

                local baseid = 60 + (i-1) * 10                
                local textid1 = baseid + 1
                local textid2 = baseid + 2
                local idstr2 = textid1..','..textid2
                strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|text=['..jibaninfo.level..'��]|size=18|x='..(tempCurrX+10)..'|y='..(tempCurrY+10)..'|color='..color..'>'
                strPanelInfo = strPanelInfo..'<Text|id='..textid2..'|text=ȫ����Ƕ��'..jibaninfo.minlv..'�����ϻ�ʯ�ɼ���:|size=18|x='..(tempCurrX+10)..'|y='..(tempCurrY+30)..'|color='..color..'>'
    
                local innery = tempCurrY + 50
                local currPropDescTable = jibaninfo.addprop_desctab
                for seq, descItem in ipairs(currPropDescTable) do
                    local textidxx = baseid + 2 + seq
                    strPanelInfo = strPanelInfo..'<Text|id='..textidxx..'|text='..descItem.desc..'|size=15|x='..(tempCurrX+30)..'|y='..innery..'|color='..color..'>'
                    innery = innery + 15
                    idstr2 = idstr2..','..textidxx
                end

                strPanelInfo = strPanelInfo..'<Layout|id='..baseid..'|children={'..idstr2..'}|x=0|y=0|width=300|height=170>'

                if idstr1 ~= '' then
                    idstr1 = idstr1..','
                end
                idstr1 = idstr1..baseid
            end
        end
        strPanelInfo = strPanelInfo..'<ListView|id=54|children={'..idstr1..'}|x=52.0|y=58.0|width=300|height=320|direction=1|margin=0>'

    elseif tempparam1 == 2 then
        --��ʾ��ʯ�������
        strPanelInfo = strPanelInfo..'<Img|id=50|children={51,52,53,54}|x=273.0|y=27.0|img=private/cc_soulstone/11.png|reset=1|bg=1|esc=1|loadDelay=0|move=0|show=0>'..
            '<Layout|id=51|x=394.0|y=1.0|width=80|height=80|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_2..'>'..
            '<Button|id=52|x=395.0|y=2.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@soulstone_button,'..SOULSTONE_BUTTONFUNC_ID_2..'>'..            
            '<Text|id=53|x=150.0|y=12.0|size=22|color=215|text=��������>'
        local tempCurrX = 0
        local tempCurrY = 0
        local idstr1 = ''        

        local slotid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
        for i = 1, #SoulStoneManager.WU_XING_CFG_INFO, 1 do  
            local wxstone = 0
            local sid = slotid..''
            local cfgwx = SoulStoneManager.WU_XING_CFG_INFO[i]
            if infoTab[sid] and infoTab[sid].wxlist and (type(infoTab[sid].wxlist)=='table') then     
                for _, wxtype in ipairs(infoTab[sid].wxlist) do
                    if wxtype == cfgwx.wxtype then
                        wxstone = wxstone + 1
                    end
                end
            end          
            
            local color = CSS.NPC_GRAY
            if wxstone >= CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM then
                color = CSS.NPC_LIGHTGREEN
            elseif wxstone > 0 then
                color = CSS.NPC_YELLOW
            end
    
            local baseid = 60 + (i-1) * 10                
            local textid1 = baseid + 1
            local textid2 = baseid + 2
            local textid3 = baseid + 3
            local idstr2 = textid1..','..textid2..','..textid3            
            strPanelInfo = strPanelInfo..'<Text|id='..textid1..'|text=4��'..cfgwx.wxname..'���Ի�ʯ�ɼ���:|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..color..'>'..
                        '<Text|id='..textid2..'|text=('..wxstone..'/4):|size=18|x='..(tempCurrX+180)..'|y='..tempCurrY..'|color='..color..'>'
            strPanelInfo = strPanelInfo..'<Text|id='..textid3..'|text='..cfgwx.desc..'|size=15|x='..tempCurrX..'|y='..(tempCurrY+25)..'|color='..color..'>'
            strPanelInfo = strPanelInfo..'<Layout|id='..baseid..'|children={'..idstr2..'}|x=0|y=0|width=300|height=60>'
            if idstr1 ~= '' then
                idstr1 = idstr1..','
            end
            idstr1 = idstr1..baseid            
        end
        strPanelInfo = strPanelInfo..'<ListView|id=54|children={'..idstr1..'}|x=52.0|y=58.0|width=300|height=320|direction=1|margin=0>'        

    end
    BF_ShowSpecialUI(actor, strPanelInfo)
end

--��Ƕ�滻��ʯ
local function DoFillHoleStone(actor, sholeseq)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_SOUL_STONE, false) then
        return
    end
    local slotid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    local sid = slotid..''
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) or not BF_IsNumberStr(sholeseq) then
        return
    end
    if not SoulStoneManager.IsValidPos(slotid) then
        return
    end    
    local seq = tonumber(sholeseq)
    if (seq==nil) or (seq<1) or (seq>CommonDefine.SOUL_STONE_SLOT_MAX_HOLE_NUM) then
        return
    end
    local slotcfg = SoulStoneManager.SLOT_CFG_INFO[slotid]
    if slotcfg == nil then
       return 
    end

    if getbagblank(actor) < 1 then
        Player.SendSelfMsg(actor, '�����������1�������ո�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
    local chooseItemMakeIdx = getplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX)
    if chooseItemMakeIdx <= 0 then
        Player.SendSelfMsg(actor, '��˫��ѡ���ʯ��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end   
    --Ч���Ƿ�Ϊ��������
    local chooseItemObj = Bag.GetItemByMakeindex(actor, chooseItemMakeIdx)
    if BF_IsNullObj(chooseItemObj) then
        Player.SendSelfMsg(actor, '��˫��ѡ���ʯ��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end    

    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end
    if infoTab[sid] == nil then
        return
    end

    local chooseitemidx = getiteminfo(actor, chooseItemObj, CommonDefine.ITEMINFO_ITEMIDX)    
    local curritemidx = infoTab[sid].holelist[seq]
    if Player.GetItemNumInBag(actor, chooseitemidx) < 1 then
        return
    end
    local takeitemstdmode = getstditeminfo(chooseitemidx, CommonDefine.STDITEMINFO_STDMODE)
    local takeitemshape = getstditeminfo(chooseitemidx, CommonDefine.STDITEMINFO_SHAPE)
    if (takeitemstdmode ~= CommonDefine.ITEM_STDMODE_SOULSTONE) or (takeitemshape ~= slotcfg.shape) then
        Player.SendSelfMsg(actor, 'ѡ��Ļ�ʯ��ƥ�䣡', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end

    local takeitemname = getstditeminfo(chooseitemidx, CommonDefine.STDITEMINFO_NAME)    
    local choosestone_wxtype = SoulStoneManager.GetWuXingType(chooseitemidx)
    local giveitemname = ''
    if curritemidx > 0 then
        giveitemname = getstditeminfo(curritemidx, CommonDefine.STDITEMINFO_NAME)
    end
    takeitem(actor, takeitemname, 1)
    if giveitemname ~= '' then
        giveitem(actor, giveitemname, 1)
    end
    infoTab[sid].holelist[seq] = chooseitemidx
    infoTab[sid].wxlist[seq] = choosestone_wxtype
    infoStr = tbl2json(infoTab)
    setplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO, infoStr)

    --���Ը���
    local cfgOldStone = cfg_item[curritemidx]
    local cfgNewStone = cfg_item[chooseitemidx]
    if cfgOldStone and cfgOldStone.Attribute and (cfgOldStone.Attribute ~= '') then     
        local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME..sid
        addattlist(actor, groupname, "-", cfgOldStone.Attribute) 
    end
    if cfgNewStone and cfgNewStone.Attribute and (cfgNewStone.Attribute ~= '') then
        local groupname = CommonDefine.ABILITY_GROUP_STONE_PRENAME..sid
        addattlist(actor, groupname, "+", cfgNewStone.Attribute) 
    end
    SoulStoneManager.RecalJiBan(actor)
    recalcabilitys(actor)
end

--ȫ��ж��
local function DoQuickTakeOff(actor)
    if BF_IsNullObj(actor) then
        return
    end
    local slotid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    if not SoulStoneManager.IsValidPos(slotid) then
        return
    end
    SoulStoneManager.QuickTakeOff(actor, slotid)
end

--һ����Ƕ
local function DoQuickTakeOn(actor)
    if BF_IsNullObj(actor) then
        return
    end
    local slotid = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    if not SoulStoneManager.IsValidPos(slotid) then
        return
    end
    if getbagblank(actor) < 4 then
        Player.SendSelfMsg(actor, '�����������4�������ո�', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return
    end
   
    SoulStoneManager.QuickTakeOn(actor, slotid)
end

--����button�ص�
function SoulStoneManager.DoOperButton(actor, sid, sparam)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end    
    local funcid = tonumber(sid)
    local param = getplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID)
    if BF_IsNumberStr(sparam) then
        param = tonumber(sparam)
    end

    setplaydef(actor, CommonDefine.VAR_N_NPC_TEMPPARAM1, 0)
    if funcid == SOULSTONE_BUTTONFUNC_ID_1 then
        setplaydef(actor, CommonDefine.VAR_N_NPC_TEMPPARAM1, 1)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_2 then        
        setplaydef(actor, CommonDefine.VAR_N_NPC_TEMPPARAM1, 0)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_3 then
        setplaydef(actor, CommonDefine.VAR_N_LAST_NPC_CHOOSEID,  param)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_4 then
        DoFillHoleStone(actor, param)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_5 then
        local strSelect = getplaydef(actor, CommonDefine.VAR_S_SELECT_ITEM)
        if not BF_IsNumberStr(strSelect) then
            Player.SendSelfMsg(actor, '��˫��ѡ���ʯ��', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
            return
        end
        setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, tonumber(strSelect))
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_6 then        
        local currPageNo = getplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1)
        setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, currPageNo-1)        
        setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, 0)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_7 then        
        local currPageNo = getplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1)
        setplaydef(actor, CommonDefine.VAR_N_CURR_NPC_DATA_PAGE1, currPageNo+1)
        setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, 0)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_8 then        
        DoQuickTakeOff(actor)
        setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, 0)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_9 then        
        DoQuickTakeOn(actor)
        setplaydef(actor, CommonDefine.VAR_N_CHOOSE_ITEM_MAKEIDX, 0)
    elseif funcid == SOULSTONE_BUTTONFUNC_ID_10 then
        setplaydef(actor, CommonDefine.VAR_N_NPC_TEMPPARAM1, 2)
    end
    SoulStoneManager.ShowBasePanel(actor)
end

--�Ƿ��п����ʾ
function SoulStoneManager.IsHaveQuickTip(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_SOUL_STONE, false) then
        return false
    end

    local infoStr = getplaydef(actor, CommonDefine.VAR_T_SOULSTONE_SLOT_INFO)
    local infoTab = {}
    if infoStr ~= '' then
        infoTab = json2tbl(infoStr)
    end 

    for _, value in ipairs(SoulStoneManager.SLOT_CFG_INFO) do
        local sid = value.id..''
        if infoTab[sid] ~= nil then
            if IsSlotHaveBetterStone(actor, value.id, infoTab) then
                return true
            end
        end
    end 

    return false
end

return SoulStoneManager