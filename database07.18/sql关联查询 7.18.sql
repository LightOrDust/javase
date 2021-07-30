--关联查询2；
-- 每个部门平均薪水的等级
--1、先求出部门的平均薪水
select e.detpno,avg(e.sal) from emp e group by e.deptno;   
select e.deptno,avg(e.sal) from emp e group by e.deptno;
--2、跟薪水登记表做关联，求出平均薪水的等级
select t.deptno,sg.grade from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno)t
on t.vsal between sg.losal and sg.hisal;

--1、求平均薪水最高的部门的部门编号；
--求部门的平均薪水
select e.deptno,avg(e.sal) from emp e group by e.deptno;
--求平均薪水最高的部门
select max(t.vsal) from (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t;
--求部门编号
select t.deptno from (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t where 
t.vsal=(select max(t.vsal) from (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t
);
--2、求部门平均薪水的等级
--3、求部门平均的薪水等级
--求部门每个人薪水等级
select e.deptno,sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;
--按照部门求平均等级
select t.deptno,avg(t.grade) from (select e.deptno,sg.grade from emp e join salgrade sg on
e.sal between sg.losal and sg.hisal) t group by t.deptno;
--限制输出，limit,mysql中用来做限制输出的，但是orcle中不是
--在orcal中，如果需要使用限制输出和分页功能的话，必须要使用rownum,
--但是rownum不能直接使用，需要嵌套使用
--4、求薪水最高的前5名雇员
select * from (select * from emp e order by e.sal) t where rownum <=5


