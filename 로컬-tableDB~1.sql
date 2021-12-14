SELECT * FROM USER_CONSTRAINTS -- Ű ������ ��ϵ� ���̺�
    WHERE OWNER = 'TABLEDB' AND
        TABLE_NAME='USERTBL' AND
        CONSTRAINT_TYPE='P'; -- P�� �⺻Ű, R�� �ܷ� Ű, C�� NOT NULL Ȥ�� CHECK
        --��� ���� ������ �̸��� ������ �Ǵµ� CREATE TABLE ���� �ȿ��� �⺻ Ű�� �����ϸ� �̸��� ����Ŭ�� �˾Ƽ� �������ش�.
        --���⼱ 'SYS_C007104'�� ���Ƿ� ������ ���� Ȯ�ΰ����ϴ�.

--ALTER TABLE ������ ����ϴ� ����� �ִ�.
DROP TABLE USERTBL CASCADE CONSTRAINTS;
CREATE TABLE USERTBL --ȸ�� ���̺�
(USERID CHAR(8) NOT NULL CONSTRAINT PK_USERTBL_USERTBL_USERID PRIMARY KEY, --����� ���̵�(PK)
USERNAME NVARCHAR2(10) NOT NULL, --�̸�
BIRTHYEAR NUMBER(4) NOT NULL, --����⵵
ADDR NCHAR(2) NOT NULL, --����(2���ڸ� �Է°���)
MOBILE1 CHAR(3) NULL, --�޴��� ����(010,011,017...)
MOBILE2 CHAR(8) NULL, --�޴��� ������ ��ȭ��ȣ
HEIGHT NUMBER(3) NULL, --Ű
MDATE DATE NULL--ȸ�� ������
);
ALTER TABLE USERTBL --USERID�� ��������
    ADD CONSTRAINT PK_USERTBL_USERID --���������� �߰�����. �߰��� ���� ���� �̸��� 'PK_USERTBL_USERID'�̴�.
    PRIMARY KEY(USERID); --�߰��� ���� ������ �⺻ Ű ���� �����̴�; �׸��� ���� ������ ������ ���� USERID���̴�.