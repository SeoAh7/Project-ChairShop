/*

--일련번호
create sequence seq_chairshop_order_idx;

create table cs_product_order
(
	o_idx  	 int,						--주문접수일련번호
	m_idx  	 int,						--회원일련번호
	m_id	 varchar2(200),				--회원아이디
	p_idx  	 int,						--상품일련번호
	p_name	 varchar2(200),				--상품명
	p_price  int,						--상품가격
	c_idx  	 int,						--장바구니일련번호
	c_cnt  	 int,						--장바구니 내 수량
	o_date	 date,						--접수일자
	order_yn char(1)	default 'n'		--접수완료여부
)

--기본키
alter table cs_product_order
	add constraint pk_cs_product_order_idx primary key(o_idx);

--주문접수/회원 간의 m_idx 외래키
alter table cs_product_order
	add constraint fk_cs_product_order_m_idx foreign key(m_idx)
										  references cs_member(m_idx)
										  on delete cascade ;

select * from cs_product_order

update cs_product_order set order_yn='n'

delete from cs_product_order

select cpo.*,
       (select nvl(count(*),0)  from cs_product_remain where p_name = cop.p_name ) r_cnt 
( select * from cs_product_order ) cpo



*/