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
        [CommonDefine.GENDER_MAN] = {'坚韧的绣春刀', '坚韧的藤甲战袍(男)', '坚韧的亮银盔(战)', '坚韧的银项链(战)', '坚固的兽骨左戒指(战)', '坚固的兽骨右戒指(战)', 
                                    '坚固的兽骨左手镯(战)', '坚固的兽骨右手镯(战)', '坚固的龙骨腰带(战)', '坚固的亮银靴(战)'},
        [CommonDefine.GENDER_WOMAN] = {'坚韧的绣春刀', '坚韧的藤甲战袍(女)', '坚韧的亮银盔(战)', '坚韧的银项链(战)', '坚固的兽骨左戒指(战)', '坚固的兽骨右戒指(战)',
                                    '坚固的兽骨左手镯(战)', '坚固的兽骨右手镯(战)', '坚固的龙骨腰带(战)', '坚固的亮银靴(战)'},
    },
    [CommonDefine.JOB_F] = {
        [CommonDefine.GENDER_MAN] = {'坚韧的藤木杖', '坚韧的藤甲战衣(男)', '坚韧的亮银盔(法)', '坚韧的银项链(法)', '坚固的兽骨左戒指(法)', '坚固的兽骨右戒指(法)',
                                    '坚固的兽骨左手镯(法)', '坚固的兽骨右手镯(法)', '坚固的龙骨腰带(法)', '坚固的亮银靴(法)'},
        [CommonDefine.GENDER_WOMAN] = {'坚韧的藤木杖', '坚韧的藤甲战衣(女)', '坚韧的亮银盔(法)', '坚韧的银项链(法)', '坚固的兽骨左戒指(法)', '坚固的兽骨右戒指(法)', 
                                    '坚固的兽骨左手镯(法)', '坚固的兽骨右手镯(法)', '坚固的龙骨腰带(法)', '坚固的亮银靴(法)'},
    },
    [CommonDefine.JOB_D] = {
        [CommonDefine.GENDER_MAN] = {'坚韧的藤木剑', '坚韧的藤甲道袍(男)', '坚韧的亮银盔(道)', '坚韧的银项链(道)', '坚固的兽骨左戒指(道)', '坚固的兽骨右戒指(道)', 
                                    '坚固的兽骨左手镯(道)', '坚固的兽骨右手镯(道)', '坚固的龙骨腰带(道)', '坚固的亮银靴(道)'},
        [CommonDefine.GENDER_WOMAN] = {'坚韧的藤木剑', '坚韧的藤甲道袍(女)', '坚韧的亮银盔(道)', '坚韧的银项链(道)', '坚固的兽骨左戒指(道)', '坚固的兽骨右戒指(道)', 
                                    '坚固的兽骨左手镯(道)', '坚固的兽骨右手镯(道)', '坚固的龙骨腰带(道)', '坚固的亮银靴(道)'},
    },
}

function main(actor)
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local sPanelStr = '<Text|text=新手福利员:|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
    sPanelStr = sPanelStr..'<Text|text=让我们跳过前期枯燥的阶段，直接升到20级，|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    tempCurrY = CSS.NPC_TOP_START_Y + 20
    sPanelStr = sPanelStr..'<Text|text=然后传送到主城开始魔方阵的挑战！|x='..(tempCurrX+100)..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'

    tempCurrX = CSS.NPC_LEFT_START_X + 150
    tempCurrY = CSS.NPC_TOP_START_Y + 150

    local currlv = Player.GetLevel(actor)
    if currlv <= 1 then    
        sPanelStr = sPanelStr..'<Text|text=一键直升20级并穿戴全身装备|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_YELLOW..'|link=@quick_upgrade_once>'
    else
        sPanelStr = sPanelStr..'<Text|text=推荐前往魔方阵中杀怪升级爆装备！|size=18|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_LIGHTGREEN..'>'
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
        --等级
        Player.SetLevel(actor, QUICK_LEVEL)
        --技能
        local skilllist = QUICK_LEARN_SKILL[job]
        if skilllist and #skilllist > 0 then
            for _, id in ipairs(skilllist) do
                addskill(actor, id, 0)        
            end
        end   
        --装备
        local equiplist = QUICK_WEAR_EQUIPMENT[job][gender]
        if equiplist and #equiplist > 0 then
            for _, equipname in ipairs(equiplist) do
                local pos = BF_GetEquipPosByNameOrID(equipname)
                giveonitem(actor, pos, equipname, 1, 0, '快速升20')
            end
        end
    end

    main(actor)
end