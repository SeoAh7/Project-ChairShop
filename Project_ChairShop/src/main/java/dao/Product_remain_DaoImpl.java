package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductManageVo;

public class Product_remain_DaoImpl implements ProductManageDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<ProductManageVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product_remain.product_remain_list");
	}

	@Override
	public ProductManageVo selectOne(int pm_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product_remain.product_remain_one_idx", pm_idx);
	}

	@Override
	public int insert(ProductManageVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product_remain.product_remain_insert", vo);
	}

	@Override
	public int delete(int pm_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProductManageVo selectOne(String p_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product_remain.product_remain_one_name", p_name);
	}

	@Override
	public int updateCnt(ProductManageVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("product_remain.product_remain_update_cnt", vo);
	}
	
}
