/*

--�Ϸù�ȣ
create sequence seq_chairshop_m_idx;

--���̺� ����
create table cs_member
(
	m_idx		int,						--ȸ�� �Ϸù�ȣ
	m_name		varchar2(100)	not null,	--�̸�
	m_id		varchar2(200)	not null,	--���̵�
	m_pwd		varchar2(200)	not null,	--��й�ȣ
	m_zipcode 	int,						--�����ȣ
	m_addr		varchar2(200),				--�ּ�
	m_tel		varchar2(200),				--��ȭ��ȣ
	m_grade		varchar2(100),				--���
	m_point		int,						--����Ʈ
	m_mail		varchar2(200),				--����
	m_ip		varchar2(200)				--������
)

--�⺻Ű
alter table cs_member
	add constraint pk_cs_member_idx primary key(m_idx);
	
--unique
alter table cs_member
	add constraint unique_cs_member_id unique(m_id);


--����
insert into cs_member values( seq_chairshop_m_idx.nextVal,
							  '������',
							  'admin',
							  '1234',
							  '0',
							  '',
							  '',
							  '������',
							  '',
							  '',
							  '192.168.7.14'
							);

commit

select * from cs_member

update cs_member set m_pwd = '1234'
	where m_idx = 2


*/