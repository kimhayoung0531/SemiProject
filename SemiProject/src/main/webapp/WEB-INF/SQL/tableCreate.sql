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
	prodect_count NUMber(15) NOT NULL, -- ?ƒ?’ˆê°œìˆ˜
	cart_date     DATE        NOT NULL  -- ?ƒ?„±?¼?
     ,CONSTRAINT PK_tbl_cart_cart_num primary key(cart_num)
    ,CONSTRAINT FK_tbl_cart_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
    ,CONSTRAINT FK_tbl_cart_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);


-- ·Î±×ÀÎ
CREATE TABLE tbl_login (
	user_id   VARCHAR2(40) NOT NULL,  -- ¾ÆÀÌµğ
	login_pwd  VARCHAR2(20) NOT NULL, -- ºñ¹Ğ¹øÈ£
	login_name VARCHAR2(20) NOT NULL  -- ÀÌ¸§
    ,constraint FK_tbl_login_user_id foreign key(user_id) 
                                references tbl_member(user_id) 
);

--·Î±×ÀÎ ±â·Ï
create table tbl_login_history(
	user_id   VARCHAR2(40) NOT NULL  -- ¾ÆÀÌµğ
	,login_date DATE       NOT NULL     -- ·Î±×ÀÎ³¯
	,clientIp   varchar2(30) NOT NULL      -- ¾ÆÀÌÇÇÁÖ¼Ò
    ,constraint FK_tbl_login_history_user_id foreign key(user_id) 
                                references tbl_member(user_id) 
);


-- »óÇ°¹®ÀÇ
create table tbl_inquiry(
	inquiry_num          NUMBER(30)  NOT NULL -- ±Û¹øÈ£
	,user_id             varchar2(40)   NOT NULL -- ¾ÆÀÌµğ
	,product_num         NUMBER(20)    NOT NULL -- »óÇ°¹øÈ£
	,inquiry_title       varchar2(20)  NOT NULL -- Á¦¸ñ
	,inquiry_text        varchar2(30) NOT NULL -- º»¹®
	,inquiry_date        DATE          NOT NULL -- ÀÛ¼º³¯Â¥
	,inquiry_state       varchar2(10)   NOT NULL -- ¹®ÀÇ»óÅÂ
	,inquiry_answer_time DATE          NOT NULL -- ´äº¯½Ã°£
	,inquiry_view_count  NUMBER(30) NOT NULL  -- Á¶È¸¼ö
    ,constraint PK_tbl_member_inquiry_num primary key(inquiry_num)
    ,constraint FK_tbl_inquiry_user_id foreign key(user_id) 
                                references tbl_member(user_id)
);
