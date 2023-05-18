CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board (
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate
);

ALTER TABLE tbl_board
ADD CONSTRAINT TBL_BOARD_PK PRIMARY KEY(bno);
    
INSERT INTO
    tbl_board(bno, title, content, writer)
VALUES(
    seq_board.NEXTVAL, '제목테스트', '내용테스트', 'user00'
);


SELECT
    *
FROM
    tbl_board
;

DELETE
FROM
    tbl_board
WHERE
    bno = 5
;

commit;


-- 더미데이터  만들기 (질의명령 실행할 때마다 존재하는 데이터가 두 배씩 복사되어 증가 - 26만 개 만듦 - 23/02/27)
INSERT INTO
    tbl_board(bno, title, content, writer)
SELECT
    seq_board.NEXTVAL, title, content, writer
FROM
    tbl_board
;

-- index + WHERE rownum 사용 : order by + BETWEEN a AND b 사용하지 않고 sorting
-- 아래 질의명령에서 F10 눌러서 정렬 구조 확인 가능 (아래(TABLE ACCESS)부터 위쪽 순으로 읽음)
SELECT
    bno, title, content
FROM (
        SELECT /*+INDEX_DESC(tbl_board TBL_BOARD_PK) */   -- /*+ 는 공백 없이 붙여쓰기!!
               --> 인덱스 힌트(쿼리 힌트) : row number가 순서대로 정리되어 있는 PK 활용하여 정렬 (/*+ ~ */) 
               --> ORDER BY 쓰는 것보다 sorting 시간이 절약됨. 인덱스를 활용하여 더 빨리 sorting 가능.
               --> 코드 미입력 시 : order by 하지 않아서 bno가 랜덤으로 정렬됨 ==> 코드 입력 시 정렬
            rownum rn, bno, title, content
        FROM
            tbl_board
        WHERE
            rownum <= 10
     )
WHERE
    rn > 0
;


-- index hint 연습
-- (F10 눌러보면 IDX_WRITER로 먼저 정렬됨을 알 수 있음 ==> query optimizer가 실행한 것)
-- (데이터 수가 적으면 query optimizer가 그냥 ASC로 정렬함. 처음부터 찾는 게 더 빠른 경우가 있기 때문)
SELECT
    *
FROM
    tbl_board
WHERE
    writer = 'newbie'
;

-- PK가 아닌 다른 컬럼으로 검색하여 정렬 시 ==> 인덱스를 새로 만든다 ==> 인덱스 갯수 증가(PK, idx_writer) ==> DB 사이즈가 계속 커짐
-- 데이터가 별로 없어서(23만 개..) 인덱스 금방 만들어짐
CREATE INDEX
    idx_writer
ON
    tbl_board(writer) -- writer 컬럼으로 인덱스 만드는 방법
;


-- 댓글 테이블
CREATE TABLE tbl_reply(
    rno NUMBER(10, 0),
    bno NUMBER(10, 0) NOT NULL,
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replyDate DATE DEFAULT sysdate,
    updateDate DATE DEFAULT sysdate
);

CREATE SEQUENCE seq_reply;

ALTER TABLE tbl_reply
ADD CONSTRAINT TBL_REPLY_PK PRIMARY KEY(rno);

ALTER TABLE tbl_reply
ADD CONSTRAINT TBL_REPLY_FK FOREIGN KEY(bno) REFERENCES tbl_board(bno);


CREATE INDEX idx_reply ON tbl_reply(bno);

SELECT
    *
FROM
    tbl_reply
;

SELECT
    TO_CHAR(updateDate, 'yyyy/mm/dd hh:mi:ss')
FROM
    tbl_reply
WHERE
    rno = 1
;

INSERT INTO
    tbl_reply(rno, bno, reply, replyer, replyDate)
SELECT
    seq_reply.NEXTVAL, 262148, reply, replyer, replyDate
FROM
    tbl_reply
;

commit;


-- BoardVO에 replyCnt 컬럼 생성하지 않고, 쿼리문으로 계산해서 댓글 수 구하는 코드 (update 없음) : 연관관계 서브질의
-- 데이터 양이 적을 때 사용하면 유리하다. (네이버 같이 데이터가 아주 많은 상황에는 X)
SELECT
    bno, title, content, 
    (
        SELECT
            COUNT(*)
        FROM
            tbl_reply
        WHERE
            tbl_reply.bno = b.bno
    ) AS replycnt
FROM
    (
        SELECT
            rownum rn, bno, title, content
        FROM
            tbl_board
        WHERE
            rownum <= 10
        ORDER BY
            bno DESC
    ) b
WHERE
    rn > 0
;



-- 첨부파일 테이블 만들기
CREATE TABLE tbl_attach (
    uuid VARCHAR2(100) NOT NULL,
    uploadPath VARCHAR2(200) NOT NULL,
    fileName VARCHAR2(100) NOT NULL,
    fileType CHAR(1) DEFAULT 'I',
    bno NUMBER(10, 0)
);

-- uuid 기본키 설정
ALTER TABLE tbl_attach 
ADD CONSTRAINT TA_UUID_PK PRIMARY KEY(uuid);

-- bno 참조키 설정
ALTER TABLE tbl_attach
ADD CONSTRAINT TA_BNO_FK FOREIGN KEY(bno) REFERENCES tbl_board(bno);


SELECT
    *
FROM
    tbl_attach
;


commit;


-- Spring Security Test 

-- 회원정보, 권한 테이블 설계
CREATE TABLE users(
    username VARCHAR2(50) 
        CONSTRAINT USERS_USERNAME_PK PRIMARY KEY
        CONSTRAINT USERS_USERNAME_NN NOT NULL,
    password VARCHAR2(50)
        CONSTRAINT USERS_PASSWORD_NN NOT NULL,
    enabled CHAR(1) DEFAULT '1'
);

CREATE TABLE authorities(
    username VARCHAR2(50)
        CONSTRAINT AUTH_USERNAME_FK REFERENCES users(username)
        CONSTRAINT AUTH_USERNAME_NN NOT NULL,
    authority VARCHAR2(50) 
        CONSTRAINT AUTH_AUTH_NN NOT NULL
);

-- 복합 인덱스 생성 (컬럼을 2개 이상 사용하여 만드는 인덱스) ==> 속도 향상 가능
CREATE UNIQUE INDEX ix_auth_username ON authorities(username, authority);

-- 회원정보 테이블 데이터 입력
INSERT INTO
    users(username, password)
VALUES(
    'user00', 'pw00'
);

INSERT INTO
    users(username, password)
VALUES(
    'member00', 'pw00'
);

INSERT INTO
    users(username, password)
VALUES(
    'admin00', 'pw00'
);

-- 권한 테이블 데이터 입력 (authority는 spring security에서 정해놓은 ROLE_~ 값을 입력해야 됨!!)
INSERT INTO
    authorities(username, authority)
VALUES(
    'user00', 'ROLE_USER'
);

INSERT INTO
    authorities(username, authority)
VALUES(
    'member00', 'ROLE_MANAGER'
);

INSERT INTO
    authorities(username, authority)
VALUES(
    'admin00', 'ROLE_MANAGER'
);

INSERT INTO
    authorities(username, authority)
VALUES(
    'admin00', 'ROLE_ADMIN'
);

COMMIT;


-- Spring Security Study (★ 컬럼명은 전부 소문자로! Camel, Snake 표기법 전부 XXX => 사유 : lombok이 getter/setter 만들 때 issue 발생할 수 있음)
CREATE TABLE tbl_member(
    userid VARCHAR2(50) PRIMARY KEY NOT NULL,
    userpw VARCHAR2(100) NOT NULL, -- bcrypt password encoder로 암호화
    username VARCHAR2(100) NOT NULL,
    regdate DATE DEFAULT sysdate,
    enabled CHAR(1) DEFAULT '1'
);

ALTER TABLE tbl_member
ADD updatedate DATE DEFAULT sysdate;

CREATE TABLE tbl_member_auth (
    userid VARCHAR2(50) NOT NULL,
    auth VARCHAR2(50) NOT NULL,
    CONSTRAINT FK_MEMBER_AUTH FOREIGN KEY(userid) REFERENCES tbl_member(userid)
);

-- MemberTests.java JUnit 테스트 성공하면 조회 질의명령에서 100개 조회됨
SELECT
    *
FROM
    tbl_member_auth
;

UPDATE
    tbl_member_auth
SET
    auth = 'ROLE_MANAGER'
WHERE
    userid LIKE 'manager%'
;

-- 자동로그인에 활용하는 테이블
CREATE TABLE persistent_logins (
    username VARCHAR2(64) NOT NULL,
    series VARCHAR2(64) PRIMARY KEY,
    token VARCHAR2(64) NOT NULL,
    last_used TIMESTAMP NOT NULL -- timestamp : 시간, last_user : 마지막 접속 시각
);


SELECT
    *
FROM
    persistent_logins
;

