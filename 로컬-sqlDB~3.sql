CREATE VIEW V_DELIVER -- 배송정보를 위한 뷰
AS
    SELECT B.USERID, U.USERNAME, B.PRODNAME, B.PRICE, B.AMOUNT, U.ADDR
    FROM BUYTBL B
        INNER JOIN USERTBL U
        ON B.USERID=U.USERID;

--배송담당자는 배송 시에 계속 배송정보 뷰를 확인하면서 배송한다.
--배송담당자가 사용할 배송정보 뷰를 확인해 보자
SELECT * FROM V_DELIVER;

--새로운 회원 '신동엽'에게 주문 요청을 받았다. 배송정보 뷰에 주문사항을 입력해 보자
INSERT INTO V_DELIVER VALUES('SDY', '신동엽', '구두', 50, 1, '인천');
--배송정보 뷰는이기에 데이터를 입력할 수 없다. 이럴 때 배송정보 뷰에 INSTEAD OF 트리거를 부착해서 해결할 수 있다.

CREATE OR REPLACE TRIGGER TRG_VIEWINSERT
    INSTEAD OF INSERT -- 삽입 작업 대신에 작동하도록 지정
    ON V_DELIVER -- 뷰에 장착
    FOR EACH ROW
BEGIN
    INSERT INTO USERTBL(USERID, USERNAME, BIRTHYEAR, ADDR, MDATE)
    VALUES (:NEW.USERID, :NEW.USERNAME, 0, :NEW.ADDR, SYSDATE);
    INSERT INTO BUYTBL(IDNUM, USERID, PRODNAME, PRICE, AMOUNT)
    VALUES (IDSEQ.NEXTVAL, :NEW.USERID, :NEW.PRODNAME, :NEW.PRICE, :NEW.AMOUNT);
END;
--V_DELIVER 뷰에 INSERT가 시도되면 우선 INSERT되는 내용이 먼저 :NEW 테이블에 입력된다.
--그러므로 :NEW 테이블의 내용에서 각각 필요한 내용을 회원 테이블과 구매 테이블에 분리해서 입력하면 된다. 
--그리고 원래 V_DELIVER뷰에 수행된 INSERT문은 무시한다.

INSERT INTO V_DELIVER VALUES('SDY', '신동엽', '구두', 50, 1, '인천');

SELECT * FROM USERTBL WHERE USERID = 'SDY';
SELECT * FROM BUYTBL WHERE USERID = 'SDY';
-- INSERT TRIGGER을 이용하면 데이터 삽입 및 수정이 불가능한 복합 뷰를 '업데이트 가능한 뷰'로 변경할 수 있다.

SELECT * FROM USER_TRIGGERS;

--해당 트리거의 내용을 보려면 USER_TRIGGER의 DESCRIPTION 및 TRIGGER_BODY 열을 확인해도 된다.
--그치만 스토어드 프로시저, 함수, 패키지 등의 PL/SQL 프로그램이 모두 저장되어 있는 USER_SOURCE 시스템 뷰를 확인해도 된다.
SELECT * FROM USER_SOURCE WHERE NAME = UPPER('TRG_VIEWINSERT');

DROP VIEW V_DELIVER;







