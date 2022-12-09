package com.kosa.myapp.diner.service;

import java.util.List;

import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.diner.model.ReplyVO;

public interface IReplyService {
	void replyDiner(ReplyVO reply, DinerVO diner);
	List<ReplyVO> replyList(int dinerId);
	
	ReplyVO selectReply(int replyId);
	void updateReply(ReplyVO reply, DinerVO diner); // �������
	
	ReplyVO selectDeleteReply(int replyId, int dinerId);
	void deleteReply(ReplyVO reply, DinerVO diner);
	
	double selectStarAvg(int dinerId);
}
