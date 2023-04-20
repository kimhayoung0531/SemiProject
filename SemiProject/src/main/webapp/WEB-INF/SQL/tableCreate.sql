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
	prodect_count NUMber(15) NOT NULL, -- ?��?��개수
	cart_date     DATE        NOT NULL  -- ?��?��?��?��
     ,CONSTRAINT PK_tbl_cart_cart_num primary key(cart_num)
    ,CONSTRAINT FK_tbl_cart_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
    ,CONSTRAINT FK_tbl_cart_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);


-- �α���
CREATE TABLE tbl_login (
	user_id   VARCHAR2(40) NOT NULL,  -- ���̵�
	login_pwd  VARCHAR2(20) NOT NULL, -- ��й�ȣ
	login_name VARCHAR2(20) NOT NULL  -- �̸�
    ,constraint FK_tbl_login_user_id foreign key(user_id) 
                                references tbl_member(user_id) 
);

--�α��� ���
create table tbl_login_history(
	user_id   VARCHAR2(40) NOT NULL  -- ���̵�
	,login_date DATE       NOT NULL     -- �α��γ�
	,clientIp   varchar2(30) NOT NULL      -- �������ּ�
    ,constraint FK_tbl_login_history_user_id foreign key(user_id) 
                                references tbl_member(user_id) 
);


-- ��ǰ����
create table tbl_inquiry(
	inquiry_num          NUMBER(30)  NOT NULL -- �۹�ȣ
	,user_id             varchar2(40)   NOT NULL -- ���̵�
	,product_num         NUMBER(20)    NOT NULL -- ��ǰ��ȣ
	,inquiry_title       varchar2(20)  NOT NULL -- ����
	,inquiry_text        varchar2(30) NOT NULL -- ����
	,inquiry_date        DATE          NOT NULL -- �ۼ���¥
	,inquiry_state       varchar2(10)   NOT NULL -- ���ǻ���
	,inquiry_answer_time DATE          NOT NULL -- �亯�ð�
	,inquiry_view_count  NUMBER(30) NOT NULL  -- ��ȸ��
    ,constraint PK_tbl_member_inquiry_num primary key(inquiry_num)
    ,constraint FK_tbl_inquiry_user_id foreign key(user_id) 
                                references tbl_member(user_id)
);

create table tbl_product
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

create table tbl_category
(category_num       NUMBER(20)      not null
,category_name      VARCHAR2(20)    not null
,constraint PK_tbl_category_category_num primary key(category_num)
);

create table tbl_addimage
(image_num        NUMBER(20)      not null
,product_num      NUMBER(20)      not null
,image_name       VARCHAR2(20)    not null
,constraint PK_tbl_addimage_image_num primary key(image_num)
,constraint FK_tbl_addimage_product_num foreign key(product_num) references tbl_product(product_num)
);
