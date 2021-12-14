set serveroutput on;
create table testtbl (id number, txt nvarchar2(5));
insert into testtbl values(1, '원더걸스');
insert into testtbl values(2, '블랙핑크');
insert into testtbl values(3, '구구단');

create or replace trigger testtrg -- 트리거 이름
after delete or update -- 삭제 및 수정 후에 작동하게 지정
on testtbl -- 트리거를 부착할 테이블
for each row -- 각 행마다 적용됨
begin
dbms_output.put_LINE('트리거가 작동했습니다.');
end;

--트리거에서 설정한 dbms_output.put_LINE() 즉시 출력되도록 하려면 insert, update, delete를 beign~end 블록으로 몪어서 실행햐야 한다.
begin 
insert into testtbl values(4, '나인뮤지스'); --4,나인뮤지스를 추가로 넣는다.
update testtbl set txt = '에이핑크' where id=3; --id가 3인 txt를 에이핑크로 변경한다.
delete testtbl where id = 4; --id거 4번인 곳을 삭제한다.
end;
