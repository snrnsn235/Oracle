create table deletedMemberTBL (
    memberID char(8),
    memberName nchar(5),
    memeberAddress nvarchar2(20),
    deletedDate date -- 삭제한 날짜
    );

create trigger trg_deletedMemberTBL -- 트리거 이름
    AFTER DELETE -- 삭제 후에 작동하게 지정
    ON MEMBERTBL -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용됨
BEGIN 
    -- :old 테이블의 내용을 백업 테이블에 삽입
    INSERT INTO deletedMemberTBL
        VALUES (:old.memberID, :old.memberName, :old.memberAddress, SYSDATE());
END;

SELECT * FROM memberTBL;
DELETE FROM memberTBL where memberName = '당탕이';
SELECT * FROM memberTBL;

CREATE SEQUENCE ORDERSEQ; -- 구매 일련번호용
CREATE SEQUENCE DELIVERSEQ; -- 배송 일련번호용
CREATE TABLE ORDERTBL -- 구매 테이블
    (ORDERNO NUMBER, -- 구매 일련번호
    USERID NVARCHAR2(5), --구매한 회원아이디
    PRODNAME NVARCHAR2(5), --구매한 물건
    ORDERAMOUNT NUMBER); --구매한 개수
CREATE TABLE PRODTBL -- 물품 테이블
(PRODNAME NVARCHAR2(5), -- 물건이름
ACCOUNT NUMBER); --남은 물건수량
CREATE TABLE DELIVERTBL -- 배송 테이블
( DELIVERNO NUMBER, --배송 일련번호
PRODNAME NVARCHAR2(5), --배송할 물건
AMOUNT NUMBER); -- 배송할 물건개수


INSERT INTO PRODTBL VALUES('사과', 100);
INSERT INTO PRODTBL VALUES('배', 100);
INSERT INTO PRODTBL VALUES('귤', 100);

-- 물품 테이블에서 개수를 감소시키는 트리거--
CREATE OR REPLACE TRIGGER TRG_ORDER
    AFTER INSERT
    ON ORDERTBL
    FOR EACH ROW
DECLARE
    V_ORDERAMOUNT NUMBER;
    V_PRODNAME NVARCHAR2(5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('1. TRG_ORDER를 실행합니다.');
    SELECT :NEW.ORDERAMOUNT INTO V_ORDERAMOUNT FROM DUAL;
    SELECT :NEW.PRODNAME INTO V_PRODNAME FROM DUAL;
    UPDATE PRODTBL SET ACCOUNT = ACCOUNT-V_ORDERAMOUNT
    WHERE PRODNAME=V_PRODNAME;
END;

--배송 테이블에 새 배송 건을 입력하는 트리거
CREATE OR REPLACE TRIGGER TRG_PROD
    AFTER UPDATE
    ON PRODTBL
    FOR EACH ROW
DECLARE
    V_AMOUNT NUMBER;
    V_PRODNAME NVARCHAR2(5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('2. TRG_PROD를 실행합니다.');
    SELECT :NEW.PRODNAME INTO V_PRODNAME FROM DUAL;
    --(변경 전의 개수 - 변경 후의 개수) = 주문 개수
    SELECT :OLD.ACCOUNT - :NEW.ACCOUNT INTO V_AMOUNT FROM DUAL;
    
    INSERT INTO DELIVERTBL(DELIVERNO, PRODNAME, AMOUNT)
        VALUES(DELIVERSEQ.NEXTVAL, V_PRODNAME, V_AMOUNT);
END;