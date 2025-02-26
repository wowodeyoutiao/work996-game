RechargeManager = {}

--��ֵID����



--��ֵ
--[[
Gold            ��ֵ���
ProductId       ��ƷID����Դ�ͻ��˳�ֵ�����ã�
MoneyId         ����ID
isReal          =1��ʵ��ֵ =0���ֳ�ֵ
orderTime       ����ʱ��(ʱ���)
rechargeAmount  ʵ�ʵ��˻��ҽ��
giftAmount      �������ͽ��  ��Ӫ��̨����
refundAmount    �������ֽ��  ��Ӫ��̨����
]]--
function RechargeManager.DoRecharge(actor, gold, productid, moneyid, isreal, ordertime, rechargeamount, giftamount, refundamount)
    if BF_IsNullObj(actor) then
        return
    end

    --ʲô��ֵ���������ڣ�������������������    
release_print('gold:'..gold)
    --�ۼƳ�ֵ
    local totalrecharge = getplaydef(actor, CommonDefine.VAR_U_RECHARGE_TOTAL)
    totalrecharge = totalrecharge + gold
    setplaydef(actor, CommonDefine.VAR_U_RECHARGE_TOTAL, totalrecharge)     

    --ÿ�ճ�ֵ
    local dayrecharge = getplaydef(actor, CommonDefine.VAR_J_DAY_RECHARGE_TOTAL)
    dayrecharge = dayrecharge + gold
    setplaydef(actor, CommonDefine.VAR_J_DAY_RECHARGE_TOTAL, dayrecharge)

    --������ֵ
    GameEventManager.DoTriggerEvent(CommonDefine.EVENT_NAME_DO_RECHARGE, actor, gold, productid, isreal)   
end

return RechargeManager