-- 상품 id 시퀀스
create sequence seq_product_product_num  
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 상품 메인이미지 id 시퀀스
create sequence product_main_image
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 카테고리 id 시퀀스
create sequence seq_category_category_num
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 장바구니 id 시퀀스
create sequence seq_cart_cart_num
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- "주문상세 일련번호 시퀀스" 생성
create sequence seq_order_detail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;