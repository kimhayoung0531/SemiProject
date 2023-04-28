---------- 주문 ?��?�� ?��?���?
CREATE TABLE tbl_order_detail (
	order_details_num     number(20)    NOT NULL, -- 주문?��?��번호
	order_num             VARCHAR2(20)  NOT NULL, -- 주문번호
	product_num           number(20)    NOT NULL, -- ?��?��번호
	order_name            VARCHAR2(50)  NOT NULL, -- 주문?��?���?
	order_quantity        number(5)     NOT NULL, -- 주문?��?��
	product_selling_price number(10)    NOT NULL, -- ?��?��?��매�?�?
	product_main_image    VARCHAR2(50)  NULL,     -- ?��?��???��?��미�?
	recipient_name        VARCHAR2(50)  NOT NULL, -- ?��?��?��?���?
	recipient_mobile      VARCHAR2(20)  NOT NULL, -- ?��?��?��?��???��번호
	recipient_telephone   VARCHAR2(20)  NULL,     -- ?��?��?��?��?��?��?��번호
	shipping_address      VARCHAR2(500) NOT NULL, -- 배송주소
	forwarded_message     VARCHAR2(300) NULL,     -- �??�� ?�� ?��?�� 메시�?
	orderer_mobile        VARCHAR2(20)  NOT NULL, -- 주문?�� ?��???��번호
	delivery_status       VARCHAR2(20)  NOT NULL, -- ?��?��배송?��?��
	payment_time          DATE          NOT NULL, -- 결제?���?
	use_mileage           number(10)    NOT NULL  -- 마일리�??��?��?��?��
    ,CONSTRAINT PK_tbl_order_detail_order_details_num primary key(order_details_num)
    ,CONSTRAINT FK_tbl_order_detail_order_num foreign key(order_num) REFERENCES tbl_order(order_num)
    ,CONSTRAINT FK_tbl_order_detail_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

--------------- 주문 ?��?���?
CREATE TABLE tbl_order (
	order_num           VARCHAR2(20) NOT NULL, -- 주문번호
	user_id             VARCHAR(40)  NULL,     -- ?��?��?��
	order_price_total   number(20)   NOT NULL, -- 주문총액
	order_mileage_total number(20)   NOT NULL, -- 주문총마?��리�?
	order_date          DATE         NOT NULL  -- 주문?��?��
    ,CONSTRAINT PK_tbl_order_order_num primary key(order_num)
    ,CONSTRAINT FK_tbl_order_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
);

----------- ?��바구?�� ?��?���?
CREATE TABLE tbl_cart (
	cart_num      number(20)  NOT NULL, -- ?��바구?��번호
	user_id       VARCHAR(40) NOT NULL, -- ?��?��?��
	product_num   number(20)  NOT NULL, -- ?��?��번호
	product_count NUMber(15) NOT NULL, -- ?��?��개수
	cart_date     DATE        NOT NULL  -- ?��?��?��?��
     ,CONSTRAINT PK_tbl_cart_cart_num primary key(cart_num)
    ,CONSTRAINT FK_tbl_cart_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
    ,CONSTRAINT FK_tbl_cart_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

-- 로그?��
CREATE TABLE tbl_login (
   user_id   VARCHAR2(40) NOT NULL,  -- ?��?��?��
   login_pwd  VARCHAR2(20) NOT NULL, -- 비�?번호
   login_name VARCHAR2(20) NOT NULL  -- ?���?
    ,constraint FK_tbl_login_user_id foreign key(user_id) 
                                references tbl_member(user_id) 
);

--로그?�� 기록
create table tbl_login_history(
   user_id   VARCHAR2(40) NOT NULL  -- ?��?��?��
   ,login_date DATE       NOT NULL     -- 로그?��?��
   ,clientIp   varchar2(30) NOT NULL      -- ?��?��?��주소
    ,constraint FK_tbl_login_history_user_id foreign key(user_id) 
    references tbl_member(user_id) 
);


-- ?��?��문의
create table tbl_inquiry(
   inquiry_num          NUMBER(30)  NOT NULL -- �?번호
   ,user_id             varchar2(40)   NOT NULL -- ?��?��?��
   ,product_num         NUMBER(20)    NOT NULL -- ?��?��번호
   ,inquiry_title       varchar2(20)  NOT NULL -- ?���?
   ,inquiry_text        varchar2(30) NOT NULL -- 본문
   ,inquiry_date        DATE          NOT NULL -- ?��?��?���?
   ,inquiry_state       varchar2(10)   NOT NULL -- 문의?��?��
   ,inquiry_answer_time DATE          NOT NULL -- ?���??���?
   ,inquiry_view_count  NUMBER(30) NOT NULL  -- 조회?��
    ,constraint PK_tbl_member_inquiry_num primary key(inquiry_num)
    ,constraint FK_tbl_inquiry_user_id foreign key(user_id) 
                                references tbl_member(user_id)
);

create table tbl_product -- ?��?�� ?��?���?
(product_num        NUMBER(20)      not null
,category_num       NUMBER(20)      not null
,product_title      VARCHAR2(150)   not null
,main_image         number(20)      not null
,product_price      NUMBER(10)      not null
,product_detail     VARCHAR2(1000)  not null
,product_inventory  number(20)  not null
,product_date       date default sysdate
,sale_count         NUMBER(10)      null
,constraint PK_tbl_product_product_num primary key(product_num)
,constraint FK_tbl_product_category_num foreign key(category_num) references tbl_category(category_num)
);

create table tbl_category -- 카테고리 ?��?���?
(category_num       NUMBER(20)      not null
,category_name      VARCHAR2(20)    not null
,constraint PK_tbl_category_category_num primary key(category_num)
);

create table tbl_addimage -- ?��?��추�??��미�? ?��?���?
(image_num        NUMBER(20)      not null
,product_num      NUMBER(20)      not null
,image_name       VARCHAR2(20)    not null
,constraint PK_tbl_addimage_image_num primary key(image_num)
,constraint FK_tbl_addimage_product_num foreign key(product_num) references tbl_product(product_num)
);

-- �?리자
create table tbl_admin
( admin_id   varchar2(40) not null -- �?리자 ?��?��?��
 ,admin_pwd  varchar2(20) not null -- �?리자 비�?번호
 ,constraint pk_tbl_admin_admin_id primary key(admin_id)
);

-- 
create table tbl_notice
( notice_num        number(10)              not null -- 번호
 ,admin_id          varchar2(40)              not null -- �?리자 ?��?��?�� 
 ,notice_title      nvarchar2(100)            not null -- ?���?
 ,notice_content    nvarchar2(500)            not null -- 본문
 ,notice_date       date  default  sysdate    not null -- ?��?��?���?
 ,notice_writer     varchar2(10)              not null -- ?��?��?��
 ,notice_viewcount  number(10)             not null -- 조회?��
 ,notice_head       varchar2(10)              null     -- 말머�?
 ,constraint pk_tbl_notice_notice_num primary key(notice_num)
 ,constraint fk_tbl_notice_admin_id foreign key(admin_id) REFERENCES tbl_admin(admin_id)
); 

-- 구매?���?
create table tbl_purchase_review
( purchase_review_id   number(10)             not null -- 구매?��기�?번호
 ,userid               varchar2(40)             not null -- ?��?��?��
 ,order_details_num    number(20)               not null -- 주문?��?��번호
 ,product_num          number(20)               not null -- ?��?��번호
 ,review_content       nvarchar2(500)           not null -- 구매?��기내?��
 ,review_rating        number(5)                not null -- 구매?��?��
 ,review_date          date  default  sysdate   not null -- 구매?��기작?��?���?
 ,constraint pk_tbl_purchase_review_purchase_review_id primary key(purchase_review_id)
 ,constraint fk_tbl_tbl_purchase_review_userid foreign key(userid) REFERENCES tbl_member(user_id)
 ,constraint fk_tbl_tbl_purchase_review_order_details_num foreign key(order_details_num) REFERENCES tbl_order_detail(order_details_num)
 ,constraint fk_tbl_tbl_purchase_review_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

-- ?��?��?���?
CREATE TABLE tbl_member 
(
   user_id             VARCHAR2(40)           NOT NULL, -- ?��?��?��
   user_name           VARCHAR2(20)           NOT NULL, -- ?���?
   pwd                 VARCHAR2(200)          NOT NULL, -- 비�?번호
   email               VARCHAR2(40)           NOT NULL, -- ?��메일
   mobile              VARCHAR2(20)           NOT NULL, -- ?��???��?��
   telephone           VARCHAR2(20)           NULL,     -- ?��?��?��?��
   post_code           VARCHAR2(5)            NOT NULL, -- ?��?��번호
   address             VARCHAR2(200)          NOT NULL, -- 주소
   detailAddress       VARCHAR2(200)          NULL,     -- ?��?��주소
   extraAddress        VARCHAR2(200)          NULL,     -- �?�?주소
   gender              VARCHAR2(1)            NOT NULL, -- ?���?
   birthday            VARCHAR2(10)           NULL,     -- ?��?��?��?��
   mileage             NUMBER DEFAULT 0       NULL,     -- 마일리�?
   registerday         DATE DEFAULT SYSDATE   NOT NULL, -- �??��?��?��
   lastPwdChange       DATE DEFAULT SYSDATE   NULL,     -- 마�?막비�?번호�?경날�?
   idle                NUMBER(1) DEFAULT 0    NOT NULL, -- ?��먼회?��?���?
   pwd_change_required DATE DEFAULT SYSDATE   NULL,     -- 비�?번호갱신?��?��?���?
   status              NUMBER(1) DEFAULT 1    NOT NULL  -- ?��?��?���?
    ,constraint PK_tbl_member_userid primary key(user_id)
    ,constraint UQ_tbl_member_email  unique(email)
    ,constraint CK_tbl_member_gender check( gender in('1','2') )
    ,constraint CK_tbl_member_status check( status in(0,1) )
    ,constraint CK_tbl_member_idle check( idle in(0,1) )
);

-- ?��?��좋아?��?��?���?
CREATE TABLE tbl_product_like (
   user_id     VARCHAR(40) NOT NULL, -- ?��?��?��
   product_num number(20)  NOT NULL  -- ?��?��번호
);
