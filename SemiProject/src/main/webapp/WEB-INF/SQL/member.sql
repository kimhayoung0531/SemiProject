-- 회원정보
CREATE TABLE tbl_member 
(
	user_id             VARCHAR2(40)           NOT NULL, -- 아이디
	user_name           VARCHAR2(20)           NOT NULL, -- 이름
	pwd                 VARCHAR2(200)          NOT NULL, -- 비밀번호
	email               VARCHAR2(40)           NOT NULL, -- 이메일
	mobile              VARCHAR2(20)           NOT NULL, -- 휴대전화
	telephone           VARCHAR2(20)           NULL,     -- 유선전화
	post_code           VARCHAR2(5)            NOT NULL, -- 우편번호
	address             VARCHAR2(200)          NOT NULL, -- 주소
	detailAddress       VARCHAR2(200)          NULL,     -- 상세주소
	extraAddress        VARCHAR2(200)          NULL,     -- 부가주소
	gender              VARCHAR2(1)            NOT NULL, -- 성별
	birthday            VARCHAR2(10)           NULL,     -- 생년월일
	mileage             NUMBER DEFAULT 0       NULL,     -- 마일리지
	registerday         DATE DEFAULT SYSDATE   NOT NULL, -- 가입일자
	lastPwdChange       DATE DEFAULT SYSDATE   NULL,     -- 마지막비밀번호변경날짜
	idle                NUMBER(1) DEFAULT 0    NOT NULL, -- 휴먼회원여부
	pwd_change_required DATE DEFAULT SYSDATE   NULL,     -- 비밀번호갱신필요여부
	status              NUMBER(1) DEFAULT 1    NOT NULL  -- 탈퇴여부
    ,constraint PK_tbl_member_userid primary key(user_id)
    ,constraint UQ_tbl_member_email  unique(email)
    ,constraint CK_tbl_member_gender check( gender in('1','2') )
    ,constraint CK_tbl_member_status check( status in(0,1) )
    ,constraint CK_tbl_member_idle check( idle in(0,1) )
);
-- Table TBL_MEMBER이(가) 생성되었습니다.
select * 
from tbl_member

-- 제품좋아요테이블
CREATE TABLE tbl_product_like (
	user_id     VARCHAR(40) NOT NULL, -- 아이디
	product_num number(20)  NOT NULL  -- 상품번호
);
select * 
from tbl_product_like