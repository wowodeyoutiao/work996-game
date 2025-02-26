EverydayTask = {}

--functionid
local EVERYDAYTASK_BUTTONFUNC_ID_1 = 1           --��ȡ����������ɵĽ���
local EVERYDAYTASK_BUTTONFUNC_ID_2 = 2           --�������������ǰ��
local EVERYDAYTASK_BUTTONFUNC_ID_3 = 3           --��ȡ�������������ɵĽ���

local TASK_STATUS_NOT_OPEN = 1                   --�ȼ����㣬���ܿ���
local TASK_STATUS_NOT_FINISH = 2                 --δ��ɣ���ǰ��
local TASK_STATUS_FINISHED = 3                   --����ɣ�����ȡ����
local TASK_STATUS_GET_REWARD = 4                 --��������ȡ

local TASK_FINAL_REWARDITEMS = 
{
    [1] = {targnum = 5, rewarditems={{name='�ر�ͼ', num=3}}},
    [2] = {targnum = 10, rewarditems={{name='��Ԫ��', num=500},{name='����ʯ', num=100}}},
}

--�򿪽���
function EverydayTask.OpenPanel(actor)
    EverydayTask.ShowActivityPanel(actor)
end

--�Ƿ���ʾ�������icon
function EverydayTask.CanShowIcon(actor)
    if BF_IsNullObj(actor) then
        return false
    end

    return true
end

local function GetSingleTaskStatus(actor, taskid, countertab, rewardtab)
    if BF_IsNullObj(actor) or (taskid==nil) or (countertab==nil) or (rewardtab==nil) then
        return TASK_STATUS_NOT_OPEN, 0
    end
    local singletask = cfgEverydayTask[taskid]
    if singletask == nil then
        return TASK_STATUS_NOT_OPEN, 0
    end

    if table.indexof(rewardtab, taskid) ~= false then
        return TASK_STATUS_GET_REWARD, 0
    else
        local bIsOpen, wNeedLv = Player.IsFunctionOpen(actor, singletask.tasktype, false)
        if not bIsOpen then
            return TASK_STATUS_NOT_OPEN, wNeedLv
        end

        local currnum = 0
        local sid = taskid..''
        if countertab[sid] then
            currnum = countertab[sid]
        end
        if currnum >= singletask.tasktargnum then
            return TASK_STATUS_FINISHED, 0
        else
            return TASK_STATUS_NOT_FINISH, 0
        end
    end
end

function EverydayTask.ShowActivityPanel(actor)
    if BF_IsNullObj(actor) then
        return
    end

    local strPanelInfo = '<Img|id=20|children={21,22,23,24,25,26,27,28,29,30,31,32}|x=162.0|y=28.0|show=0|bg=1|reset=1|move=0|esc=1|loadDelay=1|img=private/cc_everyday_task/9.png>'..
        '<Layout|id=21|x=686.0|y=17.0|width=80|height=80|link=@exit>'..
        '<Button|id=22|x=687.0|y=18.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>'..
        '<Img|id=23|ax=0|x=73|y=78.0|img=private/cc_everyday_task/6.png|esc=0>'..
        '<Img|id=24|ax=0|x=280.0|y=78.0|esc=0|img=private/cc_everyday_task/6.png>'..
        '<Img|id=25|x=460.0|y=78.0|img=private/cc_everyday_task/6.png|esc=0>'

    local datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_COUNTER_DATA)
    local countertab = {}
    if datastr ~= '' then
        countertab = json2tbl(datastr)
    end  
    datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_REWARD_DATA)
    local rewardtab = {}
    if datastr ~= '' then
        rewardtab = json2tbl(datastr)
    end    

    local nCurrFinishedTaskNum = #rewardtab
    local nTotalTaskNum = #cfgEverydayTask
    local nTargTaskNum1 = TASK_FINAL_REWARDITEMS[1].targnum
    local itemid1 = getstditeminfo(TASK_FINAL_REWARDITEMS[1].rewarditems[1].name, CommonDefine.STDITEMINFO_IDX)
    local itemcount1 = TASK_FINAL_REWARDITEMS[1].rewarditems[1].num
    local nTargTaskNum2 = TASK_FINAL_REWARDITEMS[2].targnum
    local itemid2 = getstditeminfo(TASK_FINAL_REWARDITEMS[2].rewarditems[1].name, CommonDefine.STDITEMINFO_IDX)
    local itemcount2 = TASK_FINAL_REWARDITEMS[2].rewarditems[1].num    
    strPanelInfo = strPanelInfo..'<Text|id=26|x=560.0|y=51.0|size=18|color=255|text=��ǰ��'..nCurrFinishedTaskNum..'/'..nTotalTaskNum..'>'..        
        '<Text|id=27|ax=0|x=73|y=55.0|size=15|color=255|text=���'..nTargTaskNum1..'���������ȡ>'..        
        '<Text|id=28|ax=0|x=280.0|y=54.0|size=15|color=255|text=���'..nTargTaskNum2..'������ȡ>'..
        '<ItemShow|id=29|x=205.0|y=49.0|width=70|height=70|itemid='..itemid1..'|itemcount='..itemcount1..'|bgtype=1>'..
        '<ItemShow|id=30|x=390.0|y=49.0|width=70|height=70|itemid='..itemid2..'|itemcount='..itemcount2..'|bgtype=1>'

    local nFinalRewardIdx = getplaydef(actor, CommonDefine.VAR_J_DAY_EVERYDAYTASK_FINALREWARD_IDX)
    if nFinalRewardIdx == 0 then
        if nCurrFinishedTaskNum >= nTargTaskNum1 then
            strPanelInfo = strPanelInfo..'<Button|id=31|x=570.0|y=79.0|mimg=private/cc_everyday_task/4.png|nimg=private/cc_everyday_task/4.png|link=@everyday_task_button,'..EVERYDAYTASK_BUTTONFUNC_ID_3..'>'
            Player.AddRedPoint(actor, 0, 31, 10, 10)
        else
            strPanelInfo = strPanelInfo..'<Text|id=31|ax=0|x=555|y=90.0|size=18|color='..CSS.NPC_RED..'|text=�޿���ȡ����>'
        end
    elseif nFinalRewardIdx == 1 then
        if nCurrFinishedTaskNum >= nTargTaskNum2 then
            strPanelInfo = strPanelInfo..'<Button|id=31|x=570.0|y=79.0|mimg=private/cc_everyday_task/4.png|nimg=private/cc_everyday_task/4.png|link=@everyday_task_button,'..EVERYDAYTASK_BUTTONFUNC_ID_3..'>'
            Player.AddRedPoint(actor, 0, 31, 10, 10)
        else
            strPanelInfo = strPanelInfo..'<Text|id=31|ax=0|x=555|y=90.0|size=18|color='..CSS.NPC_RED..'|text=�޿���ȡ����>'
        end
    elseif nFinalRewardIdx >= 2 then
        strPanelInfo = strPanelInfo..'<Text|id=31|ax=0|x=560|y=90.0|size=18|color='..CSS.NPC_LIGHTGREEN..'|text=����������>'
    end            

    -- ��ȡ���м�
    local keys = {}
    for key in pairs(cfgEverydayTask) do
        table.insert(keys, key)
    end
    -- �Լ���������
    table.sort(keys)   
    
    local nStartID = 500
    local idstr = ''
    for seq, _ in ipairs(keys) do
        if idstr ~= '' then
            idstr = idstr..','
        end
        idstr = idstr..(nStartID + seq*20)   
    end    
    strPanelInfo = strPanelInfo..'<ListView|id=32|children={'..idstr..'}|x=60.0|y=125.0|width=600|height=300|direction=1|margin=0>'

    for seq, key in ipairs(keys) do
        local value = cfgEverydayTask[key]
        local baseid = nStartID + seq*20
        local idstr1 = (baseid+1)..','..(baseid+2)..','..(baseid+3)..','..(baseid+4)..','..(baseid+5)
        local nCount = 5
        for seq1, _ in ipairs(value.finishrewards_tab) do
            if idstr1 ~= '' then
                idstr1 = idstr1..','
            end
            idstr1 = idstr1..(baseid + nCount + seq1)
        end
        strPanelInfo = strPanelInfo..'<Img|id='..baseid..'|children={'..idstr1..'}|x=100.0|y=61.0|show=0|img=private/cc_everyday_task/7.png>'

        local taskcurrnum = 0
        local sid = key..''
        if countertab[sid] then
            taskcurrnum = countertab[sid]
        end
        taskcurrnum = math.min(value.tasktargnum, taskcurrnum)
        strPanelInfo = strPanelInfo..'<Text|id='..(baseid+1)..'|x=20.0|y=8.0|color='..CSS.NPC_YELLOW..'|size=20|text='..value.tasktitle..'>'..
            '<Text|id='..(baseid+2)..'|x=20.0|y=50.0|color='..CSS.NPC_WHITE..'|size=15|text='..value.taskdesc..'>'..
            '<Text|id='..(baseid+3)..'|x=150.0|y=12.0|color='..CSS.NPC_WHITE..'|size=15|text=���ȣ�'..taskcurrnum..'/'..value.tasktargnum..'>'
        
        local status, param = GetSingleTaskStatus(actor, value.id, countertab, rewardtab)
        if status == TASK_STATUS_NOT_OPEN then
            strPanelInfo = strPanelInfo..'<Text|id='..(baseid+4)..'|x=500.0|y=30.0|color='..CSS.NPC_GRAY..'|size=20|text='..param..'������>'
        elseif status == TASK_STATUS_NOT_FINISH then
            strPanelInfo = strPanelInfo..'<Button|id='..(baseid+4)..'|x=510.0|y=25.0|mimg=private/cc_everyday_task/3.png|nimg=private/cc_everyday_task/3.png|link=@everyday_task_button,'..
                EVERYDAYTASK_BUTTONFUNC_ID_2..','..value.id..'>'
        elseif status == TASK_STATUS_FINISHED then
            strPanelInfo = strPanelInfo..'<Button|id='..(baseid+4)..'|x=510.0|y=25.0|mimg=private/cc_everyday_task/4.png|nimg=private/cc_everyday_task/4.png|link=@everyday_task_button,'..
                EVERYDAYTASK_BUTTONFUNC_ID_1..','..value.id..'>'
            Player.AddRedPoint(actor, 0, (baseid+4), 10, 10)
        elseif status == TASK_STATUS_GET_REWARD then
            strPanelInfo = strPanelInfo..'<Text|id='..(baseid+4)..'|x=510.0|y=30.0|color='..CSS.NPC_LIGHTGREEN..'|size=20|text=����ȡ>'
        end
        
        for seq1, singleitem in ipairs(value.finishrewards_tab) do
            local itemidx = getstditeminfo(singleitem.name, CommonDefine.STDITEMINFO_IDX)
            local currx = 400 - 70 * (seq1-1)
            strPanelInfo = strPanelInfo..'<ItemShow|id='..(baseid+nCount+seq1)..'|x='..currx..'|y=5|width=15|height=15|itemid='..itemidx..'|itemcount='..singleitem.num..'|bgtype=1|showtips=1>'
        end
    end    

    BF_ShowSpecialUI(actor, strPanelInfo)
end

--����button�ص�
function EverydayTask.DoOperButton(actor, sid, sparam) 
    if BF_IsNullObj(actor) or not BF_IsNumberStr(sid) then
        return
    end
    local funcid = tonumber(sid)
    local taskid = 0
    if BF_IsNumberStr(sparam) then
        taskid = tonumber(sparam)
    end
    if funcid == EVERYDAYTASK_BUTTONFUNC_ID_1 then
        local taskinfo = cfgEverydayTask[taskid]
        if taskinfo then         
            local datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_COUNTER_DATA)
            local countertab = {}
            if datastr ~= '' then
                countertab = json2tbl(datastr)
            end  
            datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_REWARD_DATA)
            local rewardtab = {}
            if datastr ~= '' then
                rewardtab = json2tbl(datastr)
            end             
            local status, _ = GetSingleTaskStatus(actor, taskid, countertab, rewardtab)
            if status ~= TASK_STATUS_FINISHED then
                Player.SendSelfMsg(actor, '�޽�������ȡ', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
                EverydayTask.ShowActivityPanel(actor)
                return
            end

            Player.GiveItemsToBagOrMail(actor, taskinfo.finishrewards_tab, 'ÿ�ձ���������:'..taskid)
            rewardtab[#rewardtab+1] = taskid
            datastr = tbl2json(rewardtab)
            setplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_REWARD_DATA, datastr)
            EverydayTask.ShowActivityPanel(actor)
        end        
    elseif funcid == EVERYDAYTASK_BUTTONFUNC_ID_2 then
        local taskinfo = cfgEverydayTask[taskid]
        if taskinfo then
           Player.QuickGoTo(actor, taskinfo.gotoid) 
        end
    elseif funcid == EVERYDAYTASK_BUTTONFUNC_ID_3 then
        local nFinalRewardIdx = getplaydef(actor, CommonDefine.VAR_J_DAY_EVERYDAYTASK_FINALREWARD_IDX)
        local nTargTaskNum1 = TASK_FINAL_REWARDITEMS[1].targnum
        local nTargTaskNum2 = TASK_FINAL_REWARDITEMS[2].targnum
        local datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_REWARD_DATA)
        local rewardtab = {}
        if datastr ~= '' then
            rewardtab = json2tbl(datastr)
        end          

        if nFinalRewardIdx == 0 then
            if #rewardtab >= nTargTaskNum1 then
                Player.GiveItemsToBagOrMail(actor, TASK_FINAL_REWARDITEMS[1].rewarditems, 'ÿ�ձ����ۼƽ���1')
                setplaydef(actor, CommonDefine.VAR_J_DAY_EVERYDAYTASK_FINALREWARD_IDX, 1)
            end
            if #rewardtab >= nTargTaskNum2 then
                Player.GiveItemsToBagOrMail(actor, TASK_FINAL_REWARDITEMS[2].rewarditems, 'ÿ�ձ����ۼƽ���2')
                setplaydef(actor, CommonDefine.VAR_J_DAY_EVERYDAYTASK_FINALREWARD_IDX, 2)
            end            
        elseif nFinalRewardIdx == 1 then
            if #rewardtab >= nTargTaskNum2 then
                Player.GiveItemsToBagOrMail(actor, TASK_FINAL_REWARDITEMS[2].rewarditems, 'ÿ�ձ����ۼƽ���2')
                setplaydef(actor, CommonDefine.VAR_J_DAY_EVERYDAYTASK_FINALREWARD_IDX, 2)
            end
        elseif nFinalRewardIdx >= 2 then
            Player.SendSelfMsg(actor, '���������', CommonDefine.MSG_POS_TYPE_SYS_CHANNEL)
        end
        EverydayTask.ShowActivityPanel(actor)
    end
end

--���������������
function EverydayTask.AddTaskCounter(actor, tasktype, addnum)
    local datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_COUNTER_DATA)
    local countertab = {}
    if datastr ~= '' then
        countertab = json2tbl(datastr)
    end      
    for _, value in pairs(cfgEverydayTask) do
        if value.tasktype == tasktype then
            local sid = value.id..''
            if countertab[sid] == nil then
                countertab[sid] = 0
            end
            countertab[sid] = countertab[sid] + addnum
        end
    end
    datastr = tbl2json(countertab)
    setplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_COUNTER_DATA, datastr)
end

function EverydayTask.IsTopIconHaveRedPoint(actor)
    local datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_COUNTER_DATA)
    local countertab = {}
    if datastr ~= '' then
        countertab = json2tbl(datastr)
    end      

    datastr = getplaydef(actor, CommonDefine.VAR_Z_DAY_EVERYDAYTASK_REWARD_DATA)
    local rewardtab = {}
    if datastr ~= '' then
        rewardtab = json2tbl(datastr)
    end   
    
    local nCurrFinishedTaskNum = #rewardtab
    local nTargTaskNum1 = TASK_FINAL_REWARDITEMS[1].targnum
    local nTargTaskNum2 = TASK_FINAL_REWARDITEMS[2].targnum

    local nFinalRewardIdx = getplaydef(actor, CommonDefine.VAR_J_DAY_EVERYDAYTASK_FINALREWARD_IDX)
    if nFinalRewardIdx == 0 then
        if nCurrFinishedTaskNum >= nTargTaskNum1 then
            return true
        end
    elseif nFinalRewardIdx == 1 then
        if nCurrFinishedTaskNum >= nTargTaskNum2 then
            return true
        end
    end

    for _, value in pairs(cfgEverydayTask) do
        local status = GetSingleTaskStatus(actor, value.id, countertab, rewardtab)
        if status == TASK_STATUS_FINISHED then
            return true    
        end        
    end    

    return false
end

return EverydayTask