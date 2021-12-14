CREATE USER SQLDB IDENTIFIED BY 1234
    DEFAULT TABLESPACE USER
    TEMPORARY TABLESPACE TEMP;
GRANT CONNECT, RESOURCE, DBA TO SQLDB;

CREATE TABLE userTBL--ȸ�� ���̺�
(userID CHAR(8) not null primary key,
username nvarchar2(10) not null,
birthyear number(4) not null,
addr nchar(2) not null,
mobile1 char(3),
mobile2 char(8),
height number(3),
mDate date
);
ALTER TABLE USERTBL
    RENAME COLUMN MIBILE1 TO MOBILE1;
Create table buyTBL--ȸ�� ���� ���̺�
(idnum number(8) not null primary key,
userID char(8) not null,
prodName nchar(6) not null,
groupname nchar(4),
price number(8) not null,
amount number(3) not null,
foreign key (userID) references userTBL(userID)
);

insert into userTBL values('LSG', '�̽±�', 1987, '����', '011', '11111111', 182, '2008-8-8');
insert into userTBL values('KBS', '�����', 1979, '�泲', '011', '22222222', 173, '2012-4-4');
insert into userTBL values('KKH', '���ȣ', 1971, '����', '019', '33333333', 177, '2007-7-7');
insert into userTBL values('JYP', '������', 1950, '���', '011', '44444444', 166, '2009-4-4');
insert into userTBL values('SSK', '���ð�', 1979, '����', null, null, 186, '2013-12-12');
insert into userTBL values('LJB', '�����', 1963, '����', '016', '66666666', 182, '2009-9-9');
insert into userTBL values('YJS', '������', 1969, '�泲', null, null, 170, '2005-5-5');
insert into userTBL values('EJW', '������', 1972, '���', '011', '88888888', 174, '2014-3-3');
insert into userTBL values('JKW', '������', 1965, '���', '018', '99999999', 172, '2010-10-10');
insert into userTBL values('BBK', '�ٺ�Ŵ', 1973, '����', '010', '00000000', 176, '2013-5-5');

create sequence idSEQ; -- ������ȣ �Է��� ���ؼ� ������ ����
insert into buyTBL values(idseq.nextval, 'KBS', '�ȭ', NULL, 30, 2 );
insert into buyTBL values(idseq.nextval, 'KBS', '��Ʈ��', '����', 1000, 1);
insert into buyTBL values(idseq.nextval, 'JYP', '�����', '����', 200, 1);
insert into buyTBL values(idseq.nextval, 'BBK', '�����', '����', 200, 5);
insert into buyTBL values(idseq.nextval, 'KBS', 'û����', NULL, 50, 3);
insert into buyTBL values(idseq.nextval, 'BBK', '�޸�', '����', 80, 10);
insert into buyTBL values(idseq.nextval, 'SSK', 'å', '����', 15, 5);
insert into buyTBL values(idseq.nextval, 'EJW', 'å', '����', 15, 2);
insert into buyTBL values(idseq.nextval, 'EJW', 'û����', '�Ƿ�', 50, 1);
insert into buyTBL values(idseq.nextval, 'BBK', '�ȭ', NULL, 30, 2);
insert into buyTBL values(idseq.nextval, 'EJW', 'å', '����', 15, 1);
insert into buyTBL values(idseq.nextval, 'BBK', '�ȭ', NULL, 30, 2);


COMMIT;
SELECT * FROM USERTBL;
SELECT * FROM BUYTBL;

--BETWEEN, AND/IN(), LIKE--
select userid, username from userTBL where birthyear >= 1970 and height >=182;
select userid, username from userTBL where birthyear >= 1970 or height >=182;
select userid, username from userTBL where height >=180 and height <=183;
select userid, username from userTBL where height between 180 and 183;
--���ڷ� �����Ǿ� �ִ� ������ BETWEEN, AND�� ����� �� ������, ����ó�� ���ӵ� ���� �ƴ� �ÿ� �ΰ��� ����� �� ����.

select username, addr from userTBL where addr='�泲' or addr='����' or addr='���';
select username, addr from userTBL where addr in ('�泲', '����', '���');
select username, height from userTBL where userName like '��%';
--���ڿ��� ������ �˻��ϱ� ���ؼ��� LIKE�����ڸ� ����� �� �ִ�.
--���� ������ ���� '��'���̰� �� �ڴ� �����̵�(%) ����Ѵٴ� �ǹ��Ѵ�. .
select username, height from userTBL where userName like '_����';
--�׸��� �� ���ڿ� ��ġ�ϱ� ���ؼ��� '_'�� ����Ѵ�
select username, height from userTBL where userName like '_��%';
--'%','_'�� �����ؼ� ����� �� �ִ�. �տ� �ƹ��ų� �ѱ��ڰ� ���� �ι�°�� '��', �׸��� �� ��° ���Ŀ��� �� ���ڵ� �ƹ��ų� ���� ���� ������ �� �ִ�,

--ANY/ALL/SOME �׸��� ��������(SubQUERY, ��������)
--���������� ������ �ȿ� �� �������� ��� �ִ� ���� ����Ѵ�.
--EX)���ȣ���� Ű�� ũ�ų� ���� ����� �̸��� Ű�� ����Ѵ�. -> WHERE ���ǿ� ���ȣ�� Ű�� ���� ������Ѵ�.
select username, height from userTBL where height>177;

--�׷��� �� 177�̶�� Ű�� ���� ���ִ� ���� �ƴ϶�, �̰͵� ������ ���ؼ� ����Ϸ��� ��.
SELECT USERNAME, HEIGHT FROM userTBL --��������� ���� ����
    where height > (select height from userTBL where userName = '���ȣ'); --�ᱹ 177�̶�� ���� ������ ���� �Ǿ� �� ������ ������ ����� ���ִ� ���̴�.
    
--������ '�泲'����� Ű���� Ű�� ũ�ų� ���� ����� �����غ���
select username, height from userTBL
    where height >= (select height from userTBL where addr = '�泲');
select rownum, username, height from userTBL
    where height >= any (select height from userTBL where addr='�泲');
--�̹��� 'any'�� 'all'�� �ٲپ� ����
select rownum username, height from userTBL
    where height >= all (select height from userTBL where addr='�泲'); --ó���� �߸� �����ؼ� 9���� ����.

--��¶�� 'any'�� ���������� ���� ���� ��� �� �� ������ �����ص� �Ǹ�, 'all'�� ���������� ���� ���� ����� ��� �������Ѿ� �Ѵ�.('some'�� 'any'�� ������ �ǹ�)

select username, height from userTBL
    where height = any (select height from userTBL where addr='�泲');
select username, height from userTBL
    where height IN (select height from userTBL where addr='�泲');
--'ORDER BY'���� ������� ���� ������ ��ġ���� ������, ����� ��µǴ� ������ �����ϴ� ����
--���� ������ ������ ȸ������ ����غ���
SELECT username, mDate From userTBL ORDER BY MDATE;
--�⺻������ ������������ ���ĵȴ�. ������������ �����ϱ� ���ؼ��� �� �̸� �ڿ� 'DESC'��� �����ش�.
SELECT username, mDate From userTBL ORDER BY MDATE DESC;
--�̹����� ���� ���� ������ ����. Ű�� ū ������ �����ϵ�, ���� Ű�� ���� ��� �̸� ������ ��������.
SELECT username, height From userTBL ORDER BY height desc, username asc;
--'ORDER BY'�� ���� ���� SELECT ������ �� ���� �ʿ�� ����. -> SELECT USERID FROM USERTBL ORDER BY HEIGHT���� ����ص� �ȴ�.
--'ORDER BY'���� 'WHERE'���� ���� ����ص� ����/ 'SELECT' 'FROM' 'WHERE' 'GROUP BY' 'HAVING' 'ORDER BY'�� ���� �ڿ� �;� �Ѵ�!!

--�ߺ��� ���� �ϳ��� ����� 'DISTINCT'--
--ȸ�� ���̺��� ȸ������ ���������� �� �������� ����غ���
SELECT ADDR FROM USERTBL;
SELECT ADDR FROM USERTBL ORDER BY ADDR;
--�Ʊ�ٴ� ������ �ߺ��� ���� ��� ����� �� ���� 'DISTINCT'�� ����غ���
SELECT DISTINCT ADDR FROM USERTBL;
SELECT GETAGEFUNC(1979) FROM DUAL;

