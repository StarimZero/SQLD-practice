use nodedb;

create table users(
	uid varchar(20) not null primary key,
    upass varchar(200) not null,
    uname varchar(100) not null,
    udate datetime default now()
);

insert into users(uid, upass, uname)
values('blue', 'pass', '차가운남자');
insert into users(uid, upass, uname)
values('sky', 'pass', '넓은남자');
insert into users(uid, upass, uname)
values('red', 'pass', '불꽃남자');
insert into users(uid, upass, uname)
values('white', 'pass', '순백남자');
insert into users(uid, upass, uname)
values('black', 'pass', '검은남자');

drop table users;
select * from users;

select * from users where uid='blue'; /*로그인할때 있으면 이제 패스워드가 일치하는지 비교 */

/* 게시판 만들기이 */

create table posts(
	pid int auto_increment primary key,
	title varchar(500) not null,
	contents text, /*text는 한 2000자 된다. */
    writer varchar(20) not null,/* uid와 같게 할거기때문에 타입을 맞춰줘야한다.*/
    pdate datetime default now(),
    foreign key(writer) references users(uid)
);

desc posts;

desc posts;
insert into posts(title, contents, writer)
value('우래옥 평양냉면 맛집 예약 주차 대기','주소: 서울 중구 창경궁로 62-29(주교동 118-1번지) 전화: 02-2265-0151~2 영업시간: 11:30~21:00 (라스트 오더-20:40), 매주 월요일 정기휴무 우래옥은 평양냉면뿐 아니라 불고기, 육회, 등심, 갈비 맛집으로도 유명해요. 우래옥 메뉴판 우래옥 메뉴판 가장 마음에 드는 것은 모든 재료를 국내산으로만 사용합니다.','blue');

insert into posts(title, contents, writer)
value('아이브 장원영 나이정보, 프로필','출생일 및 나이 장원영은 2004년 8월 31일에 태어났으며, 현재 2023년 3월 기준으로 18세입니다. 양력 음력 생일 장원영의 양력 생일은 2004년 8월 31일이며, 음력으로는 2004년의 244번째 날인 35번째 화요일에 해당됩니다. 장원영 프로필 소속사 장원영은 스타쉽엔터테인먼트 소속으로 활동하고 있습니다. ','sky');

insert into posts(title, contents, writer)
value('[미국여행] 뉴욕 맨해튼 센트럴파크 여행코스 TOP10','[미국여행] 뉴욕 맨해튼 센트럴파크 여행코스 TOP10 [미국여행] 뉴욕 맨해튼 센트럴파크 여행코스 TOP10 에 대해 리뷰하려고 합니다. 센트럴파크 : 뉴욕 맨해튼의 대표 도심파크 센트럴 파크 Central Park 는 뉴욕 맨해튼 의 어퍼 웨스트사이드 와 어퍼 이스트 사이드 사이에 있는 도시공원으로, 미국 최초의 조경 공원','red');

insert into posts(title, contents, writer)
value('기아 주가 전망 배당금 기업분석','이 글은 기아 주가 전망, 목표 주가, 기업 정보에 대해 설명합니다. 주식 투자에서 핵심은 미래의 기업 가치를 예측하고 선제적으로 움직이는 것입니다. 투자 대상을 결정하기 전에 현재 기업의 상황과 수치를 검토하는 것이 필요합니다. 기아 주식의 주요 상황과 투자 정보를 확인하고, 주식 투자에 도움이 되는 자료들','white');

insert into posts(title, contents, writer)
value('서부간선도로 공사, 차선 폭 변경, 일반도로화 누구를 위한 공사인가?','디지털단지 부근의 차량들이 서부간선도로 진입을 위해 뒤엉키는 구간은 수출의 다리와 독산역에서 광명시로 이어지는 철산대교 부근이다. ​ 그래서 뚝방길에서...있는 진입로 마저 일반도로화 과정에서 폐쇄하는 듯 하다. ​ 지금도 정체 구간인 수출의 다리나 철산대로로 우회하여 진입해야 하는 상황이다.','black');

insert into posts(title, contents, writer)
value('20년 만에 다시 와본 감동의 평양냉면 을밀대','을밀대 평양냉면 서울특별시 마포구 숭문길 24 회상 시간은 바야흐로 20년 전 공덕은 재개발 지정구역(?)이었기에 주거민이 매우 적었었고 래미안 아파트가 신축 건물이었고 그 옆엔 상록아파트 더 위엔 달동네가 존재했고(내가 살던) 새로 지어진 마포문화센터에서 뛰어놀며 병설유치원과 용강초등학교를 다녔던 그.','blue');

insert into posts(title, contents, writer)
value('서울 지상철도 71.6km 지화화 잰걸음…개발구상안 착수','성남1구역 등 1,800여 가구 일반 분양 대전 분양시장 내달부터 성남1구역, 문화2구역, 봉명동 주상복합 등 분양 예고 k-buildnews.com ′오세훈표 모아주택 1호′ 착공…광진구 한양연립, 215세대 공급 통합심의 이후 8개월만…원주민 전원 재정착아파트 4개동·지하 주차장 등 부대복리시설','blue');

insert into posts(title, contents, writer)
value('[서울/독산] 진영면옥 독산동 먹을텐데 평냉 맛집 내돈내산 주말 점심 웨이팅 후기','성시경 덕분에 더욱 유명해져서 저번에 왔다가 그냥 돌아간 그집 날씨도 좀 서늘해져서 이젠 좀 갈만하겠지 하고 바이크 타고 달려왔다 그렇다고 한다 가격은 준수하다 따뜻한 면수를 준다 홀이 자그마하다 육수가 면을 풀지않고 마셨을 때 꽤 괜찮다 이 정도면 탑급인데 하고 느꼈을 정도 면을 풀고 다시 육수를 마셨을.','blue');

insert into posts(title, contents, writer)
value('2024년 3월 미국 장단기 금리차 정보','미국의 장단기 금리차는 경제 상황을 예측하고 평가하는 데 중요한 지표 중 하나입니다. 이 글에서는 미국의 장단기 금리차가 경제적으로 어떤 의미를 갖는지에 대해 알아보겠습니다. 장단기 금리차란 무엇인가요? 장단기 금리차는 장기와 단기 간의 이자율 차이를 의미합니다. 일반적으로, 장기 이자율이 단기 이자율.','white');

insert into posts(title, contents, writer)
value('뉴진스 민희진 하이브 갈등, 하이브 주가 하락 (민희진 프로필)','SM엔터테인먼트 Creative Director (2002년 ~ 2019년) - HYBE CBO (2019년 ~ 2021년) - 현) ADOR 로고(설립자 겸 CEO) ▶ 결혼: 미혼 방시혁,민희진 -하이브 뉴진스 민희진 갈등 상황 2024년 04월 22일 ‘뉴진스맘‘ 민희진 어도어 대표의 소속사 독립시도로 연예계가 떠들썩 합니다. 하이브의 하위 레이블이자, ','sky');



select * from posts;

select *, date_format(pdate, '%y-%m-%d %T') fdate from posts;

select date_format(create_date, '%y-%m-%d') as create_date 
from test;

insert into posts(title,contents,writer)
select title,contents,writer from posts;
/*두문장을 합치면 셀렉트해서 인설트하라는것.*/

select count(*) from posts;

select * from posts order by pid desc;

select * from posts order by pid desc limit 0, 3; /* 0번 인덱스부터 3개  까지만 가져오겠따 */

delete from posts where pid>140;

desc users;

alter table users add column phone varchar(20);/*테이블 변경하기 */
alter table users modify column phone varchar(30); /*테이블 만든거 변경하기*/
alter table users add column add1 varchar(100);/*테이블 변경하기 */
alter table users add column add2 varchar(100);/*테이블 변경하기 */



