CREATE USER MOVIE IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;
    
GRANT CONNECT, RESOURCE, DBA TO MOVIE;



CREATE TABLE 영화 
(번호 VARCHAR2(3) NOT NULL PRIMARY KEY,
이름 VARCHAR2(30) UNIQUE,
개봉연도 NUMBER,
매출액 NUMBER,
관객수 NUMBER,
평점 NUMBER(5,2)
);

CREATE TABLE 배우 (
번호 VARCHAR2(3) NOT NULL PRIMARY KEY,
이름 VARCHAR2(30),
출생 DATE,
키 NUMBER,
몸무게 NUMBER,
배우자 VARCHAR2(30)
);

CREATE TABLE 출연(
영화번호 VARCHAR2(3) NOT NULL,
배우번호 VARCHAR2(3) NOT NULL,
역할 VARCHAR2(1),
역 VARCHAR(30)
);

INSERT INTO 영화 VALUES(1,'명량', 2014, 135748398910, 17613682, '8.49' );
INSERT INTO 영화 VALUES(2,'쉬리', 1999, NULL, 5820000, '8.79' );
INSERT INTO 영화 VALUES(3,'광해, 왕이 된 남자', 2012, 88900208769, 12319542, '9.23' );
INSERT INTO 영화 VALUES(4,'도둑들', 2012, 93665568500, 12983330, '7.60' );
INSERT INTO 영화 VALUES(5,'엽기적인 그녀', 2001, NULL, 1735692, '9.29' );
INSERT INTO 영화 VALUES(6,'변호인', 2013, 82871759300, 11374610, '8.97' );
INSERT INTO 영화 VALUES(7,'밀양', 2007, NULL, 1710364, '7.76' );
INSERT INTO 영화 VALUES(8,'태극기 휘날리며', 2004, NULL, 11746135, '9.15' );
INSERT INTO 영화 VALUES(9,'초록물고기', 1997, NULL, NULL, '8.79' );
INSERT INTO 영화 VALUES(10,'은행나무 침대', 1996, NULL, NULL, '7.67' );
INSERT INTO 영화 VALUES(11,'님은 먼 곳에', 2008, 11211235000, 1706576, '7.80' );
INSERT INTO 영화 VALUES(12,'반지의 제왕:왕의귀환', 2003, NULL,  NULL, '9.36' );
INSERT INTO 영화 VALUES(13,'그녀', 2014, NULL,  NULL, '8.51' );
INSERT INTO 영화 VALUES(14,'관상', 2013, NULL,  NULL, '7.96' );
SELECT * FROM 영화;
INSERT INTO 배우 VALUES(1, '최민식', '1962-04-27', 177, 70, NULL);
INSERT INTO 배우 VALUES(2, '류승룡', '1970-11-29', NULL, NULL, NULL);
INSERT INTO 배우 VALUES(4, '한석규', '1964-11-03', 178, 64, '임명주');
INSERT INTO 배우 VALUES(5, '송강호', '1967-01-17', 180, 80, NULL);
INSERT INTO 배우 VALUES(6, '이병헌', NULL, 177, 72, '이민정');
INSERT INTO 배우 VALUES(7, '한효주', NULL, 172, 48, NULL);
INSERT INTO 배우 VALUES(8, '전지현', '1981-10-30', 174, 52, NULL);
INSERT INTO 배우 VALUES(10, '김혜수', '1970-09-05', 170, 50, NULL);
INSERT INTO 배우 VALUES(12, '차태연', '1976-03-25', 175, 65, '최석은');
INSERT INTO 배우 VALUES(15, '전도연', NULL, 165, NULL, '강시규');
INSERT INTO 배우 VALUES(16, '장동건', NULL, 182, 68, '고소영');
INSERT INTO 배우 VALUES(17, '심혜진', '1967-01-16', 169, 51, '한상구');
INSERT INTO 배우 VALUES(18, '수애', NULL, 168, 46, NULL);
INSERT INTO 배우 VALUES(19, '주진모', NULL, NULL, NULL, NULL);
SELECT * FROM 배우;
INSERT INTO 출연 VALUES(1, 1, 1, '이순신');
INSERT INTO 출연 VALUES(1, 2, 1, '구리지마');
INSERT INTO 출연 VALUES(2, 4, 1, '유중원');
INSERT INTO 출연 VALUES(2, 1, 1, '박무영');
INSERT INTO 출연 VALUES(2, 5, 1, '이장길');
INSERT INTO 출연 VALUES(3, 6, 1, '광해/하선');
INSERT INTO 출연 VALUES(3, 2, 1, '허균');
INSERT INTO 출연 VALUES(3, 7, 1, '중전');
INSERT INTO 출연 VALUES(4, 10, 1, '팹시');
INSERT INTO 출연 VALUES(4, 8, 1, '예니콜');
INSERT INTO 출연 VALUES(4, 19, 2, '반장역');
INSERT INTO 출연 VALUES(5, 8, 1, '그녀');
INSERT INTO 출연 VALUES(5, 12, 1, '건우');
INSERT INTO 출연 VALUES(6, 5, 1, '송우석');
INSERT INTO 출연 VALUES(7, 15, 1, '피아노 학원 강사, 이신애');
INSERT INTO 출연 VALUES(7, 5, 1, '카센터 사장, 김종찬');
INSERT INTO 출연 VALUES(8, 16, 1, '이진태');
INSERT INTO 출연 VALUES(9, 4, 1, '막동');
INSERT INTO 출연 VALUES(9, 17, 1, '미애');
INSERT INTO 출연 VALUES(10, 4, 1, '수현');
INSERT INTO 출연 VALUES(10, 17, 1, '선영');
INSERT INTO 출연 VALUES(11, 18, 1, '시골 아낙, 순이 | 가수, 써니');
INSERT INTO 출연 VALUES(11, 19, 1, '기타리스트, 성찬');
SELECT * FROM 출연;


--문제1--
SELECT 이름, 평점
FROM 영화
GROUP BY 이름, 평점
HAVING (평점) >= 9;

--문제2--
SELECT 개봉연도
FROM 영화
WHERE 이름 LIKE '쉬리';

--문제3--
SELECT 이름, 평점
FROM 영화
WHERE 이름 LIKE '%왕%';


--문제4--
SELECT 이름, 평점
FROM 영화
WHERE 이름 LIKE '%왕%'
ORDER BY 개봉연도;

--문제5--
SELECT 이름, 평점
FROM 영화
WHERE 이름 LIKE '%그녀%';

--문제6--
SELECT 이름
FROM 영화
WHERE (번호) <= 3 ;

--문제7--
SELECT 번호
FROM 영화
WHERE 이름 LIKE '변호인';

--문제8--
SELECT 번호
FROM 배우
WHERE 이름 LIKE '송강호';

--문제9--
SELECT 배우.이름
FROM  배우, 영화, 출연
WHERE 영화.번호 = 출연.영화번호
    AND 배우.번호=출연.배우번호
    AND 영화.번호=1;

--문제10--
SELECT 배우.이름
FROM 배우, 출연, 영화
WHERE 영화.번호=출연.영화번호
    AND 배우.번호=출연.배우번호
    AND 영화.이름 LIKE '도둑들';
    
--문제11--
SELECT 영화.이름
FROM 배우, 영화, 출연
WHERE 배우.번호=출연.배우번호
    AND 영화.번호=출연.영화번호
    AND 배우.이름 LIKE '송강호';

--문제12--
SELECT 영화.이름
FROM 배우, 영화, 출연
WHERE 배우.번호=출연.배우번호
    AND 영화.번호=출연.영화번호
    AND 출연.역할='2'
    AND 배우.이름 LIKE '주진모';
    
--문제13--
SELECT 영화.이름, 배우.이름
FROM 배우, 영화, 출연
WHERE 배우.번호=출연.배우번호
    AND 영화.번호=출연.영화번호
    AND 출연.역할='1'
    AND 영화.개봉연도 LIKE '2012';
    
--문제14--
SELECT 영화.개봉연도, COUNT(영화.이름) AS "출연작품 수"
FROM 배우, 영화, 출연
WHERE 배우.번호=출연.배우번호
    AND 영화.번호=출연.영화번호
    AND 배우.이름='송강호'
GROUP BY 영화.개봉연도
ORDER BY 영화.개봉연도;    

--문제15--
SELECT 영화.이름 "영화제목", 배우.이름 "배우이름"
FROM 배우, 영화, 출연
WHERE 배우.번호=출연.배우번호
    AND 영화.번호=출연.영화번호
    AND 출연.역할='1'
    AND 영화.번호 IN (
        SELECT 출연.영화번호 FROM 배우, 출연 WHERE 배우.번호=출연.배우번호
        AND 배우.이름='송강호'
    );

--문제16--
SELECT 배우.이름
FROM 출연, 배우
WHERE 배우.번호 = 출연.배우번호
    AND 출연.역할 = 1
    GROUP BY  배우.이름
    HAVING COUNT(출연.영화번호)  >= 2;

--문제17--
SELECT 영화.이름, COUNT(출연.배우번호) AS "출연배우 수"
FROM 영화, 출연
WHERE 영화.번호=출연.영화번호
    AND 영화.개봉연도=2012
GROUP BY 영화.이름;
    
--문제18--
SELECT 배우.이름
FROM 배우, 출연
WHERE 배우.번호=출연.배우번호
    AND 배우.이름 != '송강호'
    AND 출연.영화번호 
    IN (SELECT 출연.영화번호
    FROM 출연, 배우
    WHERE 배우.번호=출연.배우번호
    AND 배우.이름 = '송강호')
ORDER BY 배우.이름;


