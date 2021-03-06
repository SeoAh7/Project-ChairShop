/*
select * from cs_cart_view where m_idx = #{ m_idx }
--일련번호
create sequence seq_chairshop_c_idx

--테이블 생성
create table cs_cart
(
	c_idx	int,						--장바구니 일련번호
	c_cnt	int  			not null,	--수량
	p_name	varchar2(200)	not null,	--상품명
	p_idx	int,						--상품 일련번호
	m_idx	int,						--회원 일련번호
	p_price int				not null	--가격
)

--기본키
alter table cs_cart
	add constraint pk_cs_cart_idx primary key(c_idx);

--상품&장바구니 간의 p_idx 외래키
alter table cs_cart
	add constraint fk_cs_cart_p_idx foreign key(p_idx)
									references cs_product(p_idx) ;

--회원&장바구니 간의 m_idx 외래키
alter table cs_cart
	add constraint fk_cs_cart_m_idx foreign key(m_idx)
									references cs_member(m_idx)
									on delete cascade ;

create or replace view cs_cart_view
as
	select
	   p.p_idx as p_idx,
	   c_idx, 
	   p.p_img,
	   p.p_name as p_name,
	   p.p_price as p_price,
	   c_cnt,
	   c_cnt* p.p_price as amount,
	   m_idx
	from cs_product p inner join  cs_cart c on p.p_idx = c.p_idx  


select * from cs_cart_view

	
--샘플		
select * from cs_member

insert into cart values(seq_chairshop_c_idx.nextVal, 1, 1 , 1);

select * from cs_cart where m_idx=1
												
insert into cs_cart values(seq_chairshop_c_idx.nextVal,
						   1,
						   'UI-1193',
						   7,
						   1,
						   120000
						  );
insert into cs_cart values(seq_chairshop_c_idx.nextVal,
						   1,
						   'BD120',
						   2,
						   1,
						   100000
						  );
						  
select * from cs_cart where m_idx=2

commit
*/