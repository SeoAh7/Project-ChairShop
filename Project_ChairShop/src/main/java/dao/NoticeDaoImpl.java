package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.NoticeVo;

public class NoticeDaoImpl implements NoticeDao {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<NoticeVo> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeVo selectOne(int n_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(NoticeVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int n_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(NoticeVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
