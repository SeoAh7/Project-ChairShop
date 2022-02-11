/*

--�԰�
--�Ϸù�ȣ
create sequence seq_chairshop_in_idx;

create table cs_product_in
(
	pm_idx  int,					--�԰��Ϸù�ȣ
	p_idx   int,					--��ǰ�Ϸù�ȣ
	p_name  varchar2(200) not null,	--��ǰ��
	p_cnt   int,					--�԰����
	regdate date					--�԰�����
)

--�⺻Ű
alter table cs_product_in
	add constraint pk_cs_product_in_idx primary key(pm_idx);

--�԰�&��ǰ ���� p_idx �ܷ�Ű
alter table cs_product_in
	add constraint fk_cs_product_in_p_idx foreign key(p_idx)
										  references cs_product(p_idx);


--���
--�Ϸù�ȣ
create sequence seq_chairshop_out_idx;

create table cs_product_out
(
	pm_idx  int,					--����Ϸù�ȣ
	p_idx   int,					--��ǰ�Ϸù�ȣ
	p_name  varchar2(200) not null,	--��ǰ��
	p_cnt   int,					--������
	regdate date					--�������
)

--�⺻Ű
alter table cs_product_out
	add constraint pk_cs_product_out_idx primary key(pm_idx);

--���&��ǰ ���� p_idx �ܷ�Ű
alter table cs_product_out
	add constraint fk_cs_product_out_p_idx foreign key(p_idx)
										  references cs_product(p_idx);


--���
--�Ϸù�ȣ
create sequence seq_chairshop_remain_idx;

create table cs_product_remain
(
	pm_idx  int,					--�����Ϸù�ȣ
	p_idx   int,					--��ǰ�Ϸù�ȣ
	p_name  varchar2(200) not null,	--��ǰ��
	p_cnt   int,					--������
	regdate date					--�������
)

--�⺻Ű
alter table cs_product_remain
	add constraint pk_cs_product_remain_idx primary key(pm_idx);

--unique
alter table cs_product_remain
	add constraint unique_cs_product_remain_name unique(p_name);

--���&��ǰ ���� p_idx �ܷ�Ű
alter table cs_product_remain
	add constraint fk_cs_product_remain_p_idx foreign key(p_idx)
										  	  references cs_product(p_idx);


select * from cs_product_in
select * from cs_product_out
select * from cs_product_remain



*/