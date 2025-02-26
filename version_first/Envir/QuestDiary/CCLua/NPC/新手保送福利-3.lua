require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

local CURR_NPC_DIALOG_WIDTH = 540
local CURR_NPC_DIALOG_HEIGHT = 370

local QUICK_LEVEL = 20
local QUICK_LEARN_SKILL = {
    [CommonDefine.JOB_Z] = {3, 7},
    [CommonDefine.JOB_F] = {1, 5, 8, 9},
    [CommonDefine.JOB_D] = {2, 4, 6, 13},
}
local QUICK_WEAR_EQUIPMENT = {
    [CommonDefine.JOB_Z] = {
        [CommonDefine.GENDER_MAN] = {'���͵��崺��', '���͵��ټ�ս��(��)', '���͵�������(ս)', '���͵�������(ս)', '��̵��޹����ָ(ս)', '��̵��޹��ҽ�ָ(ս)', 
                                    '��̵��޹�������(ս)', '��̵��޹�������(ս)', '��̵���������(ս)', '��̵�����ѥ(ս)'},
        [CommonDefine.GENDER_WOMAN] = {'���͵��崺��', '���͵��ټ�ս��(Ů)', '���͵�������(ս)', '���͵�������(ս)', '��̵��޹����ָ(ս)', '��̵��޹��ҽ�ָ(ս)',
                                    '��̵��޹�������(ս)', '��̵��޹�������(ս)', '��̵���������(ս)', '��̵�����ѥ(ս)'},
    },
    [CommonDefine.JOB_F] = {
        [CommonDefine.GENDER_MAN] = {'���͵���ľ��', '���͵��ټ�ս��(��)', '���͵�������(��)', '���͵�������(��)', '��̵��޹����ָ(��)', '��̵��޹��ҽ�ָ(��)',
                                    '��̵��޹�������(��)', '��̵��޹�������(��)', '��̵���������(��)', '��̵�����ѥ(��)'},
        [CommonDefine.GENDER_WOMAN] = {'���͵���ľ��', '���͵��ټ�ս��(Ů)', '���͵�������(��)', '���͵�������(��)', '��̵��޹����ָ(��)', '��̵��޹��ҽ�ָ(��)', 
                                    '��̵��޹�������(��)', '��̵��޹�������(��)', '��̵���������(��)', '��̵�����ѥ(��)'},
    },
    [CommonDefine.JOB_D] = {
        [CommonDefine.GENDER_MAN] = {'���͵���ľ��', '���͵��ټ׵���(��)', '���͵�������(��)', '���͵�������(��)', '��̵��޹����ָ(��)', '��̵��޹��ҽ�ָ(��)', 
                                    '��̵��޹�������(��)', '��̵��޹�������(��)', '��̵���������(��)', '��̵�����ѥ(��)'},
        [CommonDefine.GENDER_WOMAN] = {'���͵���ľ��', '���͵��ټ׵���(Ů)', '���͵�������(��)', '���͵�������(��)', '��̵��޹����ָ(��)', '��̵��޹��ҽ�ָ(��)', 
                                    '��̵��޹�������(��)', '��̵��޹�������(��)', '��̵���������(��)', '��̵�����ѥ(��)'},
    },
}

function main(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local sPanelStr = '<Text|text=���ָ���Ա:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    sPanelStr = sPanelStr..'<Text|text=����������ǰ�ڿ���Ľ׶Σ�ֱ������20����|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = CSS.NPC_TOP_START_Y + 20
    sPanelStr = sPanelStr..'<Text|text=Ȼ���͵����ǿ�ʼħ�������ս��|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    tempCurrX = CSS.NPC_LEFT_START_X + 150
    tempCurrY = CSS.NPC_TOP_START_Y + 150

    local currlv = Player.GetLevel(actor)
    if currlv <= 1 then    
        sPanelStr = sPanelStr..'<Text|text=һ��ֱ��20��������ȫ��װ��|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'|link=@quick_upgrade_once>'
    else
        sPanelStr = sPanelStr..'<Text|text=�Ƽ�ǰ��ħ������ɱ��������װ����|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    end

    BF_NPCSayExt(actor,sPanelStr,CURR_NPC_DIALOG_WIDTH,CURR_NPC_DIALOG_HEIGHT)
end

function quick_upgrade_once(actor)
    if BF_IsNullObj(actor) then
        return
    end

    local level = Player.GetLevel(actor)
    local job = Player.GetJob(actor)
    local gender = Player.GetGender(actor)
    if level <= 1 then
        --�ȼ�
        Player.SetLevel(actor, QUICK_LEVEL)
        --����
        local skilllist = QUICK_LEARN_SKILL[job]
        if skilllist and #skilllist > 0 then
            for _, id in ipairs(skilllist) do
                addskill(actor, id, 0)        
            end
        end   
        --װ��
        local equiplist = QUICK_WEAR_EQUIPMENT[job][gender]
        if equiplist and #equiplist > 0 then
            for _, equipname in ipairs(equiplist) do
                local pos = BF_GetEquipPosByNameOrID(equipname)
                giveonitem(actor, pos, equipname, 1, 0, '������20')
            end
        end
    end

    main(actor)
end