CREATE TABLE 학생 (
번호 NUMBER(6) NOT NULL PRIMARY KEY,
이름 VARCHAR2(20),
주소 VARCHAR2(50),
학년 NUMBER(6),
생년월일 VARCHAR2(20),
학과번호 NUMBER(6),
학점 NUMBER(6)
);

INSERT INTO 학생 VALUES(1,'차태원', '인천 남동구', 4, '1980-01-02', 10, 7);
INSERT INTO 학생 VALUES(2,'김향기', '서울 영등포구', 4, '1990-10-12', 9, 7);
INSERT INTO 학생 VALUES(3,'하정우', '인천 남동구', 4, '1985-03-04', 8, 6);
INSERT INTO 학생 VALUES(4,'주지훈', '서울 영등포구', 3, '1980-12-12', 7, 6);
INSERT INTO 학생 VALUES(5,'마동석', '서울 영등포구', 3, '1984-07-04', 6, 5);
INSERT INTO 학생 VALUES(6,'이정재', '인천 남동구', 2, '1987-09-24', 5, 5);
INSERT INTO 학생 VALUES(7,'황정민', '서울 금천구', 2, '1979-05-06', 4, 4);
INSERT INTO 학생 VALUES(8,'송강호', '서울 구로구', 2, '1974-08-25', 3, 3);
INSERT INTO 학생 VALUES(9,'강동원', '인천 남동구', 1, '1985-06-13', 2, 2);
INSERT INTO 학생 VALUES(10,'박성웅', '서울 구로구', 1, '1978-10-18', 1, 1);

CREATE TABLE 학과 (
대계열 VARCHAR2(20),
중계열 VARCHAR2(30),
학과이름 VARCHAR2(40),
학과번호 NUMBER(6) NOT NULL PRIMARY KEY
);

INSERT INTO 학과 VALUES('공학', '건축', '건축학과', 1);
INSERT INTO 학과 VALUES('공학', '산업', '산업공학과', 2);
INSERT INTO 학과 VALUES('교육', '유아교육', '유아교육학과', 3);
INSERT INTO 학과 VALUES('교육', '중등교육', '언어교육학과', 4);
INSERT INTO 학과 VALUES('사회', '법률', '법학과', 5);
INSERT INTO 학과 VALUES('사회', '사회과학', '정치외교학과', 6);
INSERT INTO 학과 VALUES('예체능', '디자인', '산업디자인과', 7);
INSERT INTO 학과 VALUES('예체능', '음악', '국악과', 8);
INSERT INTO 학과 VALUES('자연', '생활과학', '가정관리학과', 9);
INSERT INTO 학과 VALUES('자연', '생물', '생물학과', 10);

CREATE TABLE 교수(
교수번호 NUMBER(6) NOT NULL PRIMARY KEY,
교수이름 VARCHAR2(20),
담당학과번호 NUMBER(6)
);
DROP TABLE STUDENT;
INSERT INTO 교수 VALUES(1, '김교수', 1);
INSERT INTO 교수 VALUES(2, '이교수', 3);
INSERT INTO 교수 VALUES(3, '박교수', 5);
INSERT INTO 교수 VALUES(4, '조교수', 7);
INSERT INTO 교수 VALUES(5, '최교수', 9);
INSERT INTO 교수 VALUES(6, '지교수', 2);
INSERT INTO 교수 VALUES(7, '차교수', 4);
INSERT INTO 교수 VALUES(8, '홍교수', 6);
INSERT INTO 교수 VALUES(9, '황교수', 8);
INSERT INTO 교수 VALUES(10, '구교수', 10);

--건축학과에 등록되어 있는 학생을 찾으시오.
SELECT * FROM 학생
WHERE 학생.학과번호= 1;

--차태현 학생의 학과담당교수를 찾으시오.
SELECT * FROM 교수
WHERE 교수.담당학과번호 = 10;

--언어교육학과 담당교수를 찾으시오.
SELECT * FROM 교수, 학과
WHERE 교수.담당학과번호 = 학과.학과번호
AND 학과.학과번호 = 4;

--김향기 학생의 학과이름과 담당교수를 찾으시오.
SELECT 학과.학과이름, 교수.교수이름 FROM 학과,교수,학생
WHERE 학생.학과번호 = 학과.학과번호
AND 교수.담당학과번호 = 학과.학과번호
AND 학생.이름 = '김향기';

--박성웅 학생의 담당교수번호와 담당학과의 중계열을 찾으시오.
SELECT 교수.교수번호, 학과.중계열 
FROM 교수, 학과, 학생
WHERE 학생.학과번호 = 학과.학과번호
AND 교수.담당학과번호 = 학과.학과번호
AND 학생.이름 = '박성웅';

--주지훈 학생의 학과이름과 대계열을 찾으시오.
SELECT 학과.학과이름, 학과.대계열 FROM 학생, 학과
WHERE 학생.학과번호 = 학과.학과번호
AND 학생.이름='주지훈';

--하정우 학생과 주소가 같은 학생들의 이름을 찾으시오.
SELECT 학생.이름, 학생.주소 FROM 학생
WHERE 학생.주소 = '인천 남동구';

--차태현 학생과 학년이 같은 학생들의 이름을 찾으시오.
SELECT 학생.이름, 학생.학년 FROM 학생
WHERE 학생.학년 = 4;

--강동원 학생과의 주소는 같지만 학년이 다른 학생들의 이름을 찾으시오.
SELECT 학생.이름, 학생.주소, 학생.학년 FROM 학생
WHERE 학생.주소 = '인천 남동구'
AND 학생.학년 != 1;

--이정재 학생의 주소가 같은 학생들의 학과 교수를 찾으시오
SELECT 교수.교수이름, 교수.담당학과번호 FROM 교수, 학생
WHERE 학생.학과번호 = 교수.담당학과번호
AND 학생.주소 = '인천 남동구'
ORDER BY 교수.담당학과번호 DESC;

-- 송강호 학생과 주소는 같고 학년이 위인 학생들의 이름과 학과번호를 찾으시오
SELECT 학생.이름, 학생.학과번호, 학생.주소 FROM 학생
WHERE 학생.주소 = '서울 구로구'
AND 학생.학년 > 2;

-- 송강호 학생과 학년이 같은 학생들의 학과를 찾으시오
SELECT 학생.이름, 학생.학년, 학과.학과이름 FROM 학생, 학과
WHERE 학생.학과번호=학과.학과번호 
AND 학생.학년 = 2;

-- 박성웅 학생과 학년이 같은 학생들의 담당교수와 그 담당교수의 번호, 담당학과를 찾으시오.
SELECT 교수.교수이름, 교수.담당학과번호, 학과.학과이름 FROM 교수, 학과, 학생
WHERE 교수.담당학과번호=학과.학과번호
AND 학과.학과번호=학생.학과번호
AND 학생.학년=1;

-- 황정민 학생보다 학년이 위인 학생들의 학과이름과 그 학과의 중계열, 대계열을 찾으시오
SELECT 학생.번호, 학생.이름, 학과.학과이름, 학과.대계열, 학과.중계열 FROM 학과, 학생
WHERE 학과.학과번호=학생.학과번호
AND 학생.학년 > 2
ORDER BY 번호;

-- 각 테이블에 insert / update / delete 가 발생하면 해당 이벤트이름, 테이블명, 현재시간을 저장하는 트리거를 작성하시오
CREATE TABLE BACKUP_교수
(교수번호 NUMBER(6) NOT NULL PRIMARY KEY,
교수이름 VARCHAR2(20),
담당학과번호 NUMBER(6)
);
CREATE TABLE BACKUP_학과
(대계열 VARCHAR2(20),
중계열 VARCHAR2(30),
학과이름 VARCHAR2(40),
학과번호 NUMBER(6) NOT NULL PRIMARY KEY
);
CREATE TABLE BACKUP_학생
(번호 NUMBER(6) NOT NULL PRIMARY KEY,
이름 VARCHAR2(20),
주소 VARCHAR2(50),
학년 NUMBER (6),
생년월일 VARCHAR2(20),
학과번호 NUMBER (6),
학점 NUMBER (6),
이벤트이름 NCHAR(2)
);


CREATE OR REPLACE TRIGGER TRG_BACKUP교수
    AFTER UPDATE OR DELETE OR INSERT
    ON 교수
    FOR EACH ROW
DECLARE
    V_이벤트이름 NCHAR(2);
BEGIN
    IF UPDATING THEN
        V_이벤트이름 := '수정';
    ELSIF DELETING THEN
        V_이벤트이름 := '삭제';
    ELSIF INSERTING THEN
        V_이벤트이름 := '추가';
END IF;
INSERT INTO BACKUP_교수 VALUES(:OLD.교수번호, :OLD.교수이름, :OLD.담당학과번호 );
END TRG_BACKUP교수;

CREATE OR REPLACE TRIGGER TRG_BACKUP학과
    AFTER UPDATE OR DELETE OR INSERT
    ON 학과
    FOR EACH ROW
DECLARE
    V_MODTYPE NCHAR(2);
BEGIN
    IF UPDATING THEN
        V_MODTYPE := '수정';
    ELSIF DELETING THEN
        V_MODTYPE := '삭제';
    ELSIF INSERTING THEN
        V_MODTYPE := '추가';
END IF;
INSERT INTO BACKUP_학과 VALUES(:OLD.대계열, :OLD.중계열, :OLD.학과이름, :OLD.학과번호 );
END TRG_BACKUP학과;

CREATE OR REPLACE TRIGGER TRG_BACKUP학생
    AFTER UPDATE OR DELETE OR INSERT
    ON 학생
    FOR EACH ROW
DECLARE
    V_이벤트이름 NCHAR(2);
BEGIN
    IF UPDATING THEN
        V_이벤트이름 := '수정';
    ELSIF DELETING THEN
        V_이벤트이름 := '삭제';
    ELSIF INSERTING THEN
        V_이벤트이름 := '추가';
END IF;
INSERT INTO BACKUP_학생 VALUES(:OLD.번호, :OLD.이름, :OLD.주소, :OLD.학년, :OLD.생년월일, :OLD.학과번호, :OLD.학점, V_이벤트이름);
END TRG_BACKUP학생;

UPDATE 학과 SET 학과이름 = '언어청각치료학과' WHERE 학과번호 = 2;
INSERT INTO 학생 VALUES (1, '이재협', '대구 방촌동', 1, '1992-93-94', 3, 4); 
SELECT * FROM BACKUP_학과;
SELECT * FROM BACKUP_학생;
SELECT * FROM 학생;

