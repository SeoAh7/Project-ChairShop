package dao;

import java.util.List;
import java.util.Map;

import vo.QnaVo;

public interface QnaDao {
	
	List<QnaVo> selectList();
	List<QnaVo> selectList(Map map);
	QnaVo 		selectOne(int q_idx);
	
	
	int 		insert(QnaVo vo);
	int			update_use_yn(int q_idx);	//삭제기능
	int 		delete(int q_idx);
	int 		update(QnaVo vo);
	int 		reply(QnaVo vo);
	int 		selectRowTotal(Map map);
	

}
