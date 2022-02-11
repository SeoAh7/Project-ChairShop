package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import vo.ProductVo;

public class ProductDaoImpl implements ProductDao {

	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<ProductVo> selectList(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_category_list", category);
	}


	@Override
	public ProductVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_view", p_idx);
	}



	@Override
	public int insert(ProductVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.product_insert", vo);
	}




	@Override
	public int update(ProductVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int delete(int p_idx) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<ProductVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list");
	}


	@Override
	public List<ProductVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_search_list", map);
	}


	@Override
	public ProductVo selectOne(String p_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_one_name", p_name);
	}

	
	
}
