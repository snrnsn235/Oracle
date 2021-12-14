CREATE TABLE �л� (
��ȣ NUMBER(6) NOT NULL PRIMARY KEY,
�̸� VARCHAR2(20),
�ּ� VARCHAR2(50),
�г� NUMBER(6),
������� VARCHAR2(20),
�а���ȣ NUMBER(6),
���� NUMBER(6)
);

INSERT INTO �л� VALUES(1,'���¿�', '��õ ������', 4, '1980-01-02', 10, 7);
INSERT INTO �л� VALUES(2,'�����', '���� ��������', 4, '1990-10-12', 9, 7);
INSERT INTO �л� VALUES(3,'������', '��õ ������', 4, '1985-03-04', 8, 6);
INSERT INTO �л� VALUES(4,'������', '���� ��������', 3, '1980-12-12', 7, 6);
INSERT INTO �л� VALUES(5,'������', '���� ��������', 3, '1984-07-04', 6, 5);
INSERT INTO �л� VALUES(6,'������', '��õ ������', 2, '1987-09-24', 5, 5);
INSERT INTO �л� VALUES(7,'Ȳ����', '���� ��õ��', 2, '1979-05-06', 4, 4);
INSERT INTO �л� VALUES(8,'�۰�ȣ', '���� ���α�', 2, '1974-08-25', 3, 3);
INSERT INTO �л� VALUES(9,'������', '��õ ������', 1, '1985-06-13', 2, 2);
INSERT INTO �л� VALUES(10,'�ڼ���', '���� ���α�', 1, '1978-10-18', 1, 1);

CREATE TABLE �а� (
��迭 VARCHAR2(20),
�߰迭 VARCHAR2(30),
�а��̸� VARCHAR2(40),
�а���ȣ NUMBER(6) NOT NULL PRIMARY KEY
);

INSERT INTO �а� VALUES('����', '����', '�����а�', 1);
INSERT INTO �а� VALUES('����', '���', '������а�', 2);
INSERT INTO �а� VALUES('����', '���Ʊ���', '���Ʊ����а�', 3);
INSERT INTO �а� VALUES('����', '�ߵ��', '�����а�', 4);
INSERT INTO �а� VALUES('��ȸ', '����', '���а�', 5);
INSERT INTO �а� VALUES('��ȸ', '��ȸ����', '��ġ�ܱ��а�', 6);
INSERT INTO �а� VALUES('��ü��', '������', '��������ΰ�', 7);
INSERT INTO �а� VALUES('��ü��', '����', '���ǰ�', 8);
INSERT INTO �а� VALUES('�ڿ�', '��Ȱ����', '���������а�', 9);
INSERT INTO �а� VALUES('�ڿ�', '����', '�����а�', 10);

CREATE TABLE ����(
������ȣ NUMBER(6) NOT NULL PRIMARY KEY,
�����̸� VARCHAR2(20),
����а���ȣ NUMBER(6)
);
DROP TABLE STUDENT;
INSERT INTO ���� VALUES(1, '�豳��', 1);
INSERT INTO ���� VALUES(2, '�̱���', 3);
INSERT INTO ���� VALUES(3, '�ڱ���', 5);
INSERT INTO ���� VALUES(4, '������', 7);
INSERT INTO ���� VALUES(5, '�ֱ���', 9);
INSERT INTO ���� VALUES(6, '������', 2);
INSERT INTO ���� VALUES(7, '������', 4);
INSERT INTO ���� VALUES(8, 'ȫ����', 6);
INSERT INTO ���� VALUES(9, 'Ȳ����', 8);
INSERT INTO ���� VALUES(10, '������', 10);

--�����а��� ��ϵǾ� �ִ� �л��� ã���ÿ�.
SELECT * FROM �л�
WHERE �л�.�а���ȣ= 1;

--������ �л��� �а���米���� ã���ÿ�.
SELECT * FROM ����
WHERE ����.����а���ȣ = 10;

--�����а� ��米���� ã���ÿ�.
SELECT * FROM ����, �а�
WHERE ����.����а���ȣ = �а�.�а���ȣ
AND �а�.�а���ȣ = 4;

--����� �л��� �а��̸��� ��米���� ã���ÿ�.
SELECT �а�.�а��̸�, ����.�����̸� FROM �а�,����,�л�
WHERE �л�.�а���ȣ = �а�.�а���ȣ
AND ����.����а���ȣ = �а�.�а���ȣ
AND �л�.�̸� = '�����';

--�ڼ��� �л��� ��米����ȣ�� ����а��� �߰迭�� ã���ÿ�.
SELECT ����.������ȣ, �а�.�߰迭 
FROM ����, �а�, �л�
WHERE �л�.�а���ȣ = �а�.�а���ȣ
AND ����.����а���ȣ = �а�.�а���ȣ
AND �л�.�̸� = '�ڼ���';

--������ �л��� �а��̸��� ��迭�� ã���ÿ�.
SELECT �а�.�а��̸�, �а�.��迭 FROM �л�, �а�
WHERE �л�.�а���ȣ = �а�.�а���ȣ
AND �л�.�̸�='������';

--������ �л��� �ּҰ� ���� �л����� �̸��� ã���ÿ�.
SELECT �л�.�̸�, �л�.�ּ� FROM �л�
WHERE �л�.�ּ� = '��õ ������';

--������ �л��� �г��� ���� �л����� �̸��� ã���ÿ�.
SELECT �л�.�̸�, �л�.�г� FROM �л�
WHERE �л�.�г� = 4;

--������ �л����� �ּҴ� ������ �г��� �ٸ� �л����� �̸��� ã���ÿ�.
SELECT �л�.�̸�, �л�.�ּ�, �л�.�г� FROM �л�
WHERE �л�.�ּ� = '��õ ������'
AND �л�.�г� != 1;

--������ �л��� �ּҰ� ���� �л����� �а� ������ ã���ÿ�
SELECT ����.�����̸�, ����.����а���ȣ FROM ����, �л�
WHERE �л�.�а���ȣ = ����.����а���ȣ
AND �л�.�ּ� = '��õ ������'
ORDER BY ����.����а���ȣ DESC;

-- �۰�ȣ �л��� �ּҴ� ���� �г��� ���� �л����� �̸��� �а���ȣ�� ã���ÿ�
SELECT �л�.�̸�, �л�.�а���ȣ, �л�.�ּ� FROM �л�
WHERE �л�.�ּ� = '���� ���α�'
AND �л�.�г� > 2;

-- �۰�ȣ �л��� �г��� ���� �л����� �а��� ã���ÿ�
SELECT �л�.�̸�, �л�.�г�, �а�.�а��̸� FROM �л�, �а�
WHERE �л�.�а���ȣ=�а�.�а���ȣ 
AND �л�.�г� = 2;

-- �ڼ��� �л��� �г��� ���� �л����� ��米���� �� ��米���� ��ȣ, ����а��� ã���ÿ�.
SELECT ����.�����̸�, ����.����а���ȣ, �а�.�а��̸� FROM ����, �а�, �л�
WHERE ����.����а���ȣ=�а�.�а���ȣ
AND �а�.�а���ȣ=�л�.�а���ȣ
AND �л�.�г�=1;

-- Ȳ���� �л����� �г��� ���� �л����� �а��̸��� �� �а��� �߰迭, ��迭�� ã���ÿ�
SELECT �л�.��ȣ, �л�.�̸�, �а�.�а��̸�, �а�.��迭, �а�.�߰迭 FROM �а�, �л�
WHERE �а�.�а���ȣ=�л�.�а���ȣ
AND �л�.�г� > 2
ORDER BY ��ȣ;

-- �� ���̺� insert / update / delete �� �߻��ϸ� �ش� �̺�Ʈ�̸�, ���̺��, ����ð��� �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�
CREATE TABLE BACKUP_����
(������ȣ NUMBER(6) NOT NULL PRIMARY KEY,
�����̸� VARCHAR2(20),
����а���ȣ NUMBER(6)
);
CREATE TABLE BACKUP_�а�
(��迭 VARCHAR2(20),
�߰迭 VARCHAR2(30),
�а��̸� VARCHAR2(40),
�а���ȣ NUMBER(6) NOT NULL PRIMARY KEY
);
CREATE TABLE BACKUP_�л�
(��ȣ NUMBER(6) NOT NULL PRIMARY KEY,
�̸� VARCHAR2(20),
�ּ� VARCHAR2(50),
�г� NUMBER (6),
������� VARCHAR2(20),
�а���ȣ NUMBER (6),
���� NUMBER (6),
�̺�Ʈ�̸� NCHAR(2)
);


CREATE OR REPLACE TRIGGER TRG_BACKUP����
    AFTER UPDATE OR DELETE OR INSERT
    ON ����
    FOR EACH ROW
DECLARE
    V_�̺�Ʈ�̸� NCHAR(2);
BEGIN
    IF UPDATING THEN
        V_�̺�Ʈ�̸� := '����';
    ELSIF DELETING THEN
        V_�̺�Ʈ�̸� := '����';
    ELSIF INSERTING THEN
        V_�̺�Ʈ�̸� := '�߰�';
END IF;
INSERT INTO BACKUP_���� VALUES(:OLD.������ȣ, :OLD.�����̸�, :OLD.����а���ȣ );
END TRG_BACKUP����;

CREATE OR REPLACE TRIGGER TRG_BACKUP�а�
    AFTER UPDATE OR DELETE OR INSERT
    ON �а�
    FOR EACH ROW
DECLARE
    V_MODTYPE NCHAR(2);
BEGIN
    IF UPDATING THEN
        V_MODTYPE := '����';
    ELSIF DELETING THEN
        V_MODTYPE := '����';
    ELSIF INSERTING THEN
        V_MODTYPE := '�߰�';
END IF;
INSERT INTO BACKUP_�а� VALUES(:OLD.��迭, :OLD.�߰迭, :OLD.�а��̸�, :OLD.�а���ȣ );
END TRG_BACKUP�а�;

CREATE OR REPLACE TRIGGER TRG_BACKUP�л�
    AFTER UPDATE OR DELETE OR INSERT
    ON �л�
    FOR EACH ROW
DECLARE
    V_�̺�Ʈ�̸� NCHAR(2);
BEGIN
    IF UPDATING THEN
        V_�̺�Ʈ�̸� := '����';
    ELSIF DELETING THEN
        V_�̺�Ʈ�̸� := '����';
    ELSIF INSERTING THEN
        V_�̺�Ʈ�̸� := '�߰�';
END IF;
INSERT INTO BACKUP_�л� VALUES(:OLD.��ȣ, :OLD.�̸�, :OLD.�ּ�, :OLD.�г�, :OLD.�������, :OLD.�а���ȣ, :OLD.����, V_�̺�Ʈ�̸�);
END TRG_BACKUP�л�;

UPDATE �а� SET �а��̸� = '���û��ġ���а�' WHERE �а���ȣ = 2;
INSERT INTO �л� VALUES (1, '������', '�뱸 ���̵�', 1, '1992-93-94', 3, 4); 
SELECT * FROM BACKUP_�а�;
SELECT * FROM BACKUP_�л�;
SELECT * FROM �л�;

