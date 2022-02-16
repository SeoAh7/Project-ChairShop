package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.OrderVo;

public class OrderDaoImpl implements OrderDao {

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<OrderVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cs_order.order_list");
	}

	@Override
	public OrderVo selectOne(int o_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cs_order.order_list_one", o_idx);
	}

	@Override
	public int insert(OrderVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cs_order.order_insert",vo);
	}

	@Override
	public int update(int o_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("cs_order.order_update", o_idx);
	}

	@Override
	public List<OrderVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cs_order.m_order_list",m_idx);
	}

	@Override
	   public int selectCount_y(int m_idx) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("cs_order.order_count_y", m_idx);
	   }

	   @Override
	   public int selectCount_n(int m_idx) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("cs_order.order_count_n", m_idx);
	   }

}
