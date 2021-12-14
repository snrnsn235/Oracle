INSERT INTO memberTBL VALUES ('FIGURE', '연아', '경기도 군포시 당정동');
SELECT* FROM memberTBL;

UPDATE memberTBL SET MEMBERADDRESS = '서울 강남구 역삼동' WHERE memberName = '연아';
select * from memberTBL;

delete from memberTBL where memberName = '연아';
--트리거--