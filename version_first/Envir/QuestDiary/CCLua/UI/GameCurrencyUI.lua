GameCurrencyUI = {}

function GameCurrencyUI.InitUI(actor)
    --if is �ֻ��˲���ʾ����!!!!!!!
    local str = '<Img|x=70|y=-3|img=item/item_0/000123.png>'..
                '<Text|text=$STM(ITEMCOUNT_���)|x=120|y=1|size=20>'..
                '<Img|x=230|y=-3|img=item/item_0/000124.png>'..
                '<Text|text=$STM(ITEMCOUNT_Ԫ��)|x=280|y=1|size=20>'..
                '<Img|x=390|y=-3|img=item/item_0/000124.png>'..
                '<Text|text=$STM(ITEMCOUNT_4)|x=440|y=1|size=20>';
    addbutton(actor, 101, 1, str)

    str = '<Text|text=$STM(ITEMCOUNT_���)|x=150|y=346|size=20|ax=0.5>'..   
          '<Text|text=Ԫ����$STM(ITEMCOUNT_Ԫ��)|x=100|y=396|size=20>'..
          '<Text|text=��Ԫ����$STM(ITEMCOUNT_4)|x=100|y=420|size=20>'
    addbutton(actor, 7, 1, str)
end

return GameCurrencyUI