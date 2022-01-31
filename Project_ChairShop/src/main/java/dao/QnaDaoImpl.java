package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVo;

public class QnaDaoImpl implements QnaDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<QnaVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qna.qna_list");
	}

	@Override
	public QnaVo selectOne(int q_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qna.qna_one", q_idx);
	}

	@Override
	public int insert(QnaVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qna.qna_insert", vo);
	}

	@Override
	public int update_use_yn(int q_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("qna.qna_update_use_yn", q_idx);
	}
	
	@Override
	public int delete(int q_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(QnaVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("qna.qna_update", vo);
	}

	@Override
	public int reply(QnaVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qna.qna_reply", vo);
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qna.qna_rowtotal", map);
	}

	@Override
	public List<QnaVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qna.qna_condition_list", map);
	}


}
