package com.kosa.myapp.diner.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.myapp.diner.controller.DinerController;
import com.kosa.myapp.diner.dao.IDinerRepository;
import com.kosa.myapp.diner.model.DinerUploadFileVO;
import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.diner.model.Diner_LikeVO;
import com.kosa.myapp.diner.service.IDinerService;

@Service
public class DinerService implements IDinerService{
	static final Logger logger = LoggerFactory.getLogger(DinerController.class);
	
	@Autowired
	IDinerRepository dinerRepository;
	
	//占쏙옙占쏙옙 占쌉시깍옙 占쏙옙占쏙옙
	@Override
	@Transactional
	public void insertDiner(DinerVO diner) { // 첨占쏙옙占쏙옙占쏙옙 占쏙옙占승곤옙占� 占쌉뤄옙
		diner.setDinerId(dinerRepository.selectMaxDinerNo()+1); //dinerID +1 占싹곤옙 占쌉뤄옙
		dinerRepository.insertDiner(diner);
	}

	@Override
	@Transactional
	public void insertDiner(DinerVO diner, DinerUploadFileVO file) { // 첨占쏙옙占쏙옙占쏙옙 占쌍는곤옙占� 占쌉뤄옙
		diner.setDinerId(dinerRepository.selectMaxDinerNo()+1);
		dinerRepository.insertDiner(diner); //占쏙옙占쏙옙 占쌉시깍옙 占쌉뤄옙 
		if(file != null && file.getFileName() != null && !file.getFileName().equals("")) { //占쏙옙占쏙옙 占쏙옙占쏙옙
			file.setDinerId(diner.getDinerId()); // dinerId 占쏙옙占쏙옙占싶쇽옙 占쏙옙占쏙옙
			file.setFileId(dinerRepository.selectMaxFileId()+1); //fileID +1占싹곤옙 占쌉뤄옙
			dinerRepository.insertFileData(file);
		}
		
	}
	
	@Transactional
	@Override
	public DinerVO selectDiner(int dinerId) {
		dinerRepository.updateReadCount(dinerId);
		return dinerRepository.selectDiner(dinerId);
	}
	
	@Override
	public DinerUploadFileVO getFile(int fileId) {
		return dinerRepository.getFile(fileId);
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트占싹깍옙
	@Override
	public void updateDiner(DinerVO diner) {
		dinerRepository.updateDiner(diner);		
	}
	
	@Transactional
	@Override
	public void updateDiner(DinerVO diner, DinerUploadFileVO file) {
		dinerRepository.updateDiner(diner);
		if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
			file.setDinerId(diner.getDinerId());
			if(file.getFileId()>0) {
				dinerRepository.updateFileData(file);
			}else {
				dinerRepository.insertFileData(file);
			}
		}
	}
	
	
	@Override
	public DinerVO selectDeleteDiner(int dinerId) {
		return dinerRepository.selectDeleteDiner(dinerId);
	}
	
	@Override
	public String getPassword(String userId) {
		return dinerRepository.getPassword(userId);
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙
	@Transactional
	@Override
	public void deleteDiner(int dinerId, DinerVO diner) {
		dinerRepository.deleteFileData(dinerId);
		dinerRepository.deleteDinerReply(dinerId);
		dinerRepository.deleteDinerLikeByDinerId(dinerId);
		dinerRepository.deleteDinerByDinerId(dinerId);
		diner.setDinerStar(dinerRepository.selectStarAvg(dinerId));
		dinerRepository.insertDinerStar(diner);
	}
	
	@Override
	public double getStarAvg(int dinerId) {
		return dinerRepository.getStarAvg(dinerId);
	}
	
	//--------------------------------------
	@Override
	public List<DinerVO> selectDinerListbyMenu(int menuId, int page) {
		int start = (page -1) * 10 + 1;
		return dinerRepository.selectDinerListbyMenu(menuId, start, start+9);
	}

	@Override
	public List<DinerVO> selectDinerListbyMenu(int menuId) {
		return dinerRepository.selectDinerListbyMenu(menuId, 0, 100);
	}

	@Override
	public List<DinerVO> selectDinerListbyStatistic(String statisticId, int page) {
		int start = (page -1) * 10 + 1;
		return dinerRepository.selectDinerListbyStatisticId(statisticId, start, start + 9);
	}

	@Override
	public List<DinerVO> selectDinerListbyStatistic(String statisticId) {
		return dinerRepository.selectDinerListbyStatisticId(statisticId, 0, 100);
	}
	
	@Override
	public int selectTotalDinerCount() {
		return dinerRepository.selectTotalDinerCount();
	}

	@Override
	public int selectTotalDinerCountByMenuId(int menuId) {
		return dinerRepository.selectTotalDinerCountByMenuId(menuId);
	}

	@Override
	public List<DinerVO> searchListByContentKeyword(String keyword, int page) {
		int start = (page-1) * 10 + 1;
		return dinerRepository.searchListByContentKeyword("%" + keyword + "%", start, start+9);
	}

	@Override
	public int selectTotalDinerCountByKeyword(String keyword) {
		return dinerRepository.selectTotalDinerCountByKeyword("%" + keyword + "%");
	}
	
	
//	@Override
//	public void replyDiner(ReplyVO reply, DinerUploadFileVO replyfile) {
//		reply.setReplyId(dinerRepository.selectMaxReplyId()+1);
//		dinerRepository.replyDiner(reply);
//		if(replyfile != null && replyfile.getFileName()!= null && !replyfile.getFileName().equals("")) {
//			replyfile.setDinerId(dinerId);
//		}
//	}

	@Override
	@Transactional
	public void likeDiner(Diner_LikeVO dinerLike) {
		dinerLike.setLikeId(dinerRepository.selectMaxLikeId() + 1);
		int insertRow = dinerRepository.insertDinerLike(dinerLike);
		if(insertRow > 0) {
			dinerRepository.updateDinerLikeCount(dinerLike.getDinerId());
		}
	}
	
//	public void likeDiner(Diner_LikeVO dinerLike) {
//		dinerLike.setLikeId(dinerRepository.selectMaxLikeId() + 1);
//		int insertRow = dinerRepository.insertDinerLike(dinerLike);
//		logger.info("입력된 행 수"+ insertRow);
//		if(insertRow > 0) { //1행이라도 입력되었을때 (0이면 입력안된것 -> update하면 안됨)
//			dinerRepository.updateDinerLikeCount(dinerLike.getDinerId());
//		}
//	}
	
	
	
}
