/*

--일련번호
create sequence seq_chairshop_q_idx;

--테이블 생성
create table cs_qna
(
	q_idx		int,							--일련번호
	q_subject	varchar2(500)	not null,		--제목
	q_content	clob			not null,		--내용
	q_regdate	date,							--등록일자
	q_use_yn	char(1)			default 'y',	--사용유무(y or n)
	q_ip		varchar2(200)	not null,		--아이피
	m_idx		int,							--회원 일련번호
	m_id		varchar2(200),					--아이디
	q_ref		int,							--참조글 번호
	q_step		int,							--글 순서
	q_depth		int								--글 깊이
)

--기본키
alter table cs_qna
	add constraint pk_cs_qna_idx primary key(q_idx);
	
--회원&QnA 간의 m_idx 외래키
alter table cs_qna
	add constraint fk_cs_qna_m_idx foreign key(m_idx)
								   references cs_member(m_idx) ;


--새글쓰기 샘플
insert into cs_qna values(seq_chairshop_q_idx.nextVal,
						  '나미문의',
						  '나미문의입니다',
						  sysdate-1,
						  default,
						  '192.168.7.12',
						  2,
						  'one1',
						  seq_chairshop_q_idx.currVal,
						  0,
						  0
						);

--답글쓰기 샘플
insert into cs_qna values(seq_chairshop_q_idx.nextVal,
						  '나미문의[답변완료]',
						  '나미답변입니다',
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