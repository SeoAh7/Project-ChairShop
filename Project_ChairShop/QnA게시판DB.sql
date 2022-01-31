/*

--�Ϸù�ȣ
create sequence seq_chairshop_q_idx;

--���̺� ����
create table cs_qna
(
	q_idx		int,							--�Ϸù�ȣ
	q_subject	varchar2(500)	not null,		--����
	q_content	clob			not null,		--����
	q_regdate	date,							--�������
	q_use_yn	char(1)			default 'y',	--�������(y or n)
	q_ip		varchar2(200)	not null,		--������
	m_idx		int,							--ȸ�� �Ϸù�ȣ
	m_id		varchar2(200),					--���̵�
	q_ref		int,							--������ ��ȣ
	q_step		int,							--�� ����
	q_depth		int								--�� ����
)

--�⺻Ű
alter table cs_qna
	add constraint pk_cs_qna_idx primary key(q_idx);
	
--ȸ��&QnA ���� m_idx �ܷ�Ű
alter table cs_qna
	add constraint fk_cs_qna_m_idx foreign key(m_idx)
								   references cs_member(m_idx) ;


--���۾��� ����
insert into cs_qna values(seq_chairshop_q_idx.nextVal,
						  '���̹���',
						  '���̹����Դϴ�',
						  sysdate-1,
						  default,
						  '192.168.7.12',
						  2,
						  'one1',
						  seq_chairshop_q_idx.currVal,
						  0,
						  0
						);

--��۾��� ����
insert into cs_qna values(seq_chairshop_q_idx.nextVal,
						  '���̹���[�亯�Ϸ�]',
						  '���̴亯�Դϴ�',
						  sysdate,
						  default,
						  '192.168.7.12',
						  1,
						  'admin',
						  1,
						  1,
						  1
						);



commit


update cs_qna set q_use_yn = 'y'

select * from cs_member


select * from cs_qna
	order by q_ref desc, q_step asc



*/