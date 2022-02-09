/*
 
create sequence seq_chairshop_f_idx;

--테이블 생성
create table cs_faq
(
	f_idx			int,						--일련번호
	f_subject 		varchar2(500)	not null,	--제목
	f_content		clob			not null,	--내용
	f_regdate		date,						--등록일자
	m_id 			varchar2(200),				--아이디
	f_readhit		int							--조회수
)

--기본키 
alter table cs_faq
	add constraint fk_cs_faq_idx primary key(f_idx);
	
--새글쓰기 샘플
insert into cs_faq values(seq_chairshop_f_idx.nextVal,
							'FAQ제목',
							'FAQ내용',
							sysdate,
							'admin',
							0
							);
							
							commit
 
 select * from cs_faq
 
 update cs_faq set f_readhit=10 
 
 delete from cs_faq where f_idx = 3
 
 select nvl(count(*),0) from cs_faq
 */