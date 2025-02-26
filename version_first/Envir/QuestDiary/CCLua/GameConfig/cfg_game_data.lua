local config = { 
	["avoid_injury"] = { 
		k = "avoid_injury",
		value = "30#5#4#0#0#3#20#0#0#15#16#16#18#15#15",
		notice = "սʿ�ܹ�����������#սʿ�ܹ���ħ������#սʿ��սʿ�˺�����#սʿ�ܷ�ʦ�˺�����#սʿ�ܵ�ʿ�˺�����#��ʦ�ܹ�����������#��ʦ�ܹ���ħ������#��ʦ��սʿ�˺�����#��ʦ�ܷ�ʦ�˺�����#��ʦ�ܵ�ʿ�˺�����#��ʿ�ܹ�����������#��ʿ�ܹ���ħ������#��ʿ��սʿ�˺�����#��ʿ�ܷ�ʦ�˺�����#��ʿ�ܵ�ʿ�˺�����",
	},
	["transaction_limit"] = { 
		k = "transaction_limit",
		value = "1#1000020#0|2#1000030#0|5#1000040#0|8#0#300001",
		notice = "�������� ������������#�ȼ�����#ת���ȼ�����",
	},
	["guaiwugongcheng"] = { 
		k = "guaiwugongcheng",
		value = "3#30",
		notice = "���﹥�ǻ��ͼ#����ˢ��ʱ�䣨�룩",
	},
	["guaiwugongcheng_1"] = { 
		k = "guaiwugongcheng_1",
		value = "296#335|160",
		notice = "���﹥��ˢ�����������Լ������С",
	},
	["guaiwugongcheng_2"] = { 
		k = "guaiwugongcheng_2",
		value = "Ы����|ѩ����|�����|�罩��|Ш����|��֮������|������ʿ9|а��ǯ��2|��Ұ��3|��Ұ��3|Ы��3|��Ӱ֩��|Ѫ���|��������|��Ѫ��ħ|��Ѫ��ħ|���¶�ħ1|����֩��|����֩��0|Ѫ��ʬ",
		notice = "���﹥�ǹ���ID����id|����id",
	},
	["jinzhusancai"] = { 
		k = "jinzhusancai",
		value = "5|Ϧ",
		notice = "���µ�������ͼ|����id",
	},
	["union_shop_limit"] = { 
		k = "union_shop_limit",
		value = 300,
		notice = "�л��̵�洢��������",
	},
	["union_shop_flsh"] = { 
		k = "union_shop_flsh",
		value = 0,
		notice = "�л��̵�����ˢ��ʱ�䣨���㣩",
	},
	["union_shop_announce"] = { 
		k = "union_shop_announce",
		value = "1#5|7#8",
		notice = "�л��̵���ۺͶһ��������� ����#Ʒ������|����#Ʒ������",
	},
	["team_num"] = { 
		k = "team_num",
		value = 10,
		notice = "�����������",
	},
	["guild_updata"] = { 
		k = "guild_updata",
		value = "1#2#0|2#100#9999|3#150#99999",
		notice = "�л�ȼ�#�л���������|�л�ȼ�#�л���������|�л�ȼ�#�л���������",
	},
	["gold_guildexp"] = { 
		k = "gold_guildexp",
		value = "1000#1|1000#10|1000000",
		notice = "���1000���#�ɶһ�1����|���1000���#�ɶһ�10�лὨ���|ÿ�վ�������",
	},
	["announce"] = { 
		k = "announce",
		value = "�л���ֵ��ǣ�\\n 1.ע������л������ý����\\n Ԫ����\\n2.�����¹�ɳʱ�䣬�ǵ�׼ʱ��\\n ��һ��ɳ��\\n3.ÿ��ǵ���ɹ�������������\\n ����",
		notice = "Ĭ�Ϲ���",
	},
	["GUILD_EXIT_CD"] = { 
		k = "GUILD_EXIT_CD",
		value = 3600,
		notice = "�����˳��л��´������л��CDʱ�䣨�룩",
	},
	["union_warehouse_time"] = { 
		k = "union_warehouse_time",
		value = "4#180&5#240&6#360&7#1720",
		notice = "�¼����л�ʹ���л�ֿ�������ʱ�䣨��#��&��2#��2.....��",
	},
	["Found_Faction"] = { 
		k = "Found_Faction",
		value = "315#1#17|1#1000000#27",
		notice = "�����л�����Ҫ���ĵĵ���#����#�̳�id|�����л�����Ҫ���ĵĵ���#����#�̳�id",
	},
	["GUILD_limit"] = { 
		k = "GUILD_limit",
		value = "38|42|46|50|55",
		notice = "��������ID|��������ID",
	},
	["consignments_shelves"] = { 
		k = "consignments_shelves",
		value = 8,
		notice = "������_��ͨ������λ",
	},
	["consignments_putaway_time"] = { 
		k = "consignments_putaway_time",
		value = 86400,
		notice = "������_�ϼ�ʱ�䣨�룩",
	},
	["consignments_putaway_pay"] = { 
		k = "consignments_putaway_pay",
		value = 10000,
		notice = "������_�ϼܷ��� ���",
	},
	["consignments_putaway_need"] = { 
		k = "consignments_putaway_need",
		value = 100020,
		notice = "������_�ϼ�ʱ����",
	},
	["consignments_putaway_LEVEL"] = { 
		k = "consignments_putaway_LEVEL",
		value = 30,
		notice = "������_�ϼ�ʱ��ɫ�ȼ�����",
	},
	["consignments_putaway_price_floor"] = { 
		k = "consignments_putaway_price_floor",
		value = "1#100000",
		notice = "������_�ϼ�ʱ���õ����޺����ޣ�Ԫ����",
	},
	["consignments_putaway_price_gold"] = { 
		k = "consignments_putaway_price_gold",
		value = "10000#100000000",
		notice = "������_�ϼ�ʱ���õ����޺����ޣ���ң�",
	},
	["consignments_service_charge"] = { 
		k = "consignments_service_charge",
		value = 10,
		notice = "������_�۳�����ȡ�������ѳ�ɣ���ȡ�������� = �۳���Ԫ�� * �����ѳ�ɣ�����ȡ����Ԫ����,��ҵ�Ҳ���������˰��ֱ�ӿۣ��ٷֱȣ�",
	},
	["consignments_service_charge_floor"] = { 
		k = "consignments_service_charge_floor",
		value = 1,
		notice = "������_�۳�����ȡ�������ѳ�ɵ����ޣ�Ԫ����",
	},
	["consignments_service_charge_Upper"] = { 
		k = "consignments_service_charge_Upper",
		value = 99999999,
		notice = "������_�۳�����ȡ�������ѳ�ɵ����ޣ�Ԫ����",
	},
	["consignments_pay_need"] = { 
		k = "consignments_pay_need",
		notice = "������_���������",
	},
	["consignments_pay_Term"] = { 
		k = "consignments_pay_Term",
		value = "1#30#0;2#30#0;7#40#0;9#50#0;21#60#0;43#70#0;73#80#0",
		notice = "������_����ȼ���ת�����ƣ��ڲ�ͬ�Ŀ������������������������ͬ����������������#�ȼ�����#ת���ȼ����ޣ�������С��������������д������ܳ���100�����뽻���������ƣ�",
	},
	["exp_max"] = { 
		k = "exp_max",
		value = 2000000000,
		notice = "�洢��������",
	},
	["auto_equip_quality"] = { 
		k = "auto_equip_quality",
		value = 3,
		notice = "�Զ�������װ��Ʒ��(�������Ʒ�ʵĶ����Զ�������ʱ��̶�5��)",
	},
	["warehouse_max_num"] = { 
		k = "warehouse_max_num",
		value = 144,
		notice = "�ֿܲ������(48Ϊһҳ������������̶�)",
	},
	["warehouse_num"] = { 
		k = "warehouse_num",
		value = 24,
		notice = "��Ѹ���ҵĲֿ����",
	},
	["warehouse_expansion"] = { 
		k = "warehouse_expansion",
		value = "279#1#8",
		notice = "����#����#����ĸ�����",
	},
	["currency_shield"] = { 
		k = "currency_shield",
		value = "10|14",
		notice = "ǰ�����λ�����ʾ����",
	},
	["cangbaotufanwei"] = { 
		k = "cangbaotufanwei",
		value = 5,
		notice = "�ڱ���Χ",
	},
	["cangbaotu_item_Announce_1"] = { 
		k = "cangbaotu_item_Announce_1",
		value = "380|149#150",
		notice = "�ر�ͼ�ڵ���Щ������Ҫ���棨����id|����id#����id��ֱ��ʰȡ",
	},
	["cangbaotu_item_Announce_2"] = { 
		k = "cangbaotu_item_Announce_2",
		value = "381|1005302",
		notice = "�ر�ͼ�ڵ���Щ������Ҫ���棨����id|����id#����id��ˢBOSS",
	},
	["cangbaotu_item_Announce_3"] = { 
		k = "cangbaotu_item_Announce_3",
		value = "382|1005302",
		notice = "�ر�ͼ�ڵ���Щ������Ҫ���棨����id|����id#����id������BOSS",
	},
	["cangbaotu_item_Announce_4"] = { 
		k = "cangbaotu_item_Announce_4",
		value = "383|1015730#1019730#1026730#1022730#1064730#1062730#1115730#1119730#1126730#1122730#1164730#1162730#1106730#1215730#1219730#1226730#1222730#1264730#1262730",
		notice = "�ر�ͼ�ڵ���Щ������Ҫ���棨����id|����id#����id����Ĺ�ڱ�",
	},
	["cangbaotu_boss_position_1"] = { 
		k = "cangbaotu_boss_position_1",
		value = "14#15",
		notice = "�ر�ͼ��ͼ��������",
	},
	["cangbaotu_boss_position_2"] = { 
		k = "cangbaotu_boss_position_2",
		value = "14#15",
		notice = "�ر�ͼ����ˢ������",
	},
	["cangbaotu_boss_position_3"] = { 
		k = "cangbaotu_boss_position_3",
		value = "11#11|14#11|17#11|11#14|14#14|17#14|11#17|14#17|17#17|11#20|14#20|17#20",
		notice = "�ر����ؼ���������",
	},
	["cangbaotu_mapid"] = { 
		k = "cangbaotu_mapid",
		value = "0|3|11|4",
		notice = "�ر�ͼ�����ͼid",
	},
	["cangbaotu_key"] = { 
		k = "cangbaotu_key",
		value = 30,
		notice = "�ر�ͼԿ�׿�ݹ����̳�ID",
	},
	["cangbaotu_backroom_reward"] = { 
		k = "cangbaotu_backroom_reward",
		value = "248&10002#10002#10002#10002#10003#10003#10003#10003#10003#10004#10004#10005|249&10006#10006#10006#10006#10006#10007#10007#10007#10007#10007#10007#10008",
		notice = "��һ���ر�ͼ���ؾ�(�ر�ͼID&boxid#boxid#boxid#boxid#boxid#boxid|�ر�ͼID&boxid#boxid#boxid#boxid#boxid#boxid��",
	},
	["cangbaotu_caijitime"] = { 
		k = "cangbaotu_caijitime",
		value = 5,
		notice = "����ɼ�ʱ��",
	},
	["paihangbang_title_1"] = { 
		k = "paihangbang_title_1",
		value = "384|385|386",
		notice = "��ҳ�Ϊְҵ���а��һʱ��ͨ�棨սʿ|��ʦ|��ʿ��",
	},
	["level_max"] = { 
		k = "level_max",
		value = 200,
		notice = "��ɫ�ȼ�����",
	},
	["Elite_Challenge_time"] = { 
		k = "Elite_Challenge_time",
		value = 3,
		notice = "��ʿ��������",
	},
	["Elite_DayChallenge_time"] = { 
		k = "Elite_DayChallenge_time",
		value = 3,
		notice = "�ճ���Ӣ��ս����",
	},
	["auto_task_time"] = { 
		k = "auto_task_time",
		value = 500,
		notice = "�Զ����������ʱ�䣨��λ�����룩",
	},
	["Elite_DayChallenge_consumption"] = { 
		k = "Elite_DayChallenge_consumption",
		value = 304,
		notice = "ˢ���ճ���Ӣ��ս�������ĵ���",
	},
	["chuanyin_item"] = { 
		k = "chuanyin_item",
		value = 302,
		notice = "�������ĵ���",
	},
	["Elite_DayChallenge_Starprobability"] = { 
		k = "Elite_DayChallenge_Starprobability",
		value = "70#25#5",
		notice = "��ͬ�Ǽ��ճ���Ӣ��ս����ˢ�¼���",
	},
	["Maincity_limit"] = { 
		k = "Maincity_limit",
		value = "6#2300001|bsr03#2300002",
		notice = "��ͬ�������׶������Լ���������",
	},
	["zhuizongcost"] = { 
		k = "zhuizongcost",
		value = "321#1|3#2",
		notice = "׷�ٳ������ģ�����id#����|����id#����",
	},
	["fridndnumberlimit"] = { 
		k = "fridndnumberlimit",
		value = 100,
		notice = "������������",
	},
	["declareWar"] = { 
		k = "declareWar",
		value = "2#1#100000&4#1#200000&8#1#300000&12#1#500000",
		notice = "��ս����itemid#num",
	},
	["declareWar_time"] = { 
		k = "declareWar_time",
		value = "2#4#8#12",
		notice = "��սʱ��",
	},
	["alliance"] = { 
		k = "alliance",
		value = "1#1#20000&2#1#30000&6#1#50000&12#1#80000&24#1#100000",
		notice = "���˻���itemid#num",
	},
	["alliance_time"] = { 
		k = "alliance_time",
		value = "1#2#6#12#24",
		notice = "����ʱ��",
	},
	["noDigMonsters"] = { 
		k = "noDigMonsters",
		value = "1#2#3",
		notice = "�ƶ�����ʾ����ͼ��Ĺ���ID",
	},
	["drug_tips"] = { 
		k = "drug_tips",
		value = "<��ͨ��ҩ��/FCOLOR=255><��ҩ/FCOLOR=251>\\<��ͨ��ҩ��/FCOLOR=255><ħ��ҩ/FCOLOR=251>\\<˲��ҩ��/FCOLOR=255><����ѩ˪/FCOLOR=251>",
		notice = "�ڹ�ҩƷ��ע",
	},
	["boxtexiao"] = { 
		k = "boxtexiao",
		value = "15#4531#4511#4512|16#4531#4513#4514|17#4532#4515#4516|18#4533#4517#4518|18#4530#4519#4520|",
		notice = "������Ч",
	},
	["attackglobalCD"] = { 
		k = "attackglobalCD",
		value = 500,
		notice = "�չ�Ĭ��CD",
	},
	["magicglobalCD"] = { 
		k = "magicglobalCD",
		value = 1000,
		notice = "ħ��Ĭ��CD",
	},
	["HumanPaperback"] = { 
		k = "HumanPaperback",
		value = "6#32|7#31|8#33",
		notice = "�����װ (սʿ�·�#սʿ����|��ʦ�·�#��ʦ����|��ʿ�·�#��ʿ����)",
	},
	["MonsterPaperback"] = { 
		k = "MonsterPaperback",
		value = 27,
		notice = "�����װ",
	},
	["BuiltinCD"] = { 
		k = "BuiltinCD",
		value = "1000#1000#2000#2000",
		notice = "�ڹҳ�ҩ����ʱ��(��ͨ��ҩCD#��ͨ��ҩCD#˲��ҩCD#�سǾ�CD)",
	},
	["buttonSmall"] = { 
		k = "buttonSmall",
		value = 3,
		notice = "С�˰�ť�ȴ�ʱ��(����0��ʱ��ȴ�)",
	},
	["EXPcoordinate"] = { 
		k = "EXPcoordinate",
		value = "10#450|10#300|250#0|2000",
		notice = "������ʾ����(PC��X����#PC��Y����|�ƶ���X����#�ƶ���Y����|ǰ��ɫ#����ɫ|��;�����ʾ)",
	},
	["StallName"] = { 
		k = "StallName",
		value = "<$USERNAME>��̯λ",
		notice = "Ĭ�ϰ�̯������",
	},
	["BackpackGuide"] = { 
		k = "BackpackGuide",
		value = "1#1#41|42|43|44",
		notice = "����װ�������ť#�������߷ֽⰴť(0=�ر� 1=����)#StdMode����#StdMode����#",
	},
	["Fashionfx"] = { 
		k = "Fashionfx",
		value = 1,
		notice = "ʱװ��ģ(0Ĭ�Ͽ��� 1�ر�) ����ȡ���������,�����Զ���UI����ʱʹ��Ŀǰ",
	},
	["SuitCalcType"] = { 
		k = "SuitCalcType",
		value = 1,
		notice = "0�����Ե��ٷ� 1�ȰٷֱȺ����Ե�",
	},
	["Hangxuan"] = { 
		k = "Hangxuan",
		value = 0,
		notice = "�л���ս���� 0�ر� 1����",
	},
	["RankingList"] = { 
		k = "RankingList",
		value = "1#�ȼ�|2#սʿ|3#��ʦ|4#��ʿ",
		notice = "���а���ʾ (����#��ʾ���� 1#�ȼ�|2#սʿ|3#��ʦ|4#��ʿ)",
	},
	["prompt"] = { 
		k = "prompt",
		value = "res/public/btn_npcfh_04.png#5#1#0.6|res/public/btn_npcfh_04.png#10#-7#1",
		notice = "��������Ʒ��:(������(��)��ʾ���(PC��#X����#Y����#���ű���|�ƶ���#X����#Y����#���ű���)",
	},
	["Redtips"] = { 
		k = "Redtips",
		value = "res/public/btn_npcfh_04.png|res/public/btn_npcfh_03.png",
		notice = "��������ʾͼƬλ��(PC��|�ƶ���)",
	},
	["MiniMap"] = { 
		k = "MiniMap",
		value = "0#0#730#445",
		notice = "X����#Y����#��#��     (ֻ����ƶ���)",
	},
	["MonDropType"] = { 
		k = "MonDropType",
		value = 0,
		notice = "��������",
	},
}
return config
