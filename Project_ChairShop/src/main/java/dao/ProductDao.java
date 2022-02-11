package dao;

import java.util.List;
import java.util.Map;

import vo.ProductVo;

public interface ProductDao {
	
	List<ProductVo> selectList();
	List<ProductVo> selectList(Map map);
	List<ProductVo> selectList(String category);
	ProductVo selectOne(int p_idx);
	
	int insert(ProductVo vo);
	int update(ProductVo vo);
	int delete(int p_idx);
	
	//Product_Remain_DaoImpl(Àç°í)
	default ProductVo selectOne(String p_name) {return null;}
	
}
