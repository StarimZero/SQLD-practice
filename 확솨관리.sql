create table professors( --교수테이블 생성하기
     pcode char(3) not null, 
     pname varchar(15) not null, 
     dept varchar(30), 
     hiredate date, 
     title varchar(15), 
     salary int default 0, 
     primary key(pcode)
);

desc professors;
drop table professors;

create table students( --학생테이블 생성하기
 scode char(8) not null, 
 sname varchar(15) not null, 
 dept varchar(30),
 year int default 1, 
 birthday date, 
 advisor char(3), 
 primary key(scode), 
 foreign key(advisor) references professors(pcode) /* on delete cascade */
);

desc students;
drop table students;

create table courses( --강좌테이블생성하기
 lcode char(4) not null,
 lname varchar(50) not null, 
 hours int, room char(3),
 instructor char(3),
 capacity int default 0,
 persons int default 0, 
 primary key(lcode), /* constraint child_pk foreign key(instructor) references professors(pcode) */
 foreign key(instructor) references professors(pcode)
);

desc courses;
drop table courses;

create table enrollments( --수강신청테이블 생성하기
 lcode char(4) not null, 
 scode char(8) not null, 
 edate date, 
 grade int default 0,
 primary key(lcode, scode),
 foreign key(lcode) references courses(lcode), 
 foreign key(scode) references students(scode)
);

desc enrollments;
drop table enrollments;


insert into professors(pcode,pname,dept,hiredate,title,salary) values('221','이병렬','전산','75/04/03','정교수',3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('228','이재광','전산','91/09/19','부교수',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('311','강승일','전자','94/06/09','부교수',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('509','오문환','건축','92/10/14','조교수',2000000);

 -- select from where 적고 시작하기.
select * from professors; --교수 테이블의 모든 데이터를 검색하시오.
select pname, dept, title from professors; --교수 테이블에서 모든 교수의 이름, 소속학과, 직급을 검색하시오.
select dept from professors; --교수테이블에서 교수들의 소속학과를 검색하시오.
select distinct(dept) from professors; --교수 테이블에서 교수들이 근무하는 소속학과 이름을 검색하시오(단 , 중복 값은 제거하시오).
select pname, dept, hiredate from professors where hiredate < '93/03/01';--교수 테이블에서 '1993년3월1일' 이전에 임용된 교수들의 이름 소속학과, 임용날짜를 를 검색하시오.
select pcode, pname, title from professors where title = '정교수' or title = '부교수';--교수 테이블에서 직급이 정교수, 부교수인 교수들의 교수번호, 교수명, 직급을 검색
select pcode, pname, title from professors where title in ('정교수', '부교수'); --교수 테이블에서 직급이 정교수, 부교수인 교수들의 교수번호, 교수명, 직급을 검색


insert into students(scode,sname,dept,year,birthday,advisor) values('92414029','서연우','전산',3,'73/10/06','228');
insert into students(scode,sname,dept,year,birthday,advisor) values('92414033','김창덕','전산',4,'73/10/26','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514009','이지행','전자',4,'73/11/16','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514023','김형명','전자',4,'73/08/29','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92454018','이원구','건축',3,'74/09/30','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95454003','이재영','건축',4,'76/02/06','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95414058','박혜경','전산',4,'76/03/12','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('96414404','김수정','전산',3,'77/12/22','228');

select * from students;
select sname, scode, birthday from students where dept='전산' and year=3; --학생 테이블에서 '전산'이면서 '3'학년 학생들의 이름, 학번, 생년월일을 검색하시오.
select * from students where advisor != '221';--학생테이블에서 교수번호가 '221'인 교수가 지도하지 않는 학생들을 검색하시오.
select * from students where advisor <> '221';--학생테이블에서 교수번호가 '221'인 교수가 지도하지 않는 학생들을 검색하시오.
select scode, sname, birthday from students where dept = '전산' order by sname asc, birthday desc;--'전산'과 학생들의 학번, 이름, 생년월일을 이름을 기준으로 오름차순, = 이름이 같은경우에 -> 생년월일을 기준으로 내림차순 정렬을 하시오. 
select scode, sname, birthday, dept from students order by dept asc, birthday desc;--'전산'과 학생들의 학번, 이름, 생년월일을 이름을 기준으로 오름차순, = 이름이 같은경우에 -> 생년월일을 기준으로 내림차순 정렬을 하시오. 


insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C301','파일처리론', 3 ,'506','221',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C401','데이터베이스',3,'414','221',80,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C421','알고리즘',3,'510','228',80,72);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C312','자료구조',2,'510','228',100,60);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('E221','논리회로',3,'304','311',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('A109','한국의건축문화',2,'101','509',120,36);

select * from courses;
select lcode, lname, instructor, hours  from courses where lname like '%건축%'; --강좌 테이블에서 강좌이름이 건축이라는 단어를 포함하는 강좌의 강좌번호, 강좌이름, 담당교수, 강의시간수를 검색하시오





insert into enrollments(lcode, scode, edate, grade) values('C401','92414033','98/03/02',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414033','98/03/02',80);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414033','98/03/02', 0);
insert into enrollments(lcode, scode, edate, grade) values('C401','95414058','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C312','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C421','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414029','98/03/03',0);
insert into enrollments(lcode, scode, edate, grade) values('C312','92414029','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('E221','92414029','98/03/03',75);
insert into enrollments(lcode, scode, edate, grade) values('A109','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514009','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('E221','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C401','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C421','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C312','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('E221','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('A109','95454003','98/03/05',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','95454003','98/03/05',83);
insert into enrollments(lcode, scode, edate, grade) values('E221','95454003','98/03/05',75);

select lcode, scode, grade from enrollments where grade >=80;--수강신청 테이블에서 성적이 80점이상인 과목번호, 학생번호, 점수를 검색
select lcode, scode, edate from enrollments where edate between '98/03/01' and '98/03/03'; --수강신청 테이블에서 1998년 3월 1일에서 3월3일 사이에 수강신청 한 강좌번호, 학생번호, 수강신청일을 검색하시오.



select * from enrollments order by scode;
select count(*) from enrollments; -- 테이블에 값이 몇개 있는지 알려주는거 

select s.dept, sname, pname from students s, professors p  where advisor=pcode; /*학생들의 학과, 학생이름, 지도교수이름을 검색하시오. = 조인 같은거조인 = 이너조인  */
select lcode, lname, pname from courses, professors where instructor = pcode; /*강좌번호, 강좌명, 교수이름을 검색하시오.*/
select s.scode, sname, lcode, edate from enrollments e, students s where s.scode=e.scode order by scode;/*학번, 학생이름, 학생들이 수강신청 한 강좌번호, 수강신청일을 검색하시오*/
select s.scode, sname, c.lcode, c.lname, e.grade from enrollments e, students s, courses c  where s.scode=e.scode and c.lcode=e.lcode order by grade; /*학번, 학생들이 수강신청 한 강좌번호, 강좌명, 성적을 검색하시오.*/
create view view1 as select s.scode, sname, c.lcode, c.lname, e.grade from enrollments e, students s, courses c  where s.scode=e.scode and c.lcode=e.lcode order by grade; -- view 만들기
select * from view1; -- view로보기
drop view view1;

 /*'이병렬'과 교수가 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오*/
select sname, year, birthday from students, professors where pcode=advisor and pname='이병렬';
/*'98/03/03'에 수강신청 한 학생들의 학번, 학생이름, 강좌번호를 검색하시오.*/
select s.scode, s.sname, c.lcode from enrollments e, courses c, students s where e.lcode=c.lcode and e.scode=s.scode ;
/*'전산'과 교수들이 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오.*/
select sname, year, birthday from students s, professors p where pcode=advisor and p.dept='전산';
/*자료구조'를 강의하는 교수의 학과명, 교수 명을 검색하시오.*/
select dept, pname from professors p, courses c where  p.pcode=c.instructor and c.lname='자료구조'; 
 /*'파일처리론'을 수강신청 한 학생들의 학번, 수강신청일, 점수를 검색하시오.*/
select e.scode, e.edate, e.grade from courses c, enrollments e where e.lcode=c.lcode and c.lname = '파일처리론';
/*'자료구조' 과목을 수강신청 한 학생들의 학과, 학생이름, 성적을 검색하시오.*/
select s.dept, s.sname, e.grade from students s, enrollments e, courses c where e.scode=s.scode and c.lcode=e.lcode and c.lname = '자료구조'; 
 /*'전자과' 학생들의 학번, 학생이름, 수강신청 한 강좌번호, 강좌 명, 성적을 검색하시오.*/
select s.scode, s.sname, c.lcode, c.lname, e.grade from students s, enrollments e, courses c where e.scode = s.scode and e.lcode = c.lcode and dept = '전자';
/*'파일처리론'을 강의하는 교수의 이름, 이 교수가 지도하는 학생들의 학번, 학생명을 검색하시오.*/
select p.pname, s.scode, s.sname from courses c, students s, professors p  where c.instructor = p.pcode and s.advisor = p.pcode and  c.lname = '파일처리론'; 
/*'데이터베이스'를 강의하는 교수명, 이 과목을 수강신청 한 학생들의 학과, 이름, 성적을 검색하시오.*/
select p.pname, s.dept, s.sname, e.grade from courses c, students s, enrollments e, professors p where p.pcode = c.instructor and c.lcode = e.lcode and e.scode = s.scode and c.lname = '데이터베이스'; 
/*성적이 80점 이상인 학생들의 학번, 학생이름, 강좌번호, 강좌명, 담당교수 명을 검색하시오.*/
select s.scode, s.sname, c.lname, c.instructor from courses c, students s, enrollments e, professors p where p.pcode = c.instructor and c.lcode = e.lcode and e.scode = s.scode and grade >= 80 ; 
