CREATE USER MOVIE IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;
    
GRANT CONNECT, RESOURCE, DBA TO MOVIE;



CREATE TABLE ��ȭ 
(��ȣ VARCHAR2(3) NOT NULL PRIMARY KEY,
�̸� VARCHAR2(30) UNIQUE,
�������� NUMBER,
����� NUMBER,
������ NUMBER,
���� NUMBER(5,2)
);

CREATE TABLE ��� (
��ȣ VARCHAR2(3) NOT NULL PRIMARY KEY,
�̸� VARCHAR2(30),
��� DATE,
Ű NUMBER,
������ NUMBER,
����� VARCHAR2(30)
);

CREATE TABLE �⿬(
��ȭ��ȣ VARCHAR2(3) NOT NULL,
����ȣ VARCHAR2(3) NOT NULL,
���� VARCHAR2(1),
�� VARCHAR(30)
);

INSERT INTO ��ȭ VALUES(1,'��', 2014, 135748398910, 17613682, '8.49' );
INSERT INTO ��ȭ VALUES(2,'����', 1999, NULL, 5820000, '8.79' );
INSERT INTO ��ȭ VALUES(3,'����, ���� �� ����', 2012, 88900208769, 12319542, '9.23' );
INSERT INTO ��ȭ VALUES(4,'���ϵ�', 2012, 93665568500, 12983330, '7.60' );
INSERT INTO ��ȭ VALUES(5,'�������� �׳�', 2001, NULL, 1735692, '9.29' );
INSERT INTO ��ȭ VALUES(6,'��ȣ��', 2013, 82871759300, 11374610, '8.97' );
INSERT INTO ��ȭ VALUES(7,'�о�', 2007, NULL, 1710364, '7.76' );
INSERT INTO ��ȭ VALUES(8,'�±ر� �ֳ�����', 2004, NULL, 11746135, '9.15' );
INSERT INTO ��ȭ VALUES(9,'�ʷϹ����', 1997, NULL, NULL, '8.79' );
INSERT INTO ��ȭ VALUES(10,'���೪�� ħ��', 1996, NULL, NULL, '7.67' );
INSERT INTO ��ȭ VALUES(11,'���� �� ����', 2008, 11211235000, 1706576, '7.80' );
INSERT INTO ��ȭ VALUES(12,'������ ����:���Ǳ�ȯ', 2003, NULL,  NULL, '9.36' );
INSERT INTO ��ȭ VALUES(13,'�׳�', 2014, NULL,  NULL, '8.51' );
INSERT INTO ��ȭ VALUES(14,'����', 2013, NULL,  NULL, '7.96' );
SELECT * FROM ��ȭ;
INSERT INTO ��� VALUES(1, '�ֹν�', '1962-04-27', 177, 70, NULL);
INSERT INTO ��� VALUES(2, '���·�', '1970-11-29', NULL, NULL, NULL);
INSERT INTO ��� VALUES(4, '�Ѽ���', '1964-11-03', 178, 64, '�Ӹ���');
INSERT INTO ��� VALUES(5, '�۰�ȣ', '1967-01-17', 180, 80, NULL);
INSERT INTO ��� VALUES(6, '�̺���', NULL, 177, 72, '�̹���');
INSERT INTO ��� VALUES(7, '��ȿ��', NULL, 172, 48, NULL);
INSERT INTO ��� VALUES(8, '������', '1981-10-30', 174, 52, NULL);
INSERT INTO ��� VALUES(10, '������', '1970-09-05', 170, 50, NULL);
INSERT INTO ��� VALUES(12, '���¿�', '1976-03-25', 175, 65, '�ּ���');
INSERT INTO ��� VALUES(15, '������', NULL, 165, NULL, '���ñ�');
INSERT INTO ��� VALUES(16, '�嵿��', NULL, 182, 68, '��ҿ�');
INSERT INTO ��� VALUES(17, '������', '1967-01-16', 169, 51, '�ѻ�');
INSERT INTO ��� VALUES(18, '����', NULL, 168, 46, NULL);
INSERT INTO ��� VALUES(19, '������', NULL, NULL, NULL, NULL);
SELECT * FROM ���;
INSERT INTO �⿬ VALUES(1, 1, 1, '�̼���');
INSERT INTO �⿬ VALUES(1, 2, 1, '��������');
INSERT INTO �⿬ VALUES(2, 4, 1, '���߿�');
INSERT INTO �⿬ VALUES(2, 1, 1, '�ڹ���');
INSERT INTO �⿬ VALUES(2, 5, 1, '�����');
INSERT INTO �⿬ VALUES(3, 6, 1, '����/�ϼ�');
INSERT INTO �⿬ VALUES(3, 2, 1, '���');
INSERT INTO �⿬ VALUES(3, 7, 1, '����');
INSERT INTO �⿬ VALUES(4, 10, 1, '�ս�');
INSERT INTO �⿬ VALUES(4, 8, 1, '������');
INSERT INTO �⿬ VALUES(4, 19, 2, '���忪');
INSERT INTO �⿬ VALUES(5, 8, 1, '�׳�');
INSERT INTO �⿬ VALUES(5, 12, 1, '�ǿ�');
INSERT INTO �⿬ VALUES(6, 5, 1, '�ۿ켮');
INSERT INTO �⿬ VALUES(7, 15, 1, '�ǾƳ� �п� ����, �̽ž�');
INSERT INTO �⿬ VALUES(7, 5, 1, 'ī���� ����, ������');
INSERT INTO �⿬ VALUES(8, 16, 1, '������');
INSERT INTO �⿬ VALUES(9, 4, 1, '����');
INSERT INTO �⿬ VALUES(9, 17, 1, '�̾�');
INSERT INTO �⿬ VALUES(10, 4, 1, '����');
INSERT INTO �⿬ VALUES(10, 17, 1, '����');
INSERT INTO �⿬ VALUES(11, 18, 1, '�ð� �Ƴ�, ���� | ����, ���');
INSERT INTO �⿬ VALUES(11, 19, 1, '��Ÿ����Ʈ, ����');
SELECT * FROM �⿬;


--����1--
SELECT �̸�, ����
FROM ��ȭ
GROUP BY �̸�, ����
HAVING (����) >= 9;

--����2--
SELECT ��������
FROM ��ȭ
WHERE �̸� LIKE '����';

--����3--
SELECT �̸�, ����
FROM ��ȭ
WHERE �̸� LIKE '%��%';


--����4--
SELECT �̸�, ����
FROM ��ȭ
WHERE �̸� LIKE '%��%'
ORDER BY ��������;

--����5--
SELECT �̸�, ����
FROM ��ȭ
WHERE �̸� LIKE '%�׳�%';

--����6--
SELECT �̸�
FROM ��ȭ
WHERE (��ȣ) <= 3 ;

--����7--
SELECT ��ȣ
FROM ��ȭ
WHERE �̸� LIKE '��ȣ��';

--����8--
SELECT ��ȣ
FROM ���
WHERE �̸� LIKE '�۰�ȣ';

--����9--
SELECT ���.�̸�
FROM  ���, ��ȭ, �⿬
WHERE ��ȭ.��ȣ = �⿬.��ȭ��ȣ
    AND ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.��ȣ=1;

--����10--
SELECT ���.�̸�
FROM ���, �⿬, ��ȭ
WHERE ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.�̸� LIKE '���ϵ�';
    
--����11--
SELECT ��ȭ.�̸�
FROM ���, ��ȭ, �⿬
WHERE ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND ���.�̸� LIKE '�۰�ȣ';

--����12--
SELECT ��ȭ.�̸�
FROM ���, ��ȭ, �⿬
WHERE ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND �⿬.����='2'
    AND ���.�̸� LIKE '������';
    
--����13--
SELECT ��ȭ.�̸�, ���.�̸�
FROM ���, ��ȭ, �⿬
WHERE ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND �⿬.����='1'
    AND ��ȭ.�������� LIKE '2012';
    
--����14--
SELECT ��ȭ.��������, COUNT(��ȭ.�̸�) AS "�⿬��ǰ ��"
FROM ���, ��ȭ, �⿬
WHERE ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND ���.�̸�='�۰�ȣ'
GROUP BY ��ȭ.��������
ORDER BY ��ȭ.��������;    

--����15--
SELECT ��ȭ.�̸� "��ȭ����", ���.�̸� "����̸�"
FROM ���, ��ȭ, �⿬
WHERE ���.��ȣ=�⿬.����ȣ
    AND ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND �⿬.����='1'
    AND ��ȭ.��ȣ IN (
        SELECT �⿬.��ȭ��ȣ FROM ���, �⿬ WHERE ���.��ȣ=�⿬.����ȣ
        AND ���.�̸�='�۰�ȣ'
    );

--����16--
SELECT ���.�̸�
FROM �⿬, ���
WHERE ���.��ȣ = �⿬.����ȣ
    AND �⿬.���� = 1
    GROUP BY  ���.�̸�
    HAVING COUNT(�⿬.��ȭ��ȣ)  >= 2;

--����17--
SELECT ��ȭ.�̸�, COUNT(�⿬.����ȣ) AS "�⿬��� ��"
FROM ��ȭ, �⿬
WHERE ��ȭ.��ȣ=�⿬.��ȭ��ȣ
    AND ��ȭ.��������=2012
GROUP BY ��ȭ.�̸�;
    
--����18--
SELECT ���.�̸�
FROM ���, �⿬
WHERE ���.��ȣ=�⿬.����ȣ
    AND ���.�̸� != '�۰�ȣ'
    AND �⿬.��ȭ��ȣ 
    IN (SELECT �⿬.��ȭ��ȣ
    FROM �⿬, ���
    WHERE ���.��ȣ=�⿬.����ȣ
    AND ���.�̸� = '�۰�ȣ')
ORDER BY ���.�̸�;


