/*

--일련번호
create sequence seq_chairshop_m_idx;

--테이블 생성
create table cs_member
(
	m_idx		int,						--회원 일련번호
	m_name		varchar2(100)	not null,	--이름
	m_id		varchar2(200)	not null,	--아이디
	m_pwd		varchar2(200)	not null,	--비밀번호
	m_zipcode 	int,						--우편번호
	m_addr		varchar2(200),				--주소
	m_tel		varchar2(200),				--전화번호
	m_grade		varchar2(100),				--등급
	m_point		int,						--포인트
	m_mail		varchar2(200),				--메일
	m_ip		varchar2(200)				--아이피
)

--기본키
alter table cs_member
	add constraint pk_cs_member_idx primary key(m_idx);
	
--unique
alter table cs_member
	add constraint unique_cs_member_id unique(m_id);


--샘플
insert into cs_member values( seq_chairshop_m_idx.nextVal,
							  '관리자',
							  'admin',
							  '1234',
							  '0',
							  '',
							  '',
							  '관리자',
							  '',
							  '',
							  '192.168.7.14'
							);

commit

select * from cs_member

update cs_member set m_pwd = '1234'
	where m_idx = 2


*/