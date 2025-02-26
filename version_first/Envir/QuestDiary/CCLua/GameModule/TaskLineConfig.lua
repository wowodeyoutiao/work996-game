--任务线配置
TaskLineConfig = {
    [CommonDefine.TASK_LINE_ID_MAIN] = {
        taskIDVar = CommonDefine.VAR_U_ID_TASKLINE1,
        taskStatusVar = CommonDefine.VAR_U_STATUS_TASKLINE1,
        taskCounterVar = CommonDefine.VAR_T_COUNTERDATA_TASKLINE1,
        firstTaskID = 101,
        taskDataList = {
            [101] = {                   --当前任务编号
                nextid = 102,           --下个任务编号
                acceptnpcid = 215,      --'接任务NPC',
                submitnpcid = 216,      --'交任务NPC',
                autoaccept=0,           
                autosubmit=0,
                acceptdialogue = '玛法大陆从来都不缺勇士，出的去也要能回得|来才好。',
                submitdialogue = '这些鸡肉够你吃一阵子了，',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='鸡', num=1}}, 
                targpos = {mapid='0', x=632, y=633},
                reward_tab = {{name='经验', num=4500},{name='金币', num=50000},{name='断裂的铁项链(战)', num=1,job=0},{name='断裂的铁项链(法)', num=1,job=1},{name='断裂的铁项链(道)', num=1,job=2}},
            },
            [102] = {
                nextid = 103, 
                acceptnpcid = 216,      --'接任务NPC',
                submitnpcid = 217,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '最好准备一些鹿血，那可是快速补充体力的灵|药！',
                submitdialogue = '看来你是准备好了！',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='鹿', num=2}},
                targpos = {mapid='0', x=628, y=626},
                reward_tab = {{name='经验', num=7700},{name='金币', num=50000},{name='破旧的布腰带(战)', num=1,job=0},{name='破旧的布腰带(法)', num=1,job=1},{name='破旧的布腰带(道)', num=1,job=2}},
            },   
            [103] = {
                nextid = 104, 
                acceptnpcid = 217,      --'接任务NPC',
                submitnpcid = 218,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '稻草人在很多时候都是练武的好桩子。',
                submitdialogue = '来我这里都是需要用东西来交换的。',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='稻草人', num=3}},
                targpos = {mapid='0', x=607, y=651},
                reward_tab = {{name='经验', num=10000},{name='金币', num=50000},{name='普通的青铜刀', num=1,job=0},{name='普通的铁法杖', num=1,job=1},{name='普通的铁灵剑', num=1,job=2}},
            },   
            [104] = {
                nextid = 105, 
                acceptnpcid = 218,      --'接任务NPC',
                submitnpcid = 219,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '最近有些很奇怪的猫在作妖。',
                submitdialogue = '能看到你真是太好了。',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='钉耙猫', num=3}},
                targpos = {mapid='0', x=547, y=530},
                reward_tab = {{name='经验', num=16000},{name='金币', num=50000},{name='普通的鹿皮靴(战)', num=1,job=0},{name='普通的鹿皮靴(法)', num=1,job=1},{name='普通的鹿皮靴(道)', num=1,job=2}},
            }, 
            [105] = {
                nextid = 106, 
                acceptnpcid = 219,      --'接任务NPC',
                submitnpcid = 220,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '附近的那些蛤蟆聒噪的让人心烦意乱。',
                submitdialogue = '以智取胜才是最高的境界。',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='蛤蟆', num=3}},
                targpos = {mapid='0', x=338, y=497},
                reward_tab = {{name='经验', num=16000},{name='金币', num=50000},{name='普通的铁头盔(战)', num=1,job=0},{name='普通的铁头盔(法)', num=1,job=1},{name='普通的铁头盔(道)', num=1,job=2}},
            },  
            [106] = {
                nextid = 107, 
                acceptnpcid = 220,      --'接任务NPC',
                submitnpcid = 221,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '发了疯的兽人活动范围是越来越大了。',
                submitdialogue = '没有什么可以怕的，只要赶来就结束它们。',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='半兽人', num=3}},
                targpos = {mapid='0', x=271, y=506},
                reward_tab = {{name='经验', num=20000},{name='金币', num=50000},{name='普通的左戒指(战)', num=1,job=0},{name='普通的右戒指(战)', num=1,job=0},{name='普通的左戒指(法)', num=1,job=1},{name='普通的右戒指(法)', num=1,job=1},{name='普通的左戒指(道)', num=1,job=2},{name='普通的右戒指(道)', num=1,job=2}},
            },  
            [107] = {
                nextid = 108, 
                acceptnpcid = 221,      --'接任务NPC',
                submitnpcid = 222,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '武力才是硬道理！',
                submitdialogue = '这城池早已经破败不堪了。',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='半兽战士', num=3}},
                targpos = {mapid='0', x=211, y=420},
                reward_tab = {{name='经验', num=20000},{name='金币', num=50000},{name='坚固的兽骨左手镯(战)', num=1,job=0},{name='坚固的兽骨右手镯(战)', num=1,job=0},{name='坚固的兽骨左手镯(法)', num=1,job=1},{name='坚固的兽骨右手镯(法)', num=1,job=1},{name='坚固的兽骨左手镯(道)', num=1,job=2},{name='坚固的兽骨右手镯(道)', num=1,job=2}},
            },  
            [108] = {
                nextid = 109, 
                acceptnpcid = 222,      --'接任务NPC',
                submitnpcid = 213,      --'交任务NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '希望你能肩负起来这个重担！',
                submitdialogue = '常来我这里你会收获更多。',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --一个子任务最多支持三个目标，扩展另开发
                tasktarg_tab = {{monname='半兽勇士', num=3}},
                targpos = {mapid='0', x=116, y=285},
                reward_tab = {{name='经验', num=20000},{name='金币', num=50000}},
            }, 
            [109] = {
                nextid = 110, 
                acceptnpcid = 213,      --'接任务NPC',
                submitnpcid = 213,      --'交任务NPC',
                autoaccept=1, 
                autosubmit=0,
                acceptdialogue = '看起来你又成长了！',
                submitdialogue = '常来我这里你会收获更多。',
                tasktype = CommonDefine.TASK_TYPE_FREEVIP,
                --一个子任务最多支持三个目标，扩展另开发
                tasktargparam = 1,
                tasktargdesc = '免费VIP达到1级',
                reward_tab = {{name='经验', num=20000},{name='金币', num=50000}},
            },
            [110] = {
                nextid = 0, 
                acceptnpcid = 213,      --'接任务NPC',
                submitnpcid = 213,      --'交任务NPC',
                autoaccept=1, 
                autosubmit=0,
                acceptdialogue = '看起来你又成长了！',
                submitdialogue = '常来我这里你会收获更多。',
                tasktype = CommonDefine.TASK_TYPE_FREEVIP,
                --一个子任务最多支持三个目标，扩展另开发
                tasktargparam = 5,
                tasktargdesc = '免费VIP达到5级',
                reward_tab = {{name='经验', num=20000},{name='金币', num=50000}},
            },            
        }
    }
}

return TaskLineConfig