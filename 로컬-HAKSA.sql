CREATE USER HAKSA IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;
    
GRANT CONNECT, RESOURCE, DBA TO HAKSA;

CREATE TABLE 학과 (
번호 NUMBER NOT NULL PRIMARY KEY,
이름 NVARCHAR2(10) NOT NULL
);

CREATE TABLE 교수 (
    번호 NUMBER NOT NULL PRIMARY KEY,
    이름 NVARCHAR2(10) NOT NULL,
    학과번호 NUMBER NOT NULL,
    FOREIGN KEY(학과번호) REFERENCES 학과(번호)
);

CREATE TABLE 학생 (
    번호 NUMBER NOT NULL PRIMARY KEY,
    이름 NVARCHAR2(10) NOT NULL,
    주소 NVARCHAR2(50),
    학년 NUMBER,
    키 NUMBER,
    몸무게 NUMBER,
    상태 NVARCHAR2(4),
    입력일자 DATE,
    학과번호 NUMBER NOT NULL, 
    FOREIGN KEY(학과번호) REFERENCES 학과(번호)
);

CREATE TABLE 과목(
번호 NUMBER NOT NULL PRIMARY KEY,
이름 NVARCHAR2(20) NOT NULL,
학점 NUMBER,
교수번호 NUMBER NOT NULL,
FOREIGN KEY (교수번호) REFERENCES 교수(번호)
);

CREATE TABLE 수강내역 (
학생번호 NUMBER NOT NULL,
과목번호 NUMBER NOT NULL,
점수 NUMBER(4,1),
등급 NVARCHAR2(1),
CONSTRAINT 수강내역 PRIMARY KEY(학생번호, 과목번호),
FOREIGN KEY (학생번호) REFERENCES 학생(번호),
FOREIGN KEY (과목번호) REFERENCES 과목(번호)
);
--DROP TABLE 수강내역;
--DROP TABLE 과목;
--DROP TABLE 학생;
--DROP TABLE 교수;
--DROP TABLE 학과;



INSERT INTO 학과 VALUES(1, '소프트웨어공학과');
INSERT INTO 학과 VALUES(2, '컴퓨터공학과');
INSERT INTO 학과 VALUES(3, '경영정보학과');
INSERT INTO 학과 VALUES(4, '경영학과');
INSERT INTO 학과 VALUES(5, '연극영화과');
INSERT INTO 학과 VALUES(6, '철학과');
SELECT * FROM 학과;


INSERT INTO 교수 VALUES(1, '이해진', 1);
INSERT INTO 교수 VALUES(2, '김정주', 1);
INSERT INTO 교수 VALUES(3, '김이숙', 1);
INSERT INTO 교수 VALUES(4, '이석호', 2);
INSERT INTO 교수 VALUES(5, '김사부', 3);
INSERT INTO 교수 VALUES(6, '장미희', 5);
INSERT INTO 교수 VALUES(7, '백남영', 5);
INSERT INTO 교수 VALUES(8, '김현이', 5);
INSERT INTO 교수 VALUES(9, '이사부', 5);
SELECT * FROM 교수;

INSERT INTO 과목 VALUES(1,'데이터베이스관리', 3, 3);
INSERT INTO 과목 VALUES(2,'데이터베이스프로그래밍', 3, 3);
INSERT INTO 과목 VALUES(3,'SQL활용', 3, 4);
INSERT INTO 과목 VALUES(4,'데이터베이스', 4, 5);
INSERT INTO 과목 VALUES(5,'인터넷마케팅', 3, 5);
INSERT INTO 과목 VALUES(6,'연기실습', 2, 7);
INSERT INTO 과목 VALUES(7,'영화제작실습', 2, 8);
INSERT INTO 과목 VALUES(8,'영화마케팅', 1, 9);
SELECT * FROM 과목;

INSERT INTO 학생 VALUES(1, '김이향', '인천 남동구', 4, 166, 56, '재학', '2005-03-01', 5);
INSERT INTO 학생 VALUES(6, '박지은', '서울 양천구', 2, 183, 65, '재학', '2015-02-14', 3);
INSERT INTO 학생 VALUES(7, '안칠현', '서울 금천구', 1, 178, 65, '재학', '2016-02-19', 1);
INSERT INTO 학생 VALUES(8, '김태희', '서울 구로구', 1, 165, 45, '재학', '2016-02-19', 3);
INSERT INTO 학생 VALUES(9, '채영', '서울 구로구', 1, 172, 47, '재학', '2016-02-19', 2);
INSERT INTO 학생 VALUES(11, '영란', '서울 강남구', 1, 162, 43, '재학', '2016-02-19', 5);
INSERT INTO 학생 VALUES(12, '윤호', '서울 강남구', 1, 184, 66, '휴학', '2016-08-10', 1);
INSERT INTO 학생 VALUES(13, '보아', '서울 구로구', 1, 162, 45, '재학', '2016-02-19', 1);
INSERT INTO 학생 VALUES(14, '문근영', '서울 강남구',1, 165, 45, '재학', '2016-02-19', 3);
INSERT INTO 학생 VALUES(3, '이세영', '서울 구로구', 4, NULL, NULL, '재학', '2013-03-01', 4);
INSERT INTO 학생 VALUES(4, '문주원', '경기 부천시', 3, NULL, NULL, '재학', '2014-02-13', 3);
INSERT INTO 학생 VALUES(5, '성춘향', '서울 영등포구', 3, NULL, NULL, '재학', '2014-02-13', 5);
INSERT INTO 학생 VALUES(10, '박수애', NULL, 1, 168, 46, '재학', '2016-02-19', 2);
INSERT INTO 학생 VALUES(2, '박보검', '인천 부평구', 4, 168, NULL, '재학', '2010-03-01', 6);
SELECT * FROM 학생;

INSERT INTO 수강내역 VALUES(7, 1, 84.5, 'B');
INSERT  INTO 수강내역 VALUES(12, 1, 50, 'F');
INSERT  INTO 수강내역 VALUES(13, 1, 90, 'A');
INSERT  INTO 수강내역 VALUES(7, 2, 80, 'B');
INSERT  INTO 수강내역 VALUES(13, 2, 94.5, 'A');
INSERT  INTO 수강내역 VALUES(9, 3, 90, 'A');
INSERT  INTO 수강내역 VALUES(10, 3, 70, 'C');
INSERT  INTO 수강내역 VALUES(4, 4, 90, 'A');
INSERT  INTO 수강내역 VALUES(6, 4, 55, 'F');
INSERT  INTO 수강내역 VALUES(7, 4, 85, 'B');
INSERT  INTO 수강내역 VALUES(14, 4, 95, 'A');
INSERT  INTO 수강내역 VALUES(4, 5,70, 'C');
INSERT  INTO 수강내역 VALUES(6, 5, 95, 'A');
INSERT  INTO 수강내역 VALUES(8, 5, 90, 'A');
INSERT  INTO 수강내역 VALUES(14, 5, 95, 'A');
INSERT  INTO 수강내역 VALUES(6, 8, 90, 'A');
INSERT  INTO 수강내역 VALUES(8, 8, 80, 'B');
INSERT INTO 수강내역 VALUES(14, 8, 95, 'A');
INSERT INTO 수강내역 VALUES(1, 6, 85, 'B');
INSERT INTO 수강내역 VALUES(5, 6, 80, 'B');
INSERT INTO 수강내역 VALUES(11, 6, 78.5, 'C');
INSERT INTO 수강내역 VALUES(1, 7, 95, 'A');
INSERT INTO 수강내역 VALUES(5, 7, 85, 'B');
INSERT INTO 수강내역 VALUES(1, 8, 100, 'A');
SELECT * FROM 수강내역;

--문제1--
SELECT * FROM 학생;

--문제2--
SELECT 학생.이름, 학생.학년, 학생.주소
FROM 학생
ORDER BY 학년;

--문제3--
SELECT 학생.이름 AS "성명", 학생.주소 AS "현재 주소지"
FROM 학생;

--문제4--
SELECT 학생.학년
FROM 학생
GROUP BY 학생.학년;

--문제5--
SELECT 번호, 이름, 주소, 학년, 키, 몸무게, 상태, 입력일자, 학과번호
FROM 학생
WHERE 학생.번호='1';

SELECT * FROM 학생 WHERE 학생.번호=1;

--문제6--
SELECT * FROM 학생 WHERE 학생.키 < 165;

--문제7--
SELECT 학생.이름, 학생.학년, 학생.키, 학생.몸무게
FROM 학생
WHERE 학생.키 >= 170
    AND 학생.학년=1
    ORDER BY 키;

--문제8--(OR)
SELECT 학생.이름, 학생.학년, 학생.키, 학생.몸무게
FROM 학생
WHERE 학생.키 >= 170
    OR 학생.학년=1;
    
--문제9--(BETWEEN)
SELECT 학생.이름, 학생.주소, 학생.키, 학생.몸무게
FROM 학생
WHERE 학생.몸무게 BETWEEN 45 AND 50
ORDER BY 키;

--문제10--(AND)
SELECT 학생.이름, 학생.주소, 학생.키, 학생.몸무게
FROM 학생
WHERE 학생.몸무게 >= 45
    AND 학생.몸무게 <=50
    ORDER BY 키;
    
--문제11--
SELECT 학생.번호, 학생.이름, 학생.학년
FROM 학생
WHERE 학생.학년 IN (2,3)
ORDER BY 번호;

--문제12--
SELECT 학생.번호, 학생.이름, 학생.학년
FROM 학생
WHERE 학생.학년=2 OR 학생.학년=3
ORDER BY 번호;

--문제13--
SELECT * FROM 학생
WHERE 학생.이름 LIKE '박%'
ORDER BY 번호;

--문제14--
SELECT * FROM 학생
WHERE 학생.이름 LIKE '김%'
    OR 학생.이름 LIKE '이%'
    OR 학생.이름 LIKE '박%'
    ORDER BY 번호;
    
--문제15--
SELECT * FROM 학생
WHERE 학생.이름 LIKE '김%' UNION
SELECT * FROM 학생
WHERE 학생.이름 LIKE '이%' UNION
SELECT * FROM 학생
WHERE 학생.이름 LIKE '박%';

--문제16--(IS)
SELECT 학생.이름, 학생.학년, 학생.주소
FROM 학생
WHERE 학생.주소 IS NULL;

--문제17--(IS NOT)
SELECT 학생.이름, 학생.학년, 학생.몸무게
FROM 학생
WHERE 학생.몸무게 IS NOT NULL;

--문제18--
SELECT * FROM 학생
ORDER BY 이름 ASC;

--문제19--(NULLS LAST)
SELECT 학생.이름, 학생.주소, 학생.키
FROM 학생
ORDER BY 키 DESC NULLS LAST;

--문제20--
SELECT 학생.이름, 학생.학년, 학생.주소, 학생.몸무게
FROM 학생
WHERE 학생.학년 = 1
ORDER BY 몸무게;

--문제21--
SELECT 학생.이름, 학생.학년, 학생.키, 학생.몸무게
FROM 학생
WHERE 학생.학년 = 1
ORDER BY 키 DESC, 몸무게 ASC;

--문제22--
SELECT 학생.번호, 학생.이름, 학생.주소
FROM 학생
ORDER BY 이름 ASC;

--문제23--
SELECT 학생.이름, 학생.키, 학생.몸무게
FROM 학생
WHERE 학년 = (SELECT 학생.학년 FROM 학생 WHERE 학생.이름 = '문주원');

--문제24--
FROM 학생
WHERE 학생.키 < 174;

SELECT 학생.이름, 학생.학년, 학생.키
FROM 학생
WHERE 학생.키 < (SELECT AVG(키) FROM 학생 WHERE 학과번호 = 1);

--문제25--
SELECT 학생.이름, 학생.학년, 학생.키
FROM 학생
WHERE 학생.학년 = (SELECT 학생.학년 FROM 학생 WHERE 학생.이름 = '김태희')
    AND 학생.키 > (SELECT 학생.키 FROM 학생 WHERE 학생.이름='김태희');

--문제26--
SELECT 학생.번호, 학생.이름, 학생.키
FROM 학생
WHERE 학생.키=165
ORDER BY 번호;

--문제27
SELECT COUNT(학생.번호) AS "학생 수"
FROM 학생;

--문제28--
SELECT COUNT(학생.이름) AS "정보 있는 학생의 수"
FROM 학생
WHERE 이름 LIKE '박%' 
    AND 몸무게 IS NOT NULL;
    
--문제29--
SELECT AVG(수강내역.점수) AS "평균점수"
FROM 수강내역
WHERE 수강내역.과목번호=1;

--문제30--
SELECT 수강내역.과목번호, AVG(수강내역.점수) AS "과목평균점수"
FROM 수강내역
GROUP BY 수강내역.과목번호
ORDER BY 수강내역.과목번호;

--문제31--(TRUNC함수는 주로 소수점 절사 및 날짜의 시간을 없앨 때 사용된다.)
SELECT 학생.학과번호, 학생.학년, COUNT(학생.학년) AS "인원수", TRUNC(AVG(키)) AS "평균키"
FROM 학생
GROUP BY 학생.학과번호, 학생.학년
ORDER BY 학생.학년;

--문제32--
SELECT 수강내역.과목번호, COUNT(수강내역.학생번호) AS "누적학생수", AVG(수강내역.점수) AS "과목평균점수"
FROM 학생
INNER JOIN 수강내역
    ON 수강내역.학생번호=학생.번호
GROUP BY 수강내역.과목번호 HAVING COUNT(학생.이름)>=4;

--문제33--
SELECT 수강내역.과목번호, COUNT(수강내역.학생번호) AS "누적학생수", AVG(수강내역.점수) AS "과목평균점수"
FROM 학생
INNER JOIN 수강내역
    ON 수강내역.학생번호=학생.번호
GROUP BY 수강내역.과목번호 HAVING COUNT(학생.이름)>=4
ORDER BY 과목평균점수 DESC;

--문제34--
SELECT 학생.번호, 학생.이름, 학과.이름
FROM 학생
INNER JOIN 학과
ON 학생.학과번호=학과.번호
ORDER BY 번호;

--문제35--
SELECT 교수.번호, 교수.이름, 학과.이름
FROM 교수
INNER JOIN 학과
ON 교수.학과번호=학과.번호
ORDER BY 번호;

--문제36--
SELECT 학생.번호, 학생.이름, 학과.이름
FROM 학생
INNER JOIN 학과
ON 학생.학과번호=학과.번호
WHERE 학생.이름 = '김이향';

--문제37--
SELECT 학생.번호, 학생.이름, 학생.키, 학과.이름
FROM 학생
INNER JOIN 학과
ON 학생.학과번호=학과.번호
WHERE 학생.키 >= 180;

--문제38--
SELECT 학과.이름, 교수.이름, 과목.이름
FROM 학과
INNER JOIN 교수
    ON 학과.번호=교수.학과번호
INNER JOIN 과목
    ON 교수.번호=과목.교수번호;
    
--문제39--
SELECT 학과.이름, 과목.이름
FROM 학과
INNER JOIN 교수
    ON 학과.번호=교수.학과번호
INNER JOIN 과목
    ON 교수.번호=과목.교수번호;