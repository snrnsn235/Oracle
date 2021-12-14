--구매 테이블 중에서 'JYP'라는 아이디를 가진 사람이 구매한 물건을 발송하기 위해서, 이름, 주소, 연락처등을 조인해서 검색하려면 다음과 같이 사용
select * from buytbl
inner join usertbl
on buytbl.userid=usertbl.userid
where buytbl.userid ='JYP';

--where buytbl.userid ='JYP'를 생락하면, buytbl의 모든 행에 대해서 위와 동일한 방식으로 반복된다.
select * from buytbl
inner join usertbl
on buytbl.userid=usertbl.userid;

select buytbl.userid, username, prodname, addr, mibile1 || mobile2 as "연락처"
from buytbl
inner join usertbl
on buytbl.userid=usertbl.userid;

select B.USERID, u.userName, B.PRODNAME, U.ADDR, U.MIbILE1 || U.MOBILE2 AS "연락처"
FROM BUYTBL B
INNER JOIN USERTBL u
ON B.USERID=U.USERID
WHERE B.USERID = 'JYP';

select U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "연락처"
FROM USERTBL U
INNER JOIN BUYTBL B
ON B.USERID=U.USERID
WHERE B.USERID='JYP';

--전체 회원들이 구매한 목록을 모두 출력해보자.
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "연락처"
FROM USERTBL U
INNER JOIN BUYTBL B
ON B.USERID=U.USERID
ORDER BY U.USERID;

--INNER JOIN이 한쪽에는 없는 목록만 나오기 때문에 유용한 경우가 있다.
--쇼핑몰에서 한번이라도 물건을 구매한 우수회원들에게 감사의 안내문을 발송하도록 하자일 경우 DISTINCT문을 활용한다.
SELECT DISTINCT U.USERID, U.USERNAME, U.ADDR
FROM USERTBL U
INNER JOIN BUYTBL B
ON U.USERID=B.USERID
ORDER BY U.USERID;
--위와 같은 결과를 만들어낸다
SELECT U.USERID, U.USERNAME, U.ADDR
FROM USERTBL U
WHERE EXISTS (
SELECT * FROM BUYTBL B
WHERE U.USERID=B.USERID);


--OUTER
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "연락처"
FROM USERTBL U
LEFT OUTER JOIN BUYTBL B --왼쪽 테이블(USERTBL)의 것은 모두 출력되어야 한다라는 뜻
ON U.USERID=B.USERID
ORDER BY U.USERID;

--RIGHT OUTER JOIN으로 바꾸려면 단순히 왼쪽과 오른쪽 테이블의 위치만 바꾸면 된다.
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "연락처"
FROM BUYTBL B
RIGHT OUTER JOIN USERTBL U --왼쪽 테이블(USERTBL)의 것은 모두 출력되어야 한다라는 뜻
ON U.USERID=B.USERID
ORDER BY U.USERID;

--한번도 구매한 적없는 유령회원목록을 뽑아보자
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "연락처"
FROM USERTBL U
LEFT OUTER JOIN BUYTBL B --왼쪽 테이블(USERTBL)의 것은 모두 출력되어야 한다라는 뜻
ON U.USERID=B.USERID
WHERE B.PRODNAME IS NULL
ORDER BY U.USERID;

--IF, ELSE
SET SERVEROUTPUT ON;
DECLARE
    VAR1 NUMBER(5); --변수선언(VAR1)
BEGIN
    VAR1 :=100; --변수에 값 대입(변수를 대입할 때는 :=를 사용한다.)(:= 뜻은 '='과 같다.)
    IF VAR1= 100 THEN -- 만약 VAR1이 100이라면
        DBMS_OUTPUT.PUT.LINE('100입니다.');
    ELSE
        DBMS_OUTPUT.PUT.LINE('100이 아닙니다.');
    END IF;
END;














