package com.kosa.myapp.diner.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.myapp.diner.dao.IReplyRepository;
import com.kosa.myapp.diner.model.DinerVO;
//import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.diner.model.ReplyVO;
import com.kosa.myapp.diner.service.IReplyService;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	IReplyRepository replyRepository;
	
	//占쏙옙占썰쓰占쏙옙 (첨占쏙옙占쏙옙占쏙옙 占싫듸옙)
	@Transactional
	@Override
	public void replyDiner(ReplyVO reply, DinerVO diner) {
		reply.setReplyId(replyRepository.selectMaxReplyId()+1);
		replyRepository.replyDiner(reply);
		diner.setDinerStar(replyRepository.selectStarAvg(reply.getDinerId()));
		replyRepository.insertDinerStar(diner);
	}

	@Override
	public List<ReplyVO> replyList(int dinerId) {
		return replyRepository.replyList(dinerId);
	}
	
	@Override
	public ReplyVO selectReply(int replyId) {
		return replyRepository.selectReply(replyId);
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트占싹깍옙
	@Transactional
	@Override
	public void updateReply(ReplyVO reply, DinerVO diner) {
		replyRepository.updateReply(reply);
		diner.setDinerStar(replyRepository.selectStarAvg(reply.getDinerId()));
		replyRepository.insertDinerStar(diner);
	}

	//占쏙옙占� 占쏙옙占쏙옙
	@Transactional
	@Override
	public void deleteReply(ReplyVO reply, DinerVO diner) {
		replyRepository.deleteReplyByReplyId(reply.getReplyId(), reply.getDinerId());
		diner.setDinerStar(replyRepository.selectStarAvg(reply.getDinerId()));
		replyRepository.insertDinerStar(diner);		
	}

	@Override
	public ReplyVO selectDeleteReply(int replyId, int dinerId) {
		return replyRepository.selectDeleteReply(replyId, dinerId);
	}

	@Override
	public double selectStarAvg(int dinerId) {
		return replyRepository.selectStarAvg(dinerId);
	}
	
}
