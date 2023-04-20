
---------- 주문 상세 테이블
CREATE TABLE tbl_order_detail (
	order_details_num     number(20)    NOT NULL, -- 주문상세번호
	order_num             VARCHAR2(20)  NOT NULL, -- 주문번호
	product_num           number(20)    NOT NULL, -- 상품번호
	order_name            VARCHAR2(50)  NOT NULL, -- 주문자이름
	order_quantity        number(5)     NOT NULL, -- 주문수량
	product_selling_price number(10)    NOT NULL, -- 상품판매가격
	product_main_image    VARCHAR2(50)  NULL,     -- 상품대표이미지
	recipient_name        VARCHAR2(50)  NOT NULL, -- 수령자이름
	recipient_mobile      VARCHAR2(20)  NOT NULL, -- 수령자휴대폰번호
	recipient_telephone   VARCHAR2(20)  NULL,     -- 수령자유선전화번호
	shipping_address      VARCHAR2(500) NOT NULL, -- 배송주소
	forwarded_message     VARCHAR2(300) NULL,     -- 부재 시 전달 메시지
	orderer_mobile        VARCHAR2(20)  NOT NULL, -- 주문자 휴대폰번호
	delivery_status       VARCHAR2(20)  NOT NULL, -- 상품배송상태
	payment_time          DATE          NOT NULL, -- 결제시간
	use_mileage           number(10)    NOT NULL  -- 마일리지사용내역
    ,CONSTRAINT PK_tbl_order_detail_order_details_num primary key(order_details_num)
    ,CONSTRAINT FK_tbl_order_detail_order_num foreign key(order_num) REFERENCES tbl_order(order_num)
    ,CONSTRAINT FK_tbl_order_detail_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

--------------- 주문 테이블
CREATE TABLE tbl_order (
	order_num           VARCHAR2(20) NOT NULL, -- 주문번호
	user_id             VARCHAR(40)  NULL,     -- 아이디
	order_price_total   number(20)   NOT NULL, -- 주문총액
	order_mileage_total number(20)   NOT NULL, -- 주문총마일리지
	order_date          DATE         NOT NULL  -- 주문일자
    ,CONSTRAINT PK_tbl_order_order_num primary key(order_num)
    ,CONSTRAINT FK_tbl_order_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
);

----------- 장바구니 테이블
CREATE TABLE tbl_cart (
	cart_num      number(20)  NOT NULL, -- 장바구니번호
	user_id       VARCHAR(40) NOT NULL, -- 아이디
	product_num   number(20)  NOT NULL, -- 상품번호
	prodect_count NUMber(15) NOT NULL, -- 상품개수
	cart_date     DATE        NOT NULL  -- 생성일자
     ,CONSTRAINT PK_tbl_cart_cart_num primary key(cart_num)
    ,CONSTRAINT FK_tbl_cart_user_id foreign key(user_id) REFERENCES tbl_member(user_id)
    ,CONSTRAINT FK_tbl_cart_product_num foreign key(product_num) REFERENCES tbl_product(product_num)
);

