--테스트용 회원 아이디 생성
insert into tbl_member (user_id, user_name, pwd, email, mobile, post_code, address, gender)
values (test, '테스트', 'qwer1234$', 'test@gmail.com', '01077776666', 12345, '서울시 마포구', '남');


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

--테스트용 상품 생성
insert into tbl_product (product_num, category_num, product_title, main_image, product_price, product_detail, product_inventory, sale_count)
values (seq_product_product_num.nextval, 99, '삼양사 애플파이', 'apple_pie', 5000, 'apple_pie_detail', 1000, 0);

--카테고리명 생성
insert into tbl_category (category_num, category_name) values (seq_category_category_num.nextval, '냉동생지');


create table tbl_product -- 상품 테이블
(product_num        NUMBER(20)      not null
,category_num       NUMBER(20)      not null
,product_title      VARCHAR2(150)   not null
,main_image         VARCHAR2(600)   not null
,product_price      NUMBER(10)      not null
,product_detail     VARCHAR2(1000)  not null
,product_inventory  VARCHAR2(1000)  not null
,product_date       date default sysdate
,sale_count         NUMBER(10)      null
,constraint PK_tbl_product_product_num primary key(product_num)
,constraint FK_tbl_product_category_num foreign key(category_num) references tbl_category(category_num)
);

delete from tbl_product where product_num = 3;
alter table tbl_product modify main_image number(20);

select * from tbl_category;

-- 마일리지 업데이트
update tbl_member set mileage = 10000 where user_id = 'test';
commit;

alter table tbl_order_detail add postcode VARCHAR2(5) not null;

alter table tbl_order_detail drop column shipping_address;
commit;

select * from tbl_order_detail;

insert into tbl_order_detail(order_details_num, order_num, product_num, order_name, order_quantity, product_selling_price, recipient_name, recipient_mobile, recipient_telephone, forwarded_message, orderer_mobile, delivery_status, payment_time, use_mileage, postcode, address, detailAddress, extraAddress)  
values
(seq_order_detail, 'test', 9, '이름', 1,  5000, '이름2', '01012341234', '', '', '01012341234', 0, sysdate, '11111', '테스트주소', '','','' );

-- 테이블 데이터 타입 조회
select COLUMN_NAME, DATA_TYPE
from ALL_TAB_COLUMNS
where TABLE_NAME = 'TBL_ORDER_DETAIL' ;

select * from tbl_order_detail;
select * from tbl_category;