CREATE TABLE TBL_COMPANY(
	ID NUMBER CONSTRAINT PK_COMPANY PRIMARY KEY,
	COMPANY_NAME VARCHAR2(255) NOT NULL,
	COMPANY_ADDRESS VARCHAR2(255) NOT NULL,
	COMPANY_B_NUMBER NUMBER NOT NULL,
	CONPANY_TYPE NUMBER
);

CREATE TABLE TBL_CATEGORY_A(
   ID NUMBER CONSTRAINT PK_CATEGORY_A PRIMARY KEY,
   CATEGORY_A_NAME VARCHAR2(255)
);

CREATE TABLE TBL_CATEGORY_B(
   ID NUMBER CONSTRAINT PK_CATEGORY_B PRIMARY KEY,
   CATEGORY_B_NAME VARCHAR2(255),
   CATEGORY_A_ID NUMBER,
   CONSTRAINT FK_CATEGORY_B_CATEGORY_A FOREIGN KEY(CATEGORY_A_ID)
   REFERENCES TBL_CATEGORY_A(ID)
);

CREATE TABLE TBL_CATEGORY_C(
   ID NUMBER CONSTRAINT PK_CATEGORY_C PRIMARY KEY,
   CATEGORY_C_NAME VARCHAR2(255),
   CATEGORY_B_ID NUMBER,
   CONSTRAINT FK_CATEGORY_C_CATEGORY_B FOREIGN KEY(CATEGORY_B_ID)
   REFERENCES TBL_CATEGORY_B(ID)
);

CREATE TABLE TBL_ADVERTISMENT(
	ID NUMBER CONSTRAINT PK_ADVERTISMENT PRIMARY KEY,
	ADVERTISMENT_TITLE VARCHAR2(255) NOT NULL,
	ADVERTISMENT_CONTENT VARCHAR2(255) NOT NULL
);

CREATE TABLE TBL_REQUEST(
	ID NUMBER CONSTRAINT PK_REQUEST PRIMARY KEY,
	ADVERTISMENT_ID NUMBER NOT NULL,
	COMPANY_ID NUMBER NOT NULL,
	CONSTRAINT FK_ADVERTISMENT FOREIGN KEY(ADVERTISMENT_ID)
	REFERENCES TBL_ADVERTISMENT(ID),
	CONSTRAINT FK_COMPANY_REQUEST FOREIGN KEY(COMPANY_ID)
	REFERENCES TBL_COMPANY(ID)
);


CREATE TABLE TBL_REQUEST_CATEGORY(
	ID NUMBER CONSTRAINT PK_REQUEST_CATEGORY PRIMARY KEY,
	CATEGORY_C_ID NUMBER NOT NULL,
	COMPANY_ID NUMBER NOT NULL,
	CONSTRAINT FK_CATEGORY_REQUEST FOREIGN KEY(CATEGORY_C_ID)
	REFERENCES TBL_CATEGORY_C(ID),
	CONSTRAINT FK_COMPANY_REQUEST_CATEGORY FOREIGN KEY(COMPANY_ID)
	REFERENCES TBL_COMPANY(ID)
);


------------------------------------------------------------------------------


