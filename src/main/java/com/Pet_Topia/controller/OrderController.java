package com.Pet_Topia.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Review;
import com.Pet_Topia.service.OrderService;
import com.Pet_Topia.service.ReviewService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value = "/order") 
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private OrderService oservice;
	private ReviewService rservice;
	
	@Autowired
	public OrderController(OrderService oservice,ReviewService rservice) {
		this.oservice = oservice;
		this.rservice = rservice;
		
	}
	
	// 예약내역
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(
			@RequestParam("member_id") String member_id,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {

		int limit = 5; // 한 화면에 출력할 로우 갯수
		
		//예약중
		int listcount = oservice.OrderListCount(member_id);
		List<OrderInfo> boardlist = oservice.OrderList(member_id); 
		
		//지난예약
		int lastcount = oservice.LastCount(member_id);
		int maxpage = (lastcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) endpage = maxpage;
		List<OrderInfo> last = oservice.Lastlist(member_id, page, limit);  
		
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		mv.addObject("lastcount", lastcount);
		mv.addObject("last", last);
		mv.addObject("limit", limit);
		mv.setViewName("order/list");
		return mv;
	}
	
	// 리뷰 작성 폼
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public ModelAndView review(ModelAndView mv, int review_item_id,
								String date, String name, int order) {
		System.out.println("review_item_id= "+review_item_id+" / date= "+date+" / name= "+name);
		mv.addObject("review_item_id", review_item_id);
		mv.addObject("date", date);
		mv.addObject("name", name);
		mv.addObject("order", order);
		mv.setViewName("order/review_write");
		return mv;
	}
	
	// 리뷰 쓰기
	@PostMapping("/add")
	public String add(int order,String review_id,Review review, HttpServletRequest request, Model m) throws Exception {
		
		// 이미지 태그를 추출하기 위한 정규식.
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
		// 추출할 내용.
		String content = review.getReview_content();
		// 내용 중에서 이미지 태그를 찾아라!
		Matcher match = pattern.matcher(content);
		String imgTag = null;
		if(match.find()){ // 이미지 태그를 찾았다면,,
		    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
		}
		// 결과값은 name1.jpg
		System.out.println("imgTag : " + imgTag);
		review.setReview_image(imgTag);
		
		// 텍스트만 추출
		String textTag = content.replaceAll("<[^>]*>", "");
		System.out.println("textTag : " + textTag);
		review.setReview_text(textTag);
		
		//리뷰넘버 == 오더넘버
		review.setReview_num(order);
		
		rservice.insert(review); // 저장 메서드 호출
		
		int review_item_id = review.getReview_item_id();
		
		//별점 구하기
		Double star_avg = rservice.starAVG(review_item_id);
		logger.info("평균 별점 : "+star_avg);
		
		//별점 Update
		rservice.starUpdate(review_item_id);
		
		return "redirect:list?member_id="+review_id;
	}
	
	// 썸머노트 이미지 업로드
		@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
		@ResponseBody
		public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

			JsonObject jsonObject = new JsonObject();

			String fileRoot = "C:\\image\\"; // 저장될 외부 파일 경로
			String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			System.out.println(originalFileName);
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

			File targetFile = new File(fileRoot + savedFileName);

			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
				jsonObject.addProperty("url", "/pet_topia/summernoteImage/" + savedFileName);
				jsonObject.addProperty("responseCode", "success");
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			System.out.println(jsonObject);

			return jsonObject;
		}
		
		// 나의 리뷰 게시판
		@GetMapping(value = "/myreview")
		public ModelAndView myreview(
				@RequestParam("member_id") String member_id,
				@RequestParam(value = "page", defaultValue = "1", required = false) int page,
				ModelAndView mv) {
		
			int limit = 10; // 한 화면에 출력할 로우 갯수
			int listcount = rservice.mygetListCount(member_id); // 총 리스트 수를 받아옴
			int maxpage = (listcount + limit - 1) / limit;
			int startpage = ((page - 1) / 10) * 10 + 1;
			int endpage = startpage + 10 - 1;
			if (endpage > maxpage) endpage = maxpage;
			logger.info("아이디는 "+member_id);
			List<Review> boardlist = rservice.mygetBoardList(member_id, page, limit); // 리스트를 받아옴
			mv.setViewName("order/review_mylist");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("boardlist", boardlist);
			mv.addObject("limit", limit);
			return mv;
		}
		
		//리뷰 디테일
		@PostMapping(value="/review_detail")
		@ResponseBody
		public Review review_detail(@RequestParam("review_num") String review_num) {
			Review r = rservice.getDetail(review_num);
			return r;
		}
		
		//리뷰 삭제
		@PostMapping(value="/review_delete")
		@ResponseBody
		public int review_delete(@RequestParam("review_num") String review_num,
								@RequestParam("review_item_id") int review_item_id) {
			int r = rservice.review_del(review_num);
			
			if(r > 0) {
			//별점 구하기
			Double star_avg = rservice.starAVG(review_item_id);
			logger.info("평균 별점 : "+star_avg);
				if(star_avg == null) {
					star_avg = 0.0;
					rservice.starUpdate2(review_item_id, star_avg);
				}else {
					//별점 Update
					rservice.starUpdate(review_item_id);
				}
			}
			return r;
		}
		
		//예약 취소
		@GetMapping(value="/order_delete")
		public String order_delete(String member_id,int order_id, Model model) {
			int result = oservice.order_delete(order_id);
			if(result > 0 ) {
				model.addAttribute("message","삭제성공");
			}else {
				model.addAttribute("message","삭제실패");
			}
			return "redirect:list?member_id="+member_id;
		}
		
		@RequestMapping(value="/order_info")
		public ModelAndView order_info(OrderInfo o, ModelAndView mv) {
			int order_id = o.getOrder_id();
			OrderInfo order = oservice.order_info(order_id);
			OrderInfo last = oservice.order_info_last(order_id);
			mv.setViewName("order/order_info");
			mv.addObject("order", order);
			mv.addObject("last", last);
			return mv;
		}
}
