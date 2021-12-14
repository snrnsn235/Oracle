create procedure shop.myProc AS 
var1 INT;
var2 INT;
begin
    select count(*) INTO var1 from shop.memberTBL;
    select count(*) into var2 from shop.productTBL;
    DBMS_OUTPUT.PUT_LINE(var1+var2);
    end;