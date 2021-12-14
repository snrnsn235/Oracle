CREATE USER SQLDB IDENTIFIED BY 1234
    DEFAULT TABLESPACE USER
    TEMPORARY TABLESPACE TEMP;
GRANT CONNECT, RESOURCE, DBA TO SQLDB;

CREATE TABLE userTBL--회원 테이블
(userID CHAR(8) not null primary key,
username nvarchar2(10) not null,
birthyear number(4) not null,
addr nchar(2) not null,
mobile1 char(3),
mobile2 char(8),
height number(3),
mDate date
);
ALTER TABLE USERTBL
    RENAME COLUMN MIBILE1 TO MOBILE1;
Create table buyTBL--회원 구매 테이블
(idnum number(8) not null primary key,
userID char(8) not null,
prodName nchar(6) not null,
groupname nchar(4),
price number(8) not null,
amount number(3) not null,
foreign key (userID) references userTBL(userID)
);

insert into userTBL values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
insert into userTBL values('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-4-4');
insert into userTBL values('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-7-7');
insert into userTBL values('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-4-4');
insert into userTBL values('SSK', '성시경', 1979, '서울', null, null, 186, '2013-12-12');
insert into userTBL values('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-9-9');
insert into userTBL values('YJS', '윤종신', 1969, '경남', null, null, 170, '2005-5-5');
insert into userTBL values('EJW', '은지원', 1972, '경북', '011', '88888888', 174, '2014-3-3');
insert into userTBL values('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2010-10-10');
insert into userTBL values('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-5-5');

create sequence idSEQ; -- 순차번호 입력을 위해서 시퀀스 생성
insert into buyTBL values(idseq.nextval, 'KBS', '운동화', NULL, 30, 2 );
insert into buyTBL values(idseq.nextval, 'KBS', '노트북', '전자', 1000, 1);
insert into buyTBL values(idseq.nextval, 'JYP', '모니터', '전자', 200, 1);
insert into buyTBL values(idseq.nextval, 'BBK', '모니터', '전자', 200, 5);
insert into buyTBL values(idseq.nextval, 'KBS', '청바지', NULL, 50, 3);
insert into buyTBL values(idseq.nextval, 'BBK', '메모리', '전자', 80, 10);
insert into buyTBL values(idseq.nextval, 'SSK', '책', '서적', 15, 5);
insert into buyTBL values(idseq.nextval, 'EJW', '책', '서적', 15, 2);
insert into buyTBL values(idseq.nextval, 'EJW', '청바지', '의료', 50, 1);
insert into buyTBL values(idseq.nextval, 'BBK', '운동화', NULL, 30, 2);
insert into buyTBL values(idseq.nextval, 'EJW', '책', '서적', 15, 1);
insert into buyTBL values(idseq.nextval, 'BBK', '운동화', NULL, 30, 2);


COMMIT;
SELECT * FROM USERTBL;
SELECT * FROM BUYTBL;

--BETWEEN, AND/IN(), LIKE--
select userid, username from userTBL where birthyear >= 1970 and height >=182;
select userid, username from userTBL where birthyear >= 1970 or height >=182;
select userid, username from userTBL where height >=180 and height <=183;
select userid, username from userTBL where height between 180 and 183;
--숫자로 구성되어 있는 곳에서 BETWEEN, AND을 사용할 수 있지만, 지역처럼 연속된 값이 아닐 시엔 두개를 사용할 수 없다.

select username, addr from userTBL where addr='경남' or addr='전남' or addr='경북';
select username, addr from userTBL where addr in ('경남', '전남', '경북');
select username, height from userTBL where userName like '김%';
--문자열의 내용을 검색하기 위해서는 LIKE연산자를 사용할 수 있다.
--위의 조건은 성이 '김'씨이고 그 뒤는 무엇이든(%) 허용한다는 의미한다. .
select username, height from userTBL where userName like '_종신';
--그리고 한 글자와 매치하기 위해서는 '_'를 사용한다
select username, height from userTBL where userName like '_용%';
--'%','_'를 조합해서 사용할 수 있다. 앞에 아무거나 한글자가 오고 두번째는 '용', 그리고 세 번째 이후에는 몇 글자들 아무거나 오는 값을 추출할 수 있다,

--ANY/ALL/SOME 그리고 서브쿼리(SubQUERY, 서브쿼리)
--서브쿼리란 쿼리문 안에 또 쿼리문이 들어 있는 것을 얘기한다.
--EX)김경호보다 키가 크거나 같은 사람의 이름과 키를 출력한다. -> WHERE 조건에 김경호의 키를 직접 써줘야한다.
select username, height from userTBL where height>177;

--그런데 이 177이라는 키를 직접 써주는 것이 아니라, 이것도 쿼리를 통해서 사용하려는 것.
SELECT USERNAME, HEIGHT FROM userTBL --여기까지는 위와 같음
    where height > (select height from userTBL where userName = '김경호'); --결국 177이라는 값과 동일한 값이 되어 두 쿼리는 동일한 결과를 내주는 것이다.
    
--지역이 '경남'사람의 키보다 키가 크거나 같은 사람을 추출해보자
select username, height from userTBL
    where height >= (select height from userTBL where addr = '경남');
select rownum, username, height from userTBL
    where height >= any (select height from userTBL where addr='경남');
--이번엔 'any'를 'all'로 바꾸어 보자
select rownum username, height from userTBL
    where height >= all (select height from userTBL where addr='경남'); --처음에 잘못 기입해서 9명이 나옴.

--어쨋든 'any'는 서브쿼리의 여러 개의 결과 중 한 가지만 만족해도 되며, 'all'은 서브쿼리의 여러 개의 결과를 모두 만족시켜야 한다.('some'은 'any'와 동일한 의미)

select username, height from userTBL
    where height = any (select height from userTBL where addr='경남');
select username, height from userTBL
    where height IN (select height from userTBL where addr='경남');
--'ORDER BY'절은 결과물에 대해 영향을 미치지는 않지만, 결과가 출력되는 순서를 조절하는 구문
--먼저 가입한 순서로 회원들을 출력해보자
SELECT username, mDate From userTBL ORDER BY MDATE;
--기본적으로 오름차순으로 정렬된다. 내림차순으로 정렬하기 위해서는 열 이름 뒤에 'DESC'라고 적어준다.
SELECT username, mDate From userTBL ORDER BY MDATE DESC;
--이번에는 여러 개로 정렬해 보자. 키가 큰 순서로 정렬하되, 만약 키가 같을 경우 이름 순으로 정렬하자.
SELECT username, height From userTBL ORDER BY height desc, username asc;
--'ORDER BY'에 나온 열이 SELECT 다음에 꼭 있을 필요는 없다. -> SELECT USERID FROM USERTBL ORDER BY HEIGHT문을 사용해도 된다.
--'ORDER BY'문은 'WHERE'절과 같이 사용해도 무방/ 'SELECT' 'FROM' 'WHERE' 'GROUP BY' 'HAVING' 'ORDER BY'중 제일 뒤에 와야 한다!!

--중복된 것은 하나만 남기는 'DISTINCT'--
--회원 테이블에서 회원들의 거주지역이 몇 군데인지 출력해보자
SELECT ADDR FROM USERTBL;
SELECT ADDR FROM USERTBL ORDER BY ADDR;
--아까보다는 쉽지만 중복된 것을 골라서 세어보는 것 보다 'DISTINCT'를 사용해보자
SELECT DISTINCT ADDR FROM USERTBL;
SELECT GETAGEFUNC(1979) FROM DUAL;

