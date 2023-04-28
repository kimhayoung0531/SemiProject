---------- ì£¼ë¬¸ ?ƒ?„¸ ?…Œ?´ë¸?
CREATE TABLE tbl_order_detail (
	order_details_num     number(20)    NOT NULL, -- ì£¼ë¬¸?ƒ?„¸ë²ˆí˜¸
	order_num             VARCHAR2(20)  NOT NULL, -- ì£¼ë¬¸ë²ˆí˜¸
	product_num           number(20)    NOT NULL, -- ?ƒ?’ˆë²ˆí˜¸
	order_name            VARCHAR2(50)  NOT NULL, -- ì£¼ë¬¸??´ë¦?
	order_quantity        number(5)     NOT NULL, -- ì£¼ë¬¸?ˆ˜?Ÿ‰
	product_selling_price number(10)    NOT NULL, -- ?ƒ?’ˆ?Œë§¤ê?ê²?
	product_main_image    VARCHAR2(50)  NULL,     -- ?ƒ?’ˆ???‘œ?´ë¯¸ì?
	recipient_name        VARCHAR2(50)  NOT NULL, -- ?ˆ˜? ¹??´ë¦?
	recipient_mobile      VARCHAR2(20)  NOT NULL, -- ?ˆ˜? ¹??œ´???°ë²ˆí˜¸
	recipient_telephone   VARCHAR2(20)  NULL,     -- ?ˆ˜? ¹??œ ?„ ? „?™”ë²ˆí˜¸
	shipping_address      VARCHAR2(500) NOT NULL, -- ë°°ì†¡ì£¼ì†Œ
	forwarded_message     VARCHAR2(300) NULL,     -- ë¶??¬ ?‹œ ? „?‹¬ ë©”ì‹œì§?
	orderer_mobile        VARCHAR2(20)  NOT NULL, -- ì£¼ë¬¸? ?œ´???°ë²ˆí˜¸
	delivery_status       VARCHAR2(20)  NOT NULL, -- ?ƒ?’ˆë°°ì†¡?ƒ?ƒœ
	payment_time          DATE          NOT NULL, -- ê²°ì œ?‹œê°?
	use_mileage           number(10)    NOT NULL  -- ë§ˆì¼ë¦¬ì??‚¬?š©?‚´?—­
    ,CONSTRAINT PK_tbl_order_detail_order_details_num primary key(order_details_num)
    ,CONSTRAINT FK_tbl_order_detail_order_num foreign key(order_num) REFERENCES tbl_order(order_num)
    ,CONSTRAINT FK_tbl_order_detail_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

--------------- ì£¼ë¬¸ ?…Œ?´ë¸?
CREATE TABLE tbl_order (
	order_num           VARCHAR2(20) NOT NULL, -- ì£¼ë¬¸ë²ˆí˜¸
	user_id             VARCHAR(40)  NULL,     -- ?•„?´?””
	order_price_total   number(20)   NOT NULL, -- ì£¼ë¬¸ì´ì•¡
	order_mileage_total number(20)   NOT NULL, -- ì£¼ë¬¸ì´ë§ˆ?¼ë¦¬ì?
	order_date          DATE         NOT NULL  -- ì£¼ë¬¸?¼?
    ,CONSTRAINT PK_tbl_order_order_num primary key(order_num)
    ,CONSTRAINT FK_tbl_order_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
);

----------- ?¥ë°”êµ¬?‹ˆ ?…Œ?´ë¸?
CREATE TABLE tbl_cart (
	cart_num      number(20)  NOT NULL, -- ?¥ë°”êµ¬?‹ˆë²ˆí˜¸
	user_id       VARCHAR(40) NOT NULL, -- ?•„?´?””
	product_num   number(20)  NOT NULL, -- ?ƒ?’ˆë²ˆí˜¸
	product_count NUMber(15) NOT NULL, -- ?ƒ?’ˆê°œìˆ˜
	cart_date     DATE        NOT NULL  -- ?ƒ?„±?¼?
     ,CONSTRAINT PK_tbl_cart_cart_num primary key(cart_num)
    ,CONSTRAINT FK_tbl_cart_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
    ,CONSTRAINT FK_tbl_cart_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

-- ë¡œê·¸?¸
CREATE TABLE tbl_login (
   user_id   VARCHAR2(40) NOT NULL,  -- ?•„?´?””
   login_pwd  VARCHAR2(20) NOT NULL, -- ë¹„ë?ë²ˆí˜¸
   login_name VARCHAR2(20) NOT NULL  -- ?´ë¦?
    ,constraint FK_tbl_login_user_id foreign key(user_id) 
                                references tbl_member(user_id) 
);

--ë¡œê·¸?¸ ê¸°ë¡
create table tbl_login_history(
   user_id   VARCHAR2(40) NOT NULL  -- ?•„?´?””
   ,login_date DATE       NOT NULL     -- ë¡œê·¸?¸?‚ 
   ,clientIp   varchar2(30) NOT NULL      -- ?•„?´?”¼ì£¼ì†Œ
    ,constraint FK_tbl_login_history_user_id foreign key(user_id) 
    references tbl_member(user_id) 
);


-- ?ƒ?’ˆë¬¸ì˜
create table tbl_inquiry(
   inquiry_num          NUMBER(30)  NOT NULL -- ê¸?ë²ˆí˜¸
   ,user_id             varchar2(40)   NOT NULL -- ?•„?´?””
   ,product_num         NUMBER(20)    NOT NULL -- ?ƒ?’ˆë²ˆí˜¸
   ,inquiry_title       varchar2(20)  NOT NULL -- ? œëª?
   ,inquiry_text        varchar2(30) NOT NULL -- ë³¸ë¬¸
   ,inquiry_date        DATE          NOT NULL -- ?‘?„±?‚ ì§?
   ,inquiry_state       varchar2(10)   NOT NULL -- ë¬¸ì˜?ƒ?ƒœ
   ,inquiry_answer_time DATE          NOT NULL -- ?‹µë³??‹œê°?
   ,inquiry_view_count  NUMBER(30) NOT NULL  -- ì¡°íšŒ?ˆ˜
    ,constraint PK_tbl_member_inquiry_num primary key(inquiry_num)
    ,constraint FK_tbl_inquiry_user_id foreign key(user_id) 
                                references tbl_member(user_id)
);

create table tbl_product -- ?ƒ?’ˆ ?…Œ?´ë¸?
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

create table tbl_category -- ì¹´í…Œê³ ë¦¬ ?…Œ?´ë¸?
(category_num       NUMBER(20)      not null
,category_name      VARCHAR2(20)    not null
,constraint PK_tbl_category_category_num primary key(category_num)
);

create table tbl_addimage -- ?ƒ?’ˆì¶”ê??´ë¯¸ì? ?…Œ?´ë¸?
(image_num        NUMBER(20)      not null
,product_num      NUMBER(20)      not null
,image_name       VARCHAR2(20)    not null
,constraint PK_tbl_addimage_image_num primary key(image_num)
,constraint FK_tbl_addimage_product_num foreign key(product_num) references tbl_product(product_num)
);

-- ê´?ë¦¬ì
create table tbl_admin
( admin_id   varchar2(40) not null -- ê´?ë¦¬ì ?•„?´?””
 ,admin_pwd  varchar2(20) not null -- ê´?ë¦¬ì ë¹„ë?ë²ˆí˜¸
 ,constraint pk_tbl_admin_admin_id primary key(admin_id)
);

-- 
create table tbl_notice
( notice_num        number(10)              not null -- ë²ˆí˜¸
 ,admin_id          varchar2(40)              not null -- ê´?ë¦¬ì ?•„?´?”” 
 ,notice_title      nvarchar2(100)            not null -- ? œëª?
 ,notice_content    nvarchar2(500)            not null -- ë³¸ë¬¸
 ,notice_date       date  default  sysdate    not null -- ?‘?„±?‚ ì§?
 ,notice_writer     varchar2(10)              not null -- ?‘?„±?
 ,notice_viewcount  number(10)             not null -- ì¡°íšŒ?ˆ˜
 ,notice_head       varchar2(10)              null     -- ë§ë¨¸ë¦?
 ,constraint pk_tbl_notice_notice_num primary key(notice_num)
 ,constraint fk_tbl_notice_admin_id foreign key(admin_id) REFERENCES tbl_admin(admin_id)
); 

-- êµ¬ë§¤?›„ê¸?
create table tbl_purchase_review
( purchase_review_id   number(10)             not null -- êµ¬ë§¤?›„ê¸°ê?ë²ˆí˜¸
 ,userid               varchar2(40)             not null -- ?•„?´?””
 ,order_details_num    number(20)               not null -- ì£¼ë¬¸?ƒ?„¸ë²ˆí˜¸
 ,product_num          number(20)               not null -- ?ƒ?’ˆë²ˆí˜¸
 ,review_content       nvarchar2(500)           not null -- êµ¬ë§¤?›„ê¸°ë‚´?š©
 ,review_rating        number(5)                not null -- êµ¬ë§¤?‰? 
 ,review_date          date  default  sysdate   not null -- êµ¬ë§¤?›„ê¸°ì‘?„±?‚ ì§?
 ,constraint pk_tbl_purchase_review_purchase_review_id primary key(purchase_review_id)
 ,constraint fk_tbl_tbl_purchase_review_userid foreign key(userid) REFERENCES tbl_member(user_id)
 ,constraint fk_tbl_tbl_purchase_review_order_details_num foreign key(order_details_num) REFERENCES tbl_order_detail(order_details_num)
 ,constraint fk_tbl_tbl_purchase_review_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

-- ?šŒ?›? •ë³?
CREATE TABLE tbl_member 
(
   user_id             VARCHAR2(40)           NOT NULL, -- ?•„?´?””
   user_name           VARCHAR2(20)           NOT NULL, -- ?´ë¦?
   pwd                 VARCHAR2(200)          NOT NULL, -- ë¹„ë?ë²ˆí˜¸
   email               VARCHAR2(40)           NOT NULL, -- ?´ë©”ì¼
   mobile              VARCHAR2(20)           NOT NULL, -- ?œ´??? „?™”
   telephone           VARCHAR2(20)           NULL,     -- ?œ ?„ ? „?™”
   post_code           VARCHAR2(5)            NOT NULL, -- ?š°?¸ë²ˆí˜¸
   address             VARCHAR2(200)          NOT NULL, -- ì£¼ì†Œ
   detailAddress       VARCHAR2(200)          NULL,     -- ?ƒ?„¸ì£¼ì†Œ
   extraAddress        VARCHAR2(200)          NULL,     -- ë¶?ê°?ì£¼ì†Œ
   gender              VARCHAR2(1)            NOT NULL, -- ?„±ë³?
   birthday            VARCHAR2(10)           NULL,     -- ?ƒ?…„?›”?¼
   mileage             NUMBER DEFAULT 0       NULL,     -- ë§ˆì¼ë¦¬ì?
   registerday         DATE DEFAULT SYSDATE   NOT NULL, -- ê°??…?¼?
   lastPwdChange       DATE DEFAULT SYSDATE   NULL,     -- ë§ˆì?ë§‰ë¹„ë°?ë²ˆí˜¸ë³?ê²½ë‚ ì§?
   idle                NUMBER(1) DEFAULT 0    NOT NULL, -- ?œ´ë¨¼íšŒ?›?—¬ë¶?
   pwd_change_required DATE DEFAULT SYSDATE   NULL,     -- ë¹„ë?ë²ˆí˜¸ê°±ì‹ ?•„?š”?—¬ë¶?
   status              NUMBER(1) DEFAULT 1    NOT NULL  -- ?ƒˆ?‡´?—¬ë¶?
    ,constraint PK_tbl_member_userid primary key(user_id)
    ,constraint UQ_tbl_member_email  unique(email)
    ,constraint CK_tbl_member_gender check( gender in('1','2') )
    ,constraint CK_tbl_member_status check( status in(0,1) )
    ,constraint CK_tbl_member_idle check( idle in(0,1) )
);

-- ? œ?’ˆì¢‹ì•„?š”?…Œ?´ë¸?
CREATE TABLE tbl_product_like (
   user_id     VARCHAR(40) NOT NULL, -- ?•„?´?””
   product_num number(20)  NOT NULL  -- ?ƒ?’ˆë²ˆí˜¸
);
