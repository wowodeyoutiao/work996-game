---�����л��ڵ���ͬʱ����
function addattacksabakall() end

---���buff
---*  obj: ���|���� ����
---*  buffid: buffid 10000�Ժ�
---*  time: ʱ��,��Ӧbuff����ά���ĵ�λ
---*  OverLap: ���Ӳ���,Ĭ��1
---*  objOwner: ʩ����
---*  abil: ���Ա� {[1]=200, [4]=20},����id=ֵ
---@param obj string
---@param buffid integer
---@param time? integer
---@param OverLap? integer
---@param objOwner? string
---@param abil? table
function addbuff(obj,buffid,time,OverLap,objOwner,abil) end

---��������
---*  actor: ��Ҷ���
---*  id: ID
---*  name: ��ʾ����
---*  func: ������(������ö��ŷָ�)
---@param actor string
---@param id integer
---@param name string
---@param func string
function addbutshow(actor,id,name,func) end

---�����Զ��尴ť
---*  actor: ��Ҷ���
---*  windowid: ������ID
---*  name: ��ťID
---*  func: ͼ������
---@param actor string
---@param windowid integer
---@param buttonid integer
---@param icon string
function addbutton(actor,windowid,buttonid,icon) end

---�����޴�ʹ����Ʒ�Ĵ���
---*  actor: ��Ҷ���
---*  actor: ��ƷΨһID
---*  actor: ����
---@param actor string
---@param itemmakeid integer
---@param num integer
function addfunitemdura(actor,itemmakeid,num) end

---��Ӷ�Ա
---*  actor: ��Ҷ���
---*  userId: ��ԱUserId
---@param actor string
---@param userId string
function addgroupmember(actor,userId) end

---��ʱ���ӹ��ﱬ����Ʒ
---*  actor: ��Ҷ���
---*  mon: �������
---*  itemname: ��Ʒ����
---@param actor string
---@param mon string
---@param itemname string
function additemtodroplist(actor,mon,itemname) end

---���Ӷ�̬��ͼ����
--- * gateName: ����������
--- * Mapfrom: ����������ͼID
--- * x1: �������������x
--- * y1: �������������y
--- * range: �����ſɴ��ͷ�Χ
--- * Mapto: �������յ��ͼID
--- * x1: �������յ�����x
--- * y1: �������յ�����y
--- * time: �����ų���ʱ��(0:���޳�)
---@param gateName string
---@param Mapfrom string
---@param x1 integer
---@param y1 integer
---@param range integer
---@param Mapto string
---@param x2 integer
---@param y2 integer
---@param time integer
function addmapgate(gateName, Mapfrom, x1, y1, range, Mapto, x2, y2, time) end

---���������ͼ
---*  oldMap: ԭ��ͼID
---*  NewMap: �µ�ͼID
---*  NewName: �µ�ͼ��
---*  time: ��Чʱ��(��)
---*  BackMap: �سǵ�ͼ
---@param oldMap string
---@param NewMap string
---@param NewName string
---@param time integer
---@param BackMap string|integer
---@param miniMapID? integer
---@param posmX? integer
---@param posmY? integer
function addmirrormap(oldMap,NewMap,NewName,time,BackMap,miniMapID,posmX,posmY) end

---���ӳ�������
---*  actor: ��Ҷ���
---*  idx: �������
---*  attrName: �Զ�����������
---*  opt: ������ + - =
---*  attr: �����ַ���
---*  type: 0���=������װ��������1=���ӹ̶�ֵ;��������װ����(���Լӳ�����Ч)
---@param actor string
---@param idx integer|string
---@param attrName integer|string
---@param opt string
---@param attr string
---@param type? integer
function addpetattlist(actor,idx,attrName,opt,attr,type) end

---���ӳ��﹥������
---*  actor: ��Ҷ���
---*  idx: ������Ż�"X"��ʾ��ǰ����
---*  skillid: ���ӵĹ�������ID
---@param actor string
---@param idx integer|string
---@param skillid integer
function addpetskill(actor,idx,skillid) end

---��Ӽ���
---*  actor: ��Ҷ���
---@param actor string
---@param skillid integer
---@param level integer
function addskill(actor,skillid,level) end

---���л���ӵ������б�
---*  name: �л���
---*  day: ����
---@param name string
---@param day integer
function addtocastlewarlist(name,day) end

---ǿ�ư��л���ӵ������б�
---*  name: �л��� ����"*"�����л�
---@param name string
function addtocastlewarlistex(name) end

---����֪ͨ�������QF
-- * msgID: ��ϢID
-- * userID: �û�ID
-- * arg1: ��Ϣ����1
-- * arg2: ��Ϣ����2
---@param msgID integer
---@param userID string
---@param arg1 string
---@param arg2 string
function bfbackcall(msgID, userID, arg1, arg2) end

---�����л�
---*  actor: ��Ҷ���
---*  name: �л���
---@param actor string
---@param name string
function buildguild(actor,name) end

---��������NPC��lua����
---*  actor: ��Ҷ���
---*  npcidx: NPC��(NPC���ñ��е�ID)
---*  delaytime: �ӳ�ʱ��ms,0����ִ��
---*  func: ������
---*  sParam: 	����
---@param actor string
---@param npcidx integer
---@param delaytime integer
---@param func string
---@param sParam string
function callfunbynpc(actor,npcidx,delaytime,func,sParam) end

---����TXT�ű�����
---*  actor: ��Ҷ���
---*  filename: �ļ���
---*  label: ��ǩ
---@param actor string
---@param filename string
---@param label string
function callscript(actor,filename,label) end

---���ô���ű�����
---*  actor: ��Ҷ���
---*  scriptname: �ű��ӿ�
---*  ...: ����1~����10
---@param actor string
---@param scriptname string
function callscriptex(actor,scriptname,...) end

---���ô���ű�����2
---*  actor: ��Ҷ���
---@param actor string
---@param scriptname string
---@param ... any
---@return boolean �Ƿ�����
function callcheckscriptex(actor,scriptname,...) end

---��ȡ���ɳ�Ϳ����
---*  actor: ��Ҷ���
---*  return: ����ֵ 0-��ɳ�Ϳ˳�Ա1-ɳ�Ϳ˳�Ա2-ɳ�Ϳ��ϴ�
---@param actor string
---@return integer
function castleidentity(actor) end

---ɳ�Ϳ˻�����Ϣ
---*  nID: ��Ϣ���� 1=ɳ������,����string; 2=ɳ���л�����,����string; 3=ɳ���л�᳤����,����string; 
---*  nID: ��Ϣ���� 4=ռ������,����integer; 5=��ǰ�Ƿ��ڹ�ɳ״̬,����Bool; 6=ɳ���лḱ�᳤�����б�,����table
---@param nID integer
function castleinfo(nID) end

---�޸Ĺ���ģʽ
---*  actor: ��Ҷ���
---*  attackmode: 0-ȫ�幥��
---*  attackmode: 1-��ƽ����
---*  attackmode: 2-���޹���
---*  attackmode: 3-ʦͽ����
---*  attackmode: 4-���鹥��
---*  attackmode: 5-�лṥ��
---*  attackmode: 6-��������
---*  attackmode: 7-���ҹ���
---@param actor string
---@param attackmode integer
function changeattackmode(actor,attackmode) end

---���Զ���װ������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  attrindex: ����λ��(0~9)
---*  bindindex: ������(0~4)
---*  bindvalue: �󶨵�ֵ
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor string
---@param item string
---@param attrindex integer
---@param bindindex integer
---@param bindvalue integer
---@param group? integer
function changecustomitemabil(actor,item,attrindex,bindindex,bindvalue,group) end

---���Ӻ��޸��Զ������Է�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  typename: ��������(-1Ϊ���)
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor string
---@param item string
---@param typename string
---@param group? integer
function changecustomitemtext(actor,item,typename,group) end

---���Ӻ��޸ķ���������ɫ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  color: ������ɫ(0~255)
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor string
---@param item string
---@param color integer
---@param group? integer
function changecustomitemtextcolor(actor,item,color,group) end

---�޸��Զ�������ֵ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  attrindex: ����λ��(0~9)ÿ��װ�������Զ���10������
---*  operate: ������:+��-��=
---*  value: ����ֵ
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor string
---@param item string
---@param attrindex integer
---@param operate string
---@param value integer
---@param group? integer
function changecustomitemvalue(actor,item,attrindex,operate,value,group) end

---�޸��������·���Ч
---*  actor: ��Ҷ���
---*  where: λ�� 0 1
---*  EffId: ��ЧID
---*  selfSee: ��Ҷ���
---@param actor string
---@param where integer
---@param EffId integer
---@param selfSee integer
function changedresseffect(actor,where,EffId,selfSee) end

---�������ﾭ��ֵ
---*  actor: ��Ҷ���
---*  opt: ��Ҷ���
---*  count: ��Ҷ���
---*  addexp: �Ƿ����Ӿ����龭��
---@param actor string
---@param opt string
---@param count integer
---@param addexp boolean
function changeexp(actor,opt,count,addexp) end

---�����л��Ա��������
---*  actor: ��Ҷ���
---*  char: ������ + - =
---*  num: ����
---@param actor string
---@param char string
---@param num integer
function changeguildmemberlimit(actor,char,num) end

---������������
---*  actor: ��Ҷ���
---*  id: ����ID 1-20
---*  time: ����ֵ
---*  value: ʱ��(��)
---@param actor string
---@param id integer
---@param value integer
---@param time integer
function changehumability(actor,id,value,time) end

---�޸���������
---*  actor: ��Ҷ���
---*  name: Ҫ��ѯ������
---@param actor string
---@param name string
function changehumname(actor,name) end


---����������ϲ��ŵ���Ч
---*  actor: ��Ҷ���
---*  effectid: ��ЧID
---@param actor string
---@param effectid integer
function clearplayeffect(actor,effectid) end

---������м���
---*  actor: ��Ҷ���
---@param actor string
function clearskill(actor) end

---�رյ�ǰ��NPC�Ի���
---*  actor: ��Ҷ���
---@param actor string
function close(actor) end

---�ٻ�ʰȡС����
---*  actor: ��Ҷ���
---*  monName: �������� ������Ҫ��cfg_monster.xls���������:Race=216
---@param actor string
---@param monName string
function createsprite(actor,monName) end

---ɾ��Ӣ��
---*  actor: ��Ҷ���
---@param actor string
function delhero(actor) end

---ɾ��Ini�ļ�������
---*  actor: ��Ҷ���
---@param actor string
function deliniitem(actor) end

---ɾ��Ini�ļ�������(��Cache)
---*  actor: ��Ҷ���
---@param actor string
function deliniitembycache(actor) end

---ɾ��Ini�ļ�������
---*  actor: ��Ҷ���
---@param actor string
function delinisection(actor) end

---ɾ��Ini�ļ������� ��Cache
---*  actor: ��Ҷ���
---@param actor string
function delinisectionbycache(actor) end

---ͨ����ƷΨһid������Ʒ
---*  actor: ��Ҷ���
---*  makeindx: ��ƷΨһID,����(,)����
---*  count: ������Ʒ�۳�����������˲�����Ĭ��ȫ���۳����ɵ�����Ʒȫ���۳�
---*  desc: ����
---@param actor string
---@param makeindx string|integer
---@param count? integer
---@param desc? string
function delitembymakeindex(actor,makeindx,count,desc) end

---ɾ����ͼ��Ч
---*  Id: ��Ч����ID
---@param Id integer
function delmapeffect(Id) end

---ɾ����̬��ͼ����
---*  actor: ��Ҷ���
---*  MapId: ��Ҷ���
---@param actor string
---@param MapId string|integer
function delmapgate(actor,MapId) end

---ɾ�������ͼ
---*  MapId: ��ͼID
---@param MapId string|integer
function delmirrormap(MapId) end

---ɾ������
---*  nIdx: ����ID
---@param nIdx integer
function delnation(nIdx) end

---ɾ���Ǳ�ְҵ����
---*  actor: ��Ҷ���
---@param actor string
function delnojobskill(actor) end

---ɾ��NPC
---*  name: NPC����
---*  map: ��ͼ���
---@param name string
---@param map string
function delnpc(name,map) end

---ɾ��NPC��Ч
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---@param actor string
---@param NPCIndex integer
function delnpceffect(actor,NPCIndex) end

---ɾ������
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor string
---@param idx integer
function delpet(actor,idx) end

---ɾ������
---*  actor: ��Ҷ���
---*  skillid: ����ID
---@param actor string
---@param skillid integer
function delskill(actor,skillid) end

---����ΨһIDɾ���ֿ���Ʒ
---*  actor: ��Ҷ���
---*  itemmakeid: ɾ��ΨһID��Ʒ
---@param actor string
---@param itemmakeid integer
function delstorageitem(actor,itemmakeid) end

---����idxɾ���ֿ���Ʒ
---*  actor: ��Ҷ���
---*  itemidx: ɾ������Idx��Ʒ
---@param actor string
---@param itemidx integer
function delstorageitembyidx(actor,itemidx) end

---ɾ���ƺ�
---*  actor: ��Ҷ���
---*  name: �ƺ���Ʒ����
---@param actor string
---@param name string
function deprivetitle(actor,name) end

---ʹ�ýű�����ⶾ(���̶�)
---*  actor: ��Ҷ���
---*  opt: -1,�����ж�;0,�̶�;1,�춾;3,�϶�;5,���;6,����;7,����
---@param actor string
---@param opt integer
function detoxifcation(actor,opt) end

---����
---*  actor: ��Ҷ���
---@param actor string
function dismounthorse(actor) end

---ֹͣ��̯
---*  actor: ��Ҷ���
---@param actor string
function forbidmyshop(actor) end

---��ȡ��ɫ����buff
---*  actor: ��Ҷ���
---@param actor string
---@return table buff�б�
function getallbuffid(actor) end

---��ȡ�����л����
---@return table
function getallguild() end

---��ȡ��ǰ����ģʽ
---*  actor: ��Ҷ���
---@param actor string
---@return integer ����ģʽ��0-ȫ�幥��1-��ƽ����2-���޹���3-ʦͽ����4-���鹥��5-�лṥ��6-��������7-���ҹ���
function getattackmode(actor) end

---��ȡ����ʣ��ո���
---*  actor: ��Ҷ���
---@param actor string
---@return integer
function getbagblank(actor) end

---��ȡ������Ʒ����
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---@param actor string
---@param itemname string
---@param model? integer
---@return integer
function getbagitemcount(actor,itemname,model) end


---��ȡ ����|���� �����Ϣ
---*  obj: ���|���� ����
---*  nID: ���� (���˵����)
---*  param3: ����3 (��ID=1ʱ����)
---@param obj string
---@param nID integer
---@param param3? integer
---@return any
function getbaseinfo(obj,nID,param3) end

---��ȡ����ͨ�û�������(����Ҽ���)
---*  actor: ��Ҷ���
---@param actor string
---@param moneyName string
---@return integer
function getbindmoney(actor,moneyName) end

---��ȡbuff��Ϣ
---*  actor: ��Ҷ���
---*  buffid: buffid
---*  type: 1=���Ӳ���;2=ʣ��ʱ��(��λ������һ��);3=��ȡʩ���߶���(�������߷���nil);4=��ȡ��������;
---@param actor string
---@param buffid integer
---@param type integer
---@return integer|string|nil
function getbuffinfo(actor,buffid,type) end

---��ȡ����
---*  actor: ��Ҷ���
---*  varname: ��������,���txt˵����
---@param actor string
---@param varname string
---@return string
function getconst(actor,varname) end

---��ȡ���ֵ
---*  obj: ����|�������
---*  index: �±�ID 0-9
---@param obj string
---@param index string|integer
---@return string
function getcurrent(obj,index) end

---������Ʒ��ȡJson
---*  item: ��Ʒ����
---@param item string
---@return string
function getitemjson(item) end

---���װ�����ֵ���ɫ
---*  item: ��Ʒ����
---@param item string
---@return integer
function getitemnamecolor(item) end

---��ȡ��ǰΨһID��Ʒ����������
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷΨһID
---@param actor string
---@param itemmakeid integer
---@return integer
function getitemstars(actor,itemmakeid) end

---��ȡָ����ͼ�������
---*  actor: ��Ҷ���
---*  MapId: ��ͼID
---*  isAllgain: �Ƿ�ȫ����ȡ 0=ȫ����ȡ 1=�ų���������
---@param actor string
---@param MapId string|integer
---@param isAllgain integer
---@return integer
function getplaycountinmap(actor,MapId,isAllgain) end

---��ȡ��ұ���
---*  actor: ��Ҷ���
---*  varName: ������
---@param actor string
---@param varName string
---@return integer|string
function getplaydef(actor,varName) end

---�������ΨһID��ȡ��Ҷ���
---*  string: ���ΨһID
---@param makeindex string
---@return string
function getplayerbyid(makeindex)  end

---�����������ȡ��Ҷ���
---*  name: �������
---@param name string
---@return string
function getplayerbyname(name) end

---��ȡ������������б�
---*  param: �Ƿ��޳����߹һ����0=���޳�1=�޳�
---@param param? integer
---@return table
function getplayerlst(param) end

---��ȡ�л��Ա���л��е�ְλ
---*  actor: ��Ҷ���
---@param actor string
---@return integer
function getplayguildlevel(actor) end

---��ȡ�Զ������
---*  actor: ��Ҷ���
---*  model: ������Χ(HUMAN/GUILD)
---*  varName: ������
---@param actor string
---@param model string
---@param varName? string
---@return string|integer
function getplayvar(actor,model,varName) end

---��ȡ�ֿ�ʣ�������
---*  actor: ��Ҷ���
---@param actor string
---@return integer
function getsblank(actor) end

---��ȡ���ܳ�ʼ��ȴʱ��
---*  skillname: ��Ҷ���
---@param skillname string
---@return integer
function getskillcscd(skillname) end

---��ȡ��ǰ������ȴʱ��
---*  actor: ��Ҷ���
---*  skillname: ��������
---@param actor string
---@param skillname string
---@return integer
function getskilldqcd(actor,skillname) end

---���ݼ������ֻ�ȡ����id
---*  skillname: ��������
---@param skillname string
---@return integer
function getskillindex(skillname) end

---��ȡ������Ϣ
---*  actor: ��Ҷ���
---*  skillid: ����ID
---*  type: ��ȡ����:1:�ȼ�;2:ǿ���ȼ�;3:������;4:����������;
---@param actor string
---@param skillid integer
---@param type integer
---@return integer|nil û�м��ܣ�����nil
function getskillinfo(actor,skillid,type) end

---��ȡ���ܵȼ�
---*  actor: ��Ҷ���
---*  skillid: ����ID
---@param actor string
---@param skillid integer
---@return integer
function getskilllevel(actor,skillid)  end

---��ȡ����ǿ���ȼ�
---*  actor: ��Ҷ���
---*  skillid: ����ID
---@param actor string
---@param skillid integer
---@return integer
function getskilllevelup(actor,skillid)  end

---���ݼ���id��ȡ��������
---*  skillID: ����ID
---@param skillID integer
---@return string
function getskillname(skillID) end

---��ȡ����������
---*  actor: ��Ҷ���
---@param actor string
---@param skillid integer
---@return integer
function getskilltrain(actor,skillid) end

---���ݱ���������ȡ��ɫ��������
---*  actor: ��Ҷ���
---*  nIndex: ����(0��ʼ)
---@param actor string
---@param nIndex integer
---@return string
function getslavebyindex(actor,nIndex) end


---��ȡװ����ʯ��Ƕ���
---*  actor: ��Ҷ���
---*  item: װ������
---@param actor string
---@param item string
---@return string ������أ�json�ַ�����֧��0-9��10����
function getsocketableitem(actor,item) end

---��ȡ��Ҳֿ���������
---*  actor: ��Ҷ���
---@param actor string
---@return integer
function getssize(actor) end

---��ȡbuffģ����Ϣ
---*  buffinfo: buffID/buff����
---*  id: 0:idx1:����;2.���;3.����ʱ��;4.��������;
---@param buffinfo integer|string
---@param id integer
---@return integer �����ڷ���0
function getstdbuffinfo(buffinfo,id) end

---��ȡ��Ʒ��������
---*  itemid: ��ƷID
---@param itemid integer
---@param id integer
---@return integer �����ڷ���0
function getstditematt(itemid,id) end

---��ȡ��Ʒ������Ϣ
---*  item: ��ƷID/��Ʒ����
---*  id:��˵����
---@param item integer|string
---@param id integer
---@return integer|string �����ڷ���0
function getstditeminfo(item,id) end

---��ȡ�ֿ�������Ʒ�б�
---*  actor: ��Ҷ���
---@param actor string
---@return table
function getstorageitems(actor) end

---��ȡ�����˺�����
---*  actor: ��Ҷ���
---@param actor string
---@return integer
function getsuckdamage(actor) end

---��ȡȫ�ֱ���
---*  varName: ������
---@param varName string
---@return string|integer
function getsysvar(varName) end

---��ȡȫ���Զ������
---*  varName: ������
---@param varName string
---@return string|integer
function getsysvarex(varName) end

---��ȡ��������64λʱ���
---@return integer
function gettcount64() end

---��ȡ��Ʒ��Դ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---@param actor string
---@param item string
---@return string json�ַ���
function getthrowitemly(actor,item) end

---��ȡ��ɫ���гƺ�
---*  actor: ��Ҷ���
---@param actor string
---@return table
function gettitlelist(actor) end

---��ȡ������������
---*  actor: ��Ҷ���
---*  nIndex: 	����
---@param actor string
---@param nIndex integer
---@return integer
function getusebonuspoint(actor,nIndex) end

---����Ʒ
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---*  num: 	����
---*  bind: ��Ʒ����
---*  desc: ����
---@param actor string
---@param itemname string
---@param num integer
---@param bind? integer
---@param desc? string
function giveitem(actor,itemname,num,bind,desc) end

---����json�ַ�������Ʒ
---*  actor: ��Ҷ���
---*  json: json�ַ���
---*  desc: ��ע
---@param actor string
---@param json string
---@param desc? string
---@return string
function giveitembyjson(actor,json,desc) end

---����Ʒ,��ֱ�Ӵ���
---*  actor: ��Ҷ���
---*  where: װ��λ��
---*  itemname: ��Ʒ����
---*  num: ����
---*  bind: ��Ʒ����
---*  desc: ����
---@param actor string
---@param where integer
---@param itemname string
---@param num? integer
---@param bind? integer
---@param desc? string
function giveonitem(actor,where,itemname,num,bind,desc) end

---��ȡȫ����Ϣ
---*  id: ��˵����
---@param id integer
function globalinfo(id) end

---ִ��GM����
---*  actor: ��Ҷ���
---*  GM: GM����
---*  ...: �������
---@param actor string
---@param GM string
---@param ... any
function gmexecute(actor,GM,...) end

---�ص���������ĳ��а�ȫ��
---*  actor: ��Ҷ���
---@param actor string
function gohome(actor) end

---���ô���
---*  actor: ��Ҷ���
---*  type: ����ģʽ
---*  label: ��ת��Ľӿ�
---*  range: ����ģʽ=3ʱָ���ķ�Χ��С
---@param actor string
---@param type integer
---@param label string
---@param range? integer
function gotolabel(actor,type,label,range) end

---������ҵ�ָ��λ��
---*  actor: ��Ҷ���
---*  x: X����
---*  y: Y����
---@param actor string
---@param x integer
---@param y integer
function gotonow(actor,x,y) end

---����ͼ�߼���
---*  mapid: ��ͼId
---*  x: X����
---*  y: Y����
---*  type: �߼�������:1.�ܷ񵽴�;2.��ȫ��;3.������;
---*  return: true=��ͬ;false=����ͬ
---@param mapid string|integer
---@param x integer
---@param y integer
---@param type integer
---@return boolean
function gridattr(mapid,x,y,type) end

---��ȡȫ����Ϣ
---*  id:  0: ȫ�������Ϣ<br>1: ����ʱ�俪ʼ �������� �������������ȡ����<$KFDAY><br>2: ����ʱ�俪ʼ ����ʱ�� ����ʱ�佨���ȡ����<$showtime><br>3: �Ϸ�����<br>4: �Ϸ�ʱ��<br>5: ������IP<br>6: �������<br>7: �����������<br>8: ����汾�ţ������ϰ汾Ϊ׼,���԰桢���ذ���ܴ��ڲ��죩<br>9����Ϸid10�����������ƻ�ȡ�쳣,�ó���<$SERVERNAME><br>11��������id
---@param id integer
---@return any
function grobalinfo(id) end

---�����ͼ����
---*  actor: ��Ҷ���
---*  mapid: ��ͼId
---*  x: X����
---*  y: Y����
---*  level: ���Դ�����͵ȼ�(����Ϊ�� Ϊ��ʱ������Ա�ĵȼ�ֱ�Ӵ���)
---*  value: ���ͷ�Χ��(�Զӳ�Ϊ���Ĵ��Ͷ��� 0Ϊ����Ҫ��Χ)
---*  funcName: �����ֶ�(����Ϊ��)
---@param actor string
---@param mapid string|integer
---@param x integer
---@param y integer
---@param level? integer
---@param value? integer
---@param funcName? string
function groupmapmove(actor,mapid,x,y,level,value,funcName) end

---�����Զ�����ɫ��������Ϣ
---*  actor: ��Ҷ���
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  Msg: ��Ϣ����
---*  flag: ���Ͷ���Self��ֻ�����Լ���Group�����͸���ӣ�Map�����͵���ǰ��ͼ�е����ʡ�Բ����ı�ʾȫ������.
---@param actor string
---@param FColor integer
---@param BColor integer
---@param Msg string
---@param flag? string
function guildnoticemsg(actor,FColor,BColor,Msg,flag) end

---�Ƿ���buff
---*  actor: ��Ҷ���
---*  buffid: ��Ҷ���
---@param actor string
---@param buffid integer
function hasbuff(actor,buffid) end

---�Ƿ���Ӣ��
---*  actor: ��Ҷ���
---@param actor string
function hashero(actor) end

---ˢ��Ѫ��/����
---*  actor: ���/�������
---@param actor string
function healthspellchanged(actor) end

---������Ϣ�ϱ�
---*  actor: ��Ҷ���
---@param url string
---@param suffix string
---@param head string
function httppost(url,suffix,head) end

---�޸����ﵱǰѪ��
---*  actor: ��Ҷ���
---*  operate: �������� [+����][-����][=����]
---*  nvalue: HP����
---*  effid: �ز�ID,cfg_damage_number���е�ID��ţ�ID���������Ӻ�����
---*  delay: ��ʱʱ��(��)
---*  hiter: �˺���Դ����
---*  isSend: �ͷŹ㲥ƮѪ-0=���㲥;1=�㲥
---*  isRob: �Ƿ�ǿ���޸Ĺ���0=ǿ���޸Ĺ���;1=���й����������������
---@param actor string
---@param operate string
---@param nvalue integer
---@param effid? integer
---@param delay? integer
---@param hiter? string
---@param isSend? integer
---@param isRob? integer
function humanhp(actor,operate,nvalue,effid,delay,hiter,isSend,isRob) end

---�޸����ﵱǰMP
---*  actor: ��Ҷ���
---*  operate: �������� [+����][-����][=����]
---*  nvalue: MP����
---@param actor string
---@param operate string
---@param nvalue integer
function humanmp(actor,operate,nvalue) end

---ȡ�Զ������ֱ�����λ��
---*  actor: ��Ҷ���
---*  varName: ���������
---*  playflag: 0-������� 1-�������
---*  sortflag: 0-���� 1-����
---@param actor string
---@param varName string
---@param playflag integer
---@param sortflag integer
function humvarrank(actor,varName,playflag,sortflag) end

---�����ļ�
---*  path: ·������(��ʼĿ¼Envir)
---@param path string
function include(path) end

---��ʼ���л��Զ������
---*  guil: �л����
---*  varType: ��������
---*  varName: ������
---@param guil string
---@param varType string
---@param varName string
function iniguildvar(guil,varType,varName) end

---��ʼ�������Զ������
---*  actor: ��Ҷ���
---*  varType: ��������(integer/string)
---*  varRage: ������Χ(HUMAN/GUILD) HUMANָ���˱��� GUILDָ�л����
---*  varName: ������
---@param actor string
---@param varType string
---@param varRage string
---@param varName string
function iniplayvar(actor,varType,varRage,varName) end

---��ʼ��ȫ���Զ������
---*  type: ��������(integer/string)
---*  varName: ������
---*  itype: ��������
---@param type string
---@param varName string
---@param itype? integer
function inisysvar(type,varName,itype) end

---�жϵ�ͼ�����Ƿ�Ϊ��
---*  mapname: ��ͼ����
---*  nX: ��ͼx����
---*  nY: ��ͼy����
---@param mapname string
---@param nX integer
---@param nY integer
function isemptyinmap(mapname,nX,nY) end



---�ж�Ӣ���Ƿ�Ϊ����״̬
---*  actor: ��Ҷ���
---@param actor string
function isherorecall(actor) end



---������ս��״̬
---*  actor: ��Ҷ���
---@param actor string
function isnationswar(actor) end

---�����Ƿ����
---*  actor: ��Ҷ���
---@param actor string
function isnotnull(actor) end


---�ж϶����Ƿ�ɱ�����
---*  Hiter: ��������(���/Ӣ��/����)
---*  Target: ����������(���/Ӣ��/����)
---@param Hiter string
---@param Target string
function ispropertarget(Hiter,Target) end

---����/�˳�����
---*  actor: ��Ҷ���
---*  nIdx: ����ID (1~100),��0�˳�����
---*  jobIdx: ְλ��� 0-9 ���� Ĭ��Ϊ0 
---@param actor string
---@param nIdx integer
---@param jobIdx? integer
function joinnational(actor,nIdx,jobIdx) end

---�ַ���ת���ɱ��
---*  str: json�ַ���
---@param str string
---@return table
function json2tbl(str) end

---���֪ͨ��������QF
---*  id: ��Ϣid 1-99
---*  userid: ���userid
---*  parama: ���ݵ��ַ���1(�ַ���)
---*  paramb: ���ݵ��ַ���2(�ַ���)
---@param id integer
---@param userid string
---@param parama string
---@param paramb string
function kfbackcall(id,userid,parama,paramb) end

---����ǿ�Ƶ���
---*  actor: ��Ҷ���
---@param actor string
function kick(actor) end

---����ɱ����ɫ
---*  play: ��ɫ�Ķ���
---*  actor: ���ֵĶ���
---@param actor string
---@param strKiller? string
function kill(actor,strKiller) end

---�ű����÷���ɱ����
---*  actor: ��Ҷ���
---@param actor string
function killedprotect(actor) end

---��ָ��λ�����ȴ�ָ�����
---*  actor: ��Ҷ���
---*  map: ��ͼ
---*  X: 	X����
---*  Y: 	Y����
---*  MonName: ���ȹ����Ĺ�������֧�ֶ����������,���������м��� | �ָ�
---@param actor string
---@param map string
---@param X integer
---@param Y integer
---@param MonName? string
function killmobappoint(actor,map,X,Y,MonName) end

---ɱ��2
---*  actor: ��Ҷ���
---*  mon: �������
---*  drop: �Ƿ������Ʒ true����|false������
---*  trigger: �Ƿ񴥷�killmon
---*  showdie: �Ƿ���ʾ��������
---@param actor string
---@param mon string
---@param drop boolean
---@param trigger boolean
---@param showdie boolean
function killmonbyobj(actor,mon,drop,trigger,showdie) end

---ɱ��1
---*  mapid: ��ͼid
---*  monname: ����ȫ�� �� nil|* ɱ��ȫ��
---*  count: ���� ��0ɱ������
---*  drop: �Ƿ������Ʒ
---@param mapid string|integer
---@param monname string
---@param count integer
---@param drop boolean
function killmonsters(mapid,monname,count,drop) end

---���п����һر��� ����ִ���������д���
function kuafuusergohome() end

---����װ����Ʒ
---*  actor: ��Ҷ���
---*  where: װ��λ��
---@param actor string
---@param where integer
---@return string ��Ʒ����
function linkbodyitem(actor,where) end

---�ı� ��/���� ״̬
---*  actor: ���/���� ����
---*  type: ����(0=�̶� 1=�춾 5=��� 12=���� 13= ���� ������Ч)
---*  time: ʱ��(��)
---*  value: ���� ֻ����̶�����
---*  model: 0=�����з������ж�1=�жϷ�ȫ��������ԡ���������������״̬
---@param actor string
---@param type integer
---@param time integer
---@param value? integer
---@param model? integer
function makeposion(actor,type,time,value,model) end

---��ת��ͼ(�������)
---*  actor: ��Ҷ���
---*  MapId: ��ͼid
---@param actor string
---@param MapId string|integer
function map(actor,MapId) end

---��ӵ�ͼ��Ч
---*  Id: 	��Ч����ID �������ֶ����ͼ��Ч
---*  MapId: ��ͼID
---*  X: ����X
---*  Y: ����Y
---*  effId: ��ЧID
---*  time: ����ʱ��(��)
---*  mode: ģʽ:(0~4 0�����˿ɼ� 1�Լ��ɼ� 2��ӿɼ� 3�л��Ա�ɼ� 4�жԿɼ�)
---*  actor: ��Ҷ���(ģʽ1~4����д)
---@param Id integer
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param effId integer
---@param time integer
---@param mode integer
---@param actor? string
function mapeffect(Id,MapId,X,Y,effId,time,mode,actor) end

---���õ�ͼɱ�־��鱶��
---*  actor: ��Ҷ���
---*  MapId: ��ͼid( * �ű�ʾ���е�ͼ)
---*  much: ���� Ϊɱ�־��鱶�� ��������100Ϊ�����ı���(200 Ϊ 2 ������ 150 Ϊ1.5��,0��ʾ�رյ�ͼ��ɱ�־��鱶��)
---@param actor string
---@param MapId string|integer
---@param much integer
function mapkillmonexprate(actor,MapId,much) end

---�ɵ�ͼ(ָ������)
---*  actor: ��Ҷ���
---*  mapname: ��ͼ��
---*  nX: X����
---*  nY: Y����
---*  nRange: 	��Χ
---@param actor string
---@param mapname integer|string
---@param nX integer
---@param nY integer
---@param nRange? integer
function mapmove(actor,mapname,nX,nY,nRange) end

---MD5����
---*  str: ��Ҫ���ܵ��ı�
---@param str string
function md5str(str) end

---����������Ϣ
---*  actor: ��Ҷ���
---*  info: ��������
---*  flag1: ȷ������ת�Ľӿ�
---*  flag2: ȡ������ת�Ľӿ�
---@param actor string
---@param info string
---@param flag1? string
---@param flag2? string
function messagebox(actor,info,flag1,flag2) end

---�ͻ��˸���
---*  actor: ��Ҷ���
---*  str: �ı�����
---@param actor string
---@param str string
function mircopy(actor,str) end

---��ȡ/���� �����ͼʣ��ʱ��
---*  actor: ��Ҷ���
---@param actor string
function mirrormaptime(actor) end

---���Ź⻷Ч��
---*  actor: ��Ҷ���
---*  mapid: ��ͼid
---*  x: ����x
---*  y: ����y
---*  type: �⻷����
---*  time: ʱ��(��)
---*  behind: ����ģʽ-0-ǰ��-1-����
---*  selfshow: ���Լ��ɼ�0-�� ��Ұ�ھ��ɼ� 1-��
---@param actor string
---@param mapid integer|string
---@param x integer
---@param y integer
---@param type integer
---@param time integer
---@param behind? integer
---@param selfshow? integer
function mobfireburn(actor,mapid,x,y,type,time,behind,selfshow) end

---ɱ����Ʒ�ٱ�
---*  actor: ��Ҷ���
---*  count: ������Ʒ�������Ӵ���
---@param actor string
---@param count integer
function monitems(actor,count) end

---��ĳ����ͼ�е����ȫ���ƶ�������һ����ͼ
---*  actor: ��Ҷ���
---*  aMapId: �ƶ�ǰ��ͼId
---*  bMapId: �ƶ����ͼId
---*  x: x����
---*  y: y����
---*  range: ��Χ
---@param actor string
---@param aMapId string
---@param bMapId string
---@param x integer
---@param y integer
---@param range? integer
function movemapplay(actor,aMapId,bMapId,x,y,range) end

---������ս
---*  actor: ��Ҷ���
---*  nIdx: ����ID
---*  actor: ʱ��,��λСʱ
---@param actor string
---@param nIdx integer
---@param iValue integer
function nationswar(actor,nIdx,iValue) end

---���ֽ�����������
---*  actor: ��Ҷ���
---*  NPCIdx: ����ID
---*  BtnIdx: ��ť����
---*  sMsg: ��ʾ������
---@param actor string
---@param NPCIdx integer
---@param BtnIdx integer|string
---@param sMsg? string
function navigation(actor,NPCIdx,BtnIdx,sMsg) end

---ˢ�½���������״̬
---*  actor: ��Ҷ���
---*  nId: ����ID
---*  ...:����1~����10
---@param actor string
---@param nId integer
---@param ... any
function newchangetask(actor,nId,...) end

---�������
---*  actor: ��Ҷ���
---*  nId: ����
---@param actor string
---@param nId integer
function newcompletetask(actor,nId) end

---ɾ������
---*  actor: ��Ҷ���
---*  nId: ����
---@param actor string
---@param nId integer
function newdeletetask(actor,nId) end

---��ȡ������ĵڼ��еڼ�������(0��0�п�ʼ)
---*  filename: ��Ҷ���
---*  row: ����
---*  col: ����
---@param filename string
---@param row string|integer
---@param col string|integer
---@return string ��������
function newdqcsv(filename,row,col) end


---�½�����
---*  actor: ��Ҷ���
---*  nId: 	����ID
---*  ...: ����1~����10 �����滻�����������%s
---@param actor string
---@param nId integer
---@param ... string|integer
function newpicktask(actor,nId,...) end

---����csv�������
---*  filename: �ļ���
---@param filename string
function newreadcsv(filename) end

---�Ƿ�����ָ���������� CanBuyShopItem������ʹ�� 
---*  actor: ��Ҷ���
---*  canbuy: 1-�������� 0-������
---@param actor string
---@param canbuy integer
function notallowbuy(actor,canbuy) end

---�Ƿ�����ָ��������ʾ CanShowShopItem������ʹ�� 
---*  actor: ��Ҷ���
---*  canbuy: 1-����ʾ 0-��ʾ
---@param actor string
---@param canshow integer
function notallowshow(actor,canshow) end

---�ر�ָ��װ���Ա���ʾ
---*  actor: ��Ҷ���
---*  order: 1=��ƷΨһID 2=��ƷIDX 3=��Ʒ����
---*  str: 	��Ӧ����2������ֵ
---@param actor string
---@param order integer
---@param str string
function nothintitem(actor,order,str) end

---���߹һ�
---*  actor: ��Ҷ���
---*  time: ����ʱ��(��)
---@param actor string
---@param time integer
function offlineplay(actor,time) end

---������Ϸ���
---*  actor: ��Ҷ���
---*  nId: 	���ID
---*  nState: 0=�� 1=������ظ��㰴ť����ر�,����������رհ�ť(һ��������������������õ�) 2=�رյ�ǰ���ID
---*  rankID: ���а����ID //game_data�����õ�ID �˲���ֻ�����а�����Ч
---*  isHero: ���/Ӣ��ҳ�� //�򿪵����а���ʾ����һ�Ӣ�۵�ҳ��(0���=��ң�1=Ӣ��) �˲���ֻ��Ӣ�ۺϻ��� ���а�����Ч
---@param actor string
---@param nId integer
---@param nState? integer
---@param rankID? integer 
---@param isHero? integer
function openhyperlink(actor,nId,nState,rankID,isHero) end

---��NPC�󴰿�
---*  path: ��Ҷ���
---*  pos: ��Ҷ���
---*  x: ��Ҷ���
---*  y: ��Ҷ���
---*  height: ��Ҷ���
---*  width: ��Ҷ���
---*  bool: ��Ҷ���
---*  closeX: ��Ҷ���
---*  closeY: ��Ҷ���
---*  isMove: ��Ҷ���
---@param path string
---@param pos integer
---@param x integer
---@param y integer
---@param height integer
---@param width integer
---@param bool integer
---@param closeX integer
---@param closeY integer
---@param isMove integer
function openmerchantbigdlg(path,pos,x,y,height,width,bool,closeX,closeY,isMove) end

---��ָ��NPC���
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---*  nRange: ��Χֵ �ڴ˷�Χ�������
---@param actor string
---@param NPCIndex integer
---@param nRange integer
function opennpcshow(actor,NPCIndex,nRange) end

---�ƶ���ָ��NPC����
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID 
---*  nRange: ��Χֵ ���ڴ˷�Χ�����ƶ���NPC����
---*  actor: ��Χֵ2 �ƶ���NPC�����ķ�Χ��
---@param actor string
---@param NPCIndex integer
---@param nRange integer
---@param nRange2 integer
function opennpcshowex(actor,NPCIndex,nRange,nRange2) end

---�򿪲ֿ����
---*  actor: ��Ҷ���
---@param actor string
---@param isOpenUI? 0=��UI;1=ֻ�·�����
function openstorage(actor,isOpenUI) end

---��OK��
---*  actor: ��Ҷ���
---*  title: OK�����
---@param actor string
---@param title string
function openupgradedlg(actor,title) end

---��Ϸ�д���վ
---*  actor: ��Ҷ���
---*  url: ��վ
---@param actor string
---@param url string
function openwebsite(actor,url) end

---�鿴�Լ����
---*  actor: ��Ҷ���
---*  winID: 101=װ�� 102=״̬ 103=���� 104=���� 105=��Ф 106=�ƺ� 1011=ʱװ
---@param actor string
---@param winID integer
function openwindows(actor,winID) end

---�����ı�
---*  text: 	�ı�����
---*  actor: ��Ҷ���
---@param text string
---@param actor string
---@return string
function parsetext(text,actor) end

---�û��������� *ֻ�û���������:���󡢹�������� ԭ������������ȫ������ �������
---*  actor: ��Ҷ���
---*  idx: 	�������
---*  monidx: 	����IDX
---@param actor string
---@param idx integer
---@param monidx integer
function petmon(actor,idx,monidx) end

---��ȡ����״̬
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor string
---@param idx integer
function petstate(actor,idx) end

---������װ�� �˽ӿڲ��ۼ���Ʒ ���ۼ��������϶�Ӧװ�����ԡ�
---*  actor: ��Ҷ���
---*  idx: �������
---*  item: װ������ ���װ����#�ָ� -1��ʾ����ȫ��װ��
---@param actor string
---@param idx integer
---@param item string|integer
function pettakeoff(actor,idx,item) end

---���ﴩװ�� �˽ӿڲ���������Ʒ ������Ʒ��������ӵ��������� �����浽���ݿ⡣
---*  actor: ��Ҷ���
---*  idx: �������
---*  item: װ������ ���װ����#�ָ�
---@param actor string
---@param idx integer
---@param item string
function pettakeon(actor,idx,item) end

---ʰȡģʽ
---*  actor: ��Ҷ���
---*  mode: ģʽ 0=������Ϊ���ļ�ȡ 1=��С����Ϊ���ļ�ȡ
---*  Range: ��Χ
---*  interval: ��� ��С500ms
---@param actor string
---@param mode integer
---@param Range integer
---@param interval integer
function pickupitems(actor,mode,Range,interval) end

---���������ϲ�����Ч
---*  actor: ��Ҷ���
---*  actor: ��ЧID
---*  actor: ���������ƫ�Ƶ�X����
---*  actor: ���������ƫ�Ƶ�Y����
---*  actor: ���Ŵ��� ��0��һֱ����
---*  actor: ����ģʽ0-ǰ��1-����
---*  actor: ���Լ��ɼ� 0-��(��Ұ�ھ��ɼ�) 1-��
---@param actor string
---@param effectid integer
---@param offsetX integer
---@param offsetY integer
---@param times integer
---@param behind integer
---@param selfshow integer
function playeffect(actor,effectid,offsetX,offsetY,times,behind,selfshow) end

---������������
---*  actor: ��Ҷ���
---*  index: �����ļ������� ��Ӧ�������ñ�id(cfg_sound.xls)
---*  times: ѭ�����Ŵ���
---*  flag: ����ģʽ:0.���Ÿ��Լ� 1.���Ÿ�ȫ�� 2.���Ÿ�ͬһ��ͼ 4.���Ÿ�ͬ������
---@param actor string
---@param index string
---@param times string
---@param flag string
function playsound(actor,index,times,flag) end

---�������﹥������
---*  actor: ��Ҷ���
---*  rate: ������������ 100=100%
---*  time: ��Чʱ�� ����ʱ��ָ�����
---@param actor string
---@param rate integer
---@param time integer
function powerrate(actor,rate,time) end

---��ȡ�ͻ��˳�ֵ�ӿ�
---*  actor: ��Ҷ���
---*  money: ���
---*  type: ��ֵ��ʽ 1-֧���� 2-���� 3-΢��
---*  flagid: ��Ҷ���
---@param actor string
---@param money integer
---@param type integer
---@param flagid integer
function pullpay(actor,money,type,flagid) end

---��ѯ���������Ƿ����
---*  actor: ��Ҷ���
---*  name: Ҫ��ѯ������
---@param actor string
---@param name string
function queryhumnameexist(actor,name) end

---��ѯ�������
---*  actor: ��Ҷ���
---*  id: ����ID 1-100 
---@param actor string
---@param id integer
function querymoney(actor,id) end

---���ɱ����ͼ�еĹ���
---*  mapid: ��Ҷ���
---*  name: ��������
---*  num: ����(1-255)
---*  drop: �Ƿ���� 0=���� 1=������
---@param mapid string|integer
---@param name string
---@param num integer
---@param drop integer
function randomkillmon(mapid,name,num,drop) end

---���Ӹ����˺�Ч��
---*  actor: ��Ҷ���
---*  targetX: X����
---*  targetY: Y����
---*  range: Ӱ�췶Χ
---*  power: ������
---*  addtype: ��������,��˵����
---*  addvalue: ��������ֵ,��˵����
---*  checkstate: �Ƿ��������/���/ʯ��/����/����/�춾/�̶�����0=ֱ������״̬;1=��������״̬)
---*  targettype: Ŀ������(0���=����Ŀ��;1=������;2=������)
---*  effectid: Ŀ�����ϲ��ŵ���ЧID
---@param actor string
---@param targetX integer
---@param targetY integer
---@param range integer
---@param power integer
---@param addtype integer
---@param addvalue? integer
---@param checkstate? integer
---@param targettype? integer
---@param effectid? integer
function rangeharm(actor,targetX,targetY,range,power,addtype,addvalue,checkstate,targettype,effectid) end

---��ȡIni�ļ��е��ֶ�ֵ
---*  actor: ��Ҷ���
---*  section: ��������
---*  item: ������
---@param actor string
---@param section string
---@param item string
function readini(actor,section,item) end

---��ȡIni�ļ��е��ֶ�ֵ ��Cache
---*  actor: ��Ҷ���
---*  section: ��������
---*  item: ������
---@param actor string
---@param section string
---@param item string
function readinibycache(actor,section,item) end

---����
---*  actor: ��Ҷ���
---@param actor string
function realive(actor) end

---���ظ���ĳ������
---*  actor: ��Ҷ���
---*  idx: �������
---*  nHp: ������HP��
---*  type: 0-����ֵ 1-�ٷֱ�
---@param actor string
---@param idx integer
---@param nHp integer
---@param type integer
function realivepet(actor,idx,nHp,type) end

---ˢ����������
---*  actor: ��Ҷ���
---@param actor string
function recalcabilitys(actor) end

---�ٻ�Ӣ��
---*  actor: ��Ҷ���
---@param actor string
function recallhero(actor) end

---�ٻ�����
---*  actor: ��Ҷ���
---*  monName: ��������
---*  level: �����ȼ�(���Ϊ7)
---*  time: �ѱ�ʱ��(����)
---*  param1: Ԥ��(��0)
---*  param2: Ԥ��(��0)
---*  param3: ���ô���0 ���ʱ������ñ�������(��M2���Ƶ��ٻ�����)
---@param actor string
---@param monName string
---@param level integer
---@param time integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@return string ��������
function recallmob(actor,monName,level,time,param1,param2,param3) end

---�ٻ�����
---*  actor: ��Ҷ���
---*  idx: ��Ҷ���
---@param actor string
---@param idx integer
function recallpet(actor,idx) end

---����OK����Ʒ������
---*  actor: ��Ҷ���
---@param actor string
function reclaimitem(actor) end

---�����������Ʒ
---*  actor: ��Ҷ���
---@param actor string
function refreshbag(actor) end

---ˢ����Ʒ��Ϣ��ǰ��
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---@param actor string
---@param item string
function refreshitem(actor,item) end

---��NPCע��Lua��Ϣ
---*  msgId: ��ϢID
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---@param msgId integer
---@param NPCIndex integer
function regnpcmsg(msgId,NPCIndex) end

---�ýű������ͷż���
---*  actor: ��Ҷ���
---*  skillid: 	����ID
---*  type: ���� 1-��ͨ����2-ǿ������
---*  level: ���ܵȼ�
---*  target: ���ܶ���: 1-����Ŀ�� 2-����
---*  flag: �Ƿ���ʾʩ������ 0-����ʾ 1-��ʾ
---@param actor string
---@param skillid integer
---@param type integer
---@param level integer
---@param target integer
---@param flag integer
function releasemagic(actor,skillid,type,level,target,flag) end

---����
---*  actor: ��Ҷ���
---@param actor string
function releasesprite(actor) end

---��ӡ��Ϣ������̨ ���濪��ģʽ �����������̨�� ����ģʽ ���¼��ScriptXX�ļ��� ���������Ų����
---@param ... any
function release_print(...) end

---����ת������
---*  actor: ��Ҷ���
---*  rlevel: ת������һ��ת���ټ�(��ֵ��ΧΪ1-255)
---*  level: ת����ȼ�����ת��������ĵȼ� 0Ϊ���ı����ﵱǰ�ȼ�
---*  num: �������ת������Եõ��ĵ��� �˵������ܰ����������������Ե�(��ֵ��Χ 1 - 20000)
---@param actor string
---@param rlevel integer
---@param level integer
---@param num integer
function renewlevel(actor,rlevel,level,num) end

---�޸�����װ��
---*  actor: ��Ҷ���
---@param actor string
function repairall(actor) end

---�����ļ�
---*  path: ·������
---@param path string
function require(path) end

---�ջس���
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor string
---@param idx integer
function retractpettoitem(actor,idx) end

---����
---*  actor: ��Ҷ���
---*  HorseAppr: ��Ҷ���
---*  HorseEff: ��Ҷ���
---*  HorseFature: ��Ҷ���
---*  Type: ��Ҷ���
---@param actor string
---@param HorseAppr integer
---@param HorseEff integer
---@param HorseFature integer
---@param Type integer
function ridehorse(actor,HorseAppr,HorseEff,HorseFature,Type) end

---NPC�����ı�����
---*  actor: ��Ҷ���
---*  msg: �����ı�����
---@param actor string
---@param msg string
function say(actor,msg) end

---��Ļ��
---*  actor: ��Ҷ���
---*  type: ģʽ(0~4)0.���Լ�;1.����������;2��Ļ��Χ������;3.��ǰ��ͼ��������;4.ָ����ͼ��������;
---*  level: ��(1~3)
---*  num: 	����
---*  mapid: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---@param actor string
---@param type integer
---@param level integer
---@param num? integer
---@param mapid? integer
function scenevibration(actor,type,level,num,mapid) end

---������Ļ��Ч
---*  actor: ��Ҷ���
---*  id: ģʽ(0~4)0.���Լ�;1.����������;2��Ļ��Χ������;3.��ǰ��ͼ��������;4.ָ����ͼ��������;
---*  effectid: ��(1~3)
---*  X: ����
---*  Y: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---*  speed: ����
---*  times: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---*  type: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---@param actor string
---@param id integer
---@param effectid integer
---@param X integer
---@param Y integer
---@param speed integer
---@param times integer
---@param type integer
function screffects(actor,id,effectid,X,Y,speed,times,type) end


---����������ѡ��Ʒ
---*  actor: ��Ҷ���
---*  makeindex: ѡ�е���ƷΨһID�����Ʒ��","�ָ�
---@param actor string
---@param makeindex string
function selectbagitems(actor,makeindex) end

---����ƮѪƮ����Ч
---*  target: ƮѪƮ�ֵ����� һ��Ϊ�ܹ�����
---*  type: ��ʾ���� 1- �˺� 2- �����˺� 3- ����Ч�� 4- ��HP 5- �� 8- �ۼ�HP��MP 9- �˺� 10-�ۼ�MP 11- ����һ��
---*  damage: ��ʾ�ĵ���
---*  hitter: �ɿ���ƮѪƮ�ֵ����� һ��Ϊ������
---@param target string
---@param type integer
---@param damage integer
---@param hitter? string
function sendattackeff(target,type,damage,hitter) end

---������Ļ�м��������Ϣ
---*  actor: ��Ҷ���
---*  FColor: ǰ��ɫ
---*  BColor: 	����ɫ
---*  Msg: ���Ͷ���
---*  flag: ��Ҷ���
---*  time: ��ʾʱ��
---*  func: ����ʱ�����󴥷��ص�
---@param actor string
---@param FColor integer
---@param BColor integer
---@param Msg string
---@param flag integer
---@param time integer
---@param func? string
function sendcentermsg(actor,FColor,BColor,Msg,flag,time,func) end

---��Ļ�������귢�͹�����Ϣ
---*  actor: ��Ҷ���
---*  type: ��Ϣ����0-ȫ�� 1-�Լ� 2-��� 3-�л� 4-��ǰ��ͼ
---*  msg: ��Ϣ����
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  X: X����
---*  Y: Y����
---@param actor string
---@param type integer
---@param msg string
---@param FColor? integer
---@param BColor? integer
---@param X? integer
---@param Y? integer
function sendcustommsg(actor,type,msg,FColor,BColor,X,Y) end

---��ʾ����ʱ��Ϣ��ʾ
---*  actor: ��Ҷ���
---*  msg: ��Ϣ����
---*  time: ʱ�� ��
---*  FColor: ���徰ɫ
---*  mapdelete: ����ͼ�Ƿ�ɾ�� 0-��ɾ�� 1-ɾ��
---*  func: ��ת�ĺ���
---*  Y: Y����
---@param actor string
---@param msg string
---@param time integer
---@param FColor integer
---@param mapdelete integer
---@param func string
---@param Y integer
function senddelaymsg(actor,msg,time,FColor,mapdelete,func,Y) end

---������Ϣ
---*  actor:    ��Ҷ���
---*  msgid:    ��ϢID
---*  param1: 	����1
---*  param2: 	����2
---*  param3: 	����3
---*  sMsg: 	��Ϣ��
---@param actor string
---@param msgid integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@param sMsg? string
function sendluamsg(actor,msgid,param1,param2,param3,sMsg) end

---�����ʼ�
---*  userid: ��UserId ���������� ��Ҫ��ǰ���#(��:#����)
---*  id: �Զ����ʼ�ID
---*  title: �ʼ�����
---*  memo: �ʼ�����
---*  rewards: ��������: ��Ʒ1#����#�󶨱��&��Ʒ2#����#�󶨱�� &���� #�ָ�
---@param userid string
---@param id integer
---@param title string
---@param memo string
---@param rewards string
function sendmail(userid,id,title,memo,rewards) end

---������Ļ������Ϣ
---*  actor: ��Ҷ���
---*  type: ģʽ ���Ͷ��� 0-�Լ� 1-������ 2-�л� 3-��ǰ��ͼ 4-���
---*  FColor: ���徰ɫ
---*  BColor: ����ɫ
---*  Y: Y����
---*  scroll: ��������
---*  msg: 	��Ϣ����
---@param actor string
---@param type integer
---@param FColor integer
---@param BColor integer
---@param Y integer
---@param scroll integer
---@param msg string
function sendmovemsg(actor,type,FColor,BColor,Y,scroll,msg) end

---�����������Ϣ
---*  actor: ��Ҷ���
---*  type: ��Ҷ���
---*  msg: ��Ҷ���
---@param actor string|nil
---@param type integer
---@param msg string
function sendmsg(actor,type,msg) end

---����Ļ��������
---*  actor: ��Ҷ���
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  msg: ��������
---*  type: ģʽ ���Ͷ��� 0-�Լ� 1-������ 2-�л� 3-��ǰ��ͼ 4-���
---*  time: ��ʾʱ��
---@param actor string
---@param FColor integer
---@param BColor integer
---@param msg string
---@param type integer
---@param time integer
function sendmsgnew(actor,FColor,BColor,msg,type,time) end

---������Ұ�ڹ㲥��Ϣ
---*  actor:    ��Ҷ���
---*  msgid:    ��ϢID
---*  param1: 	����1
---*  param2: 	����2
---*  param3: 	����3
---*  sMsg: 	��Ϣ��
---@param actor string
---@param msgid integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@param sMsg? string
function sendrefluamsg(actor,msgid,param1,param2,param3,sMsg) end

---���������̶���Ϣ
---*  actor: ��Ҷ���
---*  type: ģʽ ���Ͷ��� 0-�Լ� 1-������ 2-�л� 3-��ǰ��ͼ 4-���
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  time: ��ʾʱ��
---*  msg: ��������
---*  showflag: �Ƿ���ʾ�������� 0-�� 1-��
---@param actor string
---@param type integer
---@param FColor integer
---@param BColor integer
---@param time integer
---@param msg string
---@param showflag integer
function sendtopchatboardmsg(actor,type,FColor,BColor,time,msg,showflag) end

---�趨���﹥��ƮѪƮ������
---*  actor: ��Ҷ���
---*  actor: ��ʾ���� ��˵����
---@param actor string
---@param type integer
function setattackefftype(actor,type) end

---ǿ���޸Ĺ���ģʽ
---*  actor: ��Ҷ���
---*  mode: ����ģʽ
---*  time: ǿ���л�ʱ��ʱ��
---@param actor string
---@param mode integer
---@param time integer
function setattackmode(actor,mode,time) end

---�����ݵ㾭��
---*  actor: ��Ҷ���
---*  evetime: ʱ��
---*  experience: 	����
---*  isSafe: �Ƿ�ȫ��(��0Ϊ�κεط�)
---*  mapid: ��ͼ��(�κε�ͼʹ��*��)
---*  opt: �������Ƿ��ܻ�ȡ����(0=������ 1= ����)
---*  alltime: ʱ��:��(�ݵ��þ����ʱ��)
---*  level: �ȼ�(���ټ����»�þ���)
---@param actor string
---@param evetime integer
---@param experience integer
---@param isSafe integer
---@param mapid integer
---@param opt integer
---@param alltime integer
---@param level integer
function setautogetexp(actor,evetime,experience,isSafe,mapid,opt,alltime,level) end

---�������ﱳ��������
---*  actor: ��Ҷ���
---*  count: ���Ӵ�С *��С��46 ������126
---@param actor string
---@param count integer
function setbagcount(actor,count) end

---��������/���������Ϣ
---*  actor: ��Ҷ���
---*  nID: ����(���˵��)
---*  value: ����ֵ
---@param actor string
---@param nID integer
---@param value integer
function setbaseinfo(actor,nID,value) end

---�����ɫ
---*  actor: ��Ҷ���
---*  color: ��ɫ(0~255); 255ʱ�����ɫ; -1��Ϊת�����õ���ɫ�����������Ͻ��б�ɫ
---*  time: �ı�ʱ��(��)
---@param actor string
---@param color integer
---@param time integer
function setbodycolor(actor,color,time) end

---��������ǰ׺
---*  actor: ��Ҷ���
---*  Prefix: ǰ׺��Ϣ �����������ǰ׺
---*  color: ����ɫ
---@param actor string
---@param Prefix? string
---@param color integer
function setchatprefix(actor,Prefix,color) end

---���ñ��ֵ
---*  actor: ����������
---*  index: �±�ID 0-9
---*  value: ���ֵ
---@param actor string
---@param index integer
---@param value integer
function setcurrent(actor,index,value) end

---�����Զ������������
---*  actor: ��Ҷ���
---*  item: װ������
---*  index: װ������������ 0~2
---*  json: ���������� json�ַ���
---@param actor string
---@param item string
---@param index integer
---@param json string
function setcustomitemprogressbar(actor,item,index,json) end

---�޸���Ʒ�־ö�
---*  actor: ��Ҷ���
---*  itemmakeid: ��Ҷ���
---*  char: ��Ҷ���
---*  dura: ��Ҷ���
---@param actor string
---@param itemmakeid integer
---@param char string
---@param dura integer
function setdura(actor,itemmakeid,char,dura) end

---�رյ�ͼ��ʱ��
---*  MapId: ��ͼID
---*  Idx: ��ʱ��ID
---@param MapId integer|string
---@param Idx integer
function setenvirofftimer(MapId,Idx) end

---�趨��ͼ��ʱ��
---*  MapId: ��ͼID
---*  Idx: ��ʱ��ID
---*  second: ʱ��(��)
---*  func: ������ת�ĺ���
---@param MapId integer|string
---@param Idx integer
---@param second integer
---@param func string
function setenvirontimer(MapId,Idx,second,func) end

---����������/��ʶֵ
---*  actor: ��Ҷ���
---*  nIndex: ���� 0-800
---*  nvalue: ��Ӧ����ֵ
---@param actor string
---@param nIndex integer
---@param nvalue integer
function setflagstatus(actor,nIndex,nvalue) end

---�������GMȨ��ֵ
---*  actor: ��Ҷ���
---*  gmlevel: GMȨ��ֵ
---@param actor string
---@param gmlevel integer
function setgmlevel(actor,gmlevel) end

---�����л���Ϣ
---*  actor: ��Ҷ���
---*  index: ����   0-�лṫ��
---*  value: ����ֵ
---@param actor string
---@param index integer
---@param value string
function setguildinfo(actor,index,value) end

---���л��Զ��������ֵ
---*  guild: ��Ҷ���
---*  varName: ������
---*  value: ����ֵ
---*  isSave: �Ƿ񱣴浽���ݿ�(0/1)
---@param guild string
---@param varName string
---@param value integer|string
---@param isSave? integer
function setguildvar(guild,varName,value,isSave) end

---��������
---*  actor: ��Ҷ���
---*  where: λ�� 0-9
---*  effType: ����Ч��(0ͼƬ���� 1��ЧID)
---*  resName: ͼƬ��������ЧID
---*  x: Y���� (Ϊ��ʱĬ��Y=0)
---*  y: Y���� (Ϊ��ʱĬ��Y=0)
---*  autoDrop: �Զ���ȫ�հ�λ��0,1(0=�� 1=����)
---*  selfSee: �Ƿ�ֻ���Լ�����0=�����˶��ɼ�;1=�����Լ��ɼ�;
---*  posM: ����λ��(����Ĭ��Ϊ0)0=�ڽ�ɫ֮��;1=�ڽ�ɫ֮��;
---@param actor string
---@param where integer
---@param effType integer
---@param resName? integer|string
---@param x? integer
---@param y? integer
---@param autoDrop? integer
---@param selfSee? integer
---@param posM? integer
function seticon(actor,where,effType,resName,x,y,autoDrop,selfSee,posM) end

---������Ʒ��¼��Ϣ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  type: [1,2]
---*  position: ��type=1,ȡֵ��Χ[0..49]type=2,ȡֵ��Χ[0..19]
---*  value: ������Ʒ��Ӧλ��ֵ
---@param actor string
---@param item string
---@param type integer
---@param position integer
---@param value integer
function setitemaddvalue(actor,item,type,position,value) end


---�����Զ�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  value: Json�ַ��� �Զ�����������
---@param actor string
---@param item string
---@param value string
function setitemcustomabil(actor,item,value) end

---������Ʒ��Ч
---*  actor: ��Ҷ���
---*  index: װ��λ�� -1~OK���е���Ʒ
---*  bageffectid: ������Ч���
---*  ineffectid: �ڹ���Ч���
---@param actor string
---@param index integer
---@param bageffectid integer
---@param ineffectid integer
---@param order1? integer
---@param order2? integer
---@param item? string
function setitemeffect(actor,index,bageffectid,ineffectid,order1,order2,item) end

---�޸�װ���ڹ�Looksֵ
---*  actor: ��Ҷ���
---*  pos: װ��λ�� (-1ʱ��OK���е�װ��0~16 17~46 55)
---*  char: ������(+ - =)
---*  pictrue: �ڹ�ͼƬ
---*  itemobj: ��Ʒ����
---@param actor string
---@param pos integer
---@param char string
---@param pictrue integer
---@param itemobj? string
function setitemlooks(actor,pos,char,pictrue,itemobj) end

---������Ʒ��״̬
---*  item: ��Ʒ����
---*  bind: ������(0-8)
---*  state: ��״̬(0Ϊ����,1Ϊ��)
---@param item string
---@param bind integer
---@param state integer
function setitemstate(item,bind,state) end

---���Ӽ��ܷ�����
---*  actor: ��Ҷ���
---*  skillname: ��������
---*  value: ��������ֵ
---*  type: ���㷽ʽ(0����������,1���ٷֱȼ���)
---@param actor string
---@param skillname string
---@param value integer
---@param type integer
function setmagicdefpower(actor,skillname,value,type) end

---���Ӽ�������
---*  actor: ��Ҷ���
---*  skillname: ��������
---*  actor: ����ֵ
---*  type: ���㷽ʽ(0����������,1���ٷֱȼ���)
---@param actor string
---@param skillname string
---@param value integer
---@param type integer
function setmagicpower(actor,skillname,value,type) end

---�ѹ������óɱ���
---*  mon: �������
---*  actor: ��Ҷ���
---@param mon string
---@param actor string
function setmonmaster(mon,actor) end

---���õ�ǰ�����ڹ��ҵ�ְλ��ʽ
---*  actor: ��Ҷ���
---*  jobIdx: ְλ���
---@param actor string
---@param jobIdx integer
function setnationking(actor,jobIdx) end

---�޸Ĺ���ְλ����
---*  actor: ��Ҷ���
---*  nIdx: ����ID (1~100)
---*  jobIdx: ְλ���
---*  jobName: ְλ����
---@param actor string
---@param nIdx integer
---@param jobIdx integer
---@param jobName string
function setnationrank(actor,nIdx,jobIdx,jobName) end

---����װ����Ԫ������
---*  actor: ��Ҷ���
---*  where: װ��λ��(-2������Ʒ����)
---*  iAttr: ����
---*  sFlag: �ȽϷ�(=+-)
---*  iValue: ��ֵ(1-100)���ٷֱ�
---@param actor string
---@param where integer
---@param iAttr integer
---@param sFlag string
---@param iValue integer
function setnewitemvalue(actor,where,iAttr,sFlag,iValue) end

---����NPC��Ч
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---*  Effect: ��ЧID 5055-��̾�� 5056-�ʺ�
---*  X: X����
---*  Y: Y����
---@param actor string
---@param NPCIndex integer
---@param Effect integer
---@param X integer
---@param Y integer
function setnpceffect(actor,NPCIndex,Effect,X,Y) end

---�Ƴ�ȫ�ֶ�ʱ��
---*  id: ��ʱ��ID
---@param id integer
function setofftimerex(id) end

---�Ƴ����˶�ʱ��
---*  actor: ��Ҷ���
---*  id: ��ʱ��ID
---@param actor string
---@param id integer
function setofftimer(actor,id,RunTick,RunTime,kf) end

---��Ӹ��˶�ʱ��
---*  actor: ��Ҷ���
---*  id: ��ʱ��ID
---*  RunTick: ִ�м�� ��
---*  RunTime: ִ�д��� >0ִ����ɺ� �Զ��Ƴ�
---*  kf: ����Ƿ����ִ�� 1:����
---@param actor string
---@param id integer
---@param RunTick integer
---@param RunTime? integer
---@param kf? integer
function setontimer(actor,id,RunTick,RunTime,kf) end

------���ȫ�ֶ�ʱ��
---*  id: ��ʱ��ID
---*  tick: ִ�м�� ��
---@param id integer
---@param tick integer
function setontimerex(id,tick) end

---��ȡ���ﵰ�ȼ�
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷMakeIndex
---*  level: �ȼ�: -1��ʾ���޸�ֵ
---*  zlevel: ת���ȼ�: -1��ʾ���޸�ֵ
---*  exp: ����ֵ: -1��ʾ���޸�ֵ
---@param actor string
---@param itemmakeid integer
---@param level integer
---@param zlevel integer
---@param exp integer
function setpetegglevel(actor,itemmakeid,level,zlevel,exp) end

---���ó���ģʽ
---*  actor: ��Ҷ���
---*  mode: ����ģʽ:1-����;2-����;3-����(������ʱ���趨Ŀ��);4-��Ϣ
---@param actor string
---@param mode integer
function setpetmode(actor,mode) end

---������ұ���
---*  actor: ��Ҷ���
---*  varName: ������
---*  varValue: ����ֵ
---@param actor string
---@param varName string
---@param varValue string|integer
function setplaydef(actor,varName,varValue) end

---�����л��Ա���л��е�ְλ;
---*  actor: ��Ҷ���
---*  pos: ���л��е�ְλ 0:�᳤;1:���᳤;2:�л��Ա1;3:�л��Ա2;4:�л��Ա3;
---@param actor string
---@param pos integer
function setplayguildlevel(actor,pos) end

---������Զ��������ֵ
---*  actor: ��Ҷ���
---*  varType: ������Χ(HUMAN/GUILD)
---*  varName: ������
---*  varValue: ����ֵ
---*  isSave: �Ƿ񱣴浽���ݿ�(0/1)
---@param actor string
---@param varType string
---@param varName string
---@param varValue string|integer
---@param isSave? integer
function setplayvar(actor,varType,varName,varValue,isSave) end

---��ʾ����ĳƺ�
---*  actor: ��Ҷ���
---*  levelname: �ƺ��ı�: ������һ����ʾ
---@param actor string
---@param levelname string
function setranklevelname(actor,levelname) end

---���ټ���CD��ȴʱ��
---*  actor: ��Ҷ���
---*  skillname: ��������
---*  char: ������(+/-/=)=0���ǻ�ԭ����CD
---*  time: ʱ�� ��
---@param actor string
---@param skillname string
---@param char string
---@param time integer
function setskilldeccd(actor,skillname,char,time) end

---���ü��ܵȼ�
---*  actor: ��Ҷ���
---*  skillid: ����ID
---*  flag: ����: 1-���ܵȼ� 2-ǿ���ȼ� 3-������
---*  point: ����ֵ
---@param actor string
---@param skillid integer
---@param flag integer
---@param point integer
function setskillinfo(actor,skillid,flag,point) end

---��/�����κ�
---*  actor: ��Ҷ���
---*  bState: 0:�ر�: 1:����
---@param actor string
---@param bState integer
function setsndaitembox(actor,bState) end

---���������˺�����
---*  actor: ��Ҷ���
---*  operate: �������� "+"���� "-"���� "="����
---*  sum: ��������
---*  rate: ���ձ���ǧ�ֱ� 1=0.1%100=10%
---*  success: ���ճɹ���
---@param actor string
---@param operate string
---@param sum integer
---@param rate integer
---@param success integer
function setsuckdamage(actor,operate,sum,rate,success) end

---����ȫ�ֱ���
---*  varName: ������
---*  varValue: ����ֵ
---@param varName string
---@param varValue string|integer
function setsysvar(varName,varValue) end

---��ȫ���Զ��������ֵ
---*  varName: ������
---*  varValue: ����ֵ
---*  isSave: �Ƿ񱣴�(0/1)
---@param varName string
---@param varValue string|integer
---@param isSave? integer
function setsysvarex(varName,varValue,isSave) end

---���õ�ǰ����Ŀ��
---*  Hiter: ������(���/Ӣ��/����)
---*  Target: ��������(���/Ӣ��/����)
---@param Hiter string
---@param Target string
function settargetcert(Hiter,Target) end

---������Ʒ��Դ
---*  jsonStr: ��Ҷ���
---@param jsonStr string
function setthrowitemly(jsonStr) end

---������Ʒ��Դ(ʹ����Ʒ����)
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  jsonStr: json�ַ���
---@param actor string
---@param item string
---@param jsonStr string
function setthrowitemly2(actor,item,jsonStr) end

---����������������
---*  actor: ��Ҷ���
---*  nIndex: ���� ��˵����
---*  nvalue: ��Ӧ����ֵ
---@param actor string
---@param nIndex integer
---@param nvalue integer
function setusebonuspoint(actor,nIndex,nvalue) end

---�ɼ��ڿ�Ƚ���������
---*  actor: ��Ҷ���
---*  time: ������ʱ�� ��
---*  succ: �ɹ�����ת�ĺ���
---*  msg: ��ʾ��Ϣ
---*  canstop: �ܷ��ж� 0-�����ж� 1-�����ж�
---*  fail: �жϴ����ĺ���
---@param actor string
---@param time integer
---@param succ string
---@param msg string
---@param canstop integer
---@param fail string
function showprogressbardlg(actor,time,succ,msg,canstop,fail) end

---װ����Ƕ��ʯ
---*  actor: ��Ҷ���
---*  item: װ������
---*  hole: װ��������� 0~9
---*  index: ��Ƕ��ʯ��index װ�����ܵ�Index
---@param actor string
---@param item string
---@param hole integer
---@param index integer
function socketableitem(actor,item,hole,index) end

---�Զ����������
---*  varName: ��Ҷ���
---*  playflag: 0-������� 1-������� 2-�л�
---*  sortflag: 0-���� 1-����
---*  count: ��ȡ�������� Ϊ�ջ�0ȡ���� ȡǰ����
---@param varName string
---@param playflag integer
---@param sortflag integer
---@param count? integer
---@return table
function sorthumvar(varName,playflag,sortflag,count) end

---�����Զ��һ�
---*  actor: ��Ҷ���
---@param actor string
function startautoattack(actor) end

---ִֹͣ��
---*  actor: ��Ҷ���
---@param actor string
function stop(actor) end

---ֹͣ�Զ��һ�
---*  actor: ��Ҷ���
---@param actor string
function stopautoattack(actor) end

---ֹͣʰȡ
---*  actor: ��Ҷ���
---@param actor string
function stoppickupitems(actor) end

---�����������
---*  itype: �������� 1=ȫ��G���� 2=ȫ��A���� 3=ȫ���Զ������ 4=�л����
---*  astr: ���ȫ�ֱ���
---*  bstr: ���뱾��ȫ�ֱ���
---*  id: ��Ϣid
---@param itype integer
---@param astr string
---@param bstr string
---@param id integer
function synzvar(itype,astr,bstr,id) end

---����OK����Ʒ
---*  actor: ��Ҷ���
---*  count: ���� (��Ե�����Ʒ��Ч)
---@param actor string
---@param count integer
function takedlgitem(actor,count) end

---����Ʒ
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---*  qty: ����
---*  IgnoreJP: ���Լ�Ʒ0 ���ж��۳�1 ��Ʒ���۳�
---*  desc:����
---@param actor string
---@param itemname string
---@param qty integer
---@param IgnoreJP? integer
---@param desc? string
---@return boolean �Ƿ�۳��ɹ�
function takeitem(actor,itemname,qty,IgnoreJP,desc) return boolean end

---����װ��
---*  actor: ��Ҷ���
---*  where: λ��
---*  makeindex: ��ƷΨһID
---@param actor string
---@param where integer
---@param makeindex integer
function takeoffitem(actor,where,makeindex) end

---����װ��
---*  actor: ��Ҷ���
---*  where: λ��
---*  makeindex: ��ƷΨһID
---@param actor string
---@param where integer
---@param makeindex integer
function takeonitem(actor,where,makeindex) end

---�����ö���ʾ
---*  actor: ��Ҷ���
---*  nId: ����ID
---@param actor string
---@param nId integer
function tasktopshow(actor,nId) end

---���ת�����ַ���
---*  tbl: table��
---@param tbl table
---@return string
function tbl2json(tbl) end

---�޳����߹һ���ɫ
---*  mapID: ��ͼ�� ��*����ʾȫ����ͼ
---*  level: �޳��ȼ� ���ڴ˵ȼ����޳���*����ʾ����
---*  count: ����޳������ ��*����ʾ����
---@param mapID string|integer
---@param level string|integer
---@param count string|integer
function tdummy(mapID,level,count) end

---������Ҵ��˴���
---*  actor: ��Ҷ���
---*  type: ģʽ 0-�ָ�Ĭ�� 1-���� 2-���� 3-���˴���
---*  time: ʱ��(��)
---*  objtype: ����  0-��� 1-����
---@param actor string
---@param type integer
---@param time integer
---@param objtype integer
function throughhum(actor,type,time,objtype) end

---�ڵ�ͼ�Ϸ�����Ʒ
---*  actor: ��Ҷ���
---*  MapId: 	��ͼID
---*  X: ����X
---*  Y: ����Y
---*  range: ��Χ
---*  itemName: ��Ʒ��
---*  count: ����
---*  time: ʱ��(��)
---*  hint: true-������ʾ
---*  take: true-����ʰȡ
---*  onlyself: true-���Լ�ʰȡ
---*  xyinorder: true-��λ��˳�� false-���λ��
---*  overlap: ������Ʒ����������װ����Ч
---*  isAuto: true-���Զ�ʰȡ
---@param actor string
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param itemName string
---@param count integer
---@param time integer
---@param hint boolean
---@param take boolean
---@param onlyself boolean
---@param xyinorder boolean
---@param overlap? integer
---@param isAuto? boolean
function throwitem(actor,MapId,X,Y,range,itemName,count,time,hint,take,onlyself,xyinorder,overlap,isAuto) end

---�ջ�Ӣ��
---*  actor: ��Ҷ���
---@param actor string
function unrecallhero(actor) end

---�����ջصĳ������
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor string
---@param idx string|integer
function unrecallpet(actor,idx) end

---������װ��������Ч
---*  actor: ��Ҷ���
---*  effectid: ��ЧID  0-ɾ����Ч
---*  position: ��ʾλ�� 0-ǰ�� 1-����
---@param actor string
---@param effectid integer
---@param position integer
function updateequipeffect(actor,effectid,position) end

---�鿴���������Ϣ
---*  actor: ��Ҷ���
---*  userid: ������ҵ�UserID
---*  winID: ���ID 101-װ�� 106-�ƺ� 1011-ʱװ
---@param actor string
---@param userid string
---@param winID integer
function viewplayer(actor,userid,winID) end

---д��Ini�ļ��е��ֶ�ֵ
---*  filename: �ļ���
---*  section: ��������
---*  item: ������
---*  value: ������ֵ
---@param filename string
---@param section string
---@param item string
---@param value string
function writeini(filename,section,item,value) end

---д��Ini�ļ��е��ֶ�ֵ ��Cache
---*  filename: �ļ���
---*  section: ��������
---*  item: ������
---*  value: ������ֵ
---@param filename string
---@param section string
---@param item string
---@param value string
function writeinibycache(filename,section,item,value) end

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

---��ȡ��̬��ͼ����
---*  actor: ��Ҷ���
---*  mapID: ��ͼID
---@param actor string
---@param mapID string|integer
---@return table
function getmapgate(actor,mapID) end

---�������ƻ�ȡ��ͼ������Ϣ
---*  mapID: ��ͼID
---*  nIndex: 0:��ͼ�� 1:��ͼ��
---@param mapID string
---@param nIndex integer
---@return integer
function getmapinfo(mapID,nIndex) end

---��ȡ��ͼָ����Χ�ڵĹ�������б�
---*  mapID: ��ͼID
---*  monName: ������ Ϊ�� or * Ϊ������й�
---*  nx: ����X
---*  ny: ����Y
---*  nRange: ��Χ
---@param mapID string|integer
---@param monName string
---@param nx integer
---@param ny integer
---@param nRange integer
---@return table ��������б�
function getmapmon(mapID,monName,nx,ny,nRange) end

---���ݵ�ͼid���ص�ͼ��
---*  mapID: ��ͼID
---@param mapID string|integer
---@return string ��ͼ��
function getmapname(mapID) end

---���ع��������Ϣ
---*  monidx: ����idx
---*  id: idȡֵ:1-��������;2-����������ɫ;3-ɱ�������õľ���ֵ;
---@param monidx integer
---@param id integer
---@return integer|string
function getmonbaseinfo(monidx,id) end

---����UserId���ع������
---*  mapID: ��ͼID
---*  monUserId: ����userid
---@param mapID string|integer
---@param monUserId string
---@return string
function getmonbyuserid(mapID,monUserId) end

---��ȡָ����ͼ��������
---*  mapID: ��ͼID
---*  MonId: ����idx
---*  isAllMon: �Ƿ���Ա���
---@param mapID string|integer
---@param MonId integer
---@param isAllMon boolean
---@return integer
function getmoncount(mapID,MonId,isAllMon) end

---��ȡ����λ�ü�����ʱ�䣨��֧��С��ͼ����ʾ�Ĺ��
---*  mapID: ��ͼID
---@param mapID string|integer
---@return string 	����Json����
function getmonrefresh(mapID) end

---��ȡ������ڵ��л����
---*  actor: ��Ҷ���
---@param actor string
---@return string �л����û���л᷵�ء�0��
function getmyguild(actor) end

---��ȡ��Ʒ�ĸ�������
---*  item: ��Ҷ���
---*  value: Ԫ������<br>0:��������<br>1�����˺�<br>2:�����˺�����<br>3:ħ���˺�����<br>4:����Ŀ�����<br>5:�����˺�����<br>6:Ŀ�걬��<br>7:������������<br>8:����ħ������<br>11:�����˺�
---@param item string
---@param value integer
---@return integer
function getnewitemaddvalue(item,value) end

---����ID��ȡNPC����
---*  npcIdx: NPC���ڵ�idx
---@param npcIdx integer
---@return string
function getnpcbyindex(npcIdx) end

---��ȡNPC�����Idx
---*  npc: npc����
---@param npc string
---@return integer
function getnpcindex(npc) end

---��ȡ��ͼ��ָ����Χ�ڵĶ���
---*  mapID: ��ͼID
---*  X: ����X
---*  Y: ����Y
---*  range: ��Χ
---*  flag: ���ֵ ������λ��ʾ 1-��� 2-����4-NPC 8-��Ʒ16-��ͼ�¼�
---@param mapID string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param flag integer
---@return table
function getobjectinmap(mapID,X,Y,range,flag) end

---��ȡ�������������
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getoppositeobj(actor) end

---��ȡ����
---*  actor: ��Ҷ���
---*  idx: ������Ż�""X"��ʾ��ǰ����
---@param actor string
---@param idx integer|string
---@return any
function getpet(actor,idx) end

---��ȡ��������װ���б�
---*  idx: �������
---@param actor string
---@param idx integer
---@return any
function getpetbodyitem(actor,idx) end

---��ȡ���ﵰ��Ϣ
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷMakeIndex
---*  type: ��Ҫ���ص���ֵ1-ת���ȼ�;2-�ȼ�;3-����;0-ͬʱ��������ֵ
---@param actor string
---@param itemmakeid integer
---@param type integer
---@return any
function getpetegglevel(actor,itemmakeid,type) end

---��ȡ���pk�ȼ�
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getpklevel(actor) end

---��ȡ��ǰNPC����
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getcurrnpc(actor) end

---��ȡ�Զ������������
---*  actor: ��Ҷ���
---*  item: װ������
---*  actor: װ������������ 0~2
---@param actor string
---@param item string
---@param index integer
---@return any
function getcustomitemprogressbar(actor,item,index) end

---��ȡװ����������
---*  actor: ��Ҷ���
---*  item: װ������
---@param actor string
---@param item string
---@return any
function getdrillhole(actor,item) end


---��ȡEnvir�ļ������ļ��б�
---@return any
function getenvirfilelist() end

---��ȡ������/��ʶֵ
---*  actor: �������
---*  index:  ���� 0-800
---@param actor string
---@param index integer
---@return any
function getflagstatus(actor,index) end

---��ȡ��Һ����б�
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getfriendnamelist(actor) end

---ȡ�ַ�����csv����е��к�
-- * csvPath: csv�ļ�·��
-- * findStr: �ַ���
-- * collect: ��������
-- * findCol: ���ҵ�����
-- * findType: ��������:0=�ڿ�ʼ����;1=���������;
---@param csvPath string
---@param findStr string
---@param collect string
---@param findCol integer
---@param findType integer
---@return any
function getgjcsv(csvPath,findStr,collect,findCol,findType) end

---��ȡ���GMȨ��ֵ
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getgmlevel(actor) end

---��ȡ��Ա�б�
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getgroupmember(actor) end

---��ȡ�л���Ϣ
---*  actor: ��Ҷ���
---*  index: ��Ϣ����
---@param actor string
---@param index integer
---@return any
function getguildinfo(actor,index) end

---��ȡ���������л��Ա����
---*  actor: ��Ҷ���
---@param actor string
---@return any
function getguildmembercount(actor) end

---��ȡ�л��Զ������
---*  guild: �л����
---*  varName: ������
---@param guild string
---@param varName string
---@return any
function getguildvar(guild,varName) end

---��ȡӢ�۶���
---*  actor: ��Ҷ���
---@param actor string
---@return any
function gethero(actor) end

---��ȡ��ǰ�������������ͻ�ȡ����������
---*  filename: �ļ���
---*  type: ��ȡĿ�꣺0-���� 1-����
---@param filename string
---@param type integer
---@return any
function gethlcsv(filename,type) end

---��ȡ��������
---*  actor: ��Ҷ���
---*  actor: ����ID��1-20��
---@param actor string
---@param id integer
---@return any
function gethumability(actor,id) end

---��ȡ������ʱ����
---*  actor: ��Ҷ���
---*  nWhere: λ�� ��Ӧcfg_att_score ����ID
---@param actor string
---@param nWhere integer
---@return integer
function gethumnewvalue(actor,nWhere) end

---��ȡ��Ʒ��¼��Ϣ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  type: [1,2,3]
---*  position: ��type=1,ȡֵ��Χ[0..49] type=2,ȡֵ��Χ[0..19]
---*  model: 0=��������;1=��������+��������
---@param actor string
---@param item string
---@param type integer
---@param position integer
---@param model integer
---@return any
function getitemaddvalue(actor,item,type,position,model) end

---������ƷΨһID�����Ʒ����
---*  actor: ��Ҷ���
---*  makeindex: ��ƷΨһID
---@param actor string
---@param makeindex integer
---@return any
function getitembymakeindex(actor,makeindex) end

---��ȡ�Զ�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---@param actor string
---@param item string
---@return any
function getitemcustomabil(actor,item) end

---��ȡ��Ʒ��Ϣ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  id: 1:ΨһID2:��ƷID3:ʣ��־�4:���־�5:��������6:��״̬
---@param actor string
---@param item string
---@param id integer
---@return any
function getiteminfo(actor,item,id) end

---�����������ر�����Ʒ��Ϣ
---*  actor: ��Ҷ���
---*  index: ������,0��ʼ
---@param actor string
---@param index integer
---@return any
function getiteminfobyindex(actor,index) end

---�������
---*  actor: ��Ҷ���
---*  distance: �������������
---*  grade: �ܳ���Ӱ��Ĺ���ȼ�����
---@param actor string
---@param distance integer
---@param grade integer
function dotaunt(actor,distance,grade) end

---װ������
---*  actor: ��Ҷ���
---*  item: װ������
---*  holejson: ������� json�ַ��� ֧��0~9��10����
---@param actor string
---@param item string
---@param holejson string
function drillhole(actor,item,holejson) end

---ʹ����Ʒ����ҩ��ʹ��������Ʒ�ȣ�
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---*  count: ��Ҷ���
---@param actor string
---@param itemname string
---@param count integer
function eatitem(actor,itemname,count) end

---���дʻ���
---*  str: Ҫ�����ı�
---@param str string
function exisitssensitiveword(str) end

---����ȫ����ʾ��Ϣ
---*  actor: ��Ҷ���
---*  flag: �Ƿ����0-������1-����
---@param actor string
---@param flag integer
function filterglobalmsg(actor,flag) end

---�����л�
---*  index: �����ؼ��� 0-�л�ID 1-�л�����
---*  key: 	�����ؼ���
---@param index integer
---@param key string
---@return string
function findguild(index,key) end

---�����������
---*  actor: ��Ҷ���
---*  idx: 	�������
---*  attrName: ��ն�Ӧ�����������;nil�������������
---@param actor string
---@param idx integer|string
---@param attrName? integer|string
function delpetattlist(actor,idx,attrName) end

---ɾ�����﹥������
---*  actor: ��Ҷ���
---*  idx: ������Ż�"X"��ʾ��ǰ����
---*  skillid: ���ӵĹ�������ID Ϊcfg_monattack���е�ID
---@param actor string
---@param idx integer|string
---@param skillid integer
function delpetskill(actor,idx,skillid) end

---�ڳ��Զ�Ѱ·��ָ������
---*  actor: ��Ҷ���
---*  aimX: Ŀ��X����
---*  aimY: Ŀ��Y����
---*  range: �������ڳ��������Զ�Ѱ·ȡֵ��Χ 0-120-�����
---@param actor string
---@param aimX integer
---@param aimY integer
---@param range integer
function dartmap(actor,aimX,aimY,range) end

---�������� �ڳ��������
---*  actor: ��Ҷ���
---*  time: �ڳ����ʱ�� ��
---*  isdie: �����Ƿ���ʧ0-��ʧ 1-ʱ�䵽����ʧ
---@param actor string
---@param time integer
---@param isdie integer
function darttime(actor,time,isdie) end


---��ʱ��ת
---*  actor: ��Ҷ���
---*  time: ʱ��(����)
---*  func: ��������
---*  del: ����ͼ�Ƿ�ɾ������ʱ 0��Ϊ��ʱ=��ɾ�� 1=ɾ��
---@param actor string
---@param time integer
---@param func string
---@param del? integer
function delaygoto(actor,time,func,del) end

---��ʱ��Ϣ��ת
---*  actor: ��Ҷ���
---*  time: ʱ��(����)
---*  func: ��������
---@param actor string
---@param time integer
---@param func string
function delaymsggoto(actor,time,func) end

---ɾ��buff
---*  actor: ��Ҷ���
---*  buffid: buffID
---@param actor string
---@param buffid integer
function delbuff(actor,buffid) end

---ɾ������
---*  actor: ��Ҷ���
---*  id: ��Ҷ���
---@param actor string
---@param id integer
function delbutshow(actor,id) end

---ɾ���Զ��尴ť
---*  actor: ��Ҷ���
---*  windowid: ������ID
---*  buttonid: ��ťID
---@param actor string
---@param windowid integer
---@param buttonid integer
function delbutton(actor,windowid,buttonid) end

---�ر���Ļ��Ч
---*  actor: ��Ҷ���
---*  id: ��������Ч���
---*  type: ����ģʽ 0-�Լ� 1-������
---@param actor string
---@param id integer
---@param type integer
function deleffects(actor,id,type) end

---ɾ����Ա
---*  actor: ��Ҷ���
---*  memberId: ��ԱUserId
---@param actor string
---@param memberId string
function delgroupmember(actor,memberId) end

---��ӳƺ�
---*  actor: ��Ҷ���
---*  name: �ƺ���Ʒ����
---*  use: �������� 1����
---@param actor string
---@param name string
---@param use? integer
function confertitle(actor,name,use) end

---�۳�����ͨ�û�������(��������μ���)
---*  actor: ��Ҷ���
---*  moneyname: ��������
---*  count: ��Ӧ����ֵ
---*  desc: ����
---@param actor string
---@param moneyname string
---@param count integer
---@param desc? string
function consumebindmoney(actor,moneyname,count,desc) end

---��������
---*  actor: ��Ҷ���
---@param actor string
function creategroup(actor) end

---����Ӣ��
---*  actor: ��Ҷ���
---*  name: Ӣ������
---*  job: 	ְҵ
---*  sex: �Ա�
---@param actor string
---@param name string
---@param job integer
---@param sex integer
function createhero(actor,name,job,sex) end

---��������
---*  actor: ��Ҷ���
---*  nIdx: ����ID (1~100)
---*  cName: 	��������
---*  maxNum: ��������
---@param actor string
---@param nIdx integer
---@param cName string
---@param maxNum integer
function createnation(actor,nIdx,cName,maxNum) end

---������ʱNPC
---*  actor: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  npcJosn: NPC��Ϣ json�ַ���
---@param actor string
---@param X integer
---@param Y integer
---@param npcJosn string
function createnpc(actor,X,Y,npcJosn) end

---�ٻ�����(������ﵰ)
---*  actor: ��Ҷ���
---*  monname: �Զ����������
---*  level: ����ȼ�
---@param actor string
---@param monname string
---@param level integer
function createpet(actor,monname,level) end

---�޸�������ʱ���ԣ�����Ч�ڣ�
---*  actor: ��Ҷ���
---*  nWhere: λ�� ��Ӧcfg_att_score ����ID
---*  nValue: ��Ӧ����ֵ
---*  nTime: ��Чʱ�� ��
---@param actor string
---@param nWhere integer
---@param nValue integer
---@param nTime integer
function changehumnewvalue(actor,nWhere,nValue,nTime) end

---����ƷΨһIDת���ɵ��߱����Ӧ��IDX��Ʒ
---*  actor: ��Ҷ���
---*  itemmakeid: ΨһID
---*  itemidx: 	����ID
---@param actor string
---@param itemmakeid integer
---@param itemidx integer
function changeitemidx(actor,itemmakeid,itemidx) end

---��������������Ʒװ��������ɫ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  color: ��ɫ(0-255)��ɫ=0ʱ�ָ�Ĭ����ɫ
---@param actor string
---@param item string
---@param color integer
function changeitemnamecolor(actor,item,color) end

---�޸��������·����
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  looks: ���ֵ
---@param actor string
---@param item string
---@param looks integer
function changeitemshape(actor,item,looks) end

---��������ȼ�
---*  actor: ��Ҷ���
---*  opt: ������ + - =
---*  count: ����
---@param actor string
---@param opt string
---@param count integer
function changelevel(actor,opt,count) end

---�޸ı�������ֵ
---*  actor: ��Ҷ���
---*  mob: 	��������
---*  attr: ����λ��
---*  method: ������(+ - =)
---*  value: ����ֵ
---*  time: ��Чʱ��
---@param actor string
---@param mob string
---@param attr integer
---@param method string
---@param value integer
---@param time integer
function changemobability(actor,mob,attr,method,value,time) end

---�ı�����ģʽ
---*  actor: ��Ҷ���
---*  mode: ģʽ1~24
---*  time: ʱ��(��)
---*  param1: ����1,12-13 18 20 21������ �����������ֵ
---*  param2: ����2 ��������ֵ
---@param actor string
---@param mode integer
---@param time integer
---@param param1? integer
---@param param2? integer
function changemode(actor,mode,time,param1,param2) end

---�����������
---*  actor: ��Ҷ���
---*  id: ����ID 1-100
---*  opt: 	������ + - =
---*  count: ����
---*  msg: ��ע����
---*  send: �Ƿ����͵��ͻ���
---@param actor string
---@param id integer
---@param opt string
---@param count integer
---@param msg? string
---@param send? boolean
function changemoney(actor,id,opt,count,msg,send) end

---�޸ı�������
---*  mon: ��������
---*  name: ��������
---@param mon string
---@param name string
function changemonname(mon,name) end

---�޸�����������ɫ
---*  actor: ��Ҷ���
---*  color: ��ɫ����
---@param actor string
---@param color integer
function changenamecolor(actor,color) end

---�޸ı����ȼ�
---*  actor: ��Ҷ���
---*  mon: ��������
---*  opt: ������ + - =
---*  nLevel:�ȼ�
---@param actor string
---@param mon string
---@param opt string
---@param nLevel integer
function changeslavelevel(actor,mon,opt,nLevel) end

---�ı�����ٶ�
---*  actor: ��Ҷ���
---*  type: �ٶ����� 1-�ƶ��ٶ�2-�����ٶ�3-ʩ���ٶ�
---*  level: �ٶȵȼ� -10~100-ԭʼ�ٶȣ�-1ʱ��������10%+1ʱ��������10%
---@param actor string
---@param type integer
---@param level integer
function changespeed(actor,type,level) end

---�½����ֿ����
---*  actor: ��Ҷ���
---*  nCount: �½����ĸ�����
---@param actor string
---@param nCount integer
function changestorage(actor,nCount) end

---�������Ƿ񴴽�
---*  nIdx: ����ID
---@param nIdx integer
function checkation(nIdx) end

---����Ӣ������
---*  actor: ��Ҷ���
---*  name: 	Ӣ������
---@param actor string
---@param name string
function checkheroname(actor,name) end

---��� ��/���� ״̬
---*  objcfg: ���/���� ����
---*  type: ���� ��˵����
---@param objcfg string
---@param type integer
---@param model? integer
function checkhumanstate(objcfg,type,model) end

---��⵱ǰ�����Ƿ��ڿ���ĵ�ͼ
---*  actor: ��Ҷ���
---@param actor string
function checkkuafu(actor) end

---����������Ƿ���������
function checkkuafuconnect() end

---��⵱ǰ�������Ƿ�Ϊ���������
function checkkuafuserver() end

---��⾵���ͼ�Ƿ����
---*  MapId: ��ͼID
---@param MapId string|integer
function checkmirrormap(MapId) end

---���������
---*  actor: ��Ҷ���
---*  nIdx: ���ұ�� 0~100 0����û�м������
---@param actor string
---@param nIdx integer
function checknational(actor,nIdx) end

---��������������
---*  actor: ��Ҷ���
---*  sFlag: �ȽϷ� =<>
---*  iValue: 	����
---@param actor string
---@param sFlag string
---@param iValue integer
function checknationhumcount(actor,sFlag,iValue) end

---���װ����Ԫ������
---*  actor: ��Ҷ���
---*  where: װ��λ�ã�-1-OK���е�װ�� 0~55-���ϵ�װ��
---*  iAttr: ����
---*  sFlag: �ȽϷ�=<>
---*  iValue: ��ֵ(1-100)���ٷֱ�
---@param actor string
---@param where integer
---@param iAttr integer
---@param sFlag string
---@param iValue integer
function checknewitemvalue(actor,where,iAttr,sFlag,iValue) end

---�Ƿ�������
---*  actor: ��Ҷ���
---@param actor string
function checkonhorse(actor) end

---��ⷶΧ�ڹ�������
---*  actor: ��Ҷ���
---*  monName: ��������Ϊ�� or * Ϊ������й�
---*  nx: ����X
---*  ny: ����Y
---*  nRange: ��Χ
---@param actor string
---@param monName string
---@param nx integer
---@param ny integer
---@param nRange integer
function checkrangemoncount(actor,monName,nx,ny,nRange) end

---���ʰȡС����
---*  actor: ��Ҷ���
---*  monName: ��������,Ϊ�� ����ȫ��
---@param actor string
---@param monName string
function checkspritelevel(actor,monName) end

---�������ƺ�
---*  actor: ��Ҷ���
---*  title: �ƺ�
---@param actor string
---@param title string
function checktitle(actor,title) end

---ɾ���ӳ�
---*  actor: ��Ҷ���
---*  func: ��Ҫɾ������ʱ����,����Ϊ���ȫ��
---@param actor string
---@param func? string
function cleardelaygoto(actor,func) end

---�����Զ���ȫ�ֱ���
---*  varName: ������, * -���б���
---@param varName string
function clearglobalcustvar(varName) end

---�����Զ����л����
---*  guild: �л�����,* -�����л�
---*  varName: ������,* -���б���
---@param actor string
---@param varName string
function clearguildcustvar(actor,varName) end

---��������Զ������
---*  actor: Ҫ������������ ���� * ��ʾ�����������
---*  varName: ������,* -���б���
---@param actor string|string
---@param varName string
function clearhumcustvar(actor,varName) end

---������Ʒ�Զ�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  group: ���-1 ������ 0~5��Ӧ���
---@param actor string
---@param item string
---@param group integer
function clearitemcustomabil(actor,item,group) end

---�����ͼ��ָ�����ֵ���Ʒ
---*  MapId: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  range: ��Χ
---*  itemName: ��Ʒ��
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param itemName string
function clearitemmap(MapId,X,Y,range,itemName) end




---ˢ��
---*  mapid: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  monname: ��������
---*  range: ��Χ
---*  count: ����
---*  color: ��ɫ(0~255)
---@param mapid integer|string
---@param X integer
---@param Y integer
---@param monname string
---@param range integer
---@param count integer
---@param color? integer
function genmon(mapid,X,Y,monname,range,count,color) end

---ˢ��(��չ)
---*  mapid: ��ͼid
---*  x: ����X
---*  y: ����Y
---*  monname: ��������
---*  range: ��Χ
---*  count: ����
---*  owner: ��������
---*  color: ��ɫ(0~255)
---*  showName: �����Զ�������
---*  isFilt: �Ƿ��������(0���ˣ�1������)
---*  countryName: ��������
---*  nAttack: �Ƿ�ɹ���ͬ���ҵ����(0=������, 1=����)
---*  nNatMonPk: ��ͬ���ҹ����Ƿ��PK(0=������, 1=����)
---*  nPlayerPk: �����Ƿ���Թ�����ͬ���ҹ���(0=����, 1=������)
---*  nNg: �Ƿ����ڹ���(0=��ͨ��, 1=�ڹ���)
---@param mapid string|integer
---@param x integer
---@param y integer
---@param monname string
---@param range integer
---@param count integer
---@param owner? integer
---@param color? integer
---@param showName string
---@param isFilt? integer
---@param countryName? string
---@param nAttack? integer
---@param nNatMonPk? integer
---@param nPlayerPk? integer
---@param nNg? integer
---@return table �����б�
function genmonex(mapid, x, y, monname, range, count, owner, color, showName, isFilt, countryName, nAttack, nNatMonPk, nPlayerPk, nNg) end

-- ========================== ������ 23.08.30���� ������==========================

---�ȸ��ʻ��߰�Ȩ�������ȡ�ָ��ַ���
---*  str: ��Ҫ��ȡ������ַ���
---*  param1: 0=ϵͳȨ�����,�м����ַ������Ǽ���֮һ;1=��#λȨ�������Ȩ��Ϊ����λȨ�ص��ܺ�
---*  param2: 0=����ֵ����ʾ#Ȩ������;1=����ֵ������ʾ#Ȩ������;2=����ֵ1��ʾ,����ֵ2����ʾ;3=����ֵ2��ʾ,����ֵ1����ʾ
---@param str string
---@param param1 integer
---@param param2 integer
---@return string ��������ַ���
---@return string ʣ����ַ���
function ransjstr(str,param1,param2) end

---����ť���Ӻ��
---*  play: ��Ҷ���
---*  win_id: ����ID
---*  btn_id: ��ťID/������������ID
---*  x: X����
---*  y: Y����
---*  type: ���ģʽ(0=ͼƬ, 1=��Ч)
---*  path/effectID: ͼƬ·������Ч���
---@param play string ��Ҷ���
---@param win_id integer ����ID
---@param btn_id integer ��ťID/������������ID
---@param x integer X����
---@param y integer Y����
---@param type integer ���ģʽ(0=ͼƬ, 1=��Ч)
---@param path_or_effectID integer ͼƬ·������Ч���
function reddot(play, win_id, btn_id, x, y, type, path_or_effectID) end

---����ťɾ�����
---*  play: ��Ҷ���
---*  win_id: ����ID
---*  btn_id: ��ťID/������������ID
---@param play string
---@param win_id integer
---@param btn_id integer
function reddel(play, win_id, btn_id) end

-- ========================== ������ 23.10.24���� ������==========================

---��װ��λ�۳���Ʒ
---*  player: ��Ҷ���
---*  where: װ��λ
---*  desc: ����
---@param player string
---@param where integer
---@param desc? string
---@return boolean �Ƿ�۳��ɹ�
function delbodyitem(player, where, desc) end

---���͵�ͼ��Ϣ
---*  mapid: ��ͼid
---*  msg: Json��Ϣ����
---@param mapid string|integer
---@param msg string
function sendmapmsg(mapid, msg) end

---����Ѱ·/Ѳ��
---*  player: �������
---*  posX: x���꼯
---*  posY: y���꼯
---*  modle: 0=Ѱ·, 1=Ѳ��
---@param player string
---@param posX string
---@param posY string
---@param modle integer
function monmission(player, posX, posY, modle) end

---�����ƶ�����
---*  monName: ��������
---*  mapID: ��ͼID
---*  posX1: ������X
---*  posY1: ������Y
---*  posX2: ������X
---*  posY2: ������Y
---@param monName string
---@param mapID string|integer
---@param posX1 integer
---@param posY1 integer
---@param posX2 integer
---@param posY2 integer
function movemontopos(monName, mapID, posX1, posY1, posX2, posY2) end

---���ӹ���
---*  player: ��Ҷ���
---*  num: ����(1~6)
---*  funcName: ������������
---@param player string
---@param num integer
---@param funcName string
function playdice(player, num, funcName) end

---ѧϰ�ڹ�
---*  player: ��Ҷ���
---@param player string
function readskillng(player) end

---��ȡ�ڹ��ȼ�
---*  player: ��Ҷ���
---@param player string
---@return integer
function getnglevel(player) end

---���������ڹ��ȼ�
---*  player: ��Ҷ���
---*  opt: ���Ʒ�(=,+,-)
---*  value: �ȼ�
---@param player string
---@param opt string
---@param value integer
function changenglevel(player, opt, value) end

---���������ڹ�����
---*  player: ��Ҷ���
---*  opt: ���Ʒ�(=,+,-)
---*  value: ����
---@param player string
---@param opt string
---@param value integer
function changengexp(player, opt, value) end

---��������ҳǩ
---*  player: ��Ҷ���
---*  pulse: ����
---*  isOpen: 0=�ر�, 1=����
---@param player string
---@param pulse integer
---@param isOpen integer
function setpulsestate(player, pulse, isOpen) end

---��������Ѩλ
---*  player: ��Ҷ���
---*  pulse: ����
---*  acupoint: Ѩλ��1~5,��������Ѩλ��
---@param player string
---@param pulse integer
---@param acupoint integer
function openpulse(player, pulse, acupoint) end


---��̯
---*  player: ��Ҷ���
---@param player string
function stopmyshop(player) end

---����HP(Ѫ��)�İٷֱ�
---*  player: ��Ҷ���
---*  opt: ���Ʒ�(=,+,-)
---*  value: ��ֵ
---@param player string
---@param opt string
---@param value integer
function addhpper(player, opt, value) end

---����MP(����)�İٷֱ�
---*  player: ��Ҷ���
---*  opt: ���Ʒ�(=,+,-)
---*  value: ��ֵ
---@param player string
---@param opt string
---@param value integer
function addmpper(player, opt, value) end

---��ȡ������Ʒ�б�
---*  player: ��Ҷ���
---*  itemName: ��������
---*  isbind: �Ƿ��
---@param player string
---@param itemName? string
---@param isbind? integer
---@return table|string �����б��޵���������ء�0��
function getbagitems(player, itemName, isbind) end

---�޸ľ���������ȼ���ʽ
---*  player: ��Ҷ���
---*  pulse: ����
---*  opt: ���Ʒ�(=,+,-)
---*  level: �ȼ�
---@param player string
---@param pulse integer
---@param opt string
---@param level integer
function changepulselevel(player, pulse, opt, level) end

---ѧϰ�ڹ�/��������
---*  player: ��Ҷ���
---*  skillName: ��������
---*  skillLevel: ���ܵȼ�
---@param player string
---@param skillName string
---@param skillLevel integer
function addskillex(player, skillName, skillLevel) end

---��ȡ����ԭʼ�������ݿ��ֶ�ֵ����
---*  monIdx/monName: ����ID/��������
---*  fieldName: �ֶ���
---@param monIdx_monName string
---@param fieldName string
---@return string|integer
function getdbmonfieldvalue(monIdx_monName, fieldName) end

---�����ӿڸ���StdMode��ȡװ��λ
---*  player: ����StdMode
---@param stdMode integer
---@return integer
function getposbystdmode(stdMode) end

---Ӣ�۸����ӿ�
---*  player: ��Ҷ���
---*  heroName: Ӣ��������
---@param player string
---@param heroName string
function changeheroname(player, heroName) end

---ɾ��ϵͳ�����ʱ
---*  player: ��Ҷ���
---*  funcName: �ص�������
---@param player string
---@param funcName string
function deldsfuncall(player, funcName) end

---�ı�ϵͳ�����ʱ
---*  player: ��Ҷ���
---*  funcName: �ص�������
---*  model: 1=����, 0=ֹͣ
---@param player string
---@param funcName string
---@param model integer
function cngdsfuncallstate(player, funcName, model) end

---����ϵͳ�����ʱ
---*  player: ��Ҷ���
---*  funcName: �ص�������
---*  time: ����ʱʱ��(����)
---*  model: 0=���������¿���������ʧ, 1=����ֱ��ִ��
---*  isClear: 0=�����µ�, 1=����ˢ�µ�ǰʱ��
---@param player string
---@param funcName string
---@param time integer
---@param model integer
---@param isClear integer
function dsfuncall(player, funcName, time, model, isClear) end


---ʰȡ��Ʒ����������Ч��
---*  play: ��Ҷ���
---*  win_id: ����ID
---*  btn_id: ��ťID
---@param play string
---@param win_id integer
---@param btn_id integer
function setpickitemtobag(play, win_id, btn_id) end


---���ֹ���
---*  play: ��Ҷ���
---*  max: ���Χ
---*  min: ��С��Χ
---*  monLevel: ����ȼ�
---*  type: 0=���������, 1=�������
---*  isMove: 0=����Ư�Ƶ������, 1=����˲�Ƶ�Ŀǰ��������, 2=����˲�Ƶ�Ŀǰ������ǰ
---*  unLimit: 0=������, 1=����/���﹥��Ŀ�겻�����Լ��Ĳ��ɱ���
---@param play string
---@param max integer
---@param min integer
---@param monLevel integer
---@param type integer
---@param isMove integer
---@param unLimit integer
function monmove(play, max, min, monLevel, type, isMove, unLimit) end

---��ӡ�ű��ܺ�ʱ(΢��)
---*  play: ��Ҷ���
---*  on/off: 0=��ʼ��ʱ, 1=������ʱ������ӡ��ʱ��Ϣ
---@param play string
---@param on_off integer
function printusetime(play, on_off) end

---��ӡ�ű��ܺ�ʱ(΢��)
---*  play: ��Ҷ���
---*  logAct: ��־ID
---*  loginfo: ��־����
---*  nParam1~nParam5: ������(�ɿ�)���֧��21��
---@param play string
---@param logAct integer
---@param loginfo string
---@param nParam1? integer
---@param nParam2? integer
---@param nParam3? integer
---@param nParam4? integer
---@param nParam5? integer
function logact(play, logAct, loginfo,nParam1,nParam2,nParam3,nParam4,nParam5) end

---��ȡ��Ʒԭʼ�������ݿ��ֶ�ֵ����
---*  itemIdx/itemName: ��ƷID/��Ʒ����
---*  fieldName: �ֶ���
---@param itemIdx_itemName string
---@param fieldName string
---@return string|integer
function getdbitemfieldvalue(itemIdx_itemName, fieldName) end

---�޸�����,��ǽ��
function repaircastle() end

---������ʾһ���Ŵ����Ӱ
---*  play: ��Ҷ���
---*  opacity: ͸����(0~255)
---*  time: ��ʾʱ��(��)
---@param play string
---@param opacity integer
---@param time integer
function showphantom(play, opacity, time) end

---ǰ�˹�ѡ����������
---*  play: ��Ҷ���
---*  type: 0=�������1=������Ӻ���, 2������, 3=������ս, 4����鿴, 5=�������Ϊ�л��Ա
---*  time: 1=����(��ѡ), 0=������(����ѡ)(��)
---@param play string
---@param type integer
---@param time integer
function clientswitch(play, type, time) end


---��ȡ��ǰ��ͼ�л��Ա����
---*  mapID: ��ͼ���
---*  guildName: �л����ֻ�*(*����δ�����л�����)
---@param mapID string|integer
---@param guildName string
---@return integer
function maphanghcyguild(mapID, guildName) end

---�󶨱���������
---*  play: ��Ҷ���
---*  bindingType: ������(1��������֪ͨ)
---*  isOpen: �Ƿ���(0���رգ�1������)
---*  callbackFunc: �ص�����(QF)
---@param play string
---@param bindingType integer
---@param isOpen integer
---@param callbackFunc string
function bindEvent(play, bindingType, isOpen, callbackFunc) end

---��ȡ��ǰ��ͼ����״̬
---*  mapID: ��ͼ���
---*  monName: �������ƣ�*��ʾ���й���
---*  model: �������ָ�ʽ��0=Ĭ������(������), 1=��ʾ����(��������)
---*  param: 0=��ȡ�����ˢ�Ĺ���״̬, 1=��ȡ����ںͽű�ˢ�Ĺ���״̬
---@param mapID string|integer
---@param monName string
---@param model integer
---@param param? integer
---@return table
function mapbossinfo(mapID, monName, model, param) end

---����΢�ź�qq�ȹ���
---*  play: ��Ҷ���
---*  model: 1=����QQ, 2=QQ����, 3=QQȺ, 4=΢��
---*  param1: ����2=2,����QQ��, ����2=3,����QQȺ��
---*  param2: ����2=3,����QQȺkey
---@param play string
---@param model integer
---@param param1? integer
---@param param2? string
function sendforqqwx(play, model, param1, param2) end

---����/�رյ�ͼ����
---*  mapID: ��ͼ���
---*  mapParam: ��ͼ����
---*  model: 0=�رյ�ͼ����, 1=������ͼ����
---*  param: ��ͼ���������Ҫ�Ĳ���
---@param mapID string|integer
---@param mapParam string
---@param model integer
---@param param? string|integer
function setmapmode(mapID, mapParam, model, param) end

---װ���������Ӹ�������
---*  play: ��Ҷ���
---*  where: װ��λ��(-2������Ʒ����)
---*  opt: �����(+,-,=)
---*  attrStr: ������
---*  item: ��Ʒ����
---@param play string
---@param where integer
---@param opt string
---@param attrStr string
---@param item? string
function setaddnewabil(play, where, opt, attrStr, item) end

---��ȡ��������װ������ֵ����
---*  play: ��Ҷ���
---*  model: ����(1��װ������������� 2����������)
---*  attrID: ����ID
---*  where: װ��λ��(-2������Ʒ����)
---*  item: ��Ʒ����
---@param play string
---@param model integer
---@param attrID integer
---@param where integer
---@param item? string
---@return string
function getitemattidvalue(play, model, attrID, where, item) end

---��ȡ��ɫ��������
---*  play: ��Ҷ���
---@param play string
function attrtab(play) end

---����Ұ����ҷ����Զ���㲥��Ϣ
---*  play: ��Ҷ���
---*  varIdx: ����id(1~5)
---*  varValue: ����ֵ
---@param play string
---@param varIdx integer
---@param varValue integer
function setotherparams(play, varIdx, varValue) end

---��������
---*  play: ��Ҷ���
---*  idx: �ڼ�����������һ������Ϊ0��
---*  rang: ���������
---*  levelMax: �ܳ���Ӱ��Ĺ���ȼ����ޣ�������ָ���ȼ����ᱻ������
---@param play string
---@param idx integer
---@param rang integer
---@param levelMax integer
function mobdotaunt(play, idx, rang, levelMax) end

---�������������������������
---*  play: ��Ҷ���
---*  petName: ��������(�����ֺͲ������ֶ�����)
---*  pro: ����������������(��������Ϊ0ʱ����������, 110=�������ﱶ��1.1��)
---@param play string
---@param petName string
---@param pro integer
function changeslaveattackhumpowerrate(play, petName, pro) end

---�����ı��ļ�
---*  path: �ļ�·��
---@param path string
function createfile(path) end

---д��ָ���ı��ļ�
---*  path: �ļ�·��
---*  str: д���ı�
---*  line: д������(0~65535)
---@param path string
---@param str string
---@param line integer
function addtextlist(path, str, line) end

---��ȡ�ı��ļ�ָ���е��ַ��� 
---*  path: �ļ�·��
---*  line: ָ����(0~1000)
---@param path string
---@param line integer
---@return string
function getrandomtext(path, line) end

---��ȡ�ı��ļ�ָ���е�����[���ݷ��ŷָ�]
---*  path: �ļ�·��
---*  line: ָ����
---*  symbol: ����
---@param path string
---@param line integer
---@param symbol string
---@return table
function getliststringex(path, line, symbol) end

---ȡ�ַ������б��е��±�
---*  path: �ļ�·��
---*  str: �ַ���
---@param path string
---@param str string
---@return integer|nil �ַ��������У�δ�ҵ�����nil
function getstringpos(path, str) end

---ɾ���ı��ļ�������
---*  path: �ļ�·��
---*  line: ָ����
---*  model: ɾ��ģʽ(0=ɾ����, 1=�����, 2=ɾ�������(����2ʧЧ))
---@param path string
---@param line? string
---@param model integer
function deltextlist(path, line, model) end

---����б�����
---*  path: �ļ�·��
---@param path string
function clearnamelist(path) end

---����ַ����Ƿ���ָ���ļ���
---*  path: �ļ�·��
---*  str: �ַ���
---@param path string
---@param str1 string
---@param str2? string
---@return boolean
function checktextlist(path, str1,str2) end

---����ַ����Ƿ���ָ���ļ���
---*  path: �ļ�·��
---*  str: �ַ���
---*  model: ���ģʽ(0=�б���,�Ƿ�����������ַ�, 1=�������ַ��Ƿ�����б��е�ĳһ������)
---@param path string
---@param str string
---@param model integer
function checkcontainstextlist(path, str, model) end

---ͨ������/ɾ���ı�
---*  model: 0=�����ļ�, 1=ɾ���ļ�
---*  fileName: �ļ�����
---@param model integer
---@param fileName string
function tongfile(model, fileName) end

---ͨ��ͬ���ı�
---*  fileName: �ļ�����
---@param fileName string
function updatetongfile(fileName) end

---�����ļ�����
---*  path: �ı�·��
---*  str: ����(���64�����ַ�)
---*  line: ָ��������
---*  model: 0=�ļ�β׷������(��), 1 =�������ݵ�ָ����, 2=�滻���ݵ�ָ����, 3=ɾ��ָ��������, 4=��������ļ�����
---@param path string
---@param str string
---@param line string
---@param model string
function changetongfile(path, str, line, model) end

---ͨ������ͬ��
---*  varName: ȫ�ֱ�����
---@param varName string
function updatetongvar(varName) end

---����ִ��,���Ӵ����ļ�
---*  varName: ����ID
---*  model: 0=�����ļ�, 1=ɾ���ļ�
---*  path: �ļ�·��
---@param varName string
---@param model integer
---@param path string
function maintongfile(varName, model, path) end

---д��ָ�� ���� ����
---*  serverID: ����ID
---*  path: �ļ�·��
---*  key: �ֶ�
---*  value: ֵ
---@param serverID string
---@param path string
---@param key string
---@param value string
function writetongkey(serverID, path, key, value) end

---��ȡָ�� ���� ���� ��ȡ����QF����
---*  serverID: ����ID
---*  path: �ļ�·��
---*  key: �ֶ�
---*  varName: ����
---@param serverID string
---@param path string
---@param key string
---@param varName string
function readtongkey(serverID, path, key, varName) end

---ִ�в�ѯͨ������
---*  serverID: ����ID
---@param serverID string
function checktongsvr(serverID) end

---����ִ�� ͬ���ļ� �������ļ�·��ͬ����������·��
---*  serverID: ����ID
---*  path: �ļ�·��
---@param serverID string
---@param path string
function updatemaintongfile(serverID, path) end

---����ִ�� ͬ���ļ� �������ļ�·��ͬ����������·��
---*  serverID: ����ID
---*  filePath: �������ļ�·��
---*  path: �����ļ�·��
---@param serverID string
---@param filePath string
---@param path string
function updatemaintongfile(serverID, filePath, path) end

---����ִ�� ��ȡ�ļ�
---*  serverID: ����ID
---*  filePath: �����ļ�·��
---*  path: Զ�̷�����·��
---@param serverID string
---@param filePath string
---@param path string
---@return any
function getmaintongfile(serverID, filePath, path) end

---����Ʒ(��չ)
---*  play: ��Ҷ���
---*  itemName: ��Ʒ����
---*  itemNum: ����
---*  bind: 0=����, 1=�۳��ǰ���Ʒ, 2=�۳�����Ʒ
---*  desc: ����
---@param play string
---@param itemName string
---@param itemNum integer
---@param bind integer
---@param desc? string
---@return boolean �Ƿ�۳��ɹ�
function takeitemex(play, itemName, itemNum, bind, desc) end

---�жϰ�״̬
---*  item: ��Ʒ����
---*  bind: ������(0-8)
---@param item string
---@param bind integer
---@return boolean �Ƿ��
function checkitemstate(item, bind) end

---����װ����λ���Լӳ�(��ֱ�)
---*  play: ��Ҷ���
---*  where: װ����λ
---*  sFlag: ������(=,+,-)
---*  pro: ����(��ֱ�)
---@param play string
---@param where integer
---@param sFlag string
---@param pro integer
function setequipaddvalue(play, where, sFlag, pro) end

---��ȡװ����λ���Լӳ�(��ֱ�)
---*  play: ��Ҷ���
---*  where: װ����λ
---@param play string
---@param where integer
---@return integer
function getequipaddvalue(play, where) end

-- ========================== ������ 23.12.07���� ������==========================

---��������ǰ�˱���
---*  play: ��Ҷ���
---@param play string
function sendredvartoclient(play) end

---��ȡ�ַ�������
---*  play: ��Ҷ���
---*  attridx: �Զ�������������
---@param play string
---@param attridx string
function getattlist(play, attridx) end

---������Ʒ��ȡJson2
---*  play: ��Ҷ���
---@param play string
function getitemjsonex(play) end

---��������ĵ�ǰ����ֵ
---*  play: ��Ҷ���
---*  sFlag: ������(=,+,-)
---*  value: ����ֵ
---*  model: ���㷽ʽ(0=����, 1=��ֱ�)
---@param play string
---@param sFlag string
---@param value integer
---@param model integer
function addinternalforce(play, sFlag, value, model) end

---�޸Ľ�ɫ���(�������·�����Ч)
---*  play: ��Ҷ���
---*  type: 0=�·�;1=����;2=�·���Ч;3������Ч;4=����;5=������Ч
---*  shape: ��۵�shape(��ɫģ��ID),-1��ʾ���
---*  time: ʱ�� (��)
---*  param1: ���ڲ���1λ��Ϊ0ʱ��Ч(0=����ʱװ���, 1=ʱװ�������)
---*  param2: ���ڲ���1λ��Ϊ0ʱ��Ч(0-���ҡ�ͷ������, 1-���ض���, 2-����ͷ��, 3-���ض��Һ�ͷ�� 4-���ض��ƺͶ�����Ч)
---@param play string
---@param type integer
---@param shape integer
---@param time integer
---@param param1 integer
---@param param2 integer
function setfeature(play, type, shape, time, param1, param2) end

---�ٷֱ��޸��ٶ�
---*  play: ��Ҷ���
---*  model: ���㷽ʽ(1=�ƶ��ٶ�, 2=�����ٶ�, 3=ħ���ٶ�)
---*  value: �ٶ�ֵ(0=ԭ�ٶ�(����0=���� -=����))
---*  time: ��Чʱ����(Ϊ��=��ʾ������ʱ��,���ֵ65535)
---@param play string
---@param model integer
---@param value integer
---@param time integer
function changespeedex(play, model, value, time) end

---�ı似����Ч
---*  play: ��Ҷ���
---*  skillName: ��������
---*  effectID: ��Чid,=0Ϊ�ر�(cfg_skill_present.xls��id)
---*  effectID2: ������ID(ħ����BUFF��id/��ǽ/Ⱥ���׵���/�����ļ�����Ч)
---@param play string
---@param skillName string
---@param effectID integer
---@param effectID2? integer
function setmagicskillefft(play, skillName, effectID, effectID2) end

---��ȡ��ǰ�����id[npcid]
---*  return: npcID��NPC���ñ��е�ID��<br>����npcid:QF=999999999,QM=999999996,LuaCond=999999995,LuaFunc=999999994
---@return integer 
function getsysindex() end


---��־�ϱ��ӿ�
---*  play: ��Ҷ���
---*  jsonStr: ��־json
---@param play string
---@param jsonStr string
function senddiymsg(play, jsonStr) end

---����ɱ���ڹ����鱶��
---*  play: ��Ҷ���
---*  pro: ����(��������100Ϊ�����ı���(200Ϊ2�����飬150Ϊ1.5��))
---*  time: ��Чʱ��(��)
---@param play string
---@param pro integer
---@param time integer
function killpulseexprate(play, pro, time) end

---����ɱ���ڹ����鱶��
---*  play: ��Ҷ���
---*  mapid: ��ͼid("*"�������е�ͼ)
---*  pro: ����(��������100Ϊ�����ı���(200Ϊ2�����飬150Ϊ1.5��))
---@param play string
---@param mapid integer|string
---@param pro integer
function plusemapkillmonexprate(play, mapid, pro) end

---��������ת�����Ե�
---*  play: ��Ҷ���
---*  sFlag: ������(=,+)
---*  value: ����(0-1000)
---@param play string
---@param sFlag string
---@param value integer
function bonuspoint(play, sFlag, value) end

---��ȡ����ת�����Ե�
---*  play: ��Ҷ���
---@param play string
---@return integer
function getbonuspoint(play) end

-- ========================== ������ 2024-xx-xx�ȴ����� ������==========================

---�ٻ�����
---*  actor: ��Ҷ���
---*  name: ��������
---*  x: ������ǰ��ͼ������X��0Ĭ����������ߣ�
---*  y: ������ǰ��ͼ������Y��0Ĭ����������ߣ�
---*  level: �����ȼ�(���Ϊ7)������Խ���˺�Խ��
---*  count: ����
---*  time: �ѱ�ʱ��(����)
---*  color: �Ƿ��Զ���ɫ��0���ı���ɫ��������0����1-7Ϊ����������ɫֵ[��ɫ��1-7����ɫ]����-1Ϊ�Զ���ɫ������������������ɫ�仯��������ʹ�ã�
---*  ignore: ���ô���0�����ʱ������ñ�������(��M2���Ƶ��ٻ�����)
---*  nolevelup: ������������0������������1��������
---*  hide: ������������0�������أ�1�����أ�
---*  inherit: �̳������˺��ٷֱ� �������ƶ��ٶȵ��޷��̳У�
---*  hp: ����Ѫ����ֵ����������Ƕ��ٱ�����Ѫ�����Ƕ��٣���0��ʾ������11�ģ���
---*  buff: BUFF ID ���BUFF ID��#������
---@param actor string
---@param name string
---@param x integer
---@param y integer
---@param level integer
---@param count integer
---@param time integer
---@param color integer
---@param ignore? integer
---@param nolevelup? integer
---@param hide? integer
---@param inherit? integer
---@param hp? integer
---@param buff? string
---@return table ��������б� 
function recallmobex(actor, name, x, y, level, count, time, color, ignore, nolevelup, hide, inherit, hp, buff) end


---��ȡ�����ļ�
---*  readPath: �����ļ�·��
---@param readPath string
---@return table ���������������
function readexcel(readPath) end


---��������Ʒ
---*  actor: ��Ҷ���
---*  item_str: ��Ʒ����#��Ʒ����&��Ʒ����#��Ʒ���� (&=�͵���˼)
---*  is_bind: 0/1/2��0=����� 1.�ǰ� 2.�󶨣�
---*  is_id: ����1�е���Ʒ������ID���ǵ������ƣ�0���������ƣ�1������ID��
---@param actor string
---@param item_str string
---@param is_bind integer
---@param is_id integer
---@return boolean �������� 
function checkitems(actor, item_str, is_id, is_bind) end


---���������Ʒ
---*  actor: ��Ҷ���
---*  item_str: ��Ʒ����#��Ʒ����&��Ʒ����#��Ʒ���� (&=�͵���˼)
---*  model: ����1�е���Ʒ������ID���ǵ������ƣ�0���������ƣ�1������ID��
---*  is_bind: 0/1/2��0=����� 1.�ǰ� 2.�󶨣�
---@param actor string
---@param item_str string
---@param model integer
---@param is_bind integer
---@return boolean �Ƿ�۳��ɹ�
function takes(actor, item_str, model, is_bind) end


---�۳���ɫ������װ��
---*  actor: ��Ҷ���
---*  itemName: װ������
---*  num: �۳���Ʒ����
---*  desc: ����
---@param actor string
---@param itemName string
---@param num integer
---@param desc? string
---@return boolean
function takew(actor, itemName, num,desc) end

---��ȡ�������гƺ�
---*  play: ��Ҷ���
---@param play string
---@return table 
function newgettitlelist(play) end


---���ӻ������
---*  actor: ��Ҷ���
---*  recyclingType: ������𣬶�Ӧ����group�ֶ�(֧�ֶ���������á�;���ָ�)
---@param actor string
---@param recyclingType string
function addrecyclingtype(actor, recyclingType) end


---ɾ���������
---*  actor: ��Ҷ���
---*  idx: �������������-1��ʾ��ջ������
---@param actor string
---@param idx string
function delrecyclingtype(actor, idx) end

---ִ�л���
---*  actor: ��Ҷ���
---@param actor string
function execrecycling(actor) end

---ִ���Զ�����
---*  actor: ��Ҷ���
---*  interval: �����ʱ�䣨��λ���룩
---*  max_bag_space: �������ռ䣨��λ�����ӣ�
---@param actor string
---@param interval? integer
---@param max_bag_space? integer
function autorecycling(actor, interval, max_bag_space) end


---����Ѱ·
---*  mapID: ��ͼid
---*  x: x���괮��
---*  y: y���괮��
---*  mob: ˢ������x
---*  moby: ˢ������y
---*  count: ����
---*  range: ��Χ
---*  mobName: ��������
---*  target: Ŀ��
---*  country: ����
---*  attackSelfPlayer: �Ƿ񹥻��������(0,1)
---*  attackPVP: ��ͬ���ҹ����Ƿ�PK(0,1)
---*  mobNameColor: ����������ɫ
---*  disableSelfPlayerAttack: �Ƿ��ֹ������ҹ���(0,1)
---@param mapID string|integer
---@param x string
---@param y string
---@param mob string
---@param moby string
---@param count integer
---@param range integer
---@param mobName string
---@param target? string
---@param country string
---@param attackSelfPlayer integer
---@param attackPVP integer
---@param mobNameColor integer
---@param disableSelfPlayerAttack integer
function mission(mapID, x, y, mob, moby, count, range, mobName, target, country, attackSelfPlayer, attackPVP, mobNameColor, disableSelfPlayerAttack) end


---����OK����Ʒ
---*  actor: ��Ҷ���
---*  boxID: OK����
---@param actor string
---@param boxID integer
function updateboxitem(actor, boxID) end

---�жϵ�ͼ��ʱ���Ƿ����
---*  mapID: ��ͼid
---*  timerid: ��ʱ��id
---@param mapID string
---@param timerid integer
---@return boolean
function hasenvirtimer(mapID, timerid) end

---�ж���Ҷ�ʱ���Ƿ����
---*  actor: ��Ҷ���
---*  timerid: ��ʱ��id
---@param actor string
---@param timerid integer
---@return boolean �Ƿ�ӵ��
function hastimer(actor, timerid) end

---�ж�ȫ�ֶ�ʱ���Ƿ����
---*  timerid: ��ʱ��id
---@param timerid integer
---@return boolean �Ƿ�ӵ��
function hastimerex(timerid) end

---�ı�ƺ�ʱ��
---*  actor: ��Ҷ���
---*  titleName: �ƺ�����
---*  operation: ��������+,-,=��
---*  cour: ʱ��(+,-�������ʱ��(��), =����ʱ���)
---@param actor string
---@param titleName string
---@param operation string
---@param cour integer
function changetitletime(actor, titleName, operation, cour) end

---�ı��л�����
---*  actor: ��Ҷ���
---*  guildName: ��Ҫ�������л���
---*  newGuildName: �µ��л�����
---@param actor string
---@param guildName string
---@param newGuildName string
function changeguildname(actor, guildName, newGuildName) end

---��ȡ�����б�
function getcastlewarlist() end

---���ü�����ȴʱ��
---*  actor: ��Ҷ���
---*  skill: ��������|����ID
---*  time: �����cdʱ��(��)����0�����ü���CD
---@param actor string
---@param skill string|integer
---@param time? integer
function skillrestcd(actor, skill, time) end

---���ù������ɼ�ʱ��
---*  mapID: ��ͼID
---*  monPosX: ����X����
---*  monPosY: ����Y����
---*  monName: ��������
---@param mapID string|integer
---@param monPosX integer
---@param monPosY integer
---@param monName string
function resetmongentick(mapID,monPosX,monPosY,monName) end

---��ȡIP��ַ�����е����߽�ɫ�����б�
---*  IPAddress: IP��ַ
---*  getAllPlayers: �Ƿ��ȡȫ������б�0/1(Ĭ�����Ʒ���200��)
---@param IPAddress string
---@param getAllPlayers integer
function getplaylistbyip(IPAddress, getAllPlayers) end

---���͵�½��Ϣ[�����]
---@param userID string ���ΨһID
function sendloginmsg(userID) end

---����½��Ϣ[�����]
---@param userID string ���ΨһID
function logincheckent(userID) end

---��������
---@param mapID string ��ͼID
---@param model integer ����Ч�� (1=��ɳЧ��,2=����Ч��,3=��ѩЧ��)
---@param time integer ��Чʱ��(��)
function setweathereffect(mapID, model, time) end

---ɾ������
---@param mapID string ��ͼID
---@param model integer ����Ч�� (0=�ر�����Ч��,1=��ɳЧ��,2=����Ч��,3=��ѩЧ��)
function delweathereffect(mapID, model) end

---��������
---@param actor string ��Ҷ���
---@param boxidx integer ����ID
---@param num integer ����(�������ݱ����,ֻ������Ĵ���)
function opendragonbox(actor, boxidx, num) end

--- ��Ӷɳ�Ϳ˹�����/��ʿ
--- @since ����64_24.05.23
--- @param monID integer ������/��ʿID
--- @param monType? integer ���ͣ�Ĭ��Ϊ0��0=������, 1=��ʿ
--- @note ��Ӷ������/������Ҫ���ĳǱ����, ������[M2-��������-�Ǳ�����]�����ù�Ӷ����/��ʿ=0
--- @note ������/������ʬ����ʧ����ܽ��й�Ӷ
function castlearchergen(monID, monType) end


--- ������������װ��
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param item_name string װ������
--- @param item_num integer װ������
--- @return boolean �Ƿ񴩴�
function checkitemw(actor, item_name,item_num) end


--- ���õȼ���
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param itype integer 0:�������, 1:�����������ȼ�ʱ���Ҳ���ȡ���ﾭ��, 2:�����������ȼ�ʱ�ۻ�����(int64)
--- @param level integer ��ס���ȼ�
function setlocklevel(actor, itype,level) end


--- ��λ���Ե���
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
function restbonuspoint(actor) end


--- ����������Ʒ
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param itemStr string ��Ʒ��������Ʒ����#����#��״̬&��Ʒ����#����#��״̬
--- @param desc string ����
function gives(actor, itemStr, desc) end


--- ����ǰ�������Ϣ[�ϳ�ϵͳ]
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param idx string|integer �ϳɱ�idx
--- @param json string json��Ϣ
function sendactionofjson(actor, idx, json) end


--- ��������������Χ�����գ�
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param value integer ����������Χֵ��-1=����ȡװ���Ĺ���ֵ
function setcandlevalue(actor, value) end


--- ָ������ı���
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param monItem string ��������
--- @param value integer �ɱ������������౬20��
--- @param delayTime integer? �ӳٺ�������Ĭ��Ϊ0
function monitemsex(actor, monItem, value, delayTime) end


--- ���ͽ�ָ����ǰ����
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param X integer Ŀ���X����
--- @param Y integer Ŀ���Y����
--- @return boolean �Ƿ�������
function beginteleport(actor, X, Y) end


--- ��ȡӢ��ģʽ
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @treturn integer Ӣ��ģʽ��0=����, 1=����, 2= ��Ϣ
function getherosta(actor) end


--- ����Ӣ��ģʽ
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
--- @param model integer Ӣ��ģʽ��0=����, 1=����, 2= ��Ϣ
function setherosta(actor, model) end


--- Ӣ�۴��͵��������
--- @since ����64_24.05.23
--- @param actor string ��Ҷ���
function herofollow(actor) end

--- �洢��Ʒstr����[��չ]
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param where integer װ��λ��(-2������Ʒ����)
---@param idx integer ����λ��(1-20)
---@param value string ����ֵ
---@param itemobj? string ��Ʒ����(����2����-2ʱ��Ч)
function setitemparam(actor, where, idx, value, itemobj) end

--- ��ȡ��Ʒstr����[��չ]
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param where integer װ��λ��(-2������Ʒ����)
---@param idx integer ����λ��(1-20)
---@param itemobj? string ��Ʒ����(����2����-2ʱ��Ч)
---@return string result ����ֵ
function getitemparam(actor, where, idx, itemobj) end

--- �洢��Ʒint����[��չ]
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param where integer װ��λ��(-2������Ʒ����)
---@param idx integer ����λ��(1-50)
---@param value integer ����ֵ(Int64)
---@param itemobj? string ��Ʒ����(����2����-2ʱ��Ч)
function setitemintparam(actor, where, idx, value, itemobj) end

--- ��ȡ��Ʒint����[��չ]
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param where integer װ��λ��(-2������Ʒ����)
---@param idx integer ����λ��(1-50)
---@param itemobj? string ��Ʒ����(����2����-2ʱ��Ч)
---@return integer result ����ֵ
function getitemintparam(actor, where, idx, itemobj) end

--- ������Ʒ���������ݿ�[��չ]
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param where integer װ��λ��(-2������Ʒ����)
---@param itemobj? string ��Ʒ����(����2����-2ʱ��Ч)
function updatecustitemparam(actor, where, itemobj) end

--- ���ö���int����
---@since ����64_24.05.23
---@param obj string ����/NPC����
---@param idx integer ����λ��(0-4)
---@param value integer ����ֵ
function setobjintvar(obj, idx, value) end

--- ��ȡ����int����
---@since ����64_24.05.23
---@param obj string ����/NPC����
---@param idx integer ����λ��(0-4)
---@return integer result ����ֵ
function getobjintvar(obj, idx) end

--- ���ö���str����
---@since ����64_24.05.23
---@param obj string ����/NPC����
---@param idx integer ����λ��(0-4)
---@param value string ����ֵ
function setobjstrvar(obj, idx, value) end

--- ��ȡ����str����
---@since ����64_24.05.23
---@param obj string ����/NPC����
---@param idx integer ����λ��(0-4)
---@return string result ����ֵ
function getobjstrvar(obj, idx) end

--- ���õ�ͼint����
---@since ����64_24.05.23
---@param mapid integer ��ͼ���
---@param idx integer ����λ��(0-49)
---@param value integer ����ֵ
function setenvirintvar(mapid, idx, value) end

--- ��ȡ��ͼint����
---@since ����64_24.05.23
---@param mapid integer ��ͼ���
---@param idx integer ����λ��(0-49)
---@return integer result ����ֵ
function getenvirintvar(mapid, idx) end

--- ���õ�ͼstr����
---@since ����64_24.05.23
---@param mapid integer ��ͼ���
---@param idx integer ����λ��(0-49)
---@param value string ����ֵ
function setenvirstrvar(mapid, idx, value) end

--- ��ȡ��ͼstr����
---@since ����64_24.05.23
---@param mapid integer ��ͼ���
---@param idx integer ����λ��(0-49)
---@return string result ����ֵ
function getenvirstrvar(mapid, idx) end

--- ����buff�ѵ�����
---@since ����64_24.05.23
---@param actor string ����
---@param buffid integer buffid
---@param opt string ������ '+' '-' '='
---@param stack integer buff���� ���ɳ�������������
---@param itimer boolean �Ƿ�����buff ʱ��
function buffstack(actor, buffid, opt, stack, itimer) end

--- �ڵ�ͼ�����ɵ�����Ʒ
---@since ����64_24.05.23
---@param mapid integer ��ͼid
---@param actor string �������� ��nil���޹��� ��ʰȡcdʱ��ᱻ����Ϊ0
---@param X integer x����
---@param Y integer y����
---@param json string ����json
---@param data string ��Ʒ��Դ(�ο�������Ʒ��Դ)
---@return table result ��Ʒmakeindex�б�
function gendropitem(mapid, actor, X, Y, json, data) end

--- ��Ŀ���ͷż���
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param skillID integer ����ID
---@param sType integer ���� 1-��ͨ���� 2-ǿ������
---@param sLevel integer ���ܵȼ�
---@param target string Ŀ�����
---@param data integer �Ƿ���ʾʩ������ 0-����ʾ 1-��ʾ
function releasemagic_target(actor, skillID, sType, sLevel, target, data) end

--- �������ͷż���
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param skillID integer ����ID
---@param sType integer ���� 1-��ͨ���� 2-ǿ������
---@param sLevel integer ���ܵȼ�
---@param X integer Ŀ���X����
---@param Y integer Ŀ���Y����
---@param data integer �Ƿ���ʾʩ������ 0-����ʾ 1-��ʾ
function releasemagic_pos(actor, skillID, sType, sLevel, X, Y, data) end

--- �ù����ͷ��Զ��弼��
---@since ����64_24.05.23
---@param mon string �������
---@param skillID integer �Զ��弼��id
---@param X integer Ŀ���X����
---@param Y integer Ŀ���Y����
---@param target string Ŀ�����
function mon_docustommagic(mon, skillID, X, Y, target) end

--- ����Զ�����﹥������
---@since ����64_24.05.23
---@param mon string �������
---@param skillID integer ��������id,��Ӧcfg_monattack��
function addmonattack(mon, skillID) end

--- ��ȡ�Զ������а񻺴�����
---@since ����64_24.05.23
---@param rankidx string �Զ������а�ҳǩ
---@return string result ���а�����,json��ʽ
function getsortdata(rankidx) end

--- ��ӻ������¼�
---@since ����64_24.05.23
---@param scheduledName string ����������
---@param executeMethod string ִ�з�ʽ
---@param time string ʱ�����
---@param funcName string ��ת��ǩ
function addscheduled(scheduledName, executeMethod, time, funcName) end

--- ɾ���������¼�
---@since ����64_24.05.23
---@param scheduledName string ����������
function delscheduled(scheduledName) end

--- �жϻ������¼�
---@since ����64_24.05.23
---@param scheduledName string ����������
---@return boolean result true=���¼�,false=���¼�
function hasscheduled(scheduledName) end

--- ���ϵͳ��ʱ�ص�
---@since ����64_24.05.23
---@param time integer ʱ��(����)
---@param funcName string ��������
function grobaldelaygoto(time, funcName) end

--- ɾ��ϵͳ��ʱ�ص�
---@since ����64_24.05.23
---@param funcName? string ��Ҫɾ������ʱ����,����Ϊ���ȫ��
---@param value? integer �Ƿ���ӱ�ǩ����,0=������,Ҫ������д���ʱ�Ĳ���,1=����,ֻ�жϺ�����
function grobalcleardelaygoto(funcName, value) end

--- �ı�������
---@since ����64_24.05.23
---@param actor string ��Ҷ���
---@param petIdx string|integer �������,X��ʾ��ǰ����
---@param appr? integer �������ID(����Appr),0=��ԭ
function setpetappr(actor, petIdx, appr) end

--- �����ͼĳ��Χ�Ĺ���
---@since ����64_24.05.23
---@param mapID string ��ͼID
---@param x integer ����X
---@param y integer ����Y
---@param range integer ��Χ
---@param monName integer ������,*��ʾ���й���
---@param isDrop integer �Ƿ���Ʒ,0=����,1=��
---@param isClear integer �Ƿ���ʬ��,0=����,1=��
function killmapmon(mapID, x, y, range, monName, isDrop, isClear) end