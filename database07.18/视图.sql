--�޸���ͨ�û�Ȩ�ޡ������ͨ�û���һ�˴�����ͼ�ǣ���ʾû��Ȩ�ޣ���Ҫʹ�ù���Աȥ�޸�Ȩ��
grant create view to scott;
--������ͼ
create view v_emp as select * from emp where deptno=30;
--��ͼ��ʹ��
select * from v_emp;
--����ͼ��������ݣ�ִ�гɹ�֮����Ҫ�ύ������ɫ��ʾ�ύ������������Ч����ɫ��ʾ�ع����������ݻָ�ԭ״
insert into v_emp(empno,ename ) values(1111,'����');
select * from emp
���ɾ��һ�� 
delete from  emp e where e.ename='����'; 

select * from emp;
--ֻ����ͼ���ֻ����ͼ������������ͼ�Ƿ�ֻ����ͼ�Ļ�������ͨ����ͼ����в������ݣ������ֻ����ͼ���򲻿��Բ���
create view v_emp2 as select * from emp with read only;
select * from v_emp2;
--ֻ����ͼ��ֻ����ͼֻ�ṩ��ѯ�������޷�������ɾ�Ĳ����
insert into v_emp2 (empno,ename) values (1234,'lisi')
--ɾ����ͼ
drop  view v_emp2;
select * from v_emp2;
--��ɾ����ͼ�е����ݵ�ʱ�����������Դ�����������ʱ���ܽ���ȫ��ɾ����ֻ��ɾ��һ�����е�����
--��ƽ��нˮ�ȼ���͵Ĳ��ŵĲ�������
--1�����ŵ�ƽ��нˮ
select e.deptno, avg(e.sal)  from emp e  group by e.deptno;

--2����ƽ��нˮ�ĵȼ�
select t.deptno, sg.grade gd from salgrade sg join ( select e.deptno,avg(e.sal) vsal from emp e group by e.deptno)t
  on t.vsal between sg.losal and sg.hisal;
 select * from salgrade;
 
 select t.deptno,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t
 on t.vsal between sg.losal and sg.hisal;   
 
--3����ƽ��нˮ�ĵȼ����

select min(t.gd) from ( select t.deptno,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t
 on t.vsal between sg.losal and sg.hisal) t;

--4����ƽ��нˮ�ĵȼ���͵Ĳ��ŵĲ�������
select d.dname,d.deptno from dept d join (select t.deptno,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno )t on t.vsal between sg.losal and sg.hisal) t on t.deptno=d.deptno
where t.gd=(select min(t.gd) from (select t.deptno ,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno ) t on t.vsal between sg.losal and sg.hisal)t);

--�鿴sql�����ܷ��֣�sql������кܶ��ظ���sql�Ӳ�ѯ������ͨ����ͼ���ظ��ĵ��������������
--������ͼ
create view v_deptno_grade as 
select t.deptno, sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal)vsal from emp e group by e.deptno) t on t.vsal between sg.losal and sg.hisal;     
select * from v_deptno_grade;
--ʹ����ͼ�滻
select d.dname,d.deptno from dept d join v_deptno_grade t on t.deptno=d.deptno where t.gd =(select min(t.gd) from v_deptno_grade t)
select * from emp e where e.deptno=10 or e.deptno=20;
select * from emp e where exists(select deptno  from dept d where (d.deptno=10  or d.deptno=20) and d.deptno=e.deptno );


