/*
1. 요구 사항
    회원들끼리 좋아요를 누를 수 있습니다.

2. 개념 모델링
3. 논리 모델링
4. 물리 모델링
5. 구현
*/

DROP TABLE TBL_MEMBER;
DROP TABLE TBL_PROFILE;

CREATE TABLE TBL_MEMBER(
   ID NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
   MEMBER_ID VARCHAR2(255) CONSTRAINT UK_MEMBER UNIQUE NOT NULL,
   MEMBER_PASSWORD VARCHAR2(255) NOT NULL,
   MEMBER_NAME VARCHAR2(255) NOT NULL,
   MEMBER_ADDRESS VARCHAR2(255) NOT NULL,
   MEMBER_EMAIL VARCHAR2(255),
   MEMBER_BIRTH DATE
);

CREATE TABLE TBL_LIKE(
   ID NUMBER CONSTRAINT PK_LIKE PRIMARY KEY,
   LIKE_RECEIVER NUMBER NOT NULL,
   LIKE_SENDER NUMBER NOT NULL,
   CONSTRAINT FK_LIKE_MEMBER_RECEIVER FOREIGN KEY(LIKE_RECEIVER)
   REFERENCES TBL_MEMBER(ID),
   CONSTRAINT FK_LIKE_MEMBER_SENDER FOREIGN KEY(LIKE_SENDER)
   REFERENCES TBL_MEMBER(ID)
);

ALTER TABLE TBL_LIKE RENAME COLUMN LIKE_RECIEVER TO LIKE_RECEIVER;
ALTER TABLE TBL_LIKE DROP CONSTRAINT FK_LIKE_MEMBER_RECIEVER;

ALTER TABLE TBL_LIKE ADD 
CONSTRAINT FK_LIKE_MEMBER_RECEIVER FOREIGN KEY(LIKE_RECEIVER)
REFERENCES TBL_MEMBER(ID);



