
select usertbl.userID, userName, prodname, addr, mobile1 || mobile2 as "����ó"
from buytbl inner join usertbl on buytbl.userID = usertbl.userID;

select usertbl.userID, userName, prodname, addr, mobile1 || mobile2 as "��ȭ"
from buytbl, usertbl
where buytbl.userID = usertbl.userID;
--���� �ΰ��� �ڵ�� ���� ����.--

select distinct U.userID, U.userName, U.addr
from userTBL U inner join buyTBL B on U.userID=B.userID
order by U.userID;

select U.userID, U.userName, B.prodName, u.addr, u.mobile1 || u.mobile2 as "��ȭ"
from usertbl u left outer join buytbl b on u.userid = b.userid
order by u.userid;

select U.userID, U.userName, U.addr
    from userTbl U
    where EXISTS(
        select *
        from buyTbl B
        where U.userID = B.userID);


CREATE TABLE stdTBL
(stdNAME NCHAR(5) NOT NULL PRIMARY KEY,
 addr   NCHAR(2) NOT NULL
);
CREATE TABLE clubTBL
(clubNAME NCHAR(5) NOT NULL PRIMARY KEY,
roomNO NCHAR(4) NOT NULL
);
CREATE SEQUENCE stdclubSEQ;
CREATE TABLE stdclubTBL
( idNUM NUMBER(5)NOT NULL PRIMARY KEY,
  stdNAME NCHAR(5) NOT NULL,
  clubNAME NCHAR(5) NOT NULL,
FOREIGN KEY(stdNAME) REFERENCES stdTBL(stdNAME),
FOREIGN KEY(clubNAME) REFERENCES clubTBL(clubNAME)
);
INSERT INTO stdTBL VALUES('�����', '�泲');
INSERT INTO stdTBL VALUES('���ð�', '����');
INSERT INTO stdTBL VALUES('������', '���');
INSERT INTO stdTBL VALUES('������', '���');
INSERT INTO stdTBL VALUES('�ٺ�Ŵ', '����');
INSERT INTO clubTBL VALUES('����', '101ȣ');
INSERT INTO clubTBL VALUES('�ٵ�', '102ȣ');
INSERT INTO clubTBL VALUES('�౸', '103ȣ');
INSERT INTO clubTBL VALUES('����', '104ȣ');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '�����', '�ٵ�');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '�����', '�౸');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '������', '�౸');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '������', '�౸');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '������', '����');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '�ٺ�Ŵ', '����');

select * from stdTBL;
select * from clubTBL;
select * from stdclubTBL;

--outer join--
select S.stdName, S.addr, C.clubName, C.roomNo
from stdtbl s
left outer join stdclubTBL sc
on S.stdname = SC.stdName
left outer join clubTBl c
on sc.clubName = C.clubName
order by S.stdName;
-- ���� ���� �ݴ� ������ �������Ѵ�.(stdclubtbl -> clubtbl -> stdtbl)
--inner join--
select S.stdName, S.addr, C.clubName, C.roomNo
    from stdTBL S inner join stdclubTBL sc on S.stdName = SC.stdName
                  inner join clubTBL c on C.clubName = sc.clubName
order by S.stdName;

select S.stdName, S.addr, C.clubName, C.roomNo
    from stdTBL S left outer join stdclubTBL sc on S.stdName = SC.stdName
                  right outer join clubTBL c on C.clubName = sc.clubName
UNION                 
select S.stdName, S.addr, C.clubName, C.roomNo
    from stdTBL S left join stdclubTBL sc on S.stdName = SC.stdName
                  left join clubTBL c on C.clubName = sc.clubName
order by S.stdName;

select * from buytbl cross join usertbl;
select username, concat(mobile1, mobile2) as "��ȭ��ȣ" from usertbl
    where username not in (select username from usertbl where mobile1 is null);
    
--���Ƹ��� �������� ���� �л��� ��µǵ��� ����
SELECT S.STDNAME, S.ADDR, C.CLUBNAME, C.ROOMNO
FROM STDTBL S
LEFT OUTER JOIN STDCLUBTBL SC
ON S.STDNAME=SC.STDNAME
LEFT OUTER JOIN CLUBTBL C
ON SC.CLUBNAME=C.CLUBNAME
ORDER BY S.STDNAME;

--���Ƹ��� �������� ���Ե� �л��� ����ϵ�, ���� �л��� �ϳ��� ���� ���Ƹ��� ���
SELECT C.CLUBNAME, C.ROOMNO, S.STDNAME, S.ADDR
FROM STDTBL S
LEFT OUTER JOIN STDCLUBTBL SC
ON SC.STDNAME=S.STDNAME
RIGHT OUTER JOIN CLUBTBL C
ON SC.CLUBNAME=C.CLUBNAME
ORDER BY C.CLUBNAME;

SELECT COUNT(*) AS "������ ����"
FROM HR.EMPLOYEES
CROSS JOIN HR.COUNTRIES;