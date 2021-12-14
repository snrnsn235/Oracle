CREATE USER MUSIC IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE, DBA TO HAKSA;

CREATE TABLE �ٹ�
(�ٹ���ȣ VARCHAR2(3) NOT NULL PRIMARY KEY,
Ÿ��Ʋ VARCHAR2(30) NOT NULL,
��Ƽ��Ʈ VARCHAR2(30),
���� NUMBER,
�߸��� DATE,
��� VARCHAR2(30),
���� NUMBER(3,1)
);
SELECT * FROM �ٹ�;
CREATE TABLE ��
(�ٹ���ȣ VARCHAR2(3) NOT NULL,
��ũ VARCHAR2(3) NOT NULL,
���ȣ VARCHAR2(3) NOT NULL,
��� VARCHAR2(50),
���� VARCHAR2(10),
FOREIGN KEY(�ٹ���ȣ) REFERENCES �ٹ�(�ٹ���ȣ)
);
ALTER TABLE ��
    ADD CONSTRAINT ��_�ٹ���ȣ
    PRIMARY KEY (�ٹ���ȣ, ��ũ, ���ȣ);
SELECT * FROM ��;
INSERT INTO �ٹ� VALUES(1, '������', '������', 11500, '1984-10-01', '����', 9.8);
INSERT INTO �ٹ� VALUES(2, '����ϱ� ������', '������', 10400, '1987-08-20', 'KingPin', 9.7);
INSERT INTO �ٹ� VALUES(3, 'Break Up 2 Make Up', '����(ZICO)', 700, '2016-01-25', 'CJ E&M MUSIC', 7.6);
INSERT INTO �ٹ� VALUES(4, '������ OST Part 8', '������', 500, '2017-01-01', 'CJ E&M MUSIC', 9.5);
INSERT INTO �ٹ� VALUES(5, '������ OST Part 9', '���ϸ�', 600, '2017-01-07', 'CJ E&M MUSIC', 8);
    

INSERT INTO �� VALUES(1, 1, 1, '���ƿͿ� �λ��׿�', NULL);
INSERT INTO �� VALUES(1, 1, 9,  '�غ��� ����', NULL);
INSERT INTO �� VALUES(1, 1, 11,  '�� ��', NULL);
INSERT INTO �� VALUES(1, 1, 12,  '������ ���ƿ�', NULL);
INSERT INTO �� VALUES(1, 1, 15,  '������ ����', NULL);
INSERT INTO �� VALUES(2, 1, 1,  '�츮���� ���', NULL);
INSERT INTO �� VALUES(2, 1, 2,  '�״� �� ǰ��', NULL);
INSERT INTO �� VALUES(2, 1, 9,  '����ϱ� ������', NULL);
INSERT INTO �� VALUES(3, 1, 1,  '�ʴ� �� ���� ��', NULL);
INSERT INTO �� VALUES(3, 1, 2, '����̾���(FEAT.�糪 of f(x))', NULL);
INSERT INTO �� VALUES(4, 1, 1,  'ù ��', NULL);
INSERT INTO �� VALUES(4, 1, 2,  'ù ��', 'Inst.');
INSERT INTO �� VALUES(5, 1, 1, 'ù��ó�� �ʿ��� ���ڴ�', '����');
INSERT INTO �� VALUES(5, 1, 2,  'ù��ó�� �ʿ��� ���ڴ�', 'Inst.');

--'�غ��� ����'�̶�� �뷡�� ��� �ִ� Ÿ��Ʋ�� ��Ƽ��Ʈ��
--�˻��϶�.
SELECT Ÿ��Ʋ, ��Ƽ��Ʈ
FROM �ٹ�, ��
WHERE �ٹ�.�ٹ���ȣ=��.�ٹ���ȣ
AND ��� = '�غ��� ����';

--'�״볻ǰ��'��� �뷡�� �θ� ��Ƽ��Ʈ�� �˻��϶�.
SELECT ��Ƽ��Ʈ
FROM �ٹ�, ��
WHERE �ٹ�.�ٹ���ȣ=��.�ٹ���ȣ
AND ��� = '�״� �� ǰ��';

--'Break Up 2 Make Up'�̶�� �̸��� ������ �ִ�
--�ٹ��� ���ϵ� �뷡�� ��� �˻��϶�.
SELECT ���
FROM �ٹ�, ��
WHERE �ٹ�.�ٹ���ȣ=��.�ٹ���ȣ
AND Ÿ��Ʋ = 'Break Up 2 Make Up';

--�� �ٹ��� ���ϵ� Ÿ��Ʋ�� ���ϰ��� ������ �˻��϶�.
SELECT Ÿ��Ʋ AS "Ÿ��Ʋ", COUNT(��.�ٹ���ȣ) AS "���ϰ� ��"
FROM �ٹ�, ��
WHERE �ٹ�.�ٹ���ȣ = ��.�ٹ���ȣ
GROUP BY Ÿ��Ʋ;

--'���'�̶�� �ܾ ���Ե� ����� ���� �ٹ��� Ÿ��Ʋ��
--���ϰ��� ������ �˻��϶�.
SELECT Ÿ��Ʋ AS "Ÿ��Ʋ", COUNT(��.�ٹ���ȣ) AS "���ϰ� ��"
FROM �ٹ�, ��
WHERE �ٹ�.�ٹ���ȣ = ��.�ٹ���ȣ
AND ��.���
LIKE  '%���%'
GROUP BY Ÿ��Ʋ;

--Ÿ��Ʋ�� ����� ������ �ٹ��� �뷡 �̸��� �˻��϶�.
SELECT ���
FROM �ٹ�, ��
WHERE �ٹ�.�ٹ���ȣ = ��.�ٹ���ȣ
    AND �ٹ�.Ÿ��Ʋ = ��.���;

--���� ��� �׷� 'Blur'�� 'Blur'��� �̸��� �ٹ���
--�߸��� �� �ִ�. �̿� ���� ��Ƽ��Ʈ�� Ÿ��Ʋ�� ������ �ٹ�
--�� Ÿ��Ʋ�� �˻��϶�.
SELECT Ÿ��Ʋ
FROM �ٹ�
WHERE �ٹ�.��Ƽ��Ʈ = �ٹ�.Ÿ��Ʋ;

--������ ����� 2�� �̻� �ٹ��� �����ϴ� ���, 
--�ش� ���� ���� ���� ������ �˻��϶�.
SELECT ���, COUNT(��.�ٹ���ȣ) AS "���ϰ� ��"
FROM ��
GROUP BY ���
HAVING COUNT(���) >= 2; --����� 2�� �̻��� �ֵ鸸