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
		if(member.getRole() == 1) { //��������
			memberDao.deleteMemberFromDinerUploadFile(member);
			memberDao.deleteHostMemberFromDinerLike(member); // �� �Խù��� ���ƿ� ���� ����� ����
			memberDao.deleteHostMemberFromReply(member); // �� �Խù��� ��� �� ��� ����
			memberDao.deleteMemberFromDiner(member);
			memberDao.deleteMemberFromMember(member);
		}else { //�Ϲ�ȸ��
			memberDao.deleteMemberFromDinerLike(member); //������ ���� ���ƿ� ����
			memberDao.deleteMemberFromReply(member); //������ �� ��� ����
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
