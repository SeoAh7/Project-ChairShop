/*
 
create sequence seq_chairshop_f_idx;
drop table cs_faq
--���̺� ����
create table cs_faq
(
	f_idx			int,						--�Ϸù�ȣ
	f_subject 		varchar2(500)	not null,	--����
	f_content		clob			not null,	--����
	f_regdate		date,						--�������
	m_id 			varchar2(200),				--���̵�
	f_readhit		int				default 0	--��ȸ��
)

--�⺻Ű 
alter table cs_faq
	add constraint fk_cs_faq_idx primary key(f_idx);
	
--���۾��� ����
insert into cs_faq values(seq_chairshop_f_idx.nextVal,
							'FAQ����',
							'FAQ����',
							sysdate,
							'admin',
							default
							);
							
							commit
 
 select * from cs_faq
 
 update cs_faq set f_readhit=10 
 
 delete from cs_faq where f_idx = 3
 
 select nvl(count(*),0) from cs_faq
 */