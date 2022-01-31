package dao;

import java.util.List;

import vo.QnaVo;

public interface QnaDao {
	
	List<QnaVo> selectList();
	QnaVo 		selectOne(int q_idx);
	
	
	int 		insert(QnaVo vo);
	int			update_use_yn(int q_idx);	//�������
	int 		delete(int q_idx);
	int 		update(QnaVo vo);
	int 		reply(QnaVo vo);
	

}
