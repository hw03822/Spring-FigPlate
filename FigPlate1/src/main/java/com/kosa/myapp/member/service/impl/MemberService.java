package com.kosa.myapp.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.myapp.diner.dao.IReplyRepository;
import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.member.dao.IMemberRepository;
import com.kosa.myapp.member.model.MemberVO;
import com.kosa.myapp.member.service.IMemberService;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberRepository memberDao;
	
	@Autowired
	IReplyRepository replyRepository;
	
	@Override
	public void insertMember(MemberVO member) {
		memberDao.insertMember(member);	
	}

	@Override
	public MemberVO selectMember(String userId) {
		return memberDao.selectMember(userId);
	}

	@Override
	public void updateMember(MemberVO member) {
		memberDao.updateMember(member);
	}

	@Override
	public String getPassword(String userId) {
		return memberDao.getPassword(userId);
	}

	@Transactional
	@Override
	public void deleteMember(MemberVO member) {
		if(member.getRole() == 1) { //가게주인
			memberDao.deleteMemberFromDinerUploadFile(member);
			memberDao.deleteHostMemberFromDinerLike(member); // 내 게시물에 좋아요 누른 사람들 삭제
			memberDao.deleteHostMemberFromReply(member); // 내 게시물에 댓글 쓴 사람 삭제
			memberDao.deleteMemberFromDiner(member);
			memberDao.deleteMemberFromMember(member);
		}else { //일반회원
			memberDao.deleteMemberFromDinerLike(member); //본인이 누른 조아요 삭제
			memberDao.deleteMemberFromReply(member); //본인이 쓴 댓글 삭제
			memberDao.deleteMemberFromMember(member);
		}
		
	}

	@Override
	public double getAvgDinerStar(int dinerId) {
		return memberDao.getAvgDinerStar(dinerId);
	}

	@Override
	public List<DinerVO> selectLikedDinerList(String userId) {
		return memberDao.selectLikedDinerList(userId);
	}
	
	@Override
	public List<Integer> getGenderStatistic(int dinerId) {
		return memberDao.getGenderStatistic(dinerId);
	}
	
	@Override
	public int getMostGenderStatistic(int dinerId) {
		return memberDao.getMostGenderStatistic(dinerId);
	}
	
	@Override
	public int getMostAgeGroup(int dinerId) {
		return memberDao.getMostAgeGroup(dinerId);
	}
	
	@Override
	public List<Integer> getAgeGroup(int dinerId) {
		return memberDao.getAgeGroup(dinerId);
	}
	
	@Override
	public Integer getDinerIdByUserId(String userId) {
		return memberDao.getDinerIdByUserId(userId);
	}

	@Override
	public List<DinerVO> selectLikedDinerListRandom(String userId) {
		return memberDao.selectLikedDinerListRandom(userId);
	}



}
