package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.FaqVo;

public class FaqDaoImpl implements FaqDao{

	SqlSession sqlSession;

	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}



	@Override
	public List<FaqVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("faq.faq_list");
	}



	@Override
	public FaqVo selectOne(int f_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("faq.faq_one",f_idx);
	}

	@Override
	public int insert(FaqVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("faq.faq_insert",vo);
	}

	@Override
	public int delete(int f_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("faq.faq_delete", f_idx);
	}

	@Override
	public int update(FaqVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("faq.faq_update",vo);
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("faq.faq_rowtotal");
	}
	
	@Override
	public List<FaqVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("faq.faq_condition_list", map);
	}
}
