Item = {}

--���idx�Ƿ��ǻ���
function Item.isCurrency(idxOrName)
    local stdmode = getstditeminfo(idxOrName, CommonDefine.STDITEMINFO_STDMODE)
    return stdmode == 41
end

function Item.GetItemQualityLvByID(itemid)
    local qualitylv = CommonDefine.ITEM_QUALITY_WHITE
    if itemid == nil then
        return qualitylv
    end
    local cfgInfo = cfg_equip[itemid]
    if cfgInfo == nil then
        cfgInfo = cfg_item[itemid]
    end
    if cfgInfo == nil then
        return qualitylv
    end    
    if cfgInfo.QualityLv == nil then
        return qualitylv
    else
        qualitylv = cfgInfo.QualityLv
    end
    return qualitylv
end

--���ص��ߵ�Ʒ��
function Item.GetItemQualityLv(actor, equipitem)
    local qualitylv = CommonDefine.ITEM_QUALITY_WHITE
    if BF_IsNullObj(actor) or BF_IsNullObj(equipitem) then
        return qualitylv
    end
    local itemid = getiteminfo(actor, equipitem, CommonDefine.ITEMINFO_ITEMIDX)
    return Item.GetItemQualityLvByID(itemid)
end

--���ص��ߵ�Ʒ����ɫid
function Item.GetItemQualityColor(actor, equipitem)
    local qualitylv = Item.GetItemQualityLv(actor, equipitem)  
    return CSS.GetQualityColor(qualitylv)
end

--���ص��߶�Ӧ����Ч�����ݹ��ܲ�ͬ������
function Item.GetUIShowEffect(itemid, functionid)
    local effectid = 0
    if (itemid == nil) or (functionid == nil) then
        return effectid
    end

    local qualitylv = Item.GetItemQualityLvByID(itemid)
    if functionid == CommonDefine.FUNC_ID_COMPOSE then
        --���ж�װ�����츳����

        if qualitylv == CommonDefine.ITEM_QUALITY_PINK then
            return 15009
        elseif qualitylv == CommonDefine.ITEM_QUALITY_GOLD then
            return 15010
        elseif qualitylv == CommonDefine.ITEM_QUALITY_RED then
            return 15011
        end
    elseif (functionid == CommonDefine.FUNC_ID_SOUL_STONE) or (functionid == CommonDefine.FUNC_ID_BAOZHU) then
        if qualitylv == CommonDefine.ITEM_QUALITY_GREEN then
            return 15018
        elseif qualitylv == CommonDefine.ITEM_QUALITY_BLUE then
            return 15019
        elseif qualitylv == CommonDefine.ITEM_QUALITY_PURPLE then
            return 15020
        elseif qualitylv == CommonDefine.ITEM_QUALITY_PINK then
            return 15022
        elseif qualitylv == CommonDefine.ITEM_QUALITY_GOLD then
            return 15024
        elseif qualitylv == CommonDefine.ITEM_QUALITY_RED then
            return 15025
        end
    else
        if qualitylv == CommonDefine.ITEM_QUALITY_PURPLE then
            return 15061
        elseif qualitylv == CommonDefine.ITEM_QUALITY_PINK then
            return 15062
        elseif qualitylv == CommonDefine.ITEM_QUALITY_GOLD then
            return 15067
        elseif qualitylv == CommonDefine.ITEM_QUALITY_RED then
            return 15063
        end
    end
    
    return effectid
end

--[[
--���idx�Ƿ�����Ʒ
function Item.isItem(idx)
    local stdmode = getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    if stdmode == 41 then return end
    return not ConstCfg.stdmodewheremap[stdmode]
end

--���idx�Ƿ���װ��
function Item.isEquip(idx)
    local stdmode = getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    if stdmode == 41 then return end
    return ConstCfg.stdmodewheremap[stdmode]
end

--��ȡwhereͨ��idx
function Item.getWheresByIdx(idx)
    local stdmode = getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    return ConstCfg.stdmodewheremap[stdmode]
end

--��ȡidxͨ��where
function Item.getIdxByWhere(actor, where)
    local equipobj = linkbodyitem(actor, where)
    if equipobj == "0" then return end
    return getiteminfo(actor, equipobj, ConstCfg.iteminfo.idx)
end

--��ȡ��Ʒ����ͨ��idx
function Item.getNameByIdx(idx)
    if idx == ConstCfg.money.bdjade then
        return "���"
    end
    return getstditeminfo(idx, ConstCfg.stditeminfo.name)
end

]]--

return Item