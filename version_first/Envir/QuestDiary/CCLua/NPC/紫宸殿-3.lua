require("Envir/QuestDiary/CCLua/GameInit")
UIncludes()

function main(actor)
    if not Player.IsFunctionOpen(actor, CommonDefine.FUNC_ID_OFFLINE, true) then
        return
    end

    OfflineHuWeiManager.CreateZCDMirrorMapAndEnter(actor)
end

