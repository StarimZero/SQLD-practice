create table tb(
     SEQ char(3) not null,
     COL1 varchar(15),
     COL2 varchar(15), 
     primary key(SEQ)
);

desc tb;

select * from tb; 
// 정처기 2022년 기출 // 
insert into tb(SEQ, COL1) values(1,2);
insert into tb(SEQ, COL1, COL2) values(2,3,6);
insert into tb(SEQ, COL2) values(3,5);
insert into tb(SEQ, COL1, COL2) values(4,5,3);
insert into tb(SEQ, COL1, COL2) values(5,6,3);

select count(col2)
from tb
where COL1 in(2,3) or col2 in(3,5);