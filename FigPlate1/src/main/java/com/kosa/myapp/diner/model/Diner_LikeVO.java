package com.kosa.myapp.diner.model;

public class Diner_LikeVO {
	private int likeId;
	private int dinerId;
	private String userId;
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public int getDinerId() {
		return dinerId;
	}
	public void setDinerId(int dinerId) {
		this.dinerId = dinerId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Diner_LikeVO [likeId=" + likeId + ", dinerId=" + dinerId + ", userId=" + userId + "]";
	}
	
}