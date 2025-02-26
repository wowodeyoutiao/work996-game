
CCServerMsgProcess = {}

function CCServerMsgProcess.RegisterMsgListener()
    --通用的消息监听
    SL:RegisterLuaNetMsg(CCMsgDefine.SM_SHOW_FIRST_RECHARGE_PANEL, 
        function(msgid, param1, param2, param3, sparam)
            SL:Require('GUILayout/CCPackage/CCFirstRecharge', true)
            CCFirstRecharge.InitShowData(sparam)
        end
    )

end

return CCServerMsgProcess