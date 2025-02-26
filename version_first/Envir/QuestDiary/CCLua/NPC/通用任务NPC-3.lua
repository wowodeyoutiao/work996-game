require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if TaskManager.CheckNpcTask(actor) then
        return
    end
    
    local tempCurrX = CSS.NPC_LEFT_START_X
    local tempCurrY = CSS.NPC_TOP_START_Y
    local msg = '<Text|text=这是一个传奇的世界！|x='..tempCurrX..'|y='..tempCurrY..'|color='..CSS.NPC_WHITE..'>'
    BF_NPCSayExt(actor,msg)
end
