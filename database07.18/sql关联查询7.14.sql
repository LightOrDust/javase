--关联查询
/*
select t1.c1,t2.c2 from t1,t2 where t1.c3=t2.c4
在进行连接的时候，可以使用等值查询，也可以使用非等连接
*/
--查询雇员的名称和部门的名称
select ename,dname from emp,dept where emp.deptno =dept.deptno;
--查询雇员名称以及自己的薪水等级
select e.ename,e.sal, sg.grade from emp e,salgrade sg where e.sal between sg.losal and sg.hisal;
--等值连接，两个表中包含相同的列名；
--非等值连接，两个表中没有相同的列名，但是某一个列在另一列表的范围之中
--外连接；
select * from emp;
select * from dept;
--需要将雇员表中的所有数据都进行显示，
--没有关联到的数据不会显示，此外需要外连接；
--分类：左外连接（把左表的全部数据显示）和右外连接（把右表的全部数据显示）
select * from emp e,dept d where e.deptno=d.deptno; --等值连接
select * from emp e,dept d where e.deptno=d.deptno(+);--左外连接
select * from emp e,dept d where e.deptno(+) =d.deptno;--右外连接
--自连接，将一张表当成不同的表来看待，自己关联自己
--将雇员和他经理的名称查出来；
select * from emp;
select e.ename,m.ename  from emp e,emp m where e.mgr=m.empno;
--笛卡尔积，当关联多张表，但是不指定连接条件的时候，会进行笛卡尔积，
--关联后的总记录条数为M*N,一般不要使用
select * from emp e,dept d;
--92的表连接语法有什么问题？？
--在92语法表中，多张表的连接条件会在方法where子句中，同时where需要对表进行条件过滤
--因此，相当于将过滤条件和连接条件揉到一起，太乱了，因此出现了99语法
--99语法
/*
CROSS JOIN
NATUAL JOIN
USING子句
LEFT OUTER JOIN
RINGHT OUTER JOIN
FULL OUTER JOIN
INNER JOIN
*/
--cross join 相当与92语法中的笛卡尔积
select * from emp cross join dept;
--natural join 相当与是等值连接，但是注意，不需要写连接条件，会从两张表中找到相同的列做连接
--但是连接处的值没有
select * from emp e natural join dept d;
--当两张表中不具有相同的列名的时候，会进行笛卡尔积操作，自然连接跟92语法的自然连接没有任何关系
select * from emp e natural join salgrade sg;
--on 子句，可以添加任意的连接条件，
--添加连接条件，相当于92语法中的等值连接
select * from emp e join dept d on e.deptno=d.deptno; 
--相当与92语法中的非等值连接。
select * from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;
?--left outer join,会把左表中的全部数据正常显示，右表没有对应的数据直接显示空即可；
select * from emp e left outer join dept d on e.deptno=d.deptno;
select * from emp e,dept d where e.deptno=d.deptno(+);
?--right outer join ,会把右表中的全部数据正常显示，左表中没有对应的记录的话显示空即可
select * from emp e right outer join dept d on e.deptno=d.deptno;
select * from emp e right outer join dept d on e.deptno(+)=d.deptno;
?--full outer join ,相当与左外连接和右外连接的合集；
select * from emp e full outer join dept d on e.deptno=d.deptno;
--inner outer join,两张表的连接查询，指挥查询出有匹配记录的数据
select * from emp e inner join dept d on e.deptno=d.deptno;
select * from emp e join dept d on e.deptno =d.deptno;
--using ,除了可以使用On表示连接条件外，也可以使用using作为连接条件，此时连接条件的列不在属于任何一张表
select deptno from emp e join dept d using(deptno);
select e.deptno,d.deptno from emp e join dept d on d.deptno =d.deptno;
--总结：两种语法的SQL语句没有任何限制，在公司中可以随意使用，但是建议使用99语法，不要使用92语法，SQL显的清除明了

--检索雇员姓名、所在单位、薪水等级
select e.ename,e.deptno,sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal; 
select e.ename,d.loc ,sg.grade from emp e join dept d on e.deptno=d.deptno join salgrade sg on  e.sal between sg.losal and sg.hisal;


/*子查询：嵌套在其他sql语句中的完整sql语句，可以称之为子查询
分类：单行子查询、多行子查询
*/

--有哪些人的薪水是在整个雇员的平均薪水之上的
--1、先求平均薪水
select avg(e.sal) from emp e;
--2、把所有人的薪水与平均薪水做比较
select e.ename from emp e where  e.sal>(select avg(sal) from emp);
select * from emp e where e.sal>(select avg(e.sal) from emp e);
--查询哪些人是经理人
--1、查询所有经理人编号；
select  e.mgr from emp e;
--2、在雇员编号中过滤经理人编号即可
select * from emp e where e.empno in (select distinct e.mgr from emp e );
--每个部门薪水的平均等级
--1、先求出部门的平均薪水
select e.deptno ,avg(e.sal) from emp e group by e.deptno;
