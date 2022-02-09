package dao;

import java.util.List;

import vo.ProductVo;

public interface ProductDao {
	
	List<ProductVo> selectList(String category);
	ProductVo selectOne(int p_idx);
	
	int insert(ProductVo vo);
	int update(ProductVo vo);
	int delete(int p_idx);
	
	//Product_Remain_DaoImpl(Àç°í)
	default ProductVo selectOne(String name) {return null;}
	default int update_name(ProductVo vo) {return 0;}
	List<ProductVo> selectList();

	
}
