1. 요구 사항
    마이페이지에서 회원 프로필을 구현하고 싶습니다.
    회원당 프로필을 여러 개 설정할 수 있고,
    대표 이미지로 선택된 프로필만 화면에 보여주고 싶습니다.

2. 개념 모델링
3. 논리 모델링
4. 물리 모델링
5. 구현
*/
DROP TABLE TBL_MEMBER;
DROP TABLE TBL_POST;
DROP TABLE TBL_REPLY;

CREATE TABLE TBL_MEMBER(
   ID NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
   MEMBER_ID VARCHAR2(255) CONSTRAINT UK_MEMBER UNIQUE NOT NULL,
   MEMBER_PASSWORD VARCHAR2(255) NOT NULL,
   MEMBER_NAME VARCHAR2(255) NOT NULL,
   MEMBER_ADDRESS VARCHAR2(255) NOT NULL,
   MEMBER_EMAIL VARCHAR2(255),
   MEMBER_BIRTH DATE
);

CREATE TABLE TBL_PROFILE(
   ID NUMBER CONSTRAINT PK_PROFILE PRIMARY KEY,
   PROFILE_PATH VARCHAR2(255) NOT NULL,
   PROFILE_SIZE NUMBER DEFAULT 0,
   STATUS NUMBER DEFAULT 0,
   MEMBER_ID NUMBER NOT NULL,
   CONSTRAINT FK_PROFILE_MEMBER FOREIGN KEY(MEMBER_ID)
   REFERENCES TBL_MEMBER(ID)
);
