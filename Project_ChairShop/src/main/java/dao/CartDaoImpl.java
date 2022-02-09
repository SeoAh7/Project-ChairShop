package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVo;

public class CartDaoImpl implements CartDao {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CartVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cart.cs_cart_list", m_idx);
	}


	@Override
	public CartVo selectOne(CartVo paramVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cart.cs_cart_one",paramVo);
	}

	@Override
	public int update(CartVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cart.cs_cart_update",vo);
	}

	@Override
	public int delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cart.cs_cart_delete",c_idx);
	}

	@Override
	public int insert(CartVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cart.cs_cart_insert",vo);
	}

	@Override
	public int selectTotalAmount(int m_idx) {
		// TODO Auto-generated method stub
		int total_amount =0;
		
	   total_amount=sqlSession.selectOne("cart.cs_cart_total_amount",m_idx);
	   
	   return total_amount;
	}

}
