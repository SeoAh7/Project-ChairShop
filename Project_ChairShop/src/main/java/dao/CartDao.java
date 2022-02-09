package dao;

import java.util.List;

import vo.CartVo;

public interface CartDao {
	List<CartVo> selectList(int m_idx);
	CartVo selectOne(CartVo paramVo);
	int    selectTotalAmount(int m_idx);
	
	int update(CartVo vo);
	int delete(int c_idx);
	int insert(CartVo vo);
}
