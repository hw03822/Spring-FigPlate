package com.kosa.myapp.diner.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosa.myapp.diner.model.DinerUploadFileVO;
import com.kosa.myapp.diner.model.DinerVO;
//import com.kosa.myapp.diner.model.ReplyVO;
import com.kosa.myapp.diner.model.Diner_LikeVO;

public interface IDinerRepository {
	int selectMaxDinerNo(); //diner_id占쏙옙 占쌍대값 占쏙옙占쏙옙占쏙옙占쏙옙
	int selectMaxFileId(); //file_id占쏙옙 占쌍댐옙 占쏙옙占쏙옙占쏙옙占쏙옙
	
	void insertDiner(DinerVO diner); // 占쏙옙占쏙옙 占쌉뤄옙
	void insertFileData(DinerUploadFileVO file); //占쏙옙占쏙옙 占쏙옙占쏙옙 占쌉뤄옙
	
	List<DinerVO> selectDinerListbyMenu(@Param("menuId") int menuId,@Param("start") int start, @Param("end") int end);
	List<DinerVO> selectDinerListbyStatisticId(@Param("statisticId") String statisticId, @Param("start") int start, @Param("end") int end);
	
	DinerVO selectDiner(int dinerId);
	
	void updateReadCount(int dinerId);
	void updateReplyNumber(@Param("masterId") int masterId, @Param("dinerReplyNumber") int dinerReplyNumber);

	void updateDiner(DinerVO diner); // 占쏙옙占쌉깍옙 占쏙옙占쏙옙 
	void updateFileData(DinerUploadFileVO file); //첨占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	
	DinerVO selectDeleteDiner(int dinerId); //占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
	DinerUploadFileVO getFile(int fileId);
	
	String getPassword(String userId); //占쏙옙橘占싫� 占쏙옙占쏙옙占쏙옙占쏙옙
	
	//占쌉시깍옙 占쏙옙占쏙옙占싹댐옙 
	void deleteFileData(int dinerId); //占쌉시깍옙 첨占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	void deleteDinerReply(int dinerId); //占쌉시깍옙 占쏙옙占� 占쏙옙占쏙옙
	void deleteDinerByDinerId(int dinerId); //占쌉시깍옙 占쏙옙占쏙옙
	void deleteDinerLikeByDinerId(int dinerId); //占쌉시깍옙 占쏙옙占쏙옙
	double selectStarAvg(int dinerId);
	double getStarAvg(int dinerId);
	void insertDinerStar(DinerVO diner);

	int selectTotalDinerCount();
	int selectTotalDinerCountByMenuId(int menuId);

	int selectTotalDinerCountByKeyword(String keyword);
	List<DinerVO> searchListByContentKeyword(@Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);
	
	void updateDinerLikeCount(int dinerId);
	int selectMaxLikeId();
	int insertDinerLike(Diner_LikeVO dinerLike);
}
