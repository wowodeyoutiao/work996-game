Bag = {}

--����makeindex���ر�������
function Bag.GetItemByMakeindex(actor, index)
	local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
   	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local makeindex = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_UNIQUEID)
		if makeindex == index then
			return itemobj
		end
   	end
	return nil
end

--����makeindex���ر������ߵ�itemidx
function Bag.GetItemidxByMakeindex(actor, index)
	local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
   	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local makeindex = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_UNIQUEID)
		if makeindex == index then
			return getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
		end
   	end
	return 0
end

--��makeidx��ⱳ���е��Ƿ��ж�Ӧ���߶���
function Bag.CheckItemInBag(actor, makeindex)
	if BF_IsNullObj(actor) then
		return false
	end
	if (makeindex==nil) or (makeindex == 0) then
		return false
	end
	if hasitem(actor, makeindex) == 1 then
		return true
	end
	return false
end

--�жϱ���������Ʒtable�Ƿ����㹻�ռ�
function Bag.IsHaveEnoughBagSpace(actor, items)
    if BF_IsNullObj(actor)  then
        return false
    end    
    if (items == nil) or (type(items) ~= 'table') then
        return true
    end

    local nNeedBagSpace = 0
    for _, value in ipairs(items) do        
        if not Item.isCurrency(value.name) then
            local leftnum = value.num
			local srcitemidx = getstditeminfo(value.name, CommonDefine.STDITEMINFO_IDX)
			local itemOverlap = getstditeminfo(value.name, CommonDefine.STDITEMINFO_OVERLAP)

			if itemOverlap == nil then
				release_print('IsHaveEnoughBagSpace itemname error:'..value.name)
			else
				if itemOverlap > 1 then
					local item_num = getbaseinfo(actor, CommonDefine.INFO_HUMBAGITEMNUM)
					for i=0, item_num-1 do
						local itemobj = getiteminfobyindex(actor, i)
						local itemidx = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
						if srcitemidx == itemidx then
							--����û�д���󶨵����⣡���������� todo.....
							--����û�д���󶨵����⣡���������� todo.....
							--����û�д���󶨵����⣡���������� todo.....
							--����û�д���󶨵����⣡���������� todo.....
							--����û�д���󶨵����⣡���������� todo.....
							local currnum = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_OVERLAP)
							leftnum = leftnum - (itemOverlap - currnum)
							if leftnum < 0 then
								leftnum = 0
								break
							end
						end
					end
	
					if leftnum > 0 then
						if leftnum % itemOverlap == 0 then
							nNeedBagSpace = nNeedBagSpace + math.floor(leftnum / itemOverlap)
						else
							nNeedBagSpace = nNeedBagSpace + math.floor(leftnum / itemOverlap) + 1
						end
					end
				end
			end
        end
    end

	if nNeedBagSpace > getbagblank(actor) then
		return false
	end
	return true
end

--���ر�����[min,max]��ָ�� stdmode��shape �ĵ���ID�ַ���  ,  �ָ�
--�����Ƿ���������ϵı��
function Bag.GetBagItemIDInStdmodeStr(actor, stdmode, shape, min, max)
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
			local itemStdmode = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_STDMODE)
			local itemShape = getstditeminfo(itemidx, CommonDefine.STDITEMINFO_SHAPE)
			if ((stdmode==0) or (itemStdmode==stdmode)) and ((shape==0) or (itemShape==shape)) then
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

--[[

--�����Ʒ����
function Bag.checkItemNumByIdx(actor, idx, num)
	num = num or 1
	local count = Bag.getItemNumByIdx(actor, idx)
	return count >= num
end

--��ȡ�����ո�����
function Bag.getBagEmptyNum(actor)
	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	return ConstCfg.bagcellnum - item_num
end

--��鱳���ո�����
function Bag.checkBagEmptyNum(actor, num)
	local empty_num = Bag.getBagEmptyNum(actor)
	return empty_num >= num
end

--��鱳���Ƿ��㹻������Ʒ items
function Bag.checkBagEmptyItems(actor, items)
	local bagEmptyNum = Bag.getBagEmptyNum(actor)
	local needEmptyNum = 0
	for _,item in ipairs(items) do
        local idx,num = item[1],item[2]
        if not Item.isCurrency(idx) then    --��Ʒ װ��
			needEmptyNum = needEmptyNum + 1
        end
    end
	return bagEmptyNum >= needEmptyNum
end

--��ȡ������ĳ����Ʒ����
function Bag.getItemObjByIdx(actor, idx)
	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
		if itemidx == idx then
			return itemobj
		end
	end
end

--��ȡ������ĳ����ƷΨһid
function Bag.getItemMakeIdByIdx(actor, idx)
	local itemobj = Bag.getItemObjByIdx(actor, idx)
	if not itemobj then return end
	return getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
end

--��鱳���Ƿ���ĳ����Ʒ������ͨ��Ψһid
function Bag.checkItemNumByMakeIndex(actor, makeindex, num)
	num = num or 1

	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemmakeid = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeid == makeindex then
			if num > 1 then
				local overlap = getiteminfo(actor, itemobj, ConstCfg.iteminfo.overlap)
				if overlap < num then return false end
			end
			return true
		end
	end

	return false
end

--��ȡ������ĳ����Ʒ����ͨ��ΨһID
function Bag.getItemObjByMakeIndex(actor, makeindex)
	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemmakeindex = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeindex == makeindex then
			return itemobj
		end
	end
end

]]--
return Bag