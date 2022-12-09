package com.kosa.myapp.diner.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosa.myapp.diner.model.DinerUploadFileVO;
import com.kosa.myapp.diner.model.DinerVO;
import com.kosa.myapp.diner.model.Diner_LikeVO;
import com.kosa.myapp.diner.model.MenuVO;
import com.kosa.myapp.diner.model.ReplyVO;
import com.kosa.myapp.diner.service.IDinerMenuService;
import com.kosa.myapp.diner.service.IDinerService;
import com.kosa.myapp.diner.service.IReplyService;
import com.kosa.myapp.member.service.IMemberService;

@Controller
public class DinerController {
	static final Logger logger = LoggerFactory.getLogger(DinerController.class);
	
	@Autowired
	IDinerService dinerService;
	
	@Autowired
	IDinerMenuService menuService;
	
	@Autowired
	IReplyService replyService;
	
	@Autowired
	IMemberService memberService;
	
	//占쏙옙占쏙옙 占쌉뤄옙
	@RequestMapping(value="/diner/write/{menuId}", method=RequestMethod.GET)
	public String writeDiner(@PathVariable int menuId, Model model) {
		List<MenuVO> menuList = menuService.selectAllMenu();
		model.addAttribute("menuList", menuList); //占쌨댐옙占쏙옙占쏙옙트 占쏙옙占쏙옙殮占�
		model.addAttribute("menuId", menuId);
		model.addAttribute("diner", new DinerVO());
		return "diner/write";
	}
	
	@RequestMapping(value="/diner/write/{menuId}", method=RequestMethod.POST)
	public String writeDiner(@ModelAttribute("diner") @Valid DinerVO diner, BindingResult result, RedirectAttributes redirectAttrs) {
		logger.info("/diner/write: "+diner.toString());
		if(result.hasErrors()) {
			System.out.println(result);
			return "diner/write";
		}
		try {
			diner.setDinerTitle(Jsoup.clean(diner.getDinerTitle(), Whitelist.basic()));
			diner.setDinerContent(Jsoup.clean(diner.getDinerContent(), Whitelist.basic()));
			MultipartFile mfile = diner.getFile();
			if(mfile != null && !mfile.isEmpty()) {
				logger.info("/diner/write:" + mfile.getOriginalFilename());
				DinerUploadFileVO file = new DinerUploadFileVO();
				file.setFileId(diner.getFileId());
				file.setFileName(mfile.getOriginalFilename());
				file.setFileSize(mfile.getSize());
				file.setFileContentType(mfile.getContentType());
				file.setFileData(mfile.getBytes());
				logger.info("/diner/write:"+file);
				
				dinerService.insertDiner(diner, file);
			}else {
				dinerService.insertDiner(diner);
			}
		}catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/diner/menu/"+ diner.getMenuId();
	}
	
	//占쏢세븝옙占쏙옙
	@RequestMapping("/diner/{dinerId}/{page}")
	public String getDinerDetails(@PathVariable int dinerId, @PathVariable int page, HttpSession session, Model model) {
		DinerVO diner = dinerService.selectDiner(dinerId);
		model.addAttribute("diner", diner);
		model.addAttribute("page", page);
		model.addAttribute("menuId", diner.getMenuId());
		logger.info("getDinerDetails " + diner.toString());
		
		//----------Reply List------------------
		List<ReplyVO> reply = replyService.replyList(dinerId);
		model.addAttribute("reply", reply);
		model.addAttribute("replySize", reply.size());
		model.addAttribute("starAvg", dinerService.getStarAvg(dinerId));
		
		//-----------Member Like List random3------------------
		String userId = (String)session.getAttribute("userId");
		if(userId != null) {
			List<DinerVO> dinerList = memberService.selectLikedDinerListRandom(userId);
			model.addAttribute("dinerList", dinerList);
		}
		
		//--------------diner related tag-------------------
		String menuName = menuService.selectMenuNameByMenuId(diner.getMenuId()); 
		model.addAttribute("menuName", menuName);
		
		return "diner/view";
	}
	
	@RequestMapping("/diner/{dinerId}")
	public String getDinerDetails(@PathVariable int dinerId, HttpSession session, Model model) {
		return getDinerDetails(dinerId, 1, session, model);
	}
	
	
	//占쏙옙占� 占쌨깍옙(占쏙옙占� 占쏙옙 占쏙옙 占쏙옙 占쌉시뱄옙 占쏢세븝옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 - 占쏙옙占� 占쏙옙占� 占쏙옙占쏙옙占쏙옙占�)
	@RequestMapping(value="/diner/review", method=RequestMethod.POST)
	public String reviewDiner(DinerVO diner, ReplyVO reply, BindingResult result, RedirectAttributes redirectAttrs, HttpSession session) {
		logger.info("/diner/reply:"+reply.toString());
		try {
			reply.setReplyContent(Jsoup.clean(reply.getReplyContent(), Whitelist.basic()));
			replyService.replyDiner(reply, diner); // insert reply info into Reply Table
		}catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		
		return "redirect:/diner/"+reply.getDinerId();
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value="/diner/update/{dinerId}", method=RequestMethod.GET)
	public String updateDiner(@PathVariable int dinerId, Model model) {
	      List<MenuVO> menuList = menuService.selectAllMenu();
	      model.addAttribute("menuList", menuList); //占쌨댐옙占쏙옙占쏙옙트 占쏙옙占쏙옙殮占 
	      DinerVO diner = dinerService.selectDiner(dinerId);
	      logger.info("fileId 확인 : " + diner);
	      model.addAttribute("diner", diner);
	      return "diner/update";
	}
	
	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌍깍옙
	@RequestMapping(value="/diner/update/{dinerId}", method=RequestMethod.POST)
	 public String updateDiner(@ModelAttribute("diner") @Valid DinerVO diner, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
	      logger.info("/diner/update: "+diner.toString());
	      if(result.hasErrors()) {
	         return "diner/update";
	      }
	      try {
	         logger.info("/dinerupdate: "+diner.toString());
	         diner.setDinerTitle(Jsoup.clean(diner.getDinerTitle(), Whitelist.basic()));
	         diner.setDinerContent(Jsoup.clean(diner.getDinerContent(), Whitelist.basic()));
	         logger.info(diner.getDinerContent());
	         MultipartFile mfile = diner.getFile();
	         if(mfile != null && !mfile.isEmpty()) {
	            logger.info("/diner/update:" + mfile.getOriginalFilename());
	            DinerUploadFileVO file = new DinerUploadFileVO();
	            file.setFileId(diner.getFileId());
	            logger.info("a : " + file.getFileId());
	            file.setFileName(mfile.getOriginalFilename());
	            file.setFileSize(mfile.getSize());
	            file.setFileContentType(mfile.getContentType());
	            file.setFileData(mfile.getBytes());
	            
	            logger.info("/diner/update:"+file);
	            
	            dinerService.updateDiner(diner, file);
	         }else {
	            dinerService.updateDiner(diner);
	         }
	      }catch (Exception e) {
	         e.printStackTrace();
	         redirectAttrs.addFlashAttribute("message", e.getMessage());
	      }
	      return "redirect:/diner/"+diner.getDinerId();
	   }
	
	//占쌉시깍옙 占쏙옙占쏙옙
	@RequestMapping(value="/diner/delete/{dinerId}", method=RequestMethod.GET)
	public String deleteDiner(@PathVariable int dinerId, Model model) {
		DinerVO diner = dinerService.selectDeleteDiner(dinerId);
		model.addAttribute("menuId", diner.getMenuId());
		model.addAttribute("dinerWriterId", diner.getDinerWriterId());
		model.addAttribute("dinerId", dinerId);
		return "diner/delete";
	}
	
	@RequestMapping(value="/diner/delete", method=RequestMethod.POST)
	public String deleteDiner(DinerVO diner, @RequestParam("password") String password, BindingResult result, HttpSession session, Model model) {
		logger.info("/diner/delete:"+diner.toString());
		logger.info("password:"+password);
		
		try {
			String dbpw = dinerService.getPassword(diner.getDinerWriterId());
			logger.info("dbpw: "+dbpw);
			
			if(dbpw.equals(password)) {
				dinerService.deleteDiner(diner.getDinerId(), diner);
				return "redirect:/diner/menu/"+diner.getMenuId()+"/"+(Integer)session.getAttribute("page");
			}else {
				model.addAttribute("message", "WRONG_PASSWORD_NOT_DELETED");
				return "error/runtime";
			}
		}catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "error/runtime";
		}
	}
	
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int fileId) {
		DinerUploadFileVO file = dinerService.getFile(fileId);
		logger.info("getFile " + file.toString());
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}
	
	
	//占쏙옙占� 占쏙옙占쏙옙
	@RequestMapping(value="/diner/reviewUpdate/{dinerId}/{replyId}", method=RequestMethod.GET)
	public String updateReply(@PathVariable int dinerId, @PathVariable int replyId, Model model) {
		ReplyVO reply = replyService.selectReply(replyId);
		model.addAttribute("reply", reply);
		model.addAttribute("dinerId", dinerId);
		model.addAttribute("replyId", replyId);
		logger.info("selectReply: "+ reply.toString());
		return "diner/review";
	}
	
	@RequestMapping(value="/diner/reviewUpdate", method=RequestMethod.POST)
	public String updateReply(ReplyVO reply, DinerVO diner, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
		logger.info("/diner/updateReply: "+reply.toString());
		try {
			reply.setReplyContent(Jsoup.clean(reply.getReplyContent(), Whitelist.basic()));
			replyService.updateReply(reply, diner);
		}catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		
		return "redirect:/diner/"+ reply.getDinerId();
	}
	
	//占쏙옙占� 占쏙옙占쏙옙
	@RequestMapping(value="/diner/reviewdelete/{dinerId}/{replyId}", method=RequestMethod.GET)
	public String deleteReply(@PathVariable int dinerId, @PathVariable int replyId, Model model) {
		ReplyVO reply = replyService.selectDeleteReply(replyId, dinerId);
		model.addAttribute("replyWriterId", reply.getReplyWriterId());
		model.addAttribute("dinerId", dinerId);
		model.addAttribute("replyId", replyId);
		return "diner/delete";
	}
	
	@RequestMapping(value="/diner/reviewdelete", method=RequestMethod.POST)
	public String deleteReply(ReplyVO reply, DinerVO diner, @RequestParam("password") String password, BindingResult result, HttpSession session, Model model) {
		logger.info("/diner/replydelete:"+reply.toString());
		logger.info("password:"+password);
		
		try {
			String dbpw = dinerService.getPassword(reply.getReplyWriterId());
			logger.info("dbpw: " + dbpw);
			
			if(dbpw.equals(password)) {
				replyService.deleteReply(reply, diner);
				return "redirect:/diner/"+reply.getDinerId();
			}else {
				model.addAttribute("message", "WRONG_PASSWORD_NOT_DELETED");
				return "error/runtime";
			}
		}catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "error/runtime";
		}
	}
	
	//-----------------------------------------
	
	@RequestMapping("diner/menu/{menuId}/{page}") 
	public String getListByMenu(@PathVariable int menuId, @PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		model.addAttribute("menuId", menuId);

		List<DinerVO> dinerList = dinerService.selectDinerListbyMenu(menuId, page);
		List<MenuVO> menuList = menuService.selectAllMenu();
		model.addAttribute("dinerList", dinerList);
		model.addAttribute("menuList", menuList);

		// paging start
		int bbsCount = dinerService.selectTotalDinerCountByMenuId(menuId);
		int totalPage = 0;
		if(bbsCount > 0) {
			totalPage= (int)Math.ceil(bbsCount/10.0);
		}
		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page", page);
		return "diner/menu";
	}
	
	@RequestMapping("/diner/menu/{menuId}")
	public String getListByMenu(@PathVariable int menuId, HttpSession session, Model model) {
		return getListByMenu(menuId, 1, session, model);
	}
	
	@RequestMapping("diner/list/{statisticId}/{page}") 
	public String getListByStatistic(@PathVariable String statisticId, @PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		model.addAttribute("statisticId", statisticId);

		List<DinerVO> dinerList = dinerService.selectDinerListbyStatistic(statisticId, page);
		model.addAttribute("dinerList", dinerList);
		logger.info("dinerList:"+dinerList);
		
		List<MenuVO> menuList = menuService.selectAllMenu();
		model.addAttribute("menuList", menuList);
		
		// paging start
		int bbsCount = dinerService.selectTotalDinerCount();
		int totalPage = 0;
		if(bbsCount > 0) {
			totalPage= (int)Math.ceil(bbsCount/10.0);
		}
		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page", page);
		return "diner/list";
	}
	
	@RequestMapping("/diner/list/{statisticId}")
	public String getListByStatistic(@PathVariable String statisticId, HttpSession session, Model model) {
		return getListByStatistic(statisticId, 1, session, model);
	}
	
	@RequestMapping("/diner/search/{page}")
	public String searchDiner(@RequestParam(required=false, defaultValue="") String keyword, @PathVariable int page, HttpSession session, Model model) {
		try {
			List<DinerVO> dinerList = dinerService.searchListByContentKeyword(keyword, page);
			model.addAttribute("dinerList", dinerList);
			logger.info("dinerList:"+dinerList);
			
			List<MenuVO> menuList = menuService.selectAllMenu();
			model.addAttribute("menuList", menuList);
			
			// paging start
			int bbsCount = dinerService.selectTotalDinerCountByKeyword(keyword);
			int totalPage = 0;
			System.out.println(bbsCount);
			if(bbsCount > 0) {
				totalPage= (int)Math.ceil(bbsCount/10.0);
			}
			System.out.println(totalPage);
			model.addAttribute("totalPageCount", totalPage);
			model.addAttribute("page", page);
			model.addAttribute("keyword", keyword);
			logger.info(totalPage + ":" + page + ":" + keyword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "diner/search";
	}
	
	@RequestMapping("/diner/like/{dinerId}")
	public @ResponseBody DinerVO likeDiner(@PathVariable int dinerId, HttpSession session) {
		String sessionUserId = (String)session.getAttribute("userId");
		Diner_LikeVO dinerLike = new Diner_LikeVO();
		dinerLike.setUserId(sessionUserId);
		dinerLike.setDinerId(dinerId);
		dinerService.likeDiner(dinerLike);
		logger.info(dinerLike.toString());
		
		return dinerService.selectDiner(dinerId);
	}
	
}
