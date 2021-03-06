--sql虐我千百变，我待sql如初恋。7.29对sql语句发起攻击，不知道今天能攻占多少阵地。oracle 有5道，mysql也有50道
--（1）查询20号部门的所有员工信息。easy
select * from emp e where  e.deptno=20;
--??（2）查询所有工种为CLERK的员工的工号、员工名和部门名。medium??
--select e.empno,e.ename,e.deptno from emp e where job='clerk';
--非数字的字段要区分大小写，否则无效
select e.empno,e.ename,e.deptno from emp e where  e.job = 'CLERK';
select e.empno,e.ename,e.deptno from emp e where e.job like 'CLERK';
select e.empno,e.ename,e.deptno from emp e where e.job like 'CLERK'
select * from emp
--（3）查询奖金（COMM）高于工资（SAL）的员工信息。easy
select * from emp e where comm>sal
--（4）查询奖金高于工资的20%的员工信息。 easy
select * from emp e where comm>sal*0.2
--??（5）查询10号部门中工种为MANAGER和20号部门中工种为CLERK的员工的信息。
select * from emp e where (e.deptno=10 and e.job like 'MANAGER') or (e.deptno=20 and e.job  like 'CLERK');
select * from emp e where (e.deptno=10 and e.job ='MANAGER') or (e.deptno=20 and e.job ='CLERK');
select * from emp e where (e.deptno=10 and e.job='MANAGER') or (e.deptno=20 and e.job='CLERK');
--1、工资大于或等于2000的员--（6）查询所有工种不是MANAGER和CLERK，且工资大于或等于2000的员工的详细信息。
工的详细信息
select * from emp where job not in ('MANAGER' ,' CLERK') and sal>=2000;
select * from emp where job not in ('MANAGER','CLERK') and sal>=2000;
select * from emp where job not in ('MANAGER','CLERK') and sal>=2000;
--（7）查询有奖金的员工的不同工种。easy
select job from emp where comm is not null or comm!=0.00 group by job;
select distinct job from emp where comm is not null
select distinct job from emp where comm is not null
select distinct job from emp where comm is not null
--（8）??查询所有员工de工资奖金和。
select sum(e.sal),sum(e.comm) from emp e 
--select sum(sum(e.sal),sum(e.comm)) from emp e,没有办法横向相加
select ename,(sal+nvl(comm,0)) salcomm from emp;
select ename ,(sal+nvl(comm,0)) salcomm from emp
select ename,(sal+nvl(comm,0)) salcomm from emp
--（9）查询没有奖金或奖金低于100的员工信息。
select * from emp e where (comm is null or comm<100)
--（10）查询各月倒数第2天入职的员工信息。
select * from emp e where hiredate in (select (last_day(hiredate)-5)from emp ) ;
select * from emp e where hiredate in (select (last_day(hiredate)-1) from emp);
select * from emp e where hiredate in (select (last_day(hiredate)-5) from emp);
select * from emp e where hiredate in (select (last_day(hiredate)-5) from emp);
select * from emp;
select add_month(hiredate,2),hiredate from emp;
select months_between(sysdate,hiredate) from emp;
--??（11）查询员工工龄大于或等于10年的员工信息。
select * from emp where (sysdate -hiredate)>=10;
select * from emp where (sysdate-hiredate)>=10;
select * from emp where (sysdate-hiredate)>=10;
--（12）查询员工信息，要求以首字母大写的方式显示所有员工的姓名。
select upper(substr(ename,1,1))||lower(substr(ename,2,length(ename)-1)) from emp;
select upper(substr(ename,1,1))||lower(substr(ename,2,length(ename)-1)) from emp;
select  upper(substr(ename,1,1))|| lower(substr(ename,2,length(ename)-1)) from emp;
--（13）查询员工名正好为6个字符的员工的信息。
select * from emp where length(ename)=6;
select * from emp where length(ename)=6;
select * from emp where length(ename)=6;
--（14）查询员工名字中不包含字母“S”员工。
select * from emp where ename not in (select  ename from emp where ename  like '%S%');
select * from emp where ename not in (select ename from emp where ename like '%S%');
select * from emp where ename not in (select ename from emp where ename like'%S%');
--（15）查询员工姓名的第2个字母为“M”的员工信息。
select * from emp where ename like '_M%';
select * from emp where ename like '__M%';
select * from emp where ename like '_M%';
--（16）查询所有员工姓名的前3个字符。
select substr(ename,1,3)from emp;
select substr(ename,1,4)from emp;
select substr(ename,1,5) from emp;
--（17）查询所有员工的姓名，如果包含字母“s”，则用“S”替换。
select replace(ename,'S','s') from emp;
select replace(ename,'S','s') from emp;
select replace(ename,'S','s') from emp;
select * from emp
--（18）查询员工的姓名和入职日期，并按入职日期从先到后进行排列。
select e.ename,e.hiredate from emp e order by  hiredate asc;
select e.ename,e.hiredate from emp e order by hiredate asc;
select e.ename,e.hiredate from emp e order by hiredate asc;
--（19）显示所有的姓名、工种、工资和奖金，按工种降序排列，若工种相同则按工资升序排列。
select e.ename,e.job,e.sal,e.comm from emp e order  by job desc,  sal asc
select e.ename,e.job,e.sal,e.comm from emp e order by job desc,sal asc
select ename,job,sal,comm from emp order by job desc,sal asc
--（20）显示所有员工的姓名、入职的年份和月份，若入职日期相同按所在的月份排序，若月份相同则按入职的年份排序。
select ename, to_char(hiredate,'YYYY')||'-'||to_char(hiredate,'MM') from emp order by to_char(hiredate,'YYYY'),to_char(hiredate,'MM')
select ename,to_char(hiredate,'YYYY')||'-'||to_char(hiredate,'MM') from emp order by to_char(hiredate,'MM'),to_char(hiredate,'YYYY')
select ename,to_char(hiredate,'YYYY')||'-'||to_char(hiredate,'MM') from emp order by to_char(hiredate,'MM'), to_char(hiredate,'YYYY')
**--（31）查询最低工资低于2000的部门及其员工信息。
select * from emp where deptno in (select deptno from (select min(sal) min_sal,deptno from emp group by deptno) where min_sal < '2000') ;

select * from emp where deptno in (select deptno from (select min(sal) min_sal,deptno from emp group by deptno) where min_sal<2000); 
--（32）查询在SALES部门工作的员工的姓名信息。
select ename from emp e where job = 'SALESMAN';
select * from emp where deptno=(select deptno from dept where dname = 'SALES')
select * from emp where deptno=(select deptno from dept where dname='SALES')
select * from emp where deptno=(selcet deptno from dept where dname='SALES')
--（33）查询工资高于公司平均工资的所有员工信息。
1、公司的平均工资
select avg(sal) from emp 
2、
select * from emp e where e.sal> (select avg(sal) from emp )
--（34）查询与SMITH员工从事相同工作的所有员工信息。
select job from emp where ename='SMITH'
select * from emp where job=(select job from emp where ename='SMITH') and ename not like 'SMITH'
select * from emp where job in (select job from emp where ename like 'SMITH') and ename not like 'SMITH' ;
--（35）列出工资等于30号部门中某个员工工资的所有员工的姓名和工资。
select sal from emp where deptno=30
select ename,sal from emp where sal=any(select sal from emp where deptno=30)
select ename,sal from emp where sal =any (select sal from emp where deptno = 30) ;
--（36）查询工资高于30号部门中工作的所有员工的工资的员工姓名和工资。
 select max(sal) from emp where deptno=30;
 select ename ,sal from emp where sal > (select max(sal) from emp where deptno=30)
 select ename,sal from emp where sal >all (select sal from emp where deptno = 30) ;
**（37）查询每个部门中的员工数量、平均工资和平均工作年限。
员工数量？
--平均工资
select deptno,avg(sal),avg(sysdate-hiredate) from emp group by deptno
select dname,count,avg_sal,avg_date from dept join (select count(*) count,avg(sal) avg_sal,avg((sysdate-hiredate)/365) avg_date,deptno from emp group by deptno) t on dept.deptno = t.deptno ;
select count(*) count, avg(sal) avg_sal,avg((sysdate-hiredate)/365 ) avg_date,deptno from emp group by deptno
select dname,count,avg_sal,avg_date from dept join (select count(*) count,avg(sal) avg_sal,avg((sysdate-hiredate)/365) avg_date,deptno from emp group by deptno) t on dept.deptno0=t.deptno;
select danme,count,avg_
**（38）查询从事同一种工作但不属于同一部门的员工信息。
select * from emp
select distinct t1.empno,t1.ename,t1.deptno from emp t1 join emp t2 on t1.job like t2.job and t1.deptno <> t2.deptno ;
select distinct t1.empno,t1.ename,t1.deptno from emp t1 join emp t2 on t1.job like t2.job and t1.deptno <> t2.deptno;
select distinct t1.empno,ti.ename,t1.deptno from emp t1 join emp t2 on t1.job like t2.job and t2.deptno <> t2.deptno;
--（39）查询各个部门的详细信息以及部门人数、部门平均工资。(需要链表查询)
Select dept.*,person_num,avg_sal from dept,(select count(*) person_num,avg(sal) avg_sal,deptno from emp group by deptno) t where dept.deptno = t.deptno ;
select count(*) person_num,avg(sal),deptno from emp group by deptno 
select dept.*,person_num,avg_sal from dept,(select count(*) person_num,avg(sal)avg_sal,deptno from emp group by deptno) t where dept.deptno=t.deptno;
select dept.*,person_num,avg_sal from dept,(select count(*)person_num,avg(sal)avg_sal,deptno from emp group by deptno) t where dept.deptno=t.deptno;
select dept.* ,person_num,avg_sal from dept,(select count(*) person_num,avg(sal) avg_sal,deptno from emp group by deptno) t where dept.deptno=t.deptno;
--（40）查询各种工作的最低工资。
select  job,min(sal) from emp group by job

--（41）查询各个部门中的不同工种的最高工资。
select max(sal),deptno,job from emp group by deptno,job  order by deptno,job
select max(sal),deptno,job from emp group by deptno,job order by deptno,job
select max(sal),deptno,job from emp group by deptno,job ordere by deptno,job
--（42）查询10号部门员工以及领导的信息。
select * from emp where empno in  (select mgr from emp where deptno=10 ) or deptno=10;
select * from emp where empno in (select mgr from emp where deptno =10) or deptno=10;
select * from emp where empno in (select mgr from emp where deptno =10) or deptno=10
--（43）查询各个部门的人数及平均工资。
select deptno,count(*),avg(sal) from emp group by deptno;
--（44）查询工资为某个部门平均工资的员工信息。
某部门的平均工资
select avg(sal) from emp group by deptno;
select * from emp e where  e.sal=any( select avg(sal) from emp group by deptno);
select * from emp where sal in (select avg(sal) avg_sal from emp group by deptno) ;
--（45）查询工资高于本部门平均工资的员工的信息。
select emp.* from emp join (select deptno,avg(sal) avg_sal from emp group by deptno) t on emp.deptno=t.deptno and sal>avg_sal ;
select * from emp join (select deptno,avg(sal)avg_sal from emp group by deptno) t on emp.deptno=t.deptno and sal>avg_sal;
select * from emp join (select deptno,avg(sal)avg_sal from emp group by deptno) t on emp.deptno=t.deptno and sal>avg_sal;
--（46）查询工资高于本部门平均工资的员工的信息及其部门的平均工资。
select emp.*,avg_sal from emp join (select deptno,avg(sal) avg_sal from emp group by deptno) t on emp.deptno=t.deptno and sal>avg_sal ;
select emp.*,avg_sal from emp join (select deptno,avg(sal) avg_sal from emp group by deptno) t on emp.deptno=t.deptno and sal>avg_sal;
select emp.*,avg_sal from emp join (select deptno,avg(sal) avg_sal from emp group by deptno )t on emp.detpno=t.deptno and sal>avg_sal;
--（47）查询工资高于20号部门某个员工工资的员工的信息。
 select * from emp where sal> any(select e.sal from emp e where deptno=20)
 select * from emp 
--（48）统计各个工种的人数与平均工资。
select job,count(*) ,avg(sal) from emp group by job
--（49）统计每个部门中各个工种的人数与平均工资。
select  deptno,job,count(*) ,avg(sal) from emp group by deptno, job order by deptno,job
--（50）查询工资、奖金与10 号部门某个员工工资、奖金都相同的员工的信息。
select emp.* from emp join (select sal,comm from emp where deptno = 10) t on emp.sal=t.sal and nvl(emp.comm,0)=nvl(t.comm,0) and emp.deptno != 10;
select emp.* from emp join(select sal,comm from emp where deptno=10) t on emp.sal=t.sal and nvl(emp.comm,0)=nvl(t.comm,0) and emp.deptno!=10;
select emp.* from emp join(select sal,comm from emo where deptno=10) t on emp.sal=t.sal and nvl(emo.comm,0)=nvl(t.comm,0) and emp.deptno!=10;
--（51）查询部门人数大于5的部门的员工的信息。
 select * from emp where deptno in (select deptno from emp  group by deptno having count(*)>5);
 select * from emp where deptno in(select deptno from emp group by deptno having count(*)>5);
 select * from emp where deptno in(select deptno from emp group by deptno having count(*)>5)
--（52）查询所有员工工资都大于1000的部门的信息。
  select * from dept where deptno in (select distinct deptno from emp where deptno not in (select distinct deptno from emp where  sal<1000));
  select * from dept where deptno in (select distinct deptno from emp where deptno not in(select distinct deptno from emp where sal<1000));
   select * from dept where deptno in (select distinct deptno from emp where deptno not in (select deptno from emp where sal<1000))
--（53）查询所有员工工资都大于1000的部门的信息及其员工信息。
select * from emp join dept on dept.deptno in (select distinct deptno from emp where deptno not in (select distinct deptno from emp where sal < 1000)) 
and dept.deptno=emp.deptno;
select * from emp join dept on dept.deptno in (select distinct deptno from emp where deptno not in (select distinct deptno from emp where sal<1000))
and dept.deptno=emp.deptno;
select * from emp join dept on dept.deptno in(select distinct deptno from emp where deptno not in (select distinct deptno from emp where sal<1000))
and dept.deptno=emp.deptno;
**--（54）查询所有员工工资都在900~3000之间的部门的信息。
   select * from dept where deptno in (select distinct deptno from emp where deptno not in (select distinct deptno from emp where sal not between 900 and 3000)) ;
   select * from dept
**--（55）查询所有工资都在900~3000之间的员工所在部门的员工信息。
select * from emp where deptno in (select distinct deptno from emp where deptno not in (select distinct deptno from emp where sal not between 900 and 3000)) ;
（56）查询每个员工的领导所在部门的信息。

（57）查询人数最多的部门信息。
（58）查询30号部门中工资排序前3名的员工信息。
（59）查询所有员工中工资排在5~10名之间的员工信息。

88（60）向emp表中插入一条记录，员工号为1357，员工名字为oracle，工资为2050元，部门号为20，入职日期为2002年5月10日。
insert into emp (empno,ename,sal,deptno,hiredate) values( 1357,'oracle',2050,20, to_date('2002-02-10','YYYY-MM-DD'));
insert into emp(empno,ename,sal,deptno,hiredate) values (1357,'oracle',2050,20,to_date('2002年5月10日','yyyy"年"mm"月"dd"日"')) ;
（61）向emp表中插入一条记录，员工名字为FAN，员工号为8000，其他信息与SMITH员工的信息相同。

（62）将各部门员工的工资修改为该员工所在部门平均工资加1000。
