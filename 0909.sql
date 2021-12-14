select * from userTBL;

set serveroutput on;

declare
    myVar1 NUMBER(3);
    myVar2 NUMBER(5,2) := 3.14; --�� �ʱ�ȭ, := ������ ���� ������ �� ���
    myVar3 NVARCHAR2(20) := '�̽±� Ű -->' ;
BEGIN
    myVar1 := 5;
    DBMS_OUTPUT.PUT_LINE(myVar1);
    DBMS_OUTPUT.PUT_line(myVar1 + myVar2);
    select height into myVar1 from userTBL where userName = '�̽±�';
    DBMS_output.put_line(myVar3 || TO_Char(myVar1));
END;

select avg(amount) as "��� ���� ����" from buyTBL;
select cast(AVG(amount) as number(3)) as "��� ���� ����" from buyTBL;

select cast('2020$12$12' as date) from dual;
select cast('2020/12/12' as date) from dual;
select cast('2020%12%12' as date) from dual;
select cast('2020@12@12' as date) from dual;

select cast(price as char(5)) || 'X' || cast(amount as char(4)) || '=' as "�ܰ�X����", price*amount as "���ž�"
from buyTBL;

select to_char(12345, '$999,999') from dual;
select to_char(12345, '$000,999') from dual;
select to_char(12345, 'L999,999') from dual;
select to_char(sysdate, 'YYYY/MM/DD HH:MM:SS') from dual;

select '100' + '200' from dual; --���ڿ� ���ڸ� ����(������ ��ȯ�Ǽ� �����)
select concat('100','200') from dual; --���ڿ� ���ڸ� ����(���ڷ� ó��)
select '100'||'200' from dual; --������ ���ڸ� ����(������ ���ڷ� ��ȯ�Ǽ� ó��)
select price from buyTBL where price>='500'; --���� 500���� ��ȯ

select ascii('A'), chr(65), asciistr('��'), unistr('/d55c') from dual; --ascii(������), chr(����), asciistr(�ѱ�), unista(�����ڵ尪)
select length('�ѱ�'), length('AB'), lengthb('�ѱ�'), lengthb('AB') from dual;--length(���ڿ�) ���ڿ��� ����, lengthb(���ڿ�) ���ڿ��� �Ҵ�� byte ��, lengthc�� �����ڵ� ���ڿ� ũ�⸦ ��ȯ
select concat('�̰���', 'oracle�̴�'), '�̰���'||' '||'oracle�̴�' from dual; --concat()�� 2���� ���ڿ��� �̾��ش�. �������� ���ڿ��� �հ� �ʹٸ� ||�� ���



--instr(����_���ڿ�, �κ�_���ڿ�, ã��_����_��ġ), instrb(����_���ڿ�, �κ�_���ڿ�, ã��_����_��ġ)
select instr('�̰��� oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�')from dual;--����_���ڿ����� �κ�_���ڿ��� ã�Ƽ� ���ڿ��� �����ϴ� ��ġ�� ��ȯ�Ѵ�. ã��_����_��ġ�� �����ϸ� 1�� ���� �Ͱ� �����ϴ�.
select instr('�̰��� oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2)from dual;
select instrb('�̰��� oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2)from dual;--instrb()�� byte������ ���� ��ġ�� ��ȯ�Ѵ�.

--lower(���ڿ�/��� �ҹ���), upper(���ڿ�/��� �빮��), initcap(���ڿ�/ù ���ڸ� ��� �빮��)
select lower('abcdefg'), upper('abcdefg'), initcap('this is oracle') from dual;
--replace�� translate
select replace('�̰��� Oracle�̴�', '�̰���', 'This is') from dual;
select translate('�̰��� Oracle�̴�', '�̰�', 'AB') from dual;`
--substr(���ڿ�, ����_��ġ, ����)
select substr('���ѹα�����', 3, 2) from dual; -- ����_��ġ���� ���̸�ŭ ���ڸ� ��ȯ. ���̰� �����Ǹ� ���ڿ��� ������ ��ȯ
select substr('���ѹα�����', 3) from dual;
--reverse(���ڿ�)
select reverse('Oracle') from dual; --���ڿ��� ������ �ٲ۴�
--LPAD(���ڿ�, ����, ä��_���ڿ�/����), RPAD(���ڿ�, ����, ä��_���ڿ�/������)
select LPAD('�̰���', 10, '##'), RPAD('�̰���',10, '##') from dual; --���ڿ��� ���̸�ŭ �ø� �Ŀ�, ����� ä��_���ڿ��� ä��. ���̴� byte������ ũ�� ����
--LTRIM(���ڿ�, ������_����/����), RTRIM(���ڿ�, ������_����/������)
select LTRIM('    �̰���'), RTRIM('�̰���$$$', '$') from dual; --���ڿ��� ����/�������� ������ ������ ����
--TRIM(������_���� ������_���� from ���ڿ�)
select trim('    �̰���    '), trim(both '��' from '��������վ��.������') from dual; --���ڿ��� ����ϸ� �յ� ������ ����. ������ ������ leading(��), both(����), trailing(��)


select * from usertbl order by birthyear;

select rank() --������ �ű�
over (order by height desc) ranknUM,--()�ȿ� �÷��� �°� "Űū����"�� �����ش޶�
username, addr, height --������  ranknUM, username, addr, height
from usertbl;

select ntile(2) -- �׷��� 2�� ������
over (order by height desc) "�ݹ�ȣ", 
username, addr, height
from usertbl;

select row_number() --Ű�� ū ������ ������ ���ϰ� ����������ϴ� �Լ�
over (order by height desc, username asc) "Űū����", --Ű�� ����, �̸��� �������
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
select to_char(sysdate, 'YYYY/MM/DD HH:MM:SS') "���� ��¥" from dual;
select to_date('20201231235959', 'YYYYMMDDHH24miss') "��¥ ����" from dual;


cast(expression as ������ ����)









