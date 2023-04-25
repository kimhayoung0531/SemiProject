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