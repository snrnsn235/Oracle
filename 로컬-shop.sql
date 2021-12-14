
<!--select memberName, memberADDRESS from memberTBL;-->
<!--sELECT * FROM MEMBERTBL WHERE MEMBERNAME = '지운이';-->

create table "my testTBL" (id NUMBER(3)); <!--테이블 이름에 띄어쓰기가 허용됨을 상기-->
<!--방금 테이블을 만들었지만 테이블(필터링됨)에는 생성되어있지 않음 -> 워크시트에서 CREATE문으로 개체를 생성하면, 접속 창에 자동으로 적용되지 않는다.-->
<!--그럴 땐 해당 개체 그룹을 선택후 마우스 오른쪽 버튼을 눌러 새로고침을 누르면 해결된다.-->
<!--오라클은 기본적으로 테이블 등의 이름을 모두 대문자로 처리하지만, 큰 따옴표 ("")에선 그대로 이름을 사용한다.

<!--테이블을 삭제-->
<!--DROP TABLE "MY TESTTBL" 오류발생, 테이블 이름을 알 수 없기 때문 대소문자로 구분된 이름을 정확하게 구분해서 지정해야한다.-->
DROP TABLE "my testTBL"
<!--삭제되었다고 해도 왼쪽 접속 창에는 남아있음 새로고침하면됨-->

select * from indexTBL where first_name = 'Jack';<!--그냥 하면 전체 테이블을 스캔한다-->

create index idx_indexTBL_first_name on indexTBL(first_name);<!--인덱스를 사용하면 쉽다.-->