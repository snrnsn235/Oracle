set serveroutput on;
create table testtbl (id number, txt nvarchar2(5));
insert into testtbl values(1, '�����ɽ�');
insert into testtbl values(2, '����ũ');
insert into testtbl values(3, '������');

create or replace trigger testtrg -- Ʈ���� �̸�
after delete or update -- ���� �� ���� �Ŀ� �۵��ϰ� ����
on testtbl -- Ʈ���Ÿ� ������ ���̺�
for each row -- �� �ึ�� �����
begin
dbms_output.put_LINE('Ʈ���Ű� �۵��߽��ϴ�.');
end;

--Ʈ���ſ��� ������ dbms_output.put_LINE() ��� ��µǵ��� �Ϸ��� insert, update, delete�� beign~end ������� ��� ������� �Ѵ�.
begin 
insert into testtbl values(4, '���ι�����'); --4,���ι������� �߰��� �ִ´�.
update testtbl set txt = '������ũ' where id=3; --id�� 3�� txt�� ������ũ�� �����Ѵ�.
delete testtbl where id = 4; --id�� 4���� ���� �����Ѵ�.
end;
