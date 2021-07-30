--数据更新  DML语言，在实际操作中，操作最多的是读取，删除和修改较少，数据更新值得是插入、修改和删除
--插入操作包括：元组值的出入 和查询结果的插入
--最基本的插入
--insert into tablename values(val1,val2,...)如果表明之后没有列，那么只能将所有的列插入
--insert ing tablename(col1,col2,....)value(valw,vals,...)可以指定向哪些列中插入数据
insert into emp values(1234,'haha','clerk',7904,to_date('2021-07-23','yyyy-mm-dd'),1000,500,10)
--向部分列中插入数据的时候，不是想向哪个列插入就能向哪个列插入，要遵循创建表的时候定义的规范
select * from emp;
insert into emp (empno,ename) values(3333,'wangwu');
--创建表的其他方式
--复制表的同时复制表数据，不会复制约束
create table emp2 as select * from emp;
--复制表结构但是不复制表中的数据，也不会复制约束
create table emp3 as select * from emp where 1=2;

select * from emp3;
drop  table emp2;
--如果有一个集合的数据，把集合中的所有数据都挨条插入，效率如何？在实际的操作中，很少会挨个插入，更多的是批量插入
--删除操作
--delete from tablename where condition
delete from emp2 where deptno =10;
--把整张数据清空
delete from emp2;
--truncate,跟delelte有不同，delete在删除经过事务，truncate不经过事务，无法回滚，虽然效率较高，但是不建议使用
truncate table emp2;
 --修改操作：
 --update tablename set col1=val1,col2=val2 where condition;
 --可以更新或修改满足条件的一个列或者多个列
 --更新单列
 update emp set ename ='heihei' where ename ='haha';
 select * from emp;
 --更新多列
 update emp set job='teacher',mgr=7905 where empno=3333;
 /*增删改是数据库的常用操作，在进行操作的时候都需要事务的保证，在pl/sql中，每次都要完成commit操作，
 事务变得非常关键：
     主要目的是为了数据一致性
     如果同一份数据，在同一时刻只能有一个人访问，就不会出现数据错乱的情况，但是在实际项目中，大多是是
 并发访问，如果要保证数据的安全，最主要的方式就是加锁
     事务的延时：
     最基本的是数据库事务
     声明式事务
     分布式事务
     为了提高效率，有可能多个操作会在同一事务中执行，那么就有可能部分成功，部分失败，基于这种情况
  就需要事务的控制
  如果不保证事务的话，就会造成脏读，不可重复读，幻读。 
 */
 
 
