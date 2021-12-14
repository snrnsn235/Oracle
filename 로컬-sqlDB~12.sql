drop table buytbl; --���� ���̺��� �ǽ��� �ʿ�����Ƿ� ����
CREATE TABLE BACKUP_USERTBL(
USERID CHAR(8) NOT NULL PRIMARY KEY,
USERNAME NVARCHAR2(10) NOT NULL,
BIRTHYEAR NUMBER(4) NOT NULL,
ADDR NCHAR(2) NOT NULL,
MOBILE1 CHAR(3),
MOBILE2 CHAR(8),
HEIGHT NUMBER(3),
MDATE DATE,
MODTPE NCHAR(2), --����� Ÿ��. '����' �Ǵ� '����'
MODDATE DATE, -- ����� ��¥
MODUSER NVARCHAR2(256) --������ �����
);

CREATE OR REPLACE TRIGGER TRG_BACKUPUSERTBL -- Ʈ���� �̸�
    AFTER UPDATE OR DELETE -- ����, ���� �Ŀ� �۵��ϵ��� ����
    ON USERTBL -- Ʈ���Ÿ� ������ ���̺�
    FOR EACH ROW -- �� �ึ�� �����
DECLARE
    V_MODTYPE NCHAR(2); --����Ÿ��(NCHAR(2)�� ����)
BEGIN
    IF UPDATING THEN -- ������Ʈ �Ǿ��ٸ�
        V_MODTYPE := '����';
    ELSIF DELETING THEN -- �����Ǿ��ٸ�
        V_MODTYPE := '����';
    END IF;
    -- := OLD ���̺��� ����(���� ���� ����)�� ��� ���̺� ����
    INSERT INTO BACKUP_USERTBL VALUES(:OLD.USERID, :OLD.USERNAME, :OLD.BIRTHYEAR, 
    :OLD.ADDR, :OLD.MOBILE1, :OLD.MOBILE2, :OLD.HEIGHT, :OLD.MDATE,
    V_MODTYPE, SYSDATE(), USER() );
END TRG_BACKUPUSERTBL;

--':OLD ���̺�' �̶� UPDATE �Ǵ� DELETE�� ����Ǳ� ���� �����Ͱ� ��� ����Ǿ� �ִ� �ӽ� ���̺��̶�� �����ϸ� �ȴ�.
--31���� USER()�� ���� ����ڸ� �ǹ��ϴ� �Լ�

UPDATE USERTBL SET ADDR = '����' WHERE USERID = 'JKW';
DELETE USERTBL WHERE HEIGHT >= 177;

SELECT * FROM BACKUP_USERTBL;

TRUNCATE TABLE USERTBL;
--��� ���̺� ������ ������ ���� �ʾҴ�. ������ TRUNCATE TABLE�� ���� �ÿ��� Ʈ���Ű� �۵����� �ʱ� �����̴�.

DROP TRIGGER TRG_BACKUPUSERTBL;

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER TRG_INSERTUSERTBL
    AFTER INSERT -- ���� �Ŀ� �۵��ϵ��� ����
    ON USERTBL
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('�������� �Է��� �õ��߽��ϴ�.');
    DBMS_OUTPUT.PUT_LINE('������ ������ ������ ��ϵǾ����ϴ�.');
    DBMS_OUTPUT.PUT_LINE('�׸���, �Է��� �����ʹ� ������� �ʾҽ��ϴ�.');
    RAISE_APPLICATION_ERROR(-20999, '�Է� �õ� �߰� !!!'); --������ ������ �߻���Ű�� �Լ�
END;

BEGIN
    INSERT INTO USERTBL VALUES('ABC', '����', 1977, '����', '011', '1111111', 181, '2019-12-25');
END;
DROP TRIGGER TRG_INSERTUSERTBL;
CREATE OR REPLACE TRIGGER TRG_CHANGEUSERTBL-- �̸� ����
BEFORE INSERT -- ���� ���� �۵��ϵ��� ����
ON USERTBL
FOR EACH ROW
BEGIN
    :NEW.USERNAME := SUBSTR(:NEW.USERNAME, 1, 1) || '00';
    :NEW.BIRTHYEAR := :NEW.BIRTHYEAR+2333;
END;

INSERT INTO USERTBL VALUES('ABC', '����', 1977, '����', '011', '1111111', 181, '2019-12-25');
SELECT * FROM USERTBL;

--Ư�� ���� ����Ǹ� �۵��ϴ� Ʈ����
CREATE OR REPLACE TRIGGER TRG_COLUMNCHANGE
    AFTER UPDATE OF USERNAME -- �̸� ���� ������Ʈ�� �۵��Ǹ� Ʈ���Ű� �۵��ǵ��� ����
    ON USERTBL
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20888, '�̸��� ������ �ȵ˴ϴ�. !!!'); --�̸��� ������� �ʵ��� ����� ������ �߻����״�.
END;

UPDATE USERTBL SET ADDR = '����' WHERE USERID ='ABC';
UPDATE USERTBL SET USERNAME = '����' WHERE USERID ='ABC';








