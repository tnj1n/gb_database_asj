/*
1. 요구사항
   이커머스 창업 준비중입니다. 기업과 사용자 간 거래를 위해 기업의 정보와 사용자 정보가 필요합니다.
   기업의 정보는 기업 이름, 주소, 대표번호가 있고
   사용자 정보는 이름, 주소, 전화번호가 있습니다. 결제 시 사용자 정보와 기업의 정보, 결제한 카드의 정보 모두 필요하며,
   상품의 정보도 필요합니다. 상품의 정보는 이름, 가격, 재고입니다.
   사용자는 등록한 카드의 정보를 저장할 수 있으며, 카드의 정보는 카드번호, 카드사, 회원 정보가 필요합니다.

2. 개념 모델링
3. 논리 모델링
4. 물리 모델링
5. 구현
*/


/* 기업 정보				사용자 정보			상품의 정보			결제			카드의 정보
 * -------------------------------------------------------------------------
 * 아이디					아이디			아이디			아이디		아이디
 * ------------------------------------------------------------------------
 * 기업 이름				이름				이름			사용자 정보			카드번호	
 * 주소					주소				가격			기업의 정보			카드사	
 * 대표번호				전화번호			재고			카드의 정보			회원 정보
 * */



CREATE TABLE TBL_COMPANY(
	ID NUMBER CONSTRAINT PK_COMPANY PRIMARY KEY,
	COMPANY_NAME VARCHAR2(255) NOT NULL,
	COMPANY_ADDRESS VARCHAR2(255) NOT NULL,
	COMPANY_TEL VARCHAR2(255) NOT NULL
);

CREATE TABLE TBL_USER(
	ID NUMBER CONSTRAINT PK_USER PRIMARY KEY,
	USER_NAME VARCHAR2(255) NOT NULL,
	USER_ADDRESS VARCHAR2(255) NOT NULL,
	USER_PHONE VARCHAR2(255) NOT NULL
);

CREATE TABLE TBL_PRODUCT(
	ID NUMBER CONSTRAINT PK_PRODUCT PRIMARY KEY,
	PRODUCT_NAME VARCHAR2(255) NOT NULL,
	PRODUCT_PRICE NUMBER DEFAULT 0,
	PRODUCT_STOCK NUMBER DEFAULT 0
);

CREATE TABLE TBL_CARD(
	ID NUMBER CONSTRAINT PK_CARD PRIMARY KEY,
	CARD_NUMBER VARCHAR2(255) CONSTRAINT UK_MEMBER UNIQUE NOT NULL,
	CARD_COMPANY VARCHAR2(255) NOT NULL,
	USER_ID NUMBER NOT NULL,
	CONSTRAINT FK_USER_CARD FOREIGN KEY(USER_ID)
 	REFERENCES TBL_USER(ID)
);

CREATE TABLE TBL_PAYMENT(
	ID NUMBER CONSTRAINT PK_PAYMENT PRIMARY KEY,
	COMPANY_ID NUMBER NOT NULL,
	CARD_ID NUMBER NOT NULL,
	PRODUCT_ID NUMBER NOT NULL,
 	CONSTRAINT FK_COMPANY_PAYMENT FOREIGN KEY(COMPANY_ID)
 	REFERENCES TBL_COMPANY(ID),
 	CONSTRAINT FK_CARD_PAYMENT FOREIGN KEY(CARD_ID)
 	REFERENCES TBL_CARD(ID),
 	CONSTRAINT FK_PRODUCT_PAYMENT FOREIGN KEY(PRODUCT_ID)
 	REFERENCES TBL_PRODUCT(ID)
);



