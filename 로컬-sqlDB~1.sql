
select usertbl.userID, userName, prodname, addr, mobile1 || mobile2 as "연락처"
from buytbl inner join usertbl on buytbl.userID = usertbl.userID;

select usertbl.userID, userName, prodname, addr, mobile1 || mobile2 as "전화"
from buytbl, usertbl
where buytbl.userID = usertbl.userID;
--위의 두개의 코드는 값이 같다.--

select distinct U.userID, U.userName, U.addr
from userTBL U inner join buyTBL B on U.userID=B.userID
order by U.userID;

select U.userID, U.userName, B.prodName, u.addr, u.mobile1 || u.mobile2 as "전화"
from usertbl u left outer join buytbl b on u.userid = b.userid
order by u.userid;

select U.userID, U.userName, U.addr
    from userTbl U
    where EXISTS(
        select *
        from buyTbl B
        where U.userID = B.userID);


CREATE TABLE stdTBL
(stdNAME NCHAR(5) NOT NULL PRIMARY KEY,
 addr   NCHAR(2) NOT NULL
);
CREATE TABLE clubTBL
(clubNAME NCHAR(5) NOT NULL PRIMARY KEY,
roomNO NCHAR(4) NOT NULL
);
CREATE SEQUENCE stdclubSEQ;
CREATE TABLE stdclubTBL
( idNUM NUMBER(5)NOT NULL PRIMARY KEY,
  stdNAME NCHAR(5) NOT NULL,
  clubNAME NCHAR(5) NOT NULL,
FOREIGN KEY(stdNAME) REFERENCES stdTBL(stdNAME),
FOREIGN KEY(clubNAME) REFERENCES clubTBL(clubNAME)
);
INSERT INTO stdTBL VALUES('김범수', '경남');
INSERT INTO stdTBL VALUES('성시경', '서울');
INSERT INTO stdTBL VALUES('조용필', '경기');
INSERT INTO stdTBL VALUES('은지원', '경북');
INSERT INTO stdTBL VALUES('바비킴', '서울');
INSERT INTO clubTBL VALUES('수영', '101호');
INSERT INTO clubTBL VALUES('바둑', '102호');
INSERT INTO clubTBL VALUES('축구', '103호');
INSERT INTO clubTBL VALUES('봉사', '104호');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '김범수', '바둑');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '김범수', '축구');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '조용필', '축구');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '은지원', '축구');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '은지원', '봉사');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '바비킴', '봉사');

select * from stdTBL;
select * from clubTBL;
select * from stdclubTBL;

--outer join--
select S.stdName, S.addr, C.clubName, C.roomNo
from stdtbl s
left outer join stdclubTBL sc
on S.stdname = SC.stdName
left outer join clubTBl c
on sc.clubName = C.clubName
order by S.stdName;
-- 지울 때는 반대 순서로 지워야한다.(stdclubtbl -> clubtbl -> stdtbl)
--inner join--
select S.stdName, S.addr, C.clubName, C.roomNo
    from stdTBL S inner join stdclubTBL sc on S.stdName = SC.stdName
                  inner join clubTBL c on C.clubName = sc.clubName
order by S.stdName;

select S.stdName, S.addr, C.clubName, C.roomNo
    from stdTBL S left outer join stdclubTBL sc on S.stdName = SC.stdName
                  right outer join clubTBL c on C.clubName = sc.clubName
UNION                 
select S.stdName, S.addr, C.clubName, C.roomNo
    from stdTBL S left join stdclubTBL sc on S.stdName = SC.stdName
                  left join clubTBL c on C.clubName = sc.clubName
order by S.stdName;

select * from buytbl cross join usertbl;
select username, concat(mobile1, mobile2) as "전화번호" from usertbl
    where username not in (select username from usertbl where mobile1 is null);
    
--동아리에 가입하지 않은 학생도 출력되도록 수정
SELECT S.STDNAME, S.ADDR, C.CLUBNAME, C.ROOMNO
FROM STDTBL S
LEFT OUTER JOIN STDCLUBTBL SC
ON S.STDNAME=SC.STDNAME
LEFT OUTER JOIN CLUBTBL C
ON SC.CLUBNAME=C.CLUBNAME
ORDER BY S.STDNAME;

--동아리를 기준으로 가입된 학생을 출력하되, 가입 학생이 하나도 없는 동아리도 출력
SELECT C.CLUBNAME, C.ROOMNO, S.STDNAME, S.ADDR
FROM STDTBL S
LEFT OUTER JOIN STDCLUBTBL SC
ON SC.STDNAME=S.STDNAME
RIGHT OUTER JOIN CLUBTBL C
ON SC.CLUBNAME=C.CLUBNAME
ORDER BY C.CLUBNAME;

SELECT COUNT(*) AS "데이터 개수"
FROM HR.EMPLOYEES
CROSS JOIN HR.COUNTRIES;