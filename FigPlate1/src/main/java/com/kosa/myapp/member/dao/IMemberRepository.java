package com.kosa.myapp.member.dao;

import java.util.List;

import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.member.model.MemberVO;

public interface IMemberRepository {
	void insertMember(MemberVO member);
	MemberVO selectMember(String userId);
	void updateMember(MemberVO member);
	String getPassword(String userId);
	
	void deleteMemberFromMember(MemberVO member);
	void deleteMemberFromReply(MemberVO member);
	void deleteMemberFromDiner(MemberVO member);
	void deleteMemberFromDinerLike(MemberVO member);
	void deleteMemberFromDinerUploadFile(MemberVO member);
	void deleteHostMemberFromDinerLike(MemberVO member);
	void deleteHostMemberFromReply(MemberVO member);
	
	double getAvgDinerStar(int dinerId);
	int getCountLikedDinerId(String userId);
	List<DinerVO> selectLikedDinerList(String userId);
	void updateLikeCount(int dinerId);
	List<Integer> getGenderStatistic(int dinerId);
	int getMostGenderStatistic(int dinerId);
	List<Integer> getAgeGroup(int dinerId);
	int getMostAgeGroup(int dinerId);
	Integer getDinerIdByUserId(String userId);
	int getLikedDinerId(String userId);
	
	List<DinerVO> selectLikedDinerListRandom(String userId);
}
