ItemUseManager = {}

--��Ӧ ���߱�� Anicount
function ItemUseManager.DoUse(actor, itemobj)
    if BF_IsNullObj(actor) or BF_IsNullObj(itemobj) then
        return false
    end

    local itemid = getiteminfo(actor, itemobj, CommonDefine.ITEMINFO_ITEMIDX)
    local anicount = getstditeminfo(itemid, CommonDefine.STDITEMINFO_ANICOUNT)
    if anicount == 0 then
        Player.SendSelfMsg(actor, '���߹��ܻ�δ������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        return false
    elseif anicount == 10 then
        --�������ʯ
        local mapidstr = Player.GetMapIDStr(actor)
        map(actor, mapidstr)
        return true        
    elseif anicount == 11 then
        --���洫��ʯ
        Player.GoBQHome(actor)
        return true       
    elseif anicount == 12 then
        --���ػس�ʯ
        Player.GoMZHome(actor)
        return true
    elseif anicount == 201 then
        --ʹ�òر�ͼ
        return TreasureMap.DoUseItem(actor)
    elseif anicount == 202 then
        --ʹ�õ��ߺ��ö�Ӧ�ĵ��ߣ�֧�̶ֹ����� �� �������
        local itemname = getstditeminfo(itemid, CommonDefine.STDITEMINFO_NAME)
        local config = cfgUnpackItem[itemid]
        if config == nil then
            return false
        end
        --�̶�����
        if config.fixedrewards_tab and not table.isempty(config.fixedrewards_tab) then
            Player.GiveItemsToBagOrMail(actor, config.fixedrewards_tab, 'ʹ��:'..itemname)            
        end
        --�������
        if config.randomrewards_tab and not table.isempty(config.randomrewards_tab) then
            local finalrewards = BF_GetRandomTab(config.randomrewards_tab, -1)
            if finalrewards and finalrewards.rewards and not table.isempty(finalrewards.rewards) then
                Player.GiveItemsToBagOrMail(actor, finalrewards.rewards, 'ʹ��:'..itemname)
            end
        end                
        return true
    elseif anicount == 203 then
        --װ����λֱ�����Ǳ�ʯ
        local starconfig = {
            {itemidx=321, star=3},
            {itemidx=322, star=4},
            {itemidx=323, star=5},
            {itemidx=324, star=6},
            {itemidx=325, star=7},
            {itemidx=326, star=8},
            {itemidx=327, star=9},
            {itemidx=328, star=10},
            {itemidx=329, star=11},
            {itemidx=330, star=12},
            {itemidx=331, star=13},
            {itemidx=332, star=14},
            {itemidx=333, star=15},
        }
        for _, value in ipairs(starconfig) do
            if value.itemidx == itemid then
                return EquipPosStarManager.RandomUpgradePosToTargStarNum(actor, value.star)
            end
        end
        return false
    elseif anicount == 204 then
        --��������
        local msg = '<Img|children={0,1,2,3,4}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
            '<Layout|id=0|width=348|height=200>'..
            '<Text|id=1|x=80|y=25|size=18|color='..CSS.NPC_WHITE..'|text=������Ҫ�ĵ�����>'..            
            '<Input|id=2|inputid=1|type=0|x=80|y=60|width=150|height=25|place=ѡ��������|placecolor='..CSS.NPC_WHITE..'|color='..CSS.NPC_WHITE..'|size=20|isChatInput=1|mincount=4|maxcount=14>'..
            '<Button|id=3|x=180|y=100|submitInput=1|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȷ��|link=@changename_button, 1>'..
            '<Button|id=4|x=40|y=100|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ȡ��|link=@changename_button, 0>'

        BF_ShowSpecialUI(actor, msg)
        return false
    end
end

return ItemUseManager