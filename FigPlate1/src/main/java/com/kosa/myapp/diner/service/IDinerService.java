package com.kosa.myapp.diner.service;

import java.util.List;

import com.kosa.myapp.diner.model.DinerUploadFileVO;
import com.kosa.myapp.diner.model.DinerVO;
//import com.kosa.myapp.diner.model.ReplyVO;
import com.kosa.myapp.diner.model.Diner_LikeVO;

public interface IDinerService {
	void insertDiner(DinerVO diner);
	void insertDiner(DinerVO diner, DinerUploadFileVO file);
	
	DinerVO selectDiner(int dinerId);
	DinerUploadFileVO getFile(int fileId);
//	void replyDiner(ReplyVO reply, DinerUploadFileVO replyfile);
	
	void updateDiner(DinerVO diner);
	void updateDiner(DinerVO diner, DinerUploadFileVO file);
	
	String getPassword(String userId);
	
	DinerVO selectDeleteDiner(int dinerId);
	void deleteDiner(int dinerId, DinerVO diner);
	
	//---------------------------
	List<DinerVO> selectDinerListbyMenu(int menuId, int page);
	List<DinerVO> selectDinerListbyMenu(int menuId);
	List<DinerVO> selectDinerListbyStatistic(String statisticId, int page);
	List<DinerVO> selectDinerListbyStatistic(String statisticId);
	
	int selectTotalDinerCount();
	int selectTotalDinerCountByMenuId(int menuId);

	List<DinerVO> searchListByContentKeyword(String keyword, int page);
	int selectTotalDinerCountByKeyword(String keyword);
	
	void likeDiner(Diner_LikeVO dinerLike);
	double getStarAvg(int dinerId);
}
