/*

--일련번호
create sequence seq_chairshop_p_idx
increment by 1
start with 1;

--테이블 생성
create table cs_product
(
	p_idx		int,							--상품 일련번호
	category	varchar2(100)	not null,		--카테고리(사무/게이밍/학생/유아)
	p_name		varchar2(200)	not null,		--상품명
	p_price		int				not null,		--가격
	p_img		varchar2(255)	null,			--이미지
	p_content	clob			not null		--상품설명
)

--기본키
alter table cs_product
	add constraint pk_cs_product_idx primary key(p_idx);
	

--샘플
insert into cs_product values(seq_chairshop_p_idx.nextVal,
							  '사무용',
							  'T50',
							  '150000',
							  '',
							  '편합니다'
							  )

							  
commit
							  							  							  							  							  							  
select * from cs_product


*/