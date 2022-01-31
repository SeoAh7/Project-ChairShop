/*

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

	
--����								
insert into cs_cart values(seq_chairshop_c_idx.nextVal,
						   1,
						   'T50',
						   1,
						   1,
						   150000
						  );

select * from cs_cart

*/