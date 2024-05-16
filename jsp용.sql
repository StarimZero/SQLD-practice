drop table users;

create table users(
	uid varchar(20) not null primary key,
    upass varchar(200) not null, /*암호화시 길어지기때문에 */
    uname varchar(100) not null,
    phone varchar(20),
	add1 varchar(500),
	add2 varchar(500),
	photo varchar(200),
	jdate datetime default now()
);

insert into users(uid, upass, uname)
values('red', 'pass', '붉꽃남자');
insert into users(uid, upass, uname)
values('blue', 'pass', '차가운남자');
insert into users(uid, upass, uname)
values('white', 'pass', '순백남자');
insert into users(uid, upass, uname)
values('black', 'pass', '암흑남자');
insert into users(uid, upass, uname)
values('green', 'pass', '순한남자');
insert into users(uid, upass, uname)
values('sky', 'pass', '넓은남자');
insert into users(uid, upass, uname)
values('pink', 'pass', '부끄러운남자');
insert into users(uid, upass, uname)
values('orange', 'pass', '뜨끈한복치');

delete from users where uid='jdfg';
update users
set add1='인천 서구 심곡동', phone='010-0000-0000', add2='연희대동아파트 101동'
where uid='red';

select * from users;
select * from users where uid='red';

alter table users add column udate datetime;

create table bbs(
	bid int auto_increment primary key,
    title varchar(100) not null,
    contents text,
    writer varchar(20) not null,
    bdate datetime default now(),
	foreign key(writer) references users(uid)
);

desc bbs;
drop table bbs;
select * from bbs;


insert into bbs(title, contents, writer)
value('우래옥 평양냉면 맛집 예약 주차 대기','주소: 서울 중구 창경궁로 62-29(주교동 118-1번지) 전화: 02-2265-0151~2 영업시간: 11:30~21:00 (라스트 오더-20:40), 매주 월요일 정기휴무 우래옥은 평양냉면뿐 아니라 불고기, 육회, 등심, 갈비 맛집으로도 유명해요. 우래옥 메뉴판 우래옥 메뉴판 가장 마음에 드는 것은 모든 재료를 국내산으로만 사용합니다.','blue');

insert into bbs(title, contents, writer)
value('아이브 장원영 나이정보, 프로필','출생일 및 나이 장원영은 2004년 8월 31일에 태어났으며, 현재 2023년 3월 기준으로 18세입니다. 양력 음력 생일 장원영의 양력 생일은 2004년 8월 31일이며, 음력으로는 2004년의 244번째 날인 35번째 화요일에 해당됩니다. 장원영 프로필 소속사 장원영은 스타쉽엔터테인먼트 소속으로 활동하고 있습니다. ','sky');

insert into bbs(title, contents, writer)
value('[미국여행] 뉴욕 맨해튼 센트럴파크 여행코스 TOP10','[미국여행] 뉴욕 맨해튼 센트럴파크 여행코스 TOP10 [미국여행] 뉴욕 맨해튼 센트럴파크 여행코스 TOP10 에 대해 리뷰하려고 합니다. 센트럴파크 : 뉴욕 맨해튼의 대표 도심파크 센트럴 파크 Central Park 는 뉴욕 맨해튼 의 어퍼 웨스트사이드 와 어퍼 이스트 사이드 사이에 있는 도시공원으로, 미국 최초의 조경 공원','red');

insert into bbs(title, contents, writer)
value('기아 주가 전망 배당금 기업분석','이 글은 기아 주가 전망, 목표 주가, 기업 정보에 대해 설명합니다. 주식 투자에서 핵심은 미래의 기업 가치를 예측하고 선제적으로 움직이는 것입니다. 투자 대상을 결정하기 전에 현재 기업의 상황과 수치를 검토하는 것이 필요합니다. 기아 주식의 주요 상황과 투자 정보를 확인하고, 주식 투자에 도움이 되는 자료들','white');

insert into bbs(title, contents, writer)
value('서부간선도로 공사, 차선 폭 변경, 일반도로화 누구를 위한 공사인가?','디지털단지 부근의 차량들이 서부간선도로 진입을 위해 뒤엉키는 구간은 수출의 다리와 독산역에서 광명시로 이어지는 철산대교 부근이다. ​ 그래서 뚝방길에서...있는 진입로 마저 일반도로화 과정에서 폐쇄하는 듯 하다. ​ 지금도 정체 구간인 수출의 다리나 철산대로로 우회하여 진입해야 하는 상황이다.','black');

insert into bbs(title, contents, writer)
value('20년 만에 다시 와본 감동의 평양냉면 을밀대','을밀대 평양냉면 서울특별시 마포구 숭문길 24 회상 시간은 바야흐로 20년 전 공덕은 재개발 지정구역(?)이었기에 주거민이 매우 적었었고 래미안 아파트가 신축 건물이었고 그 옆엔 상록아파트 더 위엔 달동네가 존재했고(내가 살던) 새로 지어진 마포문화센터에서 뛰어놀며 병설유치원과 용강초등학교를 다녔던 그.','blue');

insert into bbs(title, contents, writer)
value('서울 지상철도 71.6km 지화화 잰걸음…개발구상안 착수','성남1구역 등 1,800여 가구 일반 분양 대전 분양시장 내달부터 성남1구역, 문화2구역, 봉명동 주상복합 등 분양 예고 k-buildnews.com ′오세훈표 모아주택 1호′ 착공…광진구 한양연립, 215세대 공급 통합심의 이후 8개월만…원주민 전원 재정착아파트 4개동·지하 주차장 등 부대복리시설','blue');

insert into bbs(title, contents, writer)
value('[서울/독산] 진영면옥 독산동 먹을텐데 평냉 맛집 내돈내산 주말 점심 웨이팅 후기','성시경 덕분에 더욱 유명해져서 저번에 왔다가 그냥 돌아간 그집 날씨도 좀 서늘해져서 이젠 좀 갈만하겠지 하고 바이크 타고 달려왔다 그렇다고 한다 가격은 준수하다 따뜻한 면수를 준다 홀이 자그마하다 육수가 면을 풀지않고 마셨을 때 꽤 괜찮다 이 정도면 탑급인데 하고 느꼈을 정도 면을 풀고 다시 육수를 마셨을.','blue');

insert into bbs(title, contents, writer)
value('2024년 3월 미국 장단기 금리차 정보','미국의 장단기 금리차는 경제 상황을 예측하고 평가하는 데 중요한 지표 중 하나입니다. 이 글에서는 미국의 장단기 금리차가 경제적으로 어떤 의미를 갖는지에 대해 알아보겠습니다. 장단기 금리차란 무엇인가요? 장단기 금리차는 장기와 단기 간의 이자율 차이를 의미합니다. 일반적으로, 장기 이자율이 단기 이자율.','white');

insert into bbs(title, contents, writer)
value('뉴진스 민희진 하이브 갈등, 하이브 주가 하락 (민희진 프로필)','SM엔터테인먼트 Creative Director (2002년 ~ 2019년) - HYBE CBO (2019년 ~ 2021년) - 현) ADOR 로고(설립자 겸 CEO) ▶ 결혼: 미혼 방시혁,민희진 -하이브 뉴진스 민희진 갈등 상황 2024년 04월 22일 ‘뉴진스맘‘ 민희진 어도어 대표의 소속사 독립시도로 연예계가 떠들썩 합니다. 하이브의 하위 레이블이자, ','sky');

insert into bbs(title, contents, writer)
value('뉴진스 민희진 하이브 갈등, 하이브 주가 하락 (민희진 프로필)','SM엔터테인먼트 Creative Director (2002년 ~ 2019년) - HYBE CBO (2019년 ~ 2021년) - 현) ADOR 로고(설립자 겸 CEO) ▶ 결혼: 미혼 방시혁,민희진 -하이브 뉴진스 민희진 갈등 상황 2024년 04월 22일 ‘뉴진스맘‘ 민희진 어도어 대표의 소속사 독립시도로 연예계가 떠들썩 합니다. 하이브의 하위 레이블이자, ','sky');

insert into bbs(title, contents, writer)
value('못 있어서 죄송하다…” 진심으로 류현진 KBO 통산 100승','노시환과 장민재는 팀 선배 류현진의 KBO 통산 100승을 진심으로 축하해줬다. 그리고 몸은 떨어져 있지만, 문동주(이상 한화 이글스)도 롤모델의 대기록을 진심으로 기뻐했다. 류현진은 4월 30일 대전 한화생명이글스파크에서 열린 2024 프로야구 KBO리그 정규시즌 SSG랜더스와 홈 경기에 선발등판해 6이닝 7피안타 2사사구 1탈삼진 2실점 1자책점 호투로 한화의 8-2 승리를 견인했다.','green');

insert into bbs(title, contents, writer)
value('스페인 언론 "하비에르 아기레 감독, 한국 축구대표팀도 행선지 후보"','스페인 프로축구 마요르카에서 이강인(파리 생제르맹)과 호흡을 맞췄던 하비에르 아기레(65·멕시코) 감독의 차기 행선지에 한국 축구대표팀 사령탑이 포함됐다는 보도가 나왔다. 스페인 언론 마르카는 1일(한국시간) "아기레 감독과 마요르카의 재계약 가능성은 아직 열려있지만 쉽지 않을 것"이라며 "아기레 감독은 2년 이상 계약기간을 원하고 있고, 다양한 옵션을 가지고 있다"고 전했다.','green');

insert into bbs(title, contents, writer)
value('케리아 류민석,에스트랄에 공격적으로 당해 많이 당황','"플레이-인부터 시작하는데 뚫고 브래킷에서 좋은 모습을 보여줄 수 있도록 하겠다." T1이 1일(한국 시각) 중국 쓰촨성 청두 파이낸셜 시티 공연 예술 센터서 벌어진 미드 시즌 인비테이셔널(MSI) 플레이-인 A조 2경기서 에스트랄 e스포츠를 2대0으로 격파했다. T1은 승자전서 플라이퀘스트와 대결할 예정이다.','pink');

insert into bbs(title, contents, writer)
value('PSG 탈론 베티의 자책 "스왑 플레이 너무 못했다"','PSG 탈론은 1일(한국 시각) 중국 쓰촨성 청두 파이낸셜 시티 공연 예술 센터서 벌어진 미드 시즌 인비테이셔널(MSI) 플레이-인 A조 경기서 LCS 2번 시드인 플라이퀘스트에 1대2로 역전패 했다. PSG 탈론은 T1과 에스트랄 e스포츠의 패자와 최종전을 놓고 경기를 치르게 된다.','pink');

insert into bbs(title, contents, writer)
value('강원 원주 건조주의보 발효…"불조심"','(강원=뉴스1) 한귀섭 기자 = 기상청은 2일 오전 10시를 기해 원주에 건조주의보를 발효했다고 밝혔다. 기상청은 "당분간 강원내륙을 중심으로 대기가 건조해진다"며 "산불 등 화재 예방에 각별히 유의하기 바란다"고 당부했다.','orange');

insert into bbs(title, contents, writer)
value('대구·경북 맑고 일교차 커…오전 안개 주의','낮 최고 기온은 대구와 안동 24도, 포항 20도 등 18도에서 26도로 전날보다 5~8도가량 높겠습니다.대구지방기상청은 오전까지 대구, 경북 내륙에 가시거리 200m 미만의 짙은 안개가 끼는 곳이 있겠고, 그 밖의 지역에도 가시거리 1km 미만의 안개가 끼는 곳이 있겠다며 교통안전에 유의해달라고 부탁했습니다.','orange');

insert into bbs(title, contents, writer)
value('25조 동원한 상반기 IPO 최대어 HD현대마린솔루션…하반기 대어급 기대감 ↑','28일 금융투자업계에 따르면 25~26일 진행된 HD현대마린솔루션 일반투자자 대상 공모주 청약 결과 최종경쟁률은 225.8대 1을 기록했다. 일반 투자자 배정 물량 235만3393주에 총 6억195만4640주의 청약이 몰렸고, 청약 증거금은 약 25조 원으로 올해 들어 최고 증거금 기록을 경신했다. 앞서 2월 상장한 에이피알은 청약증거금 14조 원을 동원한 바 있다.','white');

insert into bbs(title, contents, writer)
value('후쿠오카 벳푸여행 2박3일 여행 일정 경비 현지 온천 가볼만한곳','후쿠오카 벳푸여행 2박3일 여행 일정 경비 현지 온천 가볼만한곳 소개였어요! 참고하셔서 행복한 여행 되시길 바랍니다 :) 벳부 현지 맛집 모음 : 쿠루쿠루 카메쇼 스시, 타츠 야키니  #일본동물원 #후쿠오카동물원 #일본벳푸여행 #후쿠오카아이와갈만한곳 #후쿠오카볼거리 #아프리칸사파리동물원 아프리칸 사파리 일본 〒872-0722 Oita, Usa, Ajimumachi Mi','red');

insert into bbs(title, contents, writer)
value('[단독] 트와이스 첫 연기 필모…다현, 연기 도전','한편 다현이 속한 트와이스는 오는 7월 17일 일본에서 다섯 번째 정규 앨범 ‘DIVE’(다이브)를 발표한다. 또 7월에는 월드투어 ‘READY TO BE’ 일환 일본 스타디움 공연을 전개한다. 7월 13일~14일 오사카 얀마 스타디움 나가이, 20일~21일 도쿄 아지노모토 스타디움에서 단독 공연을 펼치고 27일~28일 해외 여성 아티스트 사상 최초로 가나가와 닛산 스타디움에 입성한다.','sky');





create view view_bbs as
select bbs.*, uname, photo
from bbs, users
where uid=writer;

select * from view_bbs
order by bid desc;

insert into bbs(title,writer,contents)
select title,writer,contents from bbs;

select count(*) from bbs;

select * from view_bbs
order by bid desc
limit 5, 5;



create table comments(
	cid int auto_increment primary key,
    bid int not null,
    contents text not null,
    writer varchar(20) not null,
    cdate datetime default now(),
    foreign key(bid) references bbs(bid),
    foreign key(writer) references users(uid)
);

desc comments;

insert into comments(bid, writer, contents)
values(206, 'black','흑자는 커녕 만년적자 기업들이 기술특례 명목으로 코스닥에 상장시키는 것도 애들이 죄다 시총 수천억 평가로 상장시키는 것도 어이없다, 상장은 시켜주되 따로 분리해서 가격상승 제한이라도 하던가, 연매출 수억.수십억에 적자인데도시총이 죄다 수천억;; 대놓고 한탕이지 뭐');

insert into comments(bid, writer, contents)
values(206, 'sky','솔직히 기관들이 너무 이악물고 밴드 상단초과를 써내니까 답없지...');

insert into comments(bid, writer, contents)
values(206, 'red','누가 신규상장주 사라고 칼들고 협박했어? 니들욕심에 산거지 왜 남탓을 하냐 ㅋㅋㅋ 뻥튀기 된 주식 산건 니 손가락이 문젠거');

insert into comments(bid, writer, contents)
values(206, 'green','금융후진국, 배임-횡령-사기-분식회계~! 말해 뭐해~?!');

insert into comments(bid, writer, contents)
values(206, 'pink','그냥 밸류업이 자율로 될 것 같았으면, 지금까지 왜 안되었겠니?제도적으로 제대로 뒷받침 해줘야지. 인센티브와 페널티를 확실하게 주라고. 유야무야 할 거 였으면, 말이나 꺼내지 말 던가?');

insert into comments(bid, writer, contents)
values(206, 'white','위 기사에 소개된 원자력 ETF 수익 대부분은 HD현대일렉트릭과');

insert into comments(bid, writer, contents)
values(206, 'blue','오늘 주식시장 보니깐 대한민국 현실이 보이더라 정부 금융감독원은 정신 좀 차려라!');

insert into comments(bid, writer, contents)
values(206, 'orange','원자력etf에 원자력주는 오른게없다ㅋㅋㅋ근래에 급등한 전선 구리나 전력기기 주식들이. 포함되어있어서. 개거품 상태');




select * from comments;


insert into comments(bid, contents, writer)
select bid, contents, writer from comments;

select count(*) from comments;

select uname, photo, comments.*
from users, comments
where uid=writer;

create view view_comments as
select uname, photo, comments.*
from users, comments
where uid=writer;

select * from view_comments
where bid=206 
order by cid desc 
limit 0,3;

















