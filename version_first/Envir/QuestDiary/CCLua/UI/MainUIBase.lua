MainUIBase = {}

local UI_ICON_GAMESHOP = '1';     --商城
local UI_ICON_ROLEPANEL = '2';    --角色面板
local UI_ICON_BAG = '3';          --背包
local UI_ICON_STARTGJ = '4';      --开始挂机
local UI_ICON_SKILL = '5';        --技能
local UI_ICON_TEAM = '6';         --组队
local UI_ICON_GUILD = '7';        --行会
local UI_ICON_JIAOYI = '8';      --交易行
local UI_ICON_SETTING = '9';      --设置
local UI_ICON_EXIT = '10';        --退出
local UI_ICON_MAIL = '11';        --邮件
local UI_ICON_BOX = '12';        --盒子

function MainUIBase.InitUI(actor)
    if not Player.IsPCClient(actor) then
        --手机端
        addbutton(actor, 103, 7, '<Button|x=328|y=-65|pimg=private/main/Button_3/1900012059.png|mimg=private/main/Button_3/1900012058.png|color=255|nimg=private/main/Button_3/1900012058.png|link=@mainuibase_openpanel,'..UI_ICON_GAMESHOP..'>')
        addbutton(actor, 104, 4, '<Button|x=-130|y=-445|mimg=private/main/bottom/1900013010.png|color=255|nimg=private/main/bottom/1900013010.png|link=@mainuibase_openpanel,'..UI_ICON_ROLEPANEL..'>')
        addbutton(actor, 104, 5, '<Button|x=-63|y=-445|mimg=private/main/bottom/1900013011.png|color=255|nimg=private/main/bottom/1900013011.png|link=@mainuibase_openpanel,'..UI_ICON_BAG..'>')
        addbutton(actor, 104, 6, '<Button|x=-127|y=-374|color=251|mimg=private/main/Skill/1900012708.png|size=16|nimg=private/main/Skill/1900012708.png|pimg=private/main/Skill/1900012708.png|link=@mainuibase_openpanel,'..UI_ICON_STARTGJ..'>')
        addbutton(actor, 109, 1, '<Button|x=22|y=30|mimg=private/main/bottom/1900013012.png|color=255|nimg=private/main/bottom/1900013012.png|link=@mainuibase_openpanel,'..UI_ICON_SKILL..'>')        
        addbutton(actor, 109, 2, '<Button|x=92|y=30|mimg=private/main/bottom/1900013014.png|color=255|nimg=private/main/bottom/1900013014.png|link=@mainuibase_openpanel,'..UI_ICON_TEAM..'>')
        addbutton(actor, 109, 3, '<Button|x=162|y=30|mimg=private/main/bottom/1900013013.png|color=255|nimg=private/main/bottom/1900013013.png|link=@mainuibase_openpanel,'..UI_ICON_GUILD..'>')        
        addbutton(actor, 109, 4, '<Button|x=22|y=100|mimg=private/main/bottom/youxilibao.png|color=255|nimg=private/main/bottom/youxilibao.png|link=@mainuibase_openpanel,'..UI_ICON_BOX..'>')
        addbutton(actor, 109, 5, '<Button|x=92|y=100|mimg=private/main/bottom/1900012590.png|color=255|nimg=private/main/bottom/1900012590.png|link=@mainuibase_openpanel,'..UI_ICON_MAIL..'>') 
        addbutton(actor, 109, 6, '<Button|x=162|y=100|mimg=private/main/bottom/jiaoyihang.png|color=255|nimg=private/main/bottom/jiaoyihang.png|link=@mainuibase_openpanel,'..UI_ICON_JIAOYI..'>')
        addbutton(actor, 109, 7, '<Button|x=92|y=170|mimg=private/main/bottom/1900013017.png|color=255|nimg=private/main/bottom/1900013017.png|link=@mainuibase_openpanel,'..UI_ICON_SETTING..'>')
        addbutton(actor, 109, 8, '<Button|x=162|y=170|mimg=private/main/bottom/1900013018.png|color=255|nimg=private/main/bottom/1900013018.png|link=@mainuibase_openpanel,'..UI_ICON_EXIT..'>')          
    end
end

function MainUIBase.OpenPanel(actor, sid)
    if (actor == nil) or (sid == nil) then
        return
    end

    if sid == UI_ICON_GAMESHOP then
        openhyperlink(actor, 9)
    elseif sid == UI_ICON_ROLEPANEL then
        openhyperlink(actor, 1)
    elseif sid == UI_ICON_BAG then
        openhyperlink(actor, 7)
    elseif sid == UI_ICON_STARTGJ then
        startautoattack(actor)
    elseif sid == UI_ICON_SKILL then
        openhyperlink(actor, 4)
    elseif sid == UI_ICON_TEAM then
        openhyperlink(actor, 17)
    elseif sid == UI_ICON_GUILD then
        openhyperlink(actor, 31)
    elseif sid == UI_ICON_JIAOYI then
        openhyperlink(actor, 35)
    elseif sid == UI_ICON_SETTING then
        openhyperlink(actor, 23)  --设置
    elseif sid == UI_ICON_EXIT then
        openhyperlink(actor, 29)
    elseif sid == UI_ICON_MAIL then
        openhyperlink(actor, 16)
    elseif sid == UI_ICON_BOX then
        openhyperlink(actor, 111)
    end
end

return MainUIBase
