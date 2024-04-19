create table professors( /* 테이블 만들기 */
    pcode char(3) primary key, /* 3칸이 정해지는 거임 값의 길이에 관계없이 = 자리수가 정해져있는거 ex) 주민번호, 학번 //// primary키가 꼭필요, 지정해놓고 중복되면 알아서 오류발생*/ 
    pname varchar(15), /* 데이터 내용까지만 저장 나머지는 자리차지x 자리가수가 정해져 있지 않은거 ex)영어이름*/
    dept varchar(30),
    hiredate date,
    title varchar(15),
    salary int
);

insert into professors(pcode,pname,dept,hiredate,title,salary)
values('221','이병렬','전산','75/04/03','정교수',3000000); /* int에 ,넣으면 데이터 안들어감.*/ /*ORA-00001: unique constraint (JAVA.SYS_C006987) violated => 프라이머리키가또있는데 또실행하면 오류임*/
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('228','이재광','전산','91/09/19','부교수',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('311','강승일','전자','94/06/09','부교수',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('509','오문환','건축','92/10/14','조교수',2000000);



select * from professors; /* 데이터 출력해주는 거  *= 모든 컬럼을 다보겠다.*/
select * from professors  where dept='전산'; /* 전산학과만 보기*/
select * from professors where pname like '이%'; /* 이씨 성만 보기 */
select * from professors where pcode like '%1%';  /* pcode에 1이 암튼 있는거 */
select * from professors order by pname; /* 가나다순으로 */
select * from professors order by salary asc; /* 오름차순 = ascending asc는 생략가능 기본이 오름차순*/
select * from professors order by salary desc; /* 내림차순 = descending desc는 생략불가 */ 
/* select pcode,pname from professors;  pcde랑 pname만 보기*/
select * from professors order by pcode;

delete from professors where pcode='221'; /* pcode ''인거 삭제하는거임 primary key라서만 삭제되는건아닌데 primary key로 지워야 안전하다. */
delete from professors where pcode is not null; /* pcode에서  null이 아닌거 다지움. */

/*drop table professors; 테이블 삭제하기*/

update professors set pname = '김병렬' where pcode = '221'; /* 업데이트 할건데 pname을 김병렬로 바꿀껀데 어디? pcode가 221인거 */
update professors set pname = '이병렬', dept = '전산' where pcode = '221'; /* 업데이트 할건데 pname을 김병렬로 dept를 컴정으로 바꿀껀데 어디? pcode가 221인거 */

commit; /*적용하기*/

select max(pcode)+1 as code from professors; /*  고른다 맥스 +1 as는 별명 별명은 code 이다.*/
/*SELECT FLOOR(RAND() * (SELECT MAX(pcode) FROM professors)) + 1 AS ran FROM professors;*/
select * from professors where pcode = ?; /* pcode가... ''인거 출력하기*/
/*SELECT MOD(ABS(DBMS_RANDOM.RANDOM),900) + 100 FROM professors;*/
select * from professors;
delete from professors where pcode = ?;

update professors set dept = '전자', hiredate='24/04/16', title='정교수', salary='4000000' where pcode='845';





