local config = { 
	[1] = { 
		id = 1,
		viplevel = 0,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 20,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":50000}]",
	},
	[2] = { 
		id = 2,
		viplevel = 0,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 3,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":1000}]",
	},
	[3] = { 
		id = 3,
		viplevel = 0,
		taskseq = 3,
		tasktype = 7,
		tasktargnum = 1,
		taskparam = 0,
		taskdesc = "全身穿戴%s品质以上装备",
		finishrewards = "[{\"name\":\"金币\", \"num\":500000}]",
	},
	[4] = { 
		id = 4,
		viplevel = 0,
		taskseq = 4,
		tasktype = 13,
		tasktargnum = 10,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":100}]",
	},
	[5] = { 
		id = 5,
		viplevel = 0,
		taskseq = 5,
		tasktype = 5,
		tasktargnum = 1,
		taskparam = 0,
		taskdesc = "累计进入%s次魔方阵",
		finishrewards = "[{\"name\":\"魔方阵凭证\", \"num\":1}]",
	},
	[101] = { 
		id = 101,
		viplevel = 1,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 40,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":60000}]",
	},
	[102] = { 
		id = 102,
		viplevel = 1,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 20,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":2000}]",
	},
	[103] = { 
		id = 103,
		viplevel = 1,
		taskseq = 3,
		tasktype = 7,
		tasktargnum = 2,
		taskparam = 0,
		taskdesc = "全身穿戴%s品质以上装备",
		finishrewards = "[{\"name\":\"金币\", \"num\":1000000}]",
	},
	[104] = { 
		id = 104,
		viplevel = 1,
		taskseq = 4,
		tasktype = 13,
		tasktargnum = 25,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":200}]",
	},
	[105] = { 
		id = 105,
		viplevel = 1,
		taskseq = 5,
		tasktype = 5,
		tasktargnum = 2,
		taskparam = 0,
		taskdesc = "累计进入%s次魔方阵",
		finishrewards = "[{\"name\":\"魔方阵凭证\", \"num\":1}]",
	},
	[201] = { 
		id = 201,
		viplevel = 2,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":100000}]",
	},
	[202] = { 
		id = 202,
		viplevel = 2,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 40,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":3000}]",
	},
	[203] = { 
		id = 203,
		viplevel = 2,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 40,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":300}]",
	},
	[204] = { 
		id = 204,
		viplevel = 2,
		taskseq = 4,
		tasktype = 6,
		tasktargnum = 8,
		taskparam = 0,
		taskdesc = "任一装备位升至%s星以上",
		finishrewards = "[{\"name\":\"升星石\", \"num\":50}]",
	},
	[205] = { 
		id = 205,
		viplevel = 2,
		taskseq = 5,
		tasktype = 5,
		tasktargnum = 4,
		taskparam = 0,
		taskdesc = "累计进入%s次魔方阵",
		finishrewards = "[{\"name\":\"魔方阵凭证\", \"num\":2}]",
	},
	[301] = { 
		id = 301,
		viplevel = 3,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 60,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":200000}]",
	},
	[302] = { 
		id = 302,
		viplevel = 3,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 80,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":4000}]",
	},
	[303] = { 
		id = 303,
		viplevel = 3,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":300}]",
	},
	[304] = { 
		id = 304,
		viplevel = 3,
		taskseq = 4,
		tasktype = 9,
		tasktargnum = 40,
		taskparam = 0,
		taskdesc = "累计进行%s次元宝洗炼",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":4000}]",
	},
	[305] = { 
		id = 305,
		viplevel = 3,
		taskseq = 5,
		tasktype = 5,
		tasktargnum = 8,
		taskparam = 0,
		taskdesc = "累计进入%s次魔方阵",
		finishrewards = "[{\"name\":\"魔方阵凭证\", \"num\":2}]",
	},
	[401] = { 
		id = 401,
		viplevel = 4,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 70,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":300000}]",
	},
	[402] = { 
		id = 402,
		viplevel = 4,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 110,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":5000}]",
	},
	[403] = { 
		id = 403,
		viplevel = 4,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 60,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":500}]",
	},
	[404] = { 
		id = 404,
		viplevel = 4,
		taskseq = 4,
		tasktype = 10,
		tasktargnum = 20,
		taskparam = 0,
		taskdesc = "累计合成出%s件以上装备",
		finishrewards = "[{\"name\":\"金币\", \"num\":2000000}]",
	},
	[405] = { 
		id = 405,
		viplevel = 4,
		taskseq = 5,
		tasktype = 3,
		tasktargnum = 10,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":1000}]",
	},
	[501] = { 
		id = 501,
		viplevel = 5,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 80,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":500000}]",
	},
	[502] = { 
		id = 502,
		viplevel = 5,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 150,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":6000}]",
	},
	[503] = { 
		id = 503,
		viplevel = 5,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 70,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":700}]",
	},
	[504] = { 
		id = 504,
		viplevel = 5,
		taskseq = 4,
		tasktype = 10,
		tasktargnum = 30,
		taskparam = 0,
		taskdesc = "累计合成出%s件以上装备",
		finishrewards = "[{\"name\":\"金币\", \"num\":3000000}]",
	},
	[505] = { 
		id = 505,
		viplevel = 5,
		taskseq = 5,
		tasktype = 6,
		tasktargnum = 10,
		taskparam = 0,
		taskdesc = "任一装备位升至%s星以上",
		finishrewards = "[{\"name\":\"升星石\", \"num\":200}]",
	},
	[601] = { 
		id = 601,
		viplevel = 6,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 90,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":700000}]",
	},
	[602] = { 
		id = 602,
		viplevel = 6,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 180,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":7000}]",
	},
	[603] = { 
		id = 603,
		viplevel = 6,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 80,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":800}]",
	},
	[604] = { 
		id = 604,
		viplevel = 6,
		taskseq = 4,
		tasktype = 11,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "累计合成出%s件以上魂石",
		finishrewards = "[{\"name\":\"金币\", \"num\":4000000}]",
	},
	[605] = { 
		id = 605,
		viplevel = 6,
		taskseq = 5,
		tasktype = 12,
		tasktargnum = 30,
		taskparam = 0,
		taskdesc = "累计合成出%s件以上灵玉",
		finishrewards = "[{\"name\":\"金币\", \"num\":2000000}]",
	},
	[701] = { 
		id = 701,
		viplevel = 7,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 100,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":1000000}]",
	},
	[702] = { 
		id = 702,
		viplevel = 7,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 220,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":8000}]",
	},
	[703] = { 
		id = 703,
		viplevel = 7,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 90,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":900}]",
	},
	[704] = { 
		id = 704,
		viplevel = 7,
		taskseq = 4,
		tasktype = 10,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "累计合成出%s件以上装备",
		finishrewards = "[{\"name\":\"金币\", \"num\":5000000}]",
	},
	[705] = { 
		id = 705,
		viplevel = 7,
		taskseq = 5,
		tasktype = 11,
		tasktargnum = 60,
		taskparam = 0,
		taskdesc = "累计合成出%s件以上魂石",
		finishrewards = "[{\"name\":\"金币\", \"num\":5000000}]",
	},
	[801] = { 
		id = 801,
		viplevel = 8,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 105,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":1300000}]",
	},
	[802] = { 
		id = 802,
		viplevel = 8,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 260,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":9000}]",
	},
	[803] = { 
		id = 803,
		viplevel = 8,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 95,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":950}]",
	},
	[804] = { 
		id = 804,
		viplevel = 8,
		taskseq = 4,
		tasktype = 9,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "累计进行%s次元宝洗炼",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":5000}]",
	},
	[805] = { 
		id = 805,
		viplevel = 8,
		taskseq = 5,
		tasktype = 6,
		tasktargnum = 12,
		taskparam = 0,
		taskdesc = "任一装备位升至%s星以上",
		finishrewards = "[{\"name\":\"升星石\", \"num\":300}]",
	},
	[901] = { 
		id = 901,
		viplevel = 9,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 110,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":1600000}]",
	},
	[902] = { 
		id = 902,
		viplevel = 9,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 300,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":10000}]",
	},
	[903] = { 
		id = 903,
		viplevel = 9,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 100,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":1000}]",
	},
	[904] = { 
		id = 904,
		viplevel = 9,
		taskseq = 4,
		tasktype = 3,
		tasktargnum = 30,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":1700}]",
	},
	[905] = { 
		id = 905,
		viplevel = 9,
		taskseq = 5,
		tasktype = 4,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "累计击杀%s次灵玉首领",
		finishrewards = "[{\"name\":\"灵玉精华\", \"num\":1500}]",
	},
	[1001] = { 
		id = 1001,
		viplevel = 10,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 115,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":2000000}]",
	},
	[1002] = { 
		id = 1002,
		viplevel = 10,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 350,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":11000}]",
	},
	[1003] = { 
		id = 1003,
		viplevel = 10,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 105,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":1500}]",
	},
	[1004] = { 
		id = 1004,
		viplevel = 10,
		taskseq = 4,
		tasktype = 3,
		tasktargnum = 40,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":1900}]",
	},
	[1005] = { 
		id = 1005,
		viplevel = 10,
		taskseq = 5,
		tasktype = 4,
		tasktargnum = 60,
		taskparam = 0,
		taskdesc = "累计击杀%s次灵玉首领",
		finishrewards = "[{\"name\":\"灵玉精华\", \"num\":2000}]",
	},
	[1101] = { 
		id = 1101,
		viplevel = 11,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 120,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":2500000}]",
	},
	[1102] = { 
		id = 1102,
		viplevel = 11,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 400,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":12000}]",
	},
	[1103] = { 
		id = 1103,
		viplevel = 11,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 110,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":2000}]",
	},
	[1104] = { 
		id = 1104,
		viplevel = 11,
		taskseq = 4,
		tasktype = 3,
		tasktargnum = 50,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":2100}]",
	},
	[1105] = { 
		id = 1105,
		viplevel = 11,
		taskseq = 5,
		tasktype = 4,
		tasktargnum = 70,
		taskparam = 0,
		taskdesc = "累计击杀%s次灵玉首领",
		finishrewards = "[{\"name\":\"灵玉精华\", \"num\":2500}]",
	},
	[1201] = { 
		id = 1201,
		viplevel = 12,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 125,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":3000000}]",
	},
	[1202] = { 
		id = 1202,
		viplevel = 12,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 450,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":13000}]",
	},
	[1203] = { 
		id = 1203,
		viplevel = 12,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 115,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":2500}]",
	},
	[1204] = { 
		id = 1204,
		viplevel = 12,
		taskseq = 4,
		tasktype = 3,
		tasktargnum = 60,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":2300}]",
	},
	[1205] = { 
		id = 1205,
		viplevel = 12,
		taskseq = 5,
		tasktype = 4,
		tasktargnum = 80,
		taskparam = 0,
		taskdesc = "累计击杀%s次灵玉首领",
		finishrewards = "[{\"name\":\"灵玉精华\", \"num\":3000}]",
	},
	[1301] = { 
		id = 1301,
		viplevel = 13,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 130,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":4000000}]",
	},
	[1302] = { 
		id = 1302,
		viplevel = 13,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 500,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":14000}]",
	},
	[1303] = { 
		id = 1303,
		viplevel = 13,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 120,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":3000}]",
	},
	[1304] = { 
		id = 1304,
		viplevel = 13,
		taskseq = 4,
		tasktype = 3,
		tasktargnum = 70,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":2500}]",
	},
	[1305] = { 
		id = 1305,
		viplevel = 13,
		taskseq = 5,
		tasktype = 4,
		tasktargnum = 90,
		taskparam = 0,
		taskdesc = "累计击杀%s次灵玉首领",
		finishrewards = "[{\"name\":\"灵玉精华\", \"num\":3500}]",
	},
	[1401] = { 
		id = 1401,
		viplevel = 14,
		taskseq = 1,
		tasktype = 1,
		tasktargnum = 135,
		taskparam = 0,
		taskdesc = "角色等级达到%s级",
		finishrewards = "[{\"name\":\"经验\", \"num\":5000000}]",
	},
	[1402] = { 
		id = 1402,
		viplevel = 14,
		taskseq = 2,
		tasktype = 2,
		tasktargnum = 550,
		taskparam = 0,
		taskdesc = "角色战力达到%s万",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":15000}]",
	},
	[1403] = { 
		id = 1403,
		viplevel = 14,
		taskseq = 3,
		tasktype = 13,
		tasktargnum = 125,
		taskparam = 0,
		taskdesc = "全身装备位强化%s级以上",
		finishrewards = "[{\"name\":\"强化石\", \"num\":3500}]",
	},
	[1404] = { 
		id = 1404,
		viplevel = 14,
		taskseq = 4,
		tasktype = 3,
		tasktargnum = 80,
		taskparam = 0,
		taskdesc = "累计击杀%s次战力首领",
		finishrewards = "[{\"name\":\"绑定元宝\", \"num\":2700}]",
	},
	[1405] = { 
		id = 1405,
		viplevel = 14,
		taskseq = 5,
		tasktype = 4,
		tasktargnum = 100,
		taskparam = 0,
		taskdesc = "累计击杀%s次灵玉首领",
		finishrewards = "[{\"name\":\"灵玉精华\", \"num\":4000}]",
	},
}
return config
