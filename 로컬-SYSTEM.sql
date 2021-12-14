<!--ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234; --IDENTIFIED구문에 빨간 줄이 생기고, 구문 오류라는 메세지는 무시(약간의 버그)-->

CREATE TABLE Shop.indexTBL
AS
    SELECT first_name, last_name, hire_date
    from HR.employees;
select * from shop.indexTBL;

create view Shop.memberTBL_view AS
    select memberName, memberAddress From shop.memberTBL;<!--뷰의 실체는 select문이다. 뷰에 접근하게 되면 뷰 생성 시에 입력한 select문이 그때 작동한다.