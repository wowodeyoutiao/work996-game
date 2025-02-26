PublicBossManager = {}

--buttonid
local MAP_BUTTON_ID_1 = 101

--functionid
local PUBLICBOSS_BUTTONFUNC_ID_1 = 1    --Ұ�������ͼ�еĹ��ܰ���-�˳���ͼ
local PUBLICBOSS_BUTTONFUNC_ID_3 = 3    --Ұ�������ͼ�еĹ��ܰ���-����˳���ͼ
local PUBLICBOSS_BUTTONFUNC_ID_4 = 4    --Ұ�������ͼ�еĹ��ܰ���-ԭ�ظ���

--�ж��Ƿ�ΪҰ�������ͼ
function PublicBossManager.IsBossMap(mapidstr)
    for _, value in pairs(cfgPublicBossInfo) do
        --�����������mapid��ʱ�������ֵ����
        local idstr = value.mapid..''        
        if idstr == mapidstr then
            return true
        end
    end
    return false
end

local function InitMapUI(actor)
    addbutton(actor, 104, MAP_BUTTON_ID_1, '<Button|text=�뿪��ͼ|x=-300|y=-520|color='..CSS.NPC_WHITE..'|pimg=public/1900000662.png|nimg=public/1900000663.png|link=@publicboss_button,'..
        PUBLICBOSS_BUTTONFUNC_ID_1..'>')      
end

local function ClearMapUI(actor)
    delbutton(actor, 104, MAP_BUTTON_ID_1)
end

function PublicBossManager.DoMapButton(actor, sid)
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    local funcid = tonumber(sid)
    if funcid == PUBLICBOSS_BUTTONFUNC_ID_1 then
        --���ذ�ȫ��
        gohome(actor)
    elseif funcid == PUBLICBOSS_BUTTONFUNC_ID_3 then
        --������ذ�ȫ��
        if Player.IsDead(actor) then
            realive(actor)                       
        end        
        gohome(actor) 
    elseif funcid == PUBLICBOSS_BUTTONFUNC_ID_4 then
        --ԭ�ظ���        
        if not Player.IsDead(actor) then
            return
        end

        local relivetimes = getplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES) + 1
        local needitems = Player.GetCommonLocalReliveNeedItems(relivetimes)
        if not Player.CheckItemsEnough(actor, needitems, '����') then
            return
        end        
        --�۳�����
        Player.TakeItems(actor, needitems, 'Ұ�������ͼ����')
        setplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES, relivetimes + 1)        
        realive(actor)
    end
end

--����ͼ�Ļص�
function PublicBossManager.OnEnterMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not PublicBossManager.IsBossMap(mapidstr)) then
        return
    end
    InitMapUI(actor)
    local attackmode = getattackmode(actor)
    setplaydef(actor, CommonDefine.VAR_N_LAST_ATTACK_MODE, attackmode)
    setattackmode(actor, CommonDefine.ATTACK_MODE_ALL, 36000) 
    setplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES, 0)

    --ÿ�ձ�������        
    EverydayTask.AddTaskCounter(actor, CommonDefine.FUNC_ID_PUBLIC_BOSS, 1)    
end

--�뿪��ͼ�Ļص�
function PublicBossManager.OnLeaveMap(actor, mapidstr, x, y)
    if BF_IsNullObj(actor) or (not PublicBossManager.IsBossMap(mapidstr)) then
        return
    end    
    ClearMapUI(actor)    
    setattackmode(actor, -1, 0)        
    local attackmode = getplaydef(actor, CommonDefine.VAR_N_LAST_ATTACK_MODE)
    changeattackmode(actor, attackmode)
end

--��������ص�
function PublicBossManager.OnPlayerDie(actor, killer)
    if BF_IsNullObj(actor) then
        return
    end
    local mapid = Player.GetMapIDStr(actor)
    if not PublicBossManager.IsBossMap(mapid) then
        return
    end
    local killername = 'BOSS'
    if not BF_IsNullObj(killer) then
        killername = Player.GetName(killer)
    end

    local relivetimes = getplaydef(actor, CommonDefine.VAR_N_COMMON_LOCAL_RELIVE_TIMES)
    local needitems = Player.GetCommonLocalReliveNeedItems(relivetimes+1)
    local needitemstr = BF_GetItemTableDescStr(nil, needitems)
    local msg = '<Img|children={0,1,2,3,4,5,6}|a=1|x=737|y=201|reset=1|move=1|img=private/revive/bg_swfh_1.png|bg=1>'..
        '<Layout|id=0|width=348|height=200>'..
        '<Text|id=1|x=110|y=15|size=18|color='..CSS.NPC_WHITE..'|text=��������>'..
        '<Text|id=2|x=77|y=45|size=16|color='..CSS.NPC_WHITE..'|text=�㱻 '..killername..' ɱ���ˣ�>'..        
        '<Button|id=3|x=45|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=��������|link=@publicboss_button,'..PUBLICBOSS_BUTTONFUNC_ID_3..'>'..
        '<Button|id=4|x=170|y=75|pimg=public/1900000652.png|nimg=public/1900000653.png|color='..CSS.NPC_WHITE..'|size=17|text=ԭ�ظ���|link=@publicboss_button,'..PUBLICBOSS_BUTTONFUNC_ID_4..'>'..
        '<COUNTDOWN|id=5|x=70|y=110|time=30|count=1|size=16|color='..CSS.NPC_RED..'|link=@publicboss_button,'..PUBLICBOSS_BUTTONFUNC_ID_3..'>'..
        '<Text|id=6|x=170|y=110|size=16|color='..CSS.NPC_WHITE..'|text='..needitemstr..'>'  
    Player.ShowReliveDialogue(actor, msg)
end

GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_ENTERMAP, PublicBossManager.OnEnterMap, CommonDefine.FUNC_ID_PUBLIC_BOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_LEAVEMAP, PublicBossManager.OnLeaveMap, CommonDefine.FUNC_ID_PUBLIC_BOSS)
GameEventManager.AddListener(CommonDefine.EVENT_NAME_PLAYER_DIE, PublicBossManager.OnPlayerDie, CommonDefine.FUNC_ID_PUBLIC_BOSS)

return PublicBossManager