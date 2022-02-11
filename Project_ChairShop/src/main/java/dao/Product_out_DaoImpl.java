package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductManageVo;

public class Product_out_DaoImpl implements ProductManageDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<ProductManageVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product_out.product_out_list");
	}

	@Override
	public ProductManageVo selectOne(int pm_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product_out.product_out_one", pm_idx);
	}

	@Override
	public int insert(ProductManageVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product_out.product_out_insert", vo);
	}

	@Override
	public int delete(int pm_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("product_out.product_out_delete", pm_idx);
	}

}
