package com.kosa.myapp.member.service;

import java.util.List;

import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.member.model.MemberVO;

public interface IMemberService {
	void insertMember(MemberVO member);
	MemberVO selectMember(String userId);
	void updateMember(MemberVO member);
	String getPassword(String userId);
	void deleteMember(MemberVO member);
	List<DinerVO> selectLikedDinerList(String userId);
	double getAvgDinerStar(int dinerId);
	List<Integer> getGenderStatistic(int dinerId);
	int getMostGenderStatistic(int dinerId);
	List<Integer> getAgeGroup(int dinerId);
	int getMostAgeGroup(int dinerId);
	Integer getDinerIdByUserId(String userId);
	
	List<DinerVO> selectLikedDinerListRandom(String userId);
}
