/*

--�Ϸù�ȣ
create sequence seq_chairshop_p_idx
increment by 1
start with 1;

--���̺� ����
create table cs_product
(
	p_idx		int,							--��ǰ �Ϸù�ȣ
	category	varchar2(100)	not null,		--ī�װ�(�繫/���̹�/�л�/����)
	p_name		varchar2(200)	not null,		--��ǰ��
	p_price		int				not null,		--����
	p_img		varchar2(255)	null,			--�̹���
	p_content	clob			not null		--��ǰ����
)

--�⺻Ű
alter table cs_product
	add constraint pk_cs_product_idx primary key(p_idx);
	

--����
insert into cs_product values(seq_chairshop_p_idx.nextVal,
							  '�繫��',
							  'T50',
							  '150000',
							  '',
							  '���մϴ�'
							  )

							  
commit
							  							  							  							  							  							  
select * from cs_product


*/