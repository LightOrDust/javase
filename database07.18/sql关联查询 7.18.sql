--������ѯ2��
-- ÿ������ƽ��нˮ�ĵȼ�
--1����������ŵ�ƽ��нˮ
select e.detpno,avg(e.sal) from emp e group by e.deptno;   
select e.deptno,avg(e.sal) from emp e group by e.deptno;
--2����нˮ�ǼǱ������������ƽ��нˮ�ĵȼ�
select t.deptno,sg.grade from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno)t
on t.vsal between sg.losal and sg.hisal;

--1����ƽ��нˮ��ߵĲ��ŵĲ��ű�ţ�
--���ŵ�ƽ��нˮ
select e.deptno,avg(e.sal) from emp e group by e.deptno;
--��ƽ��нˮ��ߵĲ���
select max(t.vsal) from (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t;
--���ű��
select t.deptno from (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t where 
t.vsal=(select max(t.vsal) from (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t
);
--2������ƽ��нˮ�ĵȼ�
--3������ƽ����нˮ�ȼ�
--����ÿ����нˮ�ȼ�
select e.deptno,sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;
--���ղ�����ƽ���ȼ�
select t.deptno,avg(t.grade) from (select e.deptno,sg.grade from emp e join salgrade sg on
e.sal between sg.losal and sg.hisal) t group by t.deptno;
--���������limit,mysql����������������ģ�����orcle�в���
--��orcal�У������Ҫʹ����������ͷ�ҳ���ܵĻ�������Ҫʹ��rownum,
--����rownum����ֱ��ʹ�ã���ҪǶ��ʹ��
--4����нˮ��ߵ�ǰ5����Ա
select * from (select * from emp e order by e.sal) t where rownum <=5


