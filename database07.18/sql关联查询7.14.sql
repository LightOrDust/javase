--������ѯ
/*
select t1.c1,t2.c2 from t1,t2 where t1.c3=t2.c4
�ڽ������ӵ�ʱ�򣬿���ʹ�õ�ֵ��ѯ��Ҳ����ʹ�÷ǵ�����
*/
--��ѯ��Ա�����ƺͲ��ŵ�����
select ename,dname from emp,dept where emp.deptno =dept.deptno;
--��ѯ��Ա�����Լ��Լ���нˮ�ȼ�
select e.ename,e.sal, sg.grade from emp e,salgrade sg where e.sal between sg.losal and sg.hisal;
--��ֵ���ӣ��������а�����ͬ��������
--�ǵ�ֵ���ӣ���������û����ͬ������������ĳһ��������һ�б�ķ�Χ֮��
--�����ӣ�
select * from emp;
select * from dept;
--��Ҫ����Ա���е��������ݶ�������ʾ��
--û�й����������ݲ�����ʾ��������Ҫ�����ӣ�
--���ࣺ�������ӣ�������ȫ��������ʾ�����������ӣ����ұ��ȫ��������ʾ��
select * from emp e,dept d where e.deptno=d.deptno; --��ֵ����
select * from emp e,dept d where e.deptno=d.deptno(+);--��������
select * from emp e,dept d where e.deptno(+) =d.deptno;--��������
--�����ӣ���һ�ű��ɲ�ͬ�ı����������Լ������Լ�
--����Ա������������Ʋ������
select * from emp;
select e.ename,m.ename  from emp e,emp m where e.mgr=m.empno;
--�ѿ����������������ű����ǲ�ָ������������ʱ�򣬻���еѿ�������
--��������ܼ�¼����ΪM*N,һ�㲻Ҫʹ��
select * from emp e,dept d;
--92�ı������﷨��ʲô���⣿��
--��92�﷨���У����ű�������������ڷ���where�Ӿ��У�ͬʱwhere��Ҫ�Ա������������
--��ˣ��൱�ڽ��������������������ൽһ��̫���ˣ���˳�����99�﷨
--99�﷨
/*
CROSS JOIN
NATUAL JOIN
USING�Ӿ�
LEFT OUTER JOIN
RINGHT OUTER JOIN
FULL OUTER JOIN
INNER JOIN
*/
--cross join �൱��92�﷨�еĵѿ�����
select * from emp cross join dept;
--natural join �൱���ǵ�ֵ���ӣ�����ע�⣬����Ҫд����������������ű����ҵ���ͬ����������
--�������Ӵ���ֵû��
select * from emp e natural join dept d;
--�����ű��в�������ͬ��������ʱ�򣬻���еѿ�������������Ȼ���Ӹ�92�﷨����Ȼ����û���κι�ϵ
select * from emp e natural join salgrade sg;
--on �Ӿ䣬����������������������
--��������������൱��92�﷨�еĵ�ֵ����
select * from emp e join dept d on e.deptno=d.deptno; 
--�൱��92�﷨�еķǵ�ֵ���ӡ�
select * from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;
?--left outer join,�������е�ȫ������������ʾ���ұ�û�ж�Ӧ������ֱ����ʾ�ռ��ɣ�
select * from emp e left outer join dept d on e.deptno=d.deptno;
select * from emp e,dept d where e.deptno=d.deptno(+);
?--right outer join ,����ұ��е�ȫ������������ʾ�������û�ж�Ӧ�ļ�¼�Ļ���ʾ�ռ���
select * from emp e right outer join dept d on e.deptno=d.deptno;
select * from emp e right outer join dept d on e.deptno(+)=d.deptno;
?--full outer join ,�൱���������Ӻ��������ӵĺϼ���
select * from emp e full outer join dept d on e.deptno=d.deptno;
--inner outer join,���ű�����Ӳ�ѯ��ָ�Ӳ�ѯ����ƥ���¼������
select * from emp e inner join dept d on e.deptno=d.deptno;
select * from emp e join dept d on e.deptno =d.deptno;
--using ,���˿���ʹ��On��ʾ���������⣬Ҳ����ʹ��using��Ϊ������������ʱ�����������в��������κ�һ�ű�
select deptno from emp e join dept d using(deptno);
select e.deptno,d.deptno from emp e join dept d on d.deptno =d.deptno;
--�ܽ᣺�����﷨��SQL���û���κ����ƣ��ڹ�˾�п�������ʹ�ã����ǽ���ʹ��99�﷨����Ҫʹ��92�﷨��SQL�Ե��������

--������Ա���������ڵ�λ��нˮ�ȼ�
select e.ename,e.deptno,sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal; 
select e.ename,d.loc ,sg.grade from emp e join dept d on e.deptno=d.deptno join salgrade sg on  e.sal between sg.losal and sg.hisal;


/*�Ӳ�ѯ��Ƕ��������sql����е�����sql��䣬���Գ�֮Ϊ�Ӳ�ѯ
���ࣺ�����Ӳ�ѯ�������Ӳ�ѯ
*/

--����Щ�˵�нˮ����������Ա��ƽ��нˮ֮�ϵ�
--1������ƽ��нˮ
select avg(e.sal) from emp e;
--2���������˵�нˮ��ƽ��нˮ���Ƚ�
select e.ename from emp e where  e.sal>(select avg(sal) from emp);
select * from emp e where e.sal>(select avg(e.sal) from emp e);
--��ѯ��Щ���Ǿ�����
--1����ѯ���о����˱�ţ�
select  e.mgr from emp e;
--2���ڹ�Ա����й��˾����˱�ż���
select * from emp e where e.empno in (select distinct e.mgr from emp e );
--ÿ������нˮ��ƽ���ȼ�
--1����������ŵ�ƽ��нˮ
select e.deptno ,avg(e.sal) from emp e group by e.deptno;
