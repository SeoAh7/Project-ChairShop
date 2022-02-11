/*

--입고
--일련번호
create sequence seq_chairshop_in_idx;

create table cs_product_in
(
	pm_idx  int,					--입고일련번호
	p_idx   int,					--상품일련번호
	p_name  varchar2(200) not null,	--상품명
	p_cnt   int,					--입고수량
	regdate date					--입고일자
)

--기본키
alter table cs_product_in
	add constraint pk_cs_product_in_idx primary key(pm_idx);

--입고&상품 간의 p_idx 외래키
alter table cs_product_in
	add constraint fk_cs_product_in_p_idx foreign key(p_idx)
										  references cs_product(p_idx);


--출고
--일련번호
create sequence seq_chairshop_out_idx;

create table cs_product_out
(
	pm_idx  int,					--출고일련번호
	p_idx   int,					--상품일련번호
	p_name  varchar2(200) not null,	--상품명
	p_cnt   int,					--출고수량
	regdate date					--출고일자
)

--기본키
alter table cs_product_out
	add constraint pk_cs_product_out_idx primary key(pm_idx);

--출고&상품 간의 p_idx 외래키
alter table cs_product_out
	add constraint fk_cs_product_out_p_idx foreign key(p_idx)
										  references cs_product(p_idx);


--재고
--일련번호
create sequence seq_chairshop_remain_idx;

create table cs_product_remain
(
	pm_idx  int,					--재고고일련번호
	p_idx   int,					--상품일련번호
	p_name  varchar2(200) not null,	--상품명
	p_cnt   int,					--재고수량
	regdate date					--재고일자
)

--기본키
alter table cs_product_remain
	add constraint pk_cs_product_remain_idx primary key(pm_idx);

--unique
alter table cs_product_remain
	add constraint unique_cs_product_remain_name unique(p_name);

--재고&상품 간의 p_idx 외래키
alter table cs_product_remain
	add constraint fk_cs_product_remain_p_idx foreign key(p_idx)
										  	  references cs_product(p_idx);


select * from cs_product_in
select * from cs_product_out
select * from cs_product_remain



*/