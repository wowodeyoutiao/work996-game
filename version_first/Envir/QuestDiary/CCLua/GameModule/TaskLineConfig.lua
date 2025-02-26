--����������
TaskLineConfig = {
    [CommonDefine.TASK_LINE_ID_MAIN] = {
        taskIDVar = CommonDefine.VAR_U_ID_TASKLINE1,
        taskStatusVar = CommonDefine.VAR_U_STATUS_TASKLINE1,
        taskCounterVar = CommonDefine.VAR_T_COUNTERDATA_TASKLINE1,
        firstTaskID = 101,
        taskDataList = {
            [101] = {                   --��ǰ������
                nextid = 102,           --�¸�������
                acceptnpcid = 215,      --'������NPC',
                submitnpcid = 216,      --'������NPC',
                autoaccept=0,           
                autosubmit=0,
                acceptdialogue = '�귨��½��������ȱ��ʿ������ȥҲҪ�ܻص�|���źá�',
                submitdialogue = '��Щ���⹻���һ�����ˣ�',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='��', num=1}}, 
                targpos = {mapid='0', x=632, y=633},
                reward_tab = {{name='����', num=4500},{name='���', num=50000},{name='���ѵ�������(ս)', num=1,job=0},{name='���ѵ�������(��)', num=1,job=1},{name='���ѵ�������(��)', num=1,job=2}},
            },
            [102] = {
                nextid = 103, 
                acceptnpcid = 216,      --'������NPC',
                submitnpcid = 217,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '���׼��һЩ¹Ѫ���ǿ��ǿ��ٲ�����������|ҩ��',
                submitdialogue = '��������׼�����ˣ�',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='¹', num=2}},
                targpos = {mapid='0', x=628, y=626},
                reward_tab = {{name='����', num=7700},{name='���', num=50000},{name='�ƾɵĲ�����(ս)', num=1,job=0},{name='�ƾɵĲ�����(��)', num=1,job=1},{name='�ƾɵĲ�����(��)', num=1,job=2}},
            },   
            [103] = {
                nextid = 104, 
                acceptnpcid = 217,      --'������NPC',
                submitnpcid = 218,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '�������ںܶ�ʱ��������ĺ�׮�ӡ�',
                submitdialogue = '�������ﶼ����Ҫ�ö����������ġ�',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='������', num=3}},
                targpos = {mapid='0', x=607, y=651},
                reward_tab = {{name='����', num=10000},{name='���', num=50000},{name='��ͨ����ͭ��', num=1,job=0},{name='��ͨ��������', num=1,job=1},{name='��ͨ�����齣', num=1,job=2}},
            },   
            [104] = {
                nextid = 105, 
                acceptnpcid = 218,      --'������NPC',
                submitnpcid = 219,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '�����Щ����ֵ�è��������',
                submitdialogue = '�ܿ���������̫���ˡ�',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='����è', num=3}},
                targpos = {mapid='0', x=547, y=530},
                reward_tab = {{name='����', num=16000},{name='���', num=50000},{name='��ͨ��¹Ƥѥ(ս)', num=1,job=0},{name='��ͨ��¹Ƥѥ(��)', num=1,job=1},{name='��ͨ��¹Ƥѥ(��)', num=1,job=2}},
            }, 
            [105] = {
                nextid = 106, 
                acceptnpcid = 219,      --'������NPC',
                submitnpcid = 220,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '��������Щ�������������ķ����ҡ�',
                submitdialogue = '����ȡʤ������ߵľ��硣',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='���', num=3}},
                targpos = {mapid='0', x=338, y=497},
                reward_tab = {{name='����', num=16000},{name='���', num=50000},{name='��ͨ����ͷ��(ս)', num=1,job=0},{name='��ͨ����ͷ��(��)', num=1,job=1},{name='��ͨ����ͷ��(��)', num=1,job=2}},
            },  
            [106] = {
                nextid = 107, 
                acceptnpcid = 220,      --'������NPC',
                submitnpcid = 221,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '���˷�����˻��Χ��Խ��Խ���ˡ�',
                submitdialogue = 'û��ʲô�����µģ�ֻҪ�����ͽ������ǡ�',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='������', num=3}},
                targpos = {mapid='0', x=271, y=506},
                reward_tab = {{name='����', num=20000},{name='���', num=50000},{name='��ͨ�����ָ(ս)', num=1,job=0},{name='��ͨ���ҽ�ָ(ս)', num=1,job=0},{name='��ͨ�����ָ(��)', num=1,job=1},{name='��ͨ���ҽ�ָ(��)', num=1,job=1},{name='��ͨ�����ָ(��)', num=1,job=2},{name='��ͨ���ҽ�ָ(��)', num=1,job=2}},
            },  
            [107] = {
                nextid = 108, 
                acceptnpcid = 221,      --'������NPC',
                submitnpcid = 222,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = '��������Ӳ����',
                submitdialogue = '��ǳ����Ѿ��ưܲ����ˡ�',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='����սʿ', num=3}},
                targpos = {mapid='0', x=211, y=420},
                reward_tab = {{name='����', num=20000},{name='���', num=50000},{name='��̵��޹�������(ս)', num=1,job=0},{name='��̵��޹�������(ս)', num=1,job=0},{name='��̵��޹�������(��)', num=1,job=1},{name='��̵��޹�������(��)', num=1,job=1},{name='��̵��޹�������(��)', num=1,job=2},{name='��̵��޹�������(��)', num=1,job=2}},
            },  
            [108] = {
                nextid = 109, 
                acceptnpcid = 222,      --'������NPC',
                submitnpcid = 213,      --'������NPC',
                autoaccept=0, 
                autosubmit=0,
                acceptdialogue = 'ϣ�����ܼ縺��������ص���',
                submitdialogue = '��������������ջ���ࡣ',
                tasktype = CommonDefine.TASK_TYPE_KILLMON,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktarg_tab = {{monname='������ʿ', num=3}},
                targpos = {mapid='0', x=116, y=285},
                reward_tab = {{name='����', num=20000},{name='���', num=50000}},
            }, 
            [109] = {
                nextid = 110, 
                acceptnpcid = 213,      --'������NPC',
                submitnpcid = 213,      --'������NPC',
                autoaccept=1, 
                autosubmit=0,
                acceptdialogue = '���������ֳɳ��ˣ�',
                submitdialogue = '��������������ջ���ࡣ',
                tasktype = CommonDefine.TASK_TYPE_FREEVIP,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktargparam = 1,
                tasktargdesc = '���VIP�ﵽ1��',
                reward_tab = {{name='����', num=20000},{name='���', num=50000}},
            },
            [110] = {
                nextid = 0, 
                acceptnpcid = 213,      --'������NPC',
                submitnpcid = 213,      --'������NPC',
                autoaccept=1, 
                autosubmit=0,
                acceptdialogue = '���������ֳɳ��ˣ�',
                submitdialogue = '��������������ջ���ࡣ',
                tasktype = CommonDefine.TASK_TYPE_FREEVIP,
                --һ�����������֧������Ŀ�꣬��չ����
                tasktargparam = 5,
                tasktargdesc = '���VIP�ﵽ5��',
                reward_tab = {{name='����', num=20000},{name='���', num=50000}},
            },            
        }
    }
}

return TaskLineConfig