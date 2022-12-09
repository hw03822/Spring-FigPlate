package com.kosa.myapp.member.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.member.model.MemberVO;
import com.kosa.myapp.member.service.IMemberService;

@Controller
public class MemberController {
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	IMemberService memberService;

	@RequestMapping(value="/member/insert", method=RequestMethod.GET)
	public String insertMember(Model model) {
		model.addAttribute("member", new MemberVO());
		return "member/form";
	}

	@RequestMapping(value="/member/insert", method=RequestMethod.POST)
	public String insertMember(@ModelAttribute("member") @Valid MemberVO member, BindingResult result, Model model, HttpSession session, RedirectAttributes redirectAttrs) {
		if(result.hasErrors()) {
			return "member/form";
		}
		try	{
			memberService.insertMember(member);
			session.invalidate();
		}catch(RuntimeException	e)	{
			redirectAttrs.addFlashAttribute("message",	e.getMessage());
		}
		
		return "home";
	}

	@RequestMapping(value="/member/view", method=RequestMethod.GET)
	public String view(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");

		if(userId == null) {
			return "member/login";
		}

		MemberVO member = memberService.selectMember(userId);

		model.addAttribute("userId", userId);
		model.addAttribute("email", member.getEmail());
		model.addAttribute("name", member.getName());
		model.addAttribute("phone", member.getPhone());
		model.addAttribute("birthDate", member.getBirthDate());


		int gender = member.getGender();
		if(gender == 1) {
			model.addAttribute("gender", "남자");
		}else if(gender == 2) {
			model.addAttribute("gender", "여자");
		}

		return "member/view";
	}

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(String userId, String password, HttpSession session, Model model) {
		MemberVO member = memberService.selectMember(userId);

		Integer dinerId = memberService.getDinerIdByUserId(userId);
		if(dinerId == null) {
			dinerId = null;
		}
		if(member != null) {
			String dbPassword = member.getPassword();
			if(dbPassword == null) {
				model.addAttribute("message", "NOT_VALID_USER");
			}else {
				if(dbPassword.equals(password)) {

					session.setAttribute("userId", userId);
					session.setAttribute("name", member.getName());
					session.setAttribute("email", member.getEmail());
					session.setAttribute("role", member.getRole());
					session.setAttribute("dinerId", dinerId);	
					model.addAttribute("phone", member.getPhone());
					model.addAttribute("birthDate", member.getBirthDate());

					return "home";

				}else {
					model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		}else {
			model.addAttribute("message", "USER_NOT_FOUND");

		}
		session.invalidate();
		return "member/login";

	}

	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "home";
	}

	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String updateMember(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberVO member = memberService.selectMember(userId);
		model.addAttribute("member", member);
		return "member/update";
	} // 濡쒓렇�씤 �븯吏� �븡�븯�쓣 �븣 �쉶�썝 �닔�젙 �럹�씠吏� �빆紐⑹씠 蹂댁씠吏� �븡�룄濡� 議곗젙�븿

	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute("member") @Valid MemberVO member, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "member/update";
		}
		memberService.updateMember(member);
		model.addAttribute("member", member);
		return "redirect:/member/view";
	}

	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberVO member = memberService.selectMember(userId);
		model.addAttribute("member", member);
		return "member/delete";
	}

	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public String deleteMember(String password, HttpSession session, Model model) {
		MemberVO member = new MemberVO();
		member.setUserId((String)session.getAttribute("userId"));
		String dbpw = memberService.getPassword(member.getUserId());
		if(password != null && password.equals(dbpw)) {
			member.setPassword(password);
			memberService.deleteMember(member);
			session.invalidate(); // 로그아웃 처리
			return "member/login";
		} else { // 비밀번호가 틀렸을 경우
			model.addAttribute("message", "WRONG_PASSWORD_NOT_DELETED");
			return "error/runtime";
		}
	}
	
	@RequestMapping(value="/member/like")
	public String getListByMemberLike(HttpSession session, Model model){
		String userId = (String)session.getAttribute("userId");
		List<DinerVO> dinerList = memberService.selectLikedDinerList(userId);
		model.addAttribute("dinerList", dinerList);
		return "member/like";
	}

	@RequestMapping(value="/member/statistic/{dinerId}")
	public String getDinerSummery(@PathVariable int dinerId, Model model) {
		List<Integer> genderStatisticList = memberService.getGenderStatistic(dinerId);
		model.addAttribute("genderStatisticList", genderStatisticList);

		List<Integer> ageGroupList = memberService.getAgeGroup(dinerId);
		model.addAttribute("ageGroupList", ageGroupList);
		
		int getMostGenderStatistic = memberService.getMostGenderStatistic(dinerId);
		
		if(getMostGenderStatistic == 1) {
			model.addAttribute("getMostGenderStatistic", "남자");
		}else if(getMostGenderStatistic == 2) {
			model.addAttribute("getMostGenderStatistic", "여자");
		} else {
			model.addAttribute("getMostGenderStatistic", "모든 연령대");
		}
		
		int getMostAgeGroup = memberService.getMostAgeGroup(dinerId);
		
		if(getMostAgeGroup == 10) {
			model.addAttribute("getMostAgeGroup", "10세");
		} else if(getMostAgeGroup == 20) {
			model.addAttribute("getMostAgeGroup", "20세");
		} else if(getMostAgeGroup == 30) {
			model.addAttribute("getMostAgeGroup", "30세");
		} else if(getMostAgeGroup == 40) {
			model.addAttribute("getMostAgeGroup", "40세");
		} else if(getMostAgeGroup == 50) {
			model.addAttribute("getMostAgeGroup", "50세");
		} else if(getMostAgeGroup == 60) {
			model.addAttribute("getMostAgeGroup", "60세");
		} else if(getMostAgeGroup == 70) {
			model.addAttribute("getMostAgeGroup", "70세");
		} else if(getMostAgeGroup >= 80) {
			model.addAttribute("getMostAgeGroup", "80세 이상");
		}

		return "member/summary";

	}

}
