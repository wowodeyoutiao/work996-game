require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()


----------------------------------------------------------------�����ص�����start--------------------------------------------------------------------------
-- ������������
function startup(sysobj)  
    --�Զ���ϵͳ��������ʱ�������������
    --inisysvar("integer","ϵͳ����_1",0)  --��������ʱ ��������
    --inisysvar("integer","ϵͳ����_2",1)  --��������ʱ ��������
    --inisysvar("integer","ϵͳ����_3",2)  --��������ʱ ȡ��
    --inisysvar("integer","ϵͳ����_4",3)  --��������ʱ ȡС
    --inisysvar("integer","ϵͳ����_5",4)  --��������ʱ ���
    --inisysvar("string","ϵͳ����_6",5)   --��������ʱ ����
    --inisysvar("string","ϵͳ����_7",6)   --��������ʱ ɾ��    

    --�ϴ���ת�� ���ܣ�����
    --[[
    local randnum = math.random(12, 16)
    setsysvar("G130", randnum)
    randnum = math.random(13, 17)
    setsysvar("G131", randnum)    
    ]]--
end

-- ��ɫ��½����
function login(actor)
    --�Զ�����ұ�����ʼ��������Ĺ�����̫���㣬��ʱ��ʹ��
    --iniplayvar(actor, "integer", "HUMAN", "��ұ���_1")
    --iniplayvar(actor, "string", "HUMAN", "��ұ���_2")    
    -- #CALL [\��Ϸ��½\��½�ű�.txt] @��½����
    -- #CALL [\��Ϸ��½\���ϵͳ.txt] @��ŷ���
    -- #CALL [\��������\��������.txt] @��¼���
    -- #CALL [\Ԫ�����\Ԫ���������.txt] @ˢ��
    -- #CALL [\Ԫ�����\Ԫ������.txt] @����
    -- #CALL [\��Ϸ����\װ����Ѫ.txt] @��Ѫ����
    -- #CALL [\��Ϸ����\װ������.txt] @װ������      
    --[[
    --�����ж��Ƿ񴥷����ֵ��Զ�����
    if Player.GetLevel(actor) < CommonDefine.PLAYER_AUTO_ADDEXP_MAXLV then
        setontimer(actor, 0, 1)
    end
    --�����ж��Ƿ��ڼ����ݵ�
    if Player.GetMapIDStr(actor) == CommonDefine.MAPNAME_JQPD then
        setontimer(actor, 5, 1)
    end
    ]]--

    
    --�����ʼ��
    TopIcon.InitUI(actor)
    GameCurrencyUI.InitUI(actor)
    MainUIBase.InitUI(actor)

    --����Ƿ�������ֳ�ʼ��
    Player.InitNewPlayer(actor)    

    --����������ߵ��¼�����
    GameEventManager.DoTriggerEvent(CommonDefine.EVENT_NAME_PLAYER_ENTERGAME, actor)

    --������״̬
    Player.CheckSpeedUpStatus(actor)        

    recalcabilitys(actor)

    --����ս����Ϣ
    local currpower = Player.GetPlayerPower(actor);
    setplaydef(actor, CommonDefine.VAR_N_LAST_PLAYERPOWER, currpower);
    Player.SendSelfMsg(actor, '��ǰս��:'..currpower, CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
    local str = '<Img|id=5010|children={5011}|x=272|y=30|img=private/cc_mainui/zhanli.png>'..
        '<Text|id=5011|text='..currpower..'|x=100|y=16|color='..CSS.NPC_WHITE..'|size=25>'
    addbutton(actor, 101, 999, str)    

    --���ߴ���ƺ�����߼�
    --���ߴ���ƺ�����߼�
    --���ߴ���ƺ�����߼�
    --���ߴ���ƺ�����߼�
    --���ߴ���ƺ�����߼� todo......
end

----------------------------------------------------------------�����ص�����end--------------------------------------------------------------------------


----------------------------------------------------------------ontimer���˶�ʱ��start--------------------------------------------------------------------------
--[[
---���ֿ����Զ�������50
function ontimer0(actor)
    if (Player.GetLevel(actor) < CommonDefine.PLAYER_AUTO_ADDEXP_MAXLV) and (Player.GetMapIDStr(actor) == CommonDefine.MAPNAME_NEWREN) then
        changeexp(actor, '+', 20000, false)
    end
end

--�����ݵ�
function ontimer5(actor)
    local nFlag = getsysvar('I66');
    if nFlag ~= 1 then
        return
    end

    local distance = BF_GetDistanceFromMapPoint(actor, CommonDefine.MAPNAME_JQPD, 23, 26);
    if distance <= 1 then
        changemoney(actor, CommonDefine.ITEMID_GOLD, '+', 20, '�ݵ�', true)
        changeexp(actor, '+', 300000, true)     --�����ݵ㾭��Ӿ�������
    elseif distance <= 2 then
        changemoney(actor, CommonDefine.ITEMID_GOLD, '+', 15, '�ݵ�', true)
        changeexp(actor, '+', 200000, true)     --�����ݵ㾭��Ӿ�������
    elseif distance <= 3 then
        changemoney(actor, CommonDefine.ITEMID_GOLD, '+', 10, '�ݵ�', true)
        changeexp(actor, '+', 100000, true)     --�����ݵ㾭��Ӿ�������
    end 
end
]]--

--ħ����
function ontimer11(actor)
    MoFangZhenManager.OnTimerCheck(actor)
end

--topicon��С���
function ontimer12(actor)
    TopIcon.CheckRedPoint(actor)
end

--���ǰ������ʾ
function ontimer13(actor)
    TopIcon.CheckQuickInfoTip(actor)
end

----------------------------------------------------------------ontimer���˶�ʱ��end--------------------------------------------------------------------------
