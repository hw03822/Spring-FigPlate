package com.kosa.myapp.diner.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int replyId;
	private String replyWriterId;
	private int dinerId;
	private String replyContent;
	private int replyStar;
	private Timestamp replyWriteDate;
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getReplyWriterId() {
		return replyWriterId;
	}
	public void setReplyWriterId(String replyWriterId) {
		this.replyWriterId = replyWriterId;
	}
	public int getDinerId() {
		return dinerId;
	}
	public void setDinerId(int dinerId) {
		this.dinerId = dinerId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReplyStar() {
		return replyStar;
	}
	public void setReplyStar(int replyStar) {
		this.replyStar = replyStar;
	}
	public Timestamp getReplyWriteDate() {
		return replyWriteDate;
	}
	public void setReplyWriteDate(Timestamp replyWriteDate) {
		this.replyWriteDate = replyWriteDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", replyWriterId=" + replyWriterId + ", dinerId=" + dinerId
				+ ", replyContent=" + replyContent + ", replyStar=" + replyStar + ", replyWriteDate=" + replyWriteDate
				+ "]";
	}
	
	
}
