select * from userTBL;

set serveroutput on;

declare
    myVar1 NUMBER(3);
    myVar2 NUMBER(5,2) := 3.14; --값 초기화, := 변수에 값을 대입할 때 사용
    myVar3 NVARCHAR2(20) := '이승기 키 -->' ;
BEGIN
    myVar1 := 5;
    DBMS_OUTPUT.PUT_LINE(myVar1);
    DBMS_OUTPUT.PUT_line(myVar1 + myVar2);
    select height into myVar1 from userTBL where userName = '이승기';
    DBMS_output.put_line(myVar3 || TO_Char(myVar1));
END;

select avg(amount) as "평균 구매 개수" from buyTBL;
select cast(AVG(amount) as number(3)) as "평균 구매 개수" from buyTBL;

select cast('2020$12$12' as date) from dual;
select cast('2020/12/12' as date) from dual;
select cast('2020%12%12' as date) from dual;
select cast('2020@12@12' as date) from dual;

select cast(price as char(5)) || 'X' || cast(amount as char(4)) || '=' as "단가X수량", price*amount as "구매액"
from buyTBL;

select to_char(12345, '$999,999') from dual;
select to_char(12345, '$000,999') from dual;
select to_char(12345, 'L999,999') from dual;
select to_char(sysdate, 'YYYY/MM/DD HH:MM:SS') from dual;

select '100' + '200' from dual; --문자와 문자를 더함(정수로 변환되서 연산됨)
select concat('100','200') from dual; --문자와 문자를 연결(문자로 처리)
select '100'||'200' from dual; --정수와 문자를 연결(정수가 문자로 변환되서 처리)
select price from buyTBL where price>='500'; --정수 500으로 전환

select ascii('A'), chr(65), asciistr('한'), unistr('/d55c') from dual; --ascii(영문자), chr(숫자), asciistr(한글), unista(유니코드값)
select length('한글'), length('AB'), lengthb('한글'), lengthb('AB') from dual;--length(문자열) 문자열의 길이, lengthb(문자열) 문자열에 할당된 byte 수, lengthc는 유니코드 문자열 크기를 반환
select concat('이것이', 'oracle이다'), '이것이'||' '||'oracle이다' from dual; --concat()은 2개의 문자열만 이어준다. 여러개의 문자열을 잇고 싶다면 ||를 사용



--instr(기준_문자열, 부분_문자열, 찾을_시작_위치), instrb(기준_문자열, 부분_문자열, 찾을_시작_위치)
select instr('이것이 oracle이다. 이것도 오라클이다', '이것')from dual;--기준_문자열에서 부분_문자열을 찾아서 문자열이 시작하는 위치를 반환한다. 찾을_시작_위치를 생략하면 1을 써준 것과 동일하다.
select instr('이것이 oracle이다. 이것도 오라클이다', '이것', 2)from dual;
select instrb('이것이 oracle이다. 이것도 오라클이다', '이것', 2)from dual;--instrb()는 byte단위로 세서 위치를 반환한다.

--lower(문자열/모두 소문자), upper(문자열/모두 대문자), initcap(문자열/첫 글자를 모두 대문자)
select lower('abcdefg'), upper('abcdefg'), initcap('this is oracle') from dual;
--replace와 translate
select replace('이것이 Oracle이다', '이것이', 'This is') from dual;
select translate('이것이 Oracle이다', '이것', 'AB') from dual;`
--substr(문자열, 시작_위치, 길이)
select substr('대한민국만세', 3, 2) from dual; -- 시작_위치부터 길이만큼 문자를 반환. 길이가 생략되면 문자열의 끝까지 반환
select substr('대한민국만세', 3) from dual;
--reverse(문자열)
select reverse('Oracle') from dual; --문자열의 순서를 바꾼다
--LPAD(문자열, 길이, 채울_문자열/왼쪽), RPAD(문자열, 길이, 채울_문자열/오른쪽)
select LPAD('이것이', 10, '##'), RPAD('이것이',10, '##') from dual; --문자열을 길이만큼 늘린 후에, 빈곳을 채울_문자열로 채움. 길이는 byte단위로 크기 지정
--LTRIM(문자열, 제거할_문자/왼쪽), RTRIM(문자열, 제거할_문자/오른쪽)
select LTRIM('    이것이'), RTRIM('이것이$$$', '$') from dual; --문자열의 왼쪽/오른쪽의 제거할 문제를 제거
--TRIM(제거할_방향 제거할_문자 from 문자열)
select trim('    이것이    '), trim(both 'ㅋ' from 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ') from dual; --문자열만 사용하면 앞뒤 공백을 제거. 제거할 방향은 leading(앞), both(양쪽), trailing(뒤)


select * from usertbl order by birthyear;

select rank() --순위를 매김
over (order by height desc) ranknUM,--()안에 컬럼에 맞게 "키큰순위"로 정렬해달라
username, addr, height --순서는  ranknUM, username, addr, height
from usertbl;

select ntile(2) -- 그룹을 2개 나누자
over (order by height desc) "반번호", 
username, addr, height
from usertbl;

select row_number() --키가 큰 순으로 순위를 정하고 싶을때사용하는 함수
over (order by height desc, username asc) "키큰순위", --키는 역순, 이름은 순서대로
username, addr, height
from usertbl;

create table movieTBL
(movie_id   number(4),
    movie_title NVARCHAR2(30),
    movie_director NVARCHAR2(30),
    movie_star NVARCHAR2(30),
    movie_script CLOB,
    movie_film BLOB
);

drop table movietbl;

select * from movietbl;

select sysdate from dual;
select to_char(sysdate, 'YYYY/MM/DD HH:MM:SS') "현재 날짜" from dual;
select to_date('20201231235959', 'YYYYMMDDHH24miss') "날짜 형식" from dual;


cast(expression as 데이터 형식)









