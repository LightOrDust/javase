--���ݸ���  DML���ԣ���ʵ�ʲ����У����������Ƕ�ȡ��ɾ�����޸Ľ��٣����ݸ���ֵ���ǲ��롢�޸ĺ�ɾ��
--�������������Ԫ��ֵ�ĳ��� �Ͳ�ѯ����Ĳ���
--������Ĳ���
--insert into tablename values(val1,val2,...)�������֮��û���У���ôֻ�ܽ����е��в���
--insert ing tablename(col1,col2,....)value(valw,vals,...)����ָ������Щ���в�������
insert into emp values(1234,'haha','clerk',7904,to_date('2021-07-23','yyyy-mm-dd'),1000,500,10)
--�򲿷����в������ݵ�ʱ�򣬲��������ĸ��в���������ĸ��в��룬Ҫ��ѭ�������ʱ����Ĺ淶
select * from emp;
insert into emp (empno,ename) values(3333,'wangwu');
--�������������ʽ
--���Ʊ��ͬʱ���Ʊ����ݣ����Ḵ��Լ��
create table emp2 as select * from emp;
--���Ʊ�ṹ���ǲ����Ʊ��е����ݣ�Ҳ���Ḵ��Լ��
create table emp3 as select * from emp where 1=2;

select * from emp3;
drop  table emp2;
--�����һ�����ϵ����ݣ��Ѽ����е��������ݶ��������룬Ч����Σ���ʵ�ʵĲ����У����ٻᰤ�����룬���������������
--ɾ������
--delete from tablename where condition
delete from emp2 where deptno =10;
--�������������
delete from emp2;
--truncate,��delelte�в�ͬ��delete��ɾ����������truncate�����������޷��ع�����ȻЧ�ʽϸߣ����ǲ�����ʹ��
truncate table emp2;
 --�޸Ĳ�����
 --update tablename set col1=val1,col2=val2 where condition;
 --���Ը��»��޸�����������һ���л��߶����
 --���µ���
 update emp set ename ='heihei' where ename ='haha';
 select * from emp;
 --���¶���
 update emp set job='teacher',mgr=7905 where empno=3333;
 /*��ɾ�������ݿ�ĳ��ò������ڽ��в�����ʱ����Ҫ����ı�֤����pl/sql�У�ÿ�ζ�Ҫ���commit������
 �����÷ǳ��ؼ���
     ��ҪĿ����Ϊ������һ����
     ���ͬһ�����ݣ���ͬһʱ��ֻ����һ���˷��ʣ��Ͳ���������ݴ��ҵ������������ʵ����Ŀ�У��������
 �������ʣ����Ҫ��֤���ݵİ�ȫ������Ҫ�ķ�ʽ���Ǽ���
     �������ʱ��
     ������������ݿ�����
     ����ʽ����
     �ֲ�ʽ����
     Ϊ�����Ч�ʣ��п��ܶ����������ͬһ������ִ�У���ô���п��ܲ��ֳɹ�������ʧ�ܣ������������
  ����Ҫ����Ŀ���
  �������֤����Ļ����ͻ��������������ظ������ö��� 
 */
 
 
