SELECT * FROM USER_CONSTRAINTS -- 키 정보가 등록된 테이블
    WHERE OWNER = 'TABLEDB' AND
        TABLE_NAME='USERTBL' AND
        CONSTRAINT_TYPE='P'; -- P는 기본키, R은 외래 키, C는 NOT NULL 혹은 CHECK
        --모든 제약 조건은 이름을 가지게 되는데 CREATE TABLE 구문 안에서 기본 키를 지정하면 이름은 오라클이 알아서 설정해준다.
        --여기선 'SYS_C007104'로 임의로 지어준 것을 확인가능하다.

--ALTER TABLE 구문을 사용하는 방법도 있다.
DROP TABLE USERTBL CASCADE CONSTRAINTS;
CREATE TABLE USERTBL --회원 테이블
(USERID CHAR(8) NOT NULL CONSTRAINT PK_USERTBL_USERTBL_USERID PRIMARY KEY, --사용자 아이디(PK)
USERNAME NVARCHAR2(10) NOT NULL, --이름
BIRTHYEAR NUMBER(4) NOT NULL, --출생년도
ADDR NCHAR(2) NOT NULL, --지역(2글자만 입력가능)
MOBILE1 CHAR(3) NULL, --휴대폰 국번(010,011,017...)
MOBILE2 CHAR(8) NULL, --휴대폰 나머지 전화번호
HEIGHT NUMBER(3) NULL, --키
MDATE DATE NULL--회원 가입일
);
ALTER TABLE USERTBL --USERID를 변경하자
    ADD CONSTRAINT PK_USERTBL_USERID --제약조건을 추가하자. 추가할 제약 조건 이름은 'PK_USERTBL_USERID'이다.
    PRIMARY KEY(USERID); --추가할 제약 조건은 기본 키 제약 조건이다; 그리고 제약 조건을 설정할 열은 USERID열이다.