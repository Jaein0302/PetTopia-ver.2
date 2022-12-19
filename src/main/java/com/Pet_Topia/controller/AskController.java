package com.Pet_Topia.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.ItemAnswer;
import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.service.AskService;

@Controller
@RequestMapping(value = "/ask")
public class AskController {
	
	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	private AskService askService;
	
	@Autowired
	public AskController(AskService askService) {
		this.askService = askService;
	}
	
	@PostMapping(value = "/add")
	public String ask_add(Model mv,
						  RedirectAttributes rattr,					
						  ItemAsk itemask,
						  HttpServletRequest request,
						  @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		logger.info("referer:" + beforeURL);
				
		int result = askService.insertAsk(itemask); 
		
		if(result == 0) {
			logger.info("상품문의 등록실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "상품문의 실패");
			return "error/error";
		}
		
		logger.info("상품 문의 성공");		
		rattr.addFlashAttribute("result","addSuccess");
		
		return "redirect:" + beforeURL;		
	}
	
	@PostMapping(value = "/update")
	public String updateAsk(
							 ItemAsk itemask,
							 RedirectAttributes rattr,
							 @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		int result = askService.updateAsk(itemask); 
		logger.info("result=" + result);
		
		if (result == 1) {
			rattr.addFlashAttribute("result", "updateSuccess");
		}		

		return "redirect:" + beforeURL;		
	}
	
	@GetMapping("/delete")
	public String delete(int ITEM_ASK_NUM,
						 Model mv, 
						 HttpServletRequest request,
						 RedirectAttributes rattr,
						 @RequestHeader(value = "referer") String beforeURL)throws Exception {

		int result = askService.askDelete(ITEM_ASK_NUM);
		
		//삭제 처리 실패한 경우
		if(result == 0) {
			logger.info("문의 삭제 실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "문의 삭제 실패");
			return "error/error";
		}
		logger.info("문의 삭제 성공");
		rattr.addFlashAttribute("result","deleteSuccess");
		
		return "redirect:" + beforeURL;
	}
	
	@GetMapping("/answer_view")
	public ModelAndView getreplyview(int ITEM_ID,
									ModelAndView mv
								   ) {
				
		int listcount = askService.getAnswerCount(ITEM_ID); //  ask 총 리스트 수	
		List<ItemAsk> asklist = askService.getAskList2(ITEM_ID); // ask 리스트	
		List<String> answercheck = askService.answerCheck(ITEM_ID);  // 답변 유무
		List<ItemAnswer> answerlist = askService.getAnswerList(ITEM_ID);  // 답변 번호, 답변 내용
				
		logger.info(asklist.toString());
		logger.info(answercheck.toString());
		logger.info(answerlist.toString());
		
		mv.addObject("listcount", listcount);
		mv.addObject("asklist", asklist);
		mv.addObject("answercheck", answercheck);
		mv.addObject("answerlist", answerlist);
		mv.setViewName("product/answer_view");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value = "/add_answer")
	public int addAnswer( ItemAnswer answer ) {
		
		int result = askService.addAnswer(answer); 
		logger.info("result=" + result);

		return result;	
	}
	
	@PostMapping(value = "/updateProcess")
	public String updateAnswer(
							 int ITEM_ANSWER_NUM,
							 String ITEM_ANSWER_CONTENT,
							 RedirectAttributes rattr,
							 @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		int result = askService.updateAnswer(ITEM_ANSWER_NUM, ITEM_ANSWER_CONTENT); 
		logger.info("result=" + result);
		
		if (result == 1) {
			rattr.addFlashAttribute("result", "updateSuccess");
		}		

		return "redirect:" + beforeURL;		
	}
	

	//내 문의
	@GetMapping(value ="/myask") 
	public ModelAndView my_product(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
						  String member_id,
						  ModelAndView mv) {
		
		int listcount = askService.getmyListCount(member_id); // 해당하는 리스트만 받아옴

		int limit = 5; // 한 화면에 출력할 로우 갯수
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<ItemAsk> asklist = askService.getAskList3(page, limit, member_id); // 리스트를 받아옴		

		mv.setViewName("product/my_ask");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("asklist", asklist);
		mv.addObject("limit", limit);
		return mv;
	}
	
}
	
	
