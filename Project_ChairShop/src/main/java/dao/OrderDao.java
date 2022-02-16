package dao;

import java.util.List;

import vo.OrderVo;

public interface OrderDao {

	List<OrderVo> selectList();
	List<OrderVo> selectList(int m_idx);
	OrderVo       selectOne(int o_idx);
	
	int insert(OrderVo vo);
	int update(int o_idx);
	
	int selectCount_y(int m_idx);   
	int selectCount_n(int m_idx);
}
