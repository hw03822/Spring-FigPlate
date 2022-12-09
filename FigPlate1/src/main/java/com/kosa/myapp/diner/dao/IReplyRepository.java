package com.kosa.myapp.diner.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosa.myapp.diner.model.DinerUploadFileVO;
import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.diner.model.ReplyVO;

public interface IReplyRepository {
	int selectMaxReplyId(); //reply_id�ִ� �������� (2000���� ����) => �����߰�
	
	void replyDiner(ReplyVO reply); // ���侲��
	void replyFileData(DinerUploadFileVO replyfile); // ���侲��
	
	List<ReplyVO> replyList(int dinerId); //�Խñ��� ��� ����Ʈ
	
	ReplyVO selectReply(int replyId);
	void updateReply(ReplyVO reply); // �������
	
	ReplyVO selectDeleteReply(@Param("replyId") int replyId, @Param("dinerId") int dinerId);
	void deleteReplyByReplyId(@Param("replyId") int replyId, @Param("dinerId") int dinerId);
	
	double selectStarAvg(int dinerId);
	void insertDinerStar(DinerVO diner);
}
