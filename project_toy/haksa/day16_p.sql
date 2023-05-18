create database sampledb; -- ==> MySQL에서 DB 만드는 코드
-- * 주석처리 단축키 : ctrl + / 
-- * 한 줄 선택 단축키 : shift + home/end (코드의 마지막 위치/처음 위치에 커서 배치할 것)
-- * 맨위/맨아래로 이동 : ctrl + home/end
-- ★★★oracle : 수동 commit이 기본값,  mysql, ms-sqlserver : 자동 commit이 기본값 (롤백 불가!)
-- ★★★응용프로그램에서는 Oracle, MySQL 상관없이 모든 transaction이 자동 commit됨
-- 	  (java에서 코딩해서 insert 등을 실행하면 자동으로 commit된다는 의미)
use sampledb; -- DB 선택 

-- 테이블 생성
CREATE TABLE student(
	id CHAR(7) PRIMARY KEY,  -- 무명 제약조건 설정 
    name VARCHAR(10) NOT NULL,
    dept VARCHAR(20) NOT NULL,
    address VARCHAR(50) NOT NULL
);

-- 데이터 입력
INSERT INTO
	student
VALUES(
	'1091011', '김철수', '컴퓨터시스템', '서울시 관악구 봉천동'
); -- 한글 입력하려면 UTF-8,student generel.ci 로 변경

INSERT INTO
	student
VALUES(
	'0792012', '최고봉', '멀티미디어', '경기도 안산시 초지동'
);

INSERT INTO
	student
VALUES(
	'0494013', '이기자', '컴퓨터공학', '경기도 안양시 평촌동'
);

INSERT INTO
	student
VALUES(
	'2498732', '홍길동', '철학', '서울시 중구'
);

INSERT INTO
	student
VALUES(
	'3529021', '강감찬', '역사학', '경기도 안산시'
);

INSERT INTO
	student
VALUES(
	'4382871', '최영희', '회계학', '경기도 파주시'
);

INSERT INTO
	student
VALUES(
	'5283786', '박현수', '체육학', '경기도 하남시'
);

START TRANSACTION; -- 이 코드를 입력하면 수동 커밋 필요한 상태로 전환, 커밋, 롤백 가능

-- student 테이블 데이터 조회 질의명령
SELECT 
	*
FROM
	books
;

--------------------------------------------------------------------------------------

CREATE TABLE books(
	no CHAR(6) PRIMARY KEY,     -- 책번호
    title VARCHAR(50) NOT NULL, -- 이름
    author varchar(50) NOT NULL -- 저자
);

INSERT INTO
	books
VALUES(
	'000001', '오라클기본', '이황'
);
INSERT INTO
	books
VALUES(
	'000002', '자바정복', '율곡'
);
INSERT INTO
	books
VALUES(
	'000003', 'HTML5', '강감찬'
);
INSERT INTO
	books
VALUES(
	'000004', '코딩의 역사', '이순신'
);

INSERT INTO
	books
VALUES(
	'000005', '스포츠의 이해', '왕건'
);

INSERT INTO
	books
VALUES(
	'000006', '미디어의 이해', '백남준'
);

INSERT INTO
	books
VALUES(
	'000007', '그리스 철학', '김윤희'
);
commit;

CREATE TABLE bookRent(
		no CHAR(10) PRIMARY KEY,  -- 대여번호
        id CHAR(7) NOT NULL, 	  -- 학번 
        bookNo CHAR(6) NOT NULL,  -- 책번호
        rDate CHAR(8) NOT NULL,   -- 대여일
        CONSTRAINT FK_BOOKRENT FOREIGN KEY(id) REFERENCES student(id)
);

INSERT INTO
	bookRent
VALUES(
	'2017071304','1091011','000001','20170713'
);
INSERT INTO
	bookRent
VALUES(
	'2017071305','0494013','000002','20170713'
);
INSERT INTO
	bookRent
VALUES(
	'2017071306','0792012','000003','20170713'
);

SELECT
	*
FROM
	bookRent
;

----------------------- join --------------------------------------------------------------
SELECT
	s.id "학번", s.name "이름", b.title "책제목", r.rDate "도서대여일"
FROM 					-- 1) 필요한 데이터가 어느 테이블에 있는지 먼저 생각해보기
	student s, books b, bookRent r
WHERE					-- 2) 두 테이블에 공통적으로 있는 컬럼 찾아서 조인조건 작성
	r.id = s.id
	AND b.no = bookNo
;

-- 테이블에 별칭 붙이지 않는 쪽을 권장. 테이블이 많아지면 별칭으로는 빠르게 테이블 파악하기 어려움.
SELECT
	student.id "학번", student.name "이름", books.title "책제목", bookRent.rDate "도서대여일"
FROM 					-- 1) 필요한 데이터가 어느 테이블에 있는지 먼저 생각해보기
	student, books, bookRent
WHERE					-- 2) 두 테이블에 공통적으로 있는 컬럼 찾아서 조인조건 작성
	bookRent.id = student.id
	AND books.no = bookRent.bookNo
;

-- ANSI JOIN
SELECT
	student.id "학번", student.name "이름", books.title "책제목", bookRent.rDate "도서대여일"
FROM
	student
JOIN
	bookRent
ON -- inner join 조인조건은 on에 입력
	student.id = bookRent.id
INNER JOIN
	books
ON
	books.no = bookRent.bookNo
;

CREATE TABLE administrator(
	adminNo VARCHAR(3) PRIMARY KEY,
    adminId VARCHAR(10) UNIQUE NOT NULL,
    adminPw VARCHAR(20) NOT NULL,
    adminInfo VARCHAR(30)
);

INSERT INTO
	administrator
VALUES(
	'1', 'admin', 'admin', '김서진', '첫번째 관리자'
);

SELECT
	*
FROM
	administrator
;

commit;

SELECT
	dept
FROM
	bookRent, student
WHERE
	bookRent.id = student.id
GROUP BY
	dept
;

SELECT
	COUNT(DISTINCT dept)
FROM
	student
;

INSERT INTO
	student
VALUES(
	2333333, '문정윤', '국어국문학과', '서울시 송파구'
);

SELECT
	dept, COUNT(dept)
FROM
	student, bookRent
WHERE
	student.id = bookRent.id
    AND dept = '컴퓨터시스템'
;