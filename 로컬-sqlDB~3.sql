CREATE VIEW V_DELIVER -- ��������� ���� ��
AS
    SELECT B.USERID, U.USERNAME, B.PRODNAME, B.PRICE, B.AMOUNT, U.ADDR
    FROM BUYTBL B
        INNER JOIN USERTBL U
        ON B.USERID=U.USERID;

--��۴���ڴ� ��� �ÿ� ��� ������� �並 Ȯ���ϸ鼭 ����Ѵ�.
--��۴���ڰ� ����� ������� �並 Ȯ���� ����
SELECT * FROM V_DELIVER;

--���ο� ȸ�� '�ŵ���'���� �ֹ� ��û�� �޾Ҵ�. ������� �信 �ֹ������� �Է��� ����
INSERT INTO V_DELIVER VALUES('SDY', '�ŵ���', '����', 50, 1, '��õ');
--������� ����̱⿡ �����͸� �Է��� �� ����. �̷� �� ������� �信 INSTEAD OF Ʈ���Ÿ� �����ؼ� �ذ��� �� �ִ�.

CREATE OR REPLACE TRIGGER TRG_VIEWINSERT
    INSTEAD OF INSERT -- ���� �۾� ��ſ� �۵��ϵ��� ����
    ON V_DELIVER -- �信 ����
    FOR EACH ROW
BEGIN
    INSERT INTO USERTBL(USERID, USERNAME, BIRTHYEAR, ADDR, MDATE)
    VALUES (:NEW.USERID, :NEW.USERNAME, 0, :NEW.ADDR, SYSDATE);
    INSERT INTO BUYTBL(IDNUM, USERID, PRODNAME, PRICE, AMOUNT)
    VALUES (IDSEQ.NEXTVAL, :NEW.USERID, :NEW.PRODNAME, :NEW.PRICE, :NEW.AMOUNT);
END;
--V_DELIVER �信 INSERT�� �õ��Ǹ� �켱 INSERT�Ǵ� ������ ���� :NEW ���̺� �Էµȴ�.
--�׷��Ƿ� :NEW ���̺��� ���뿡�� ���� �ʿ��� ������ ȸ�� ���̺�� ���� ���̺� �и��ؼ� �Է��ϸ� �ȴ�. 
--�׸��� ���� V_DELIVER�信 ����� INSERT���� �����Ѵ�.

INSERT INTO V_DELIVER VALUES('SDY', '�ŵ���', '����', 50, 1, '��õ');

SELECT * FROM USERTBL WHERE USERID = 'SDY';
SELECT * FROM BUYTBL WHERE USERID = 'SDY';
-- INSERT TRIGGER�� �̿��ϸ� ������ ���� �� ������ �Ұ����� ���� �並 '������Ʈ ������ ��'�� ������ �� �ִ�.

SELECT * FROM USER_TRIGGERS;

--�ش� Ʈ������ ������ ������ USER_TRIGGER�� DESCRIPTION �� TRIGGER_BODY ���� Ȯ���ص� �ȴ�.
--��ġ�� ������ ���ν���, �Լ�, ��Ű�� ���� PL/SQL ���α׷��� ��� ����Ǿ� �ִ� USER_SOURCE �ý��� �並 Ȯ���ص� �ȴ�.
SELECT * FROM USER_SOURCE WHERE NAME = UPPER('TRG_VIEWINSERT');

DROP VIEW V_DELIVER;







