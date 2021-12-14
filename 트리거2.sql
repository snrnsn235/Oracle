create table deletedMemberTBL (
    memberID char(8),
    memberName nchar(5),
    memeberAddress nvarchar2(20),
    deletedDate date -- ������ ��¥
    );

create trigger trg_deletedMemberTBL -- Ʈ���� �̸�
    AFTER DELETE -- ���� �Ŀ� �۵��ϰ� ����
    ON MEMBERTBL -- Ʈ���Ÿ� ������ ���̺�
    FOR EACH ROW -- �� �ึ�� �����
BEGIN 
    -- :old ���̺��� ������ ��� ���̺� ����
    INSERT INTO deletedMemberTBL
        VALUES (:old.memberID, :old.memberName, :old.memberAddress, SYSDATE());
END;

SELECT * FROM memberTBL;
DELETE FROM memberTBL where memberName = '������';
SELECT * FROM memberTBL;

CREATE SEQUENCE ORDERSEQ; -- ���� �Ϸù�ȣ��
CREATE SEQUENCE DELIVERSEQ; -- ��� �Ϸù�ȣ��
CREATE TABLE ORDERTBL -- ���� ���̺�
    (ORDERNO NUMBER, -- ���� �Ϸù�ȣ
    USERID NVARCHAR2(5), --������ ȸ�����̵�
    PRODNAME NVARCHAR2(5), --������ ����
    ORDERAMOUNT NUMBER); --������ ����
CREATE TABLE PRODTBL -- ��ǰ ���̺�
(PRODNAME NVARCHAR2(5), -- �����̸�
ACCOUNT NUMBER); --���� ���Ǽ���
CREATE TABLE DELIVERTBL -- ��� ���̺�
( DELIVERNO NUMBER, --��� �Ϸù�ȣ
PRODNAME NVARCHAR2(5), --����� ����
AMOUNT NUMBER); -- ����� ���ǰ���


INSERT INTO PRODTBL VALUES('���', 100);
INSERT INTO PRODTBL VALUES('��', 100);
INSERT INTO PRODTBL VALUES('��', 100);

-- ��ǰ ���̺��� ������ ���ҽ�Ű�� Ʈ����--
CREATE OR REPLACE TRIGGER TRG_ORDER
    AFTER INSERT
    ON ORDERTBL
    FOR EACH ROW
DECLARE
    V_ORDERAMOUNT NUMBER;
    V_PRODNAME NVARCHAR2(5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('1. TRG_ORDER�� �����մϴ�.');
    SELECT :NEW.ORDERAMOUNT INTO V_ORDERAMOUNT FROM DUAL;
    SELECT :NEW.PRODNAME INTO V_PRODNAME FROM DUAL;
    UPDATE PRODTBL SET ACCOUNT = ACCOUNT-V_ORDERAMOUNT
    WHERE PRODNAME=V_PRODNAME;
END;

--��� ���̺� �� ��� ���� �Է��ϴ� Ʈ����
CREATE OR REPLACE TRIGGER TRG_PROD
    AFTER UPDATE
    ON PRODTBL
    FOR EACH ROW
DECLARE
    V_AMOUNT NUMBER;
    V_PRODNAME NVARCHAR2(5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('2. TRG_PROD�� �����մϴ�.');
    SELECT :NEW.PRODNAME INTO V_PRODNAME FROM DUAL;
    --(���� ���� ���� - ���� ���� ����) = �ֹ� ����
    SELECT :OLD.ACCOUNT - :NEW.ACCOUNT INTO V_AMOUNT FROM DUAL;
    
    INSERT INTO DELIVERTBL(DELIVERNO, PRODNAME, AMOUNT)
        VALUES(DELIVERSEQ.NEXTVAL, V_PRODNAME, V_AMOUNT);
END;