--修改普通用户权限。如果普通用户第一此创建视图是，提示没有权限，就要使用管理员去修改权限
grant create view to scott;
--创建视图
create view v_emp as select * from emp where deptno=30;
--视图的使用
select * from v_emp;
--向视图中添加数据，执行成功之后，需要提交事务，绿色表示提交事务，让数据生效，红色表示回滚事务，让数据恢复原状
insert into v_emp(empno,ename ) values(1111,'张三');
select * from emp
如何删除一行 
delete from  emp e where e.ename='张三'; 

select * from emp;
--只读视图与非只读视图：如果定义的视图是非只读视图的话，可以通过视图向表中插入数据，如果是只读视图，则不可以插入
create view v_emp2 as select * from emp with read only;
select * from v_emp2;
--只读视图：只读视图只提供查询的需求，无法进行增删改查操作
insert into v_emp2 (empno,ename) values (1234,'lisi')
--删除视图
drop  view v_emp2;
select * from v_emp2;
--当删除视图中的数据的时候，如果数据来源与多个基表，则此时不能进行全部删除，只能删除一个表中的数据
--求平均薪水等级最低的部门的部门名称
--1、求部门的平均薪水
select e.deptno, avg(e.sal)  from emp e  group by e.deptno;

--2、求平均薪水的等级
select t.deptno, sg.grade gd from salgrade sg join ( select e.deptno,avg(e.sal) vsal from emp e group by e.deptno)t
  on t.vsal between sg.losal and sg.hisal;
 select * from salgrade;
 
 select t.deptno,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t
 on t.vsal between sg.losal and sg.hisal;   
 
--3、求平均薪水的等级最低

select min(t.gd) from ( select t.deptno,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno) t
 on t.vsal between sg.losal and sg.hisal) t;

--4、求平均薪水的等级最低的部门的部门名称
select d.dname,d.deptno from dept d join (select t.deptno,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno )t on t.vsal between sg.losal and sg.hisal) t on t.deptno=d.deptno
where t.gd=(select min(t.gd) from (select t.deptno ,sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal) vsal from emp e group by e.deptno ) t on t.vsal between sg.losal and sg.hisal)t);

--查看sql语句就能发现，sql语句中有很多重复的sql子查询，可以通过视图将重复的的语句给抽离出来，
--创建视图
create view v_deptno_grade as 
select t.deptno, sg.grade gd from salgrade sg join (select e.deptno,avg(e.sal)vsal from emp e group by e.deptno) t on t.vsal between sg.losal and sg.hisal;     
select * from v_deptno_grade;
--使用视图替换
select d.dname,d.deptno from dept d join v_deptno_grade t on t.deptno=d.deptno where t.gd =(select min(t.gd) from v_deptno_grade t)
select * from emp e where e.deptno=10 or e.deptno=20;
select * from emp e where exists(select deptno  from dept d where (d.deptno=10  or d.deptno=20) and d.deptno=e.deptno );


