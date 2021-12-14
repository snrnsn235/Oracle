CREATE USER HAKSA IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;
    
GRANT CONNECT, RESOURCE, DBA TO HAKSA;

CREATE TABLE �а� (
��ȣ NUMBER NOT NULL PRIMARY KEY,
�̸� NVARCHAR2(10) NOT NULL
);

CREATE TABLE ���� (
    ��ȣ NUMBER NOT NULL PRIMARY KEY,
    �̸� NVARCHAR2(10) NOT NULL,
    �а���ȣ NUMBER NOT NULL,
    FOREIGN KEY(�а���ȣ) REFERENCES �а�(��ȣ)
);

CREATE TABLE �л� (
    ��ȣ NUMBER NOT NULL PRIMARY KEY,
    �̸� NVARCHAR2(10) NOT NULL,
    �ּ� NVARCHAR2(50),
    �г� NUMBER,
    Ű NUMBER,
    ������ NUMBER,
    ���� NVARCHAR2(4),
    �Է����� DATE,
    �а���ȣ NUMBER NOT NULL, 
    FOREIGN KEY(�а���ȣ) REFERENCES �а�(��ȣ)
);

CREATE TABLE ����(
��ȣ NUMBER NOT NULL PRIMARY KEY,
�̸� NVARCHAR2(20) NOT NULL,
���� NUMBER,
������ȣ NUMBER NOT NULL,
FOREIGN KEY (������ȣ) REFERENCES ����(��ȣ)
);

CREATE TABLE �������� (
�л���ȣ NUMBER NOT NULL,
�����ȣ NUMBER NOT NULL,
���� NUMBER(4,1),
��� NVARCHAR2(1),
CONSTRAINT �������� PRIMARY KEY(�л���ȣ, �����ȣ),
FOREIGN KEY (�л���ȣ) REFERENCES �л�(��ȣ),
FOREIGN KEY (�����ȣ) REFERENCES ����(��ȣ)
);
--DROP TABLE ��������;
--DROP TABLE ����;
--DROP TABLE �л�;
--DROP TABLE ����;
--DROP TABLE �а�;



INSERT INTO �а� VALUES(1, '����Ʈ������а�');
INSERT INTO �а� VALUES(2, '��ǻ�Ͱ��а�');
INSERT INTO �а� VALUES(3, '�濵�����а�');
INSERT INTO �а� VALUES(4, '�濵�а�');
INSERT INTO �а� VALUES(5, '���ؿ�ȭ��');
INSERT INTO �а� VALUES(6, 'ö�а�');
SELECT * FROM �а�;


INSERT INTO ���� VALUES(1, '������', 1);
INSERT INTO ���� VALUES(2, '������', 1);
INSERT INTO ���� VALUES(3, '���̼�', 1);
INSERT INTO ���� VALUES(4, '�̼�ȣ', 2);
INSERT INTO ���� VALUES(5, '����', 3);
INSERT INTO ���� VALUES(6, '�����', 5);
INSERT INTO ���� VALUES(7, '�鳲��', 5);
INSERT INTO ���� VALUES(8, '������', 5);
INSERT INTO ���� VALUES(9, '�̻��', 5);
SELECT * FROM ����;

INSERT INTO ���� VALUES(1,'�����ͺ��̽�����', 3, 3);
INSERT INTO ���� VALUES(2,'�����ͺ��̽����α׷���', 3, 3);
INSERT INTO ���� VALUES(3,'SQLȰ��', 3, 4);
INSERT INTO ���� VALUES(4,'�����ͺ��̽�', 4, 5);
INSERT INTO ���� VALUES(5,'���ͳݸ�����', 3, 5);
INSERT INTO ���� VALUES(6,'����ǽ�', 2, 7);
INSERT INTO ���� VALUES(7,'��ȭ���۽ǽ�', 2, 8);
INSERT INTO ���� VALUES(8,'��ȭ������', 1, 9);
SELECT * FROM ����;

INSERT INTO �л� VALUES(1, '������', '��õ ������', 4, 166, 56, '����', '2005-03-01', 5);
INSERT INTO �л� VALUES(6, '������', '���� ��õ��', 2, 183, 65, '����', '2015-02-14', 3);
INSERT INTO �л� VALUES(7, '��ĥ��', '���� ��õ��', 1, 178, 65, '����', '2016-02-19', 1);
INSERT INTO �л� VALUES(8, '������', '���� ���α�', 1, 165, 45, '����', '2016-02-19', 3);
INSERT INTO �л� VALUES(9, 'ä��', '���� ���α�', 1, 172, 47, '����', '2016-02-19', 2);
INSERT INTO �л� VALUES(11, '����', '���� ������', 1, 162, 43, '����', '2016-02-19', 5);
INSERT INTO �л� VALUES(12, '��ȣ', '���� ������', 1, 184, 66, '����', '2016-08-10', 1);
INSERT INTO �л� VALUES(13, '����', '���� ���α�', 1, 162, 45, '����', '2016-02-19', 1);
INSERT INTO �л� VALUES(14, '���ٿ�', '���� ������',1, 165, 45, '����', '2016-02-19', 3);
INSERT INTO �л� VALUES(3, '�̼���', '���� ���α�', 4, NULL, NULL, '����', '2013-03-01', 4);
INSERT INTO �л� VALUES(4, '���ֿ�', '��� ��õ��', 3, NULL, NULL, '����', '2014-02-13', 3);
INSERT INTO �л� VALUES(5, '������', '���� ��������', 3, NULL, NULL, '����', '2014-02-13', 5);
INSERT INTO �л� VALUES(10, '�ڼ���', NULL, 1, 168, 46, '����', '2016-02-19', 2);
INSERT INTO �л� VALUES(2, '�ں���', '��õ ����', 4, 168, NULL, '����', '2010-03-01', 6);
SELECT * FROM �л�;

INSERT INTO �������� VALUES(7, 1, 84.5, 'B');
INSERT  INTO �������� VALUES(12, 1, 50, 'F');
INSERT  INTO �������� VALUES(13, 1, 90, 'A');
INSERT  INTO �������� VALUES(7, 2, 80, 'B');
INSERT  INTO �������� VALUES(13, 2, 94.5, 'A');
INSERT  INTO �������� VALUES(9, 3, 90, 'A');
INSERT  INTO �������� VALUES(10, 3, 70, 'C');
INSERT  INTO �������� VALUES(4, 4, 90, 'A');
INSERT  INTO �������� VALUES(6, 4, 55, 'F');
INSERT  INTO �������� VALUES(7, 4, 85, 'B');
INSERT  INTO �������� VALUES(14, 4, 95, 'A');
INSERT  INTO �������� VALUES(4, 5,70, 'C');
INSERT  INTO �������� VALUES(6, 5, 95, 'A');
INSERT  INTO �������� VALUES(8, 5, 90, 'A');
INSERT  INTO �������� VALUES(14, 5, 95, 'A');
INSERT  INTO �������� VALUES(6, 8, 90, 'A');
INSERT  INTO �������� VALUES(8, 8, 80, 'B');
INSERT INTO �������� VALUES(14, 8, 95, 'A');
INSERT INTO �������� VALUES(1, 6, 85, 'B');
INSERT INTO �������� VALUES(5, 6, 80, 'B');
INSERT INTO �������� VALUES(11, 6, 78.5, 'C');
INSERT INTO �������� VALUES(1, 7, 95, 'A');
INSERT INTO �������� VALUES(5, 7, 85, 'B');
INSERT INTO �������� VALUES(1, 8, 100, 'A');
SELECT * FROM ��������;

--����1--
SELECT * FROM �л�;

--����2--
SELECT �л�.�̸�, �л�.�г�, �л�.�ּ�
FROM �л�
ORDER BY �г�;

--����3--
SELECT �л�.�̸� AS "����", �л�.�ּ� AS "���� �ּ���"
FROM �л�;

--����4--
SELECT �л�.�г�
FROM �л�
GROUP BY �л�.�г�;

--����5--
SELECT ��ȣ, �̸�, �ּ�, �г�, Ű, ������, ����, �Է�����, �а���ȣ
FROM �л�
WHERE �л�.��ȣ='1';

SELECT * FROM �л� WHERE �л�.��ȣ=1;

--����6--
SELECT * FROM �л� WHERE �л�.Ű < 165;

--����7--
SELECT �л�.�̸�, �л�.�г�, �л�.Ű, �л�.������
FROM �л�
WHERE �л�.Ű >= 170
    AND �л�.�г�=1
    ORDER BY Ű;

--����8--(OR)
SELECT �л�.�̸�, �л�.�г�, �л�.Ű, �л�.������
FROM �л�
WHERE �л�.Ű >= 170
    OR �л�.�г�=1;
    
--����9--(BETWEEN)
SELECT �л�.�̸�, �л�.�ּ�, �л�.Ű, �л�.������
FROM �л�
WHERE �л�.������ BETWEEN 45 AND 50
ORDER BY Ű;

--����10--(AND)
SELECT �л�.�̸�, �л�.�ּ�, �л�.Ű, �л�.������
FROM �л�
WHERE �л�.������ >= 45
    AND �л�.������ <=50
    ORDER BY Ű;
    
--����11--
SELECT �л�.��ȣ, �л�.�̸�, �л�.�г�
FROM �л�
WHERE �л�.�г� IN (2,3)
ORDER BY ��ȣ;

--����12--
SELECT �л�.��ȣ, �л�.�̸�, �л�.�г�
FROM �л�
WHERE �л�.�г�=2 OR �л�.�г�=3
ORDER BY ��ȣ;

--����13--
SELECT * FROM �л�
WHERE �л�.�̸� LIKE '��%'
ORDER BY ��ȣ;

--����14--
SELECT * FROM �л�
WHERE �л�.�̸� LIKE '��%'
    OR �л�.�̸� LIKE '��%'
    OR �л�.�̸� LIKE '��%'
    ORDER BY ��ȣ;
    
--����15--
SELECT * FROM �л�
WHERE �л�.�̸� LIKE '��%' UNION
SELECT * FROM �л�
WHERE �л�.�̸� LIKE '��%' UNION
SELECT * FROM �л�
WHERE �л�.�̸� LIKE '��%';

--����16--(IS)
SELECT �л�.�̸�, �л�.�г�, �л�.�ּ�
FROM �л�
WHERE �л�.�ּ� IS NULL;

--����17--(IS NOT)
SELECT �л�.�̸�, �л�.�г�, �л�.������
FROM �л�
WHERE �л�.������ IS NOT NULL;

--����18--
SELECT * FROM �л�
ORDER BY �̸� ASC;

--����19--(NULLS LAST)
SELECT �л�.�̸�, �л�.�ּ�, �л�.Ű
FROM �л�
ORDER BY Ű DESC NULLS LAST;

--����20--
SELECT �л�.�̸�, �л�.�г�, �л�.�ּ�, �л�.������
FROM �л�
WHERE �л�.�г� = 1
ORDER BY ������;

--����21--
SELECT �л�.�̸�, �л�.�г�, �л�.Ű, �л�.������
FROM �л�
WHERE �л�.�г� = 1
ORDER BY Ű DESC, ������ ASC;

--����22--
SELECT �л�.��ȣ, �л�.�̸�, �л�.�ּ�
FROM �л�
ORDER BY �̸� ASC;

--����23--
SELECT �л�.�̸�, �л�.Ű, �л�.������
FROM �л�
WHERE �г� = (SELECT �л�.�г� FROM �л� WHERE �л�.�̸� = '���ֿ�');

--����24--
FROM �л�
WHERE �л�.Ű < 174;

SELECT �л�.�̸�, �л�.�г�, �л�.Ű
FROM �л�
WHERE �л�.Ű < (SELECT AVG(Ű) FROM �л� WHERE �а���ȣ = 1);

--����25--
SELECT �л�.�̸�, �л�.�г�, �л�.Ű
FROM �л�
WHERE �л�.�г� = (SELECT �л�.�г� FROM �л� WHERE �л�.�̸� = '������')
    AND �л�.Ű > (SELECT �л�.Ű FROM �л� WHERE �л�.�̸�='������');

--����26--
SELECT �л�.��ȣ, �л�.�̸�, �л�.Ű
FROM �л�
WHERE �л�.Ű=165
ORDER BY ��ȣ;

--����27
SELECT COUNT(�л�.��ȣ) AS "�л� ��"
FROM �л�;

--����28--
SELECT COUNT(�л�.�̸�) AS "���� �ִ� �л��� ��"
FROM �л�
WHERE �̸� LIKE '��%' 
    AND ������ IS NOT NULL;
    
--����29--
SELECT AVG(��������.����) AS "�������"
FROM ��������
WHERE ��������.�����ȣ=1;

--����30--
SELECT ��������.�����ȣ, AVG(��������.����) AS "�����������"
FROM ��������
GROUP BY ��������.�����ȣ
ORDER BY ��������.�����ȣ;

--����31--(TRUNC�Լ��� �ַ� �Ҽ��� ���� �� ��¥�� �ð��� ���� �� ���ȴ�.)
SELECT �л�.�а���ȣ, �л�.�г�, COUNT(�л�.�г�) AS "�ο���", TRUNC(AVG(Ű)) AS "���Ű"
FROM �л�
GROUP BY �л�.�а���ȣ, �л�.�г�
ORDER BY �л�.�г�;

--����32--
SELECT ��������.�����ȣ, COUNT(��������.�л���ȣ) AS "�����л���", AVG(��������.����) AS "�����������"
FROM �л�
INNER JOIN ��������
    ON ��������.�л���ȣ=�л�.��ȣ
GROUP BY ��������.�����ȣ HAVING COUNT(�л�.�̸�)>=4;

--����33--
SELECT ��������.�����ȣ, COUNT(��������.�л���ȣ) AS "�����л���", AVG(��������.����) AS "�����������"
FROM �л�
INNER JOIN ��������
    ON ��������.�л���ȣ=�л�.��ȣ
GROUP BY ��������.�����ȣ HAVING COUNT(�л�.�̸�)>=4
ORDER BY ����������� DESC;

--����34--
SELECT �л�.��ȣ, �л�.�̸�, �а�.�̸�
FROM �л�
INNER JOIN �а�
ON �л�.�а���ȣ=�а�.��ȣ
ORDER BY ��ȣ;

--����35--
SELECT ����.��ȣ, ����.�̸�, �а�.�̸�
FROM ����
INNER JOIN �а�
ON ����.�а���ȣ=�а�.��ȣ
ORDER BY ��ȣ;

--����36--
SELECT �л�.��ȣ, �л�.�̸�, �а�.�̸�
FROM �л�
INNER JOIN �а�
ON �л�.�а���ȣ=�а�.��ȣ
WHERE �л�.�̸� = '������';

--����37--
SELECT �л�.��ȣ, �л�.�̸�, �л�.Ű, �а�.�̸�
FROM �л�
INNER JOIN �а�
ON �л�.�а���ȣ=�а�.��ȣ
WHERE �л�.Ű >= 180;

--����38--
SELECT �а�.�̸�, ����.�̸�, ����.�̸�
FROM �а�
INNER JOIN ����
    ON �а�.��ȣ=����.�а���ȣ
INNER JOIN ����
    ON ����.��ȣ=����.������ȣ;
    
--����39--
SELECT �а�.�̸�, ����.�̸�
FROM �а�
INNER JOIN ����
    ON �а�.��ȣ=����.�а���ȣ
INNER JOIN ����
    ON ����.��ȣ=����.������ȣ;