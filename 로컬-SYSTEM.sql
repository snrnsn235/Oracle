<!--ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234; --IDENTIFIED������ ���� ���� �����, ���� ������� �޼����� ����(�ణ�� ����)-->

CREATE TABLE Shop.indexTBL
AS
    SELECT first_name, last_name, hire_date
    from HR.employees;
select * from shop.indexTBL;

create view Shop.memberTBL_view AS
    select memberName, memberAddress From shop.memberTBL;<!--���� ��ü�� select���̴�. �信 �����ϰ� �Ǹ� �� ���� �ÿ� �Է��� select���� �׶� �۵��Ѵ�.