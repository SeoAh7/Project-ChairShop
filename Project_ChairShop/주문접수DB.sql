/*

--�Ϸù�ȣ
create sequence seq_chairshop_order_idx;

create table cs_product_order
(
	o_idx  	 int,						--�ֹ������Ϸù�ȣ
	m_idx  	 int,						--ȸ���Ϸù�ȣ
	m_id	 varchar2(200),				--ȸ�����̵�
	p_idx  	 int,						--��ǰ�Ϸù�ȣ
	p_name	 varchar2(200),				--��ǰ��
	p_price  int,						--��ǰ����
	c_idx  	 int,						--��ٱ����Ϸù�ȣ
	c_cnt  	 int,						--��ٱ��� �� ����
	o_date	 date,						--��������
	order_yn char(1)	default 'n'		--�����ϷῩ��
)

--�⺻Ű
alter table cs_product_order
	add constraint pk_cs_product_order_idx primary key(o_idx);

--�ֹ�����/ȸ�� ���� m_idx �ܷ�Ű
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