--���� ���̺� �߿��� 'JYP'��� ���̵� ���� ����� ������ ������ �߼��ϱ� ���ؼ�, �̸�, �ּ�, ����ó���� �����ؼ� �˻��Ϸ��� ������ ���� ���
select * from buytbl
inner join usertbl
on buytbl.userid=usertbl.userid
where buytbl.userid ='JYP';

--where buytbl.userid ='JYP'�� �����ϸ�, buytbl�� ��� �࿡ ���ؼ� ���� ������ ������� �ݺ��ȴ�.
select * from buytbl
inner join usertbl
on buytbl.userid=usertbl.userid;

select buytbl.userid, username, prodname, addr, mibile1 || mobile2 as "����ó"
from buytbl
inner join usertbl
on buytbl.userid=usertbl.userid;

select B.USERID, u.userName, B.PRODNAME, U.ADDR, U.MIbILE1 || U.MOBILE2 AS "����ó"
FROM BUYTBL B
INNER JOIN USERTBL u
ON B.USERID=U.USERID
WHERE B.USERID = 'JYP';

select U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "����ó"
FROM USERTBL U
INNER JOIN BUYTBL B
ON B.USERID=U.USERID
WHERE B.USERID='JYP';

--��ü ȸ������ ������ ����� ��� ����غ���.
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "����ó"
FROM USERTBL U
INNER JOIN BUYTBL B
ON B.USERID=U.USERID
ORDER BY U.USERID;

--INNER JOIN�� ���ʿ��� ���� ��ϸ� ������ ������ ������ ��찡 �ִ�.
--���θ����� �ѹ��̶� ������ ������ ���ȸ���鿡�� ������ �ȳ����� �߼��ϵ��� ������ ��� DISTINCT���� Ȱ���Ѵ�.
SELECT DISTINCT U.USERID, U.USERNAME, U.ADDR
FROM USERTBL U
INNER JOIN BUYTBL B
ON U.USERID=B.USERID
ORDER BY U.USERID;
--���� ���� ����� ������
SELECT U.USERID, U.USERNAME, U.ADDR
FROM USERTBL U
WHERE EXISTS (
SELECT * FROM BUYTBL B
WHERE U.USERID=B.USERID);


--OUTER
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "����ó"
FROM USERTBL U
LEFT OUTER JOIN BUYTBL B --���� ���̺�(USERTBL)�� ���� ��� ��µǾ�� �Ѵٶ�� ��
ON U.USERID=B.USERID
ORDER BY U.USERID;

--RIGHT OUTER JOIN���� �ٲٷ��� �ܼ��� ���ʰ� ������ ���̺��� ��ġ�� �ٲٸ� �ȴ�.
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "����ó"
FROM BUYTBL B
RIGHT OUTER JOIN USERTBL U --���� ���̺�(USERTBL)�� ���� ��� ��µǾ�� �Ѵٶ�� ��
ON U.USERID=B.USERID
ORDER BY U.USERID;

--�ѹ��� ������ ������ ����ȸ������� �̾ƺ���
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MIBILE1 || U.MOBILE2 AS "����ó"
FROM USERTBL U
LEFT OUTER JOIN BUYTBL B --���� ���̺�(USERTBL)�� ���� ��� ��µǾ�� �Ѵٶ�� ��
ON U.USERID=B.USERID
WHERE B.PRODNAME IS NULL
ORDER BY U.USERID;

--IF, ELSE
SET SERVEROUTPUT ON;
DECLARE
    VAR1 NUMBER(5); --��������(VAR1)
BEGIN
    VAR1 :=100; --������ �� ����(������ ������ ���� :=�� ����Ѵ�.)(:= ���� '='�� ����.)
    IF VAR1= 100 THEN -- ���� VAR1�� 100�̶��
        DBMS_OUTPUT.PUT.LINE('100�Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT.LINE('100�� �ƴմϴ�.');
    END IF;
END;














