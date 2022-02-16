/*
select * from cs_cart_view where m_idx = #{ m_idx }
--�Ϸù�ȣ
create sequence seq_chairshop_c_idx

--���̺� ����
create table cs_cart
(
	c_idx	int,						--��ٱ��� �Ϸù�ȣ
	c_cnt	int  			not null,	--����
	p_name	varchar2(200)	not null,	--��ǰ��
	p_idx	int,						--��ǰ �Ϸù�ȣ
	m_idx	int,						--ȸ�� �Ϸù�ȣ
	p_price int				not null	--����
)

--�⺻Ű
alter table cs_cart
	add constraint pk_cs_cart_idx primary key(c_idx);

--��ǰ&��ٱ��� ���� p_idx �ܷ�Ű
alter table cs_cart
	add constraint fk_cs_cart_p_idx foreign key(p_idx)
									references cs_product(p_idx) ;

--ȸ��&��ٱ��� ���� m_idx �ܷ�Ű
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

	
--����		
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