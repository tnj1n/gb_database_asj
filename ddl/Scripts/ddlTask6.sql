/*
    요구사항

    학사 관리 시스템에 학생과 교수, 과목을 관리합니다.
    학생은 학번, 이름, 전공, 학년이 필요하고
    교수는 교수 번호, 이름, 전공, 직위가 필요합니다.
    과목은 고유한 과목 번호와 과목명, 학점이 필요합니다.
    학생은 여러 과목을 수강할 수 있으며,
    교수는 여러 과목을 강의할 수 있습니다.
    학생이 수강한 과목은 성적(점수)이 모두 기록됩니다.
*/

/*학생			교수			과목
 * 
 * 학번			교수 번호		과목 번호UN
 * 이름			이름			과목명
 * 전공			전공			학점
 * 학년			직위
 * 
 * */

CREATE TABLE TBL_STUDENT(
	ID NUMBER CONSTRAINT PK_STUDNET PRIMARY KEY,
	STUDENT_NAME VARCHAR2(255) NOT NULL,
	STUDENT_MAJOR VARCHAR2(255) NOT NULL,
	STUDENT_YEAR NUMBER DEFAULT 1
);

CREATE TABLE TBL_PROFESSOR(
	ID NUMBER CONSTRAINT PK_PROFESSOR PRIMARY KEY,
	PROFESSOR_NAME VARCHAR2(255) NOT NULL,
	PROFESSOR_MAJOR VARCHAR2(255) NOT NULL,
	PROFESSOR_OFFICE VARCHAR2(255)
);

CREATE TABLE TBL_CLASS(
	ID NUMBER CONSTRAINT PK_CALSS PRIMARY KEY,
	CLASS_NAME VARCHAR2(255) NOT NULL CONSTRAINT UK_CLASS UNIQUE,
	CLASS_GRADE NUMBER(4, 2) DEFAULT 0
);

CREATE TABLE TBL_STUDENT_CLASS(
    ID NUMBER CONSTRAINT PK_STUDENT_CLASS PRIMARY KEY,
    CLASS_ID NUMBER NOT NULL,
    STUDENT_ID NUMBER NOT NULL,
	CONSTRAINT FK_STUDENT_CLASS_STUDENT FOREIGN KEY(STUDENT_ID)
	REFERENCES TBL_STUDENT(ID),
	CONSTRAINT FK_STUDENT_CLASS_CLASS FOREIGN KEY(CLASS_ID)
	REFERENCES TBL_CLASS(ID)
);



CREATE TABLE TBL_LECTURE(
	ID NUMBER CONSTRAINT PK_LECTURE PRIMARY KEY,
	PROFESSOR_ID NUMBER,
	CLASS_ID NUMBER NOT NULL,
	CONSTRAINT FK_PROFESSOR_CLASS FOREIGN KEY(PROFESSOR_ID)
	REFERENCES TBL_PROFESSOR(ID),
	CONSTRAINT FK_LECTURE_CLASS FOREIGN KEY(CLASS_ID)
	REFERENCES TBL_CLASS(ID)
);

