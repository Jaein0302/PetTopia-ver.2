package com.Pet_Topia.controller;

import java.io.File;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.ItemAnswer;
import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.domain.MySaveFolder;
import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Review;
import com.Pet_Topia.domain.Wish;
import com.Pet_Topia.service.AskService;
import com.Pet_Topia.service.MemberService;
import com.Pet_Topia.service.ProductService;
import com.Pet_Topia.service.ReviewService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	private ProductService productService;
	private AskService askService;
	private MemberService memberservice;
	private MySaveFolder mysavefolder;
	private ReviewService rservice;
	
	@Autowired
	public ProductController(ProductService productService,
							 MySaveFolder mysavefolder,
							 AskService askService,
							 ReviewService rservice,
							 MemberService memberservice) {
		this.productService = productService;
		this.memberservice = memberservice;
		this.askService = askService;
		this.mysavefolder = mysavefolder;
		this.rservice = rservice;
	}
	
	@RequestMapping(value ="/product_list")
	public ModelAndView productlist(
			@RequestParam(value="item_category") String category,
			@RequestParam(value="search_field", defaultValue="-1", required = false) int index,
			@RequestParam(value="search_word",  defaultValue="",   required = false) String search_word,
			ModelAndView mv
			) {
		logger.info("item_category= " + category);
		logger.info("search_field= " + index);
		logger.info("search_word= " + search_word);
		
		
		List<Product> list = productService.getSearchList(category, index, search_word);


		mv.addObject("category", category);
		mv.addObject("productlist", list);
		mv.setViewName("product/product_list");
		return mv;
	}	
	
	//productlist 검색기능
	@ResponseBody
	@PostMapping(value ="/search") 
	public Map<String, Object> search(
				@RequestParam(value = "ITEM_SEX", defaultValue = "", required = false) String ITEM_SEX,
				@RequestParam(value = "ITEM_WEIGHT", defaultValue = "", required = false) String ITEM_WEIGHT,
				@RequestParam(value = "ITEM_SPECIES", defaultValue = "", required = false) String ITEM_SPECIES
				) {
		
				logger.info("ITEM_SEX= " + ITEM_SEX);
				logger.info("ITEM_WEIGHT= " + ITEM_WEIGHT);
				logger.info("ITEM_SPECIES= " + ITEM_SPECIES);
			
				List<Product> list = productService.getListAjax(ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES);
				
				logger.info(list.toString());
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				return map;
			}

	//상품 상세보기 페이지
	@GetMapping(value ="/detail")
	public ModelAndView productdetail(
					@RequestParam(value="ITEM_ID", required = false) int ITEM_ID,
					@RequestParam(value = "page", defaultValue = "1", required = false) int page,
					ModelAndView mv			
					) {
		
		//product_detail.jsp 화면
		Product product = productService.getDetail(ITEM_ID);
		
		if(product == null) {
			logger.info("상세페이지 보기 실패");
			mv.setViewName("error/error");
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			logger.info("상세페이지 보기 성공");
			mv.setViewName("product/product_detail");
			mv.addObject("productdata", product);
		}
		
		//ask.view.jsp(상품문의)에 값 전달
		int limit = 10; // 한 화면에 출력할 로우 갯수
		int listcount = askService.getListCount(product); // 총 리스트 수를 받아옴
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;
		
		List<ItemAsk> asklist = askService.getAskList(page, limit, product); // 리스트를 받아옴
		
		//답변여부
		List<String> answercheck = askService.answerCheck(ITEM_ID);  // 답변 유무
		
		//답변내용
		List<ItemAnswer> answerlist = askService.getAnswerList(ITEM_ID);  // 답변 리스트 받아옴
		
		//리뷰게시판
		int rlistcount = rservice.getListCount(ITEM_ID);
		List<Review> rlist = rservice.getBoardList(ITEM_ID,page, limit);
		List<Review> photo = rservice.getPhoto(ITEM_ID); 
		
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("rlistcount", rlistcount);
		mv.addObject("rlist", rlist);
		mv.addObject("photo", photo);
		mv.addObject("listcount", listcount);
		mv.addObject("asklist", asklist);
		mv.addObject("limit", limit);
		mv.addObject("answercheck", answercheck);
		mv.addObject("answerlist", answerlist);
		
		
		return mv;
		
	}
	
	//상품 등록하기 페이지
	@GetMapping(value ="/my_product") 
	public ModelAndView my_product(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
						  String member_id,
						  ModelAndView mv) {
		
		int listcount = productService.getmyListCount(member_id); // 해당하는 리스트만 받아옴

		int limit = 5; // 한 화면에 출력할 로우 갯수
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Product> productlist = productService.getProductList(page, limit, member_id); // 리스트를 받아옴		

		mv.setViewName("product/my_product");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("productlist", productlist);
		mv.addObject("limit", limit);
		return mv;
	}

	//상품 등록하기
	@PostMapping(value ="/add")
	public String add_product(Model mv,
							  RedirectAttributes rattr,
							  Product product,
							  String member_id,
							  HttpServletRequest request) throws Exception {

		//MultipartFile을 product 객체의 필드에 저장
		MultipartFile uploadfile = product.getUploadfile();

		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
			product.setITEM_IMAGE_ORIGINAL(fileName); // 원래 파일명 저장
			String saveFolder = mysavefolder.getSavefolder();

			logger.info("fileName=" + fileName);
			logger.info("mysavefolder=" + mysavefolder);
			logger.info("saveFolder=" + saveFolder);
			/*
			  String saveFolder =
			  request.getSession().getServletContext().getRealPath("resources") +
			  "/upload";
			 */
			String fileDBName = fileDBName(fileName, saveFolder);
			String fileDBNameReplace = fileDBName.replace("\\","/");
			logger.info("fileDBName = " + fileDBName);
			logger.info("fileDBNameReplace = "+ fileDBNameReplace);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			logger.info("transferTo path = " + saveFolder + fileDBName);
			// 바뀐 파일명으로 저장
			product.setITEM_IMAGE_FILE(fileDBNameReplace);
		}

		logger.info(product.toString());

		/** MEMBER_ADDRESS값 가져오기 **/
		String ITEM_SELLER  = product.getITEM_SELLER();
		Member memberlist = memberservice.member_info(ITEM_SELLER);
		String ITEM_ADDRESS = memberlist.getMember_address();
		product.setITEM_ADDRESS(ITEM_ADDRESS);

		/** db에 저장 **/
		int result = productService.insertProduct(product, member_id);

		if(result == 0) {
			logger.info("상품 등록실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "상품 등록 실패");
			return "error/error";
		}

		logger.info("상품 등록 성공");
		rattr.addFlashAttribute("result","addSuccess");



		return "redirect:my_product?member_id="+member_id;
	}
	
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		// 새로운 폴더를 생성
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}

		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		/**** 확장자 구하기 시작 ****/
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
		logger.info("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/*** 확장자 구하기 끝(jpg 구하기) ***/

		// 새로운 파일명
		String refileName = "product" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);

		// 오라클 디비에 저장될 파일 명
		// String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	
	
	//업데이트 화면
	@GetMapping(value = "/update_view")
	public ModelAndView modifyView(
						int ITEM_ID, 
						ModelAndView mv,
						HttpServletRequest request) {
	
		Product productdata = productService.getDetail(ITEM_ID);
	
		//글 내용 불러오기 실패
		if(productdata == null) {
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","수정보기 실패입니다.");
			return mv;
		}
		
		logger.info("(수정)상세보기 성공");
		mv.setViewName("product/update_view");
		mv.addObject("productdata", productdata);
		return mv;
	}
	
	
	@PostMapping("/update")
	public String BoardModifyAction(Model mv, 
						  RedirectAttributes rattr, 
						  Product product, 
						  HttpServletRequest request, Principal p) throws Exception {
		
		MultipartFile uploadfile = product.getUploadfile();
		
		if (!uploadfile.isEmpty()) {
		String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
		product.setITEM_IMAGE_ORIGINAL(fileName); // 원래 파일명 저장
		String saveFolder = mysavefolder.getSavefolder();
		
		logger.info("fileName=" + fileName);
		logger.info("mysavefolder=" + mysavefolder);
		logger.info("saveFolder=" + saveFolder);

		String fileDBName = fileDBName(fileName, saveFolder);
		logger.info("fileDBName = " + fileDBName);
		
		// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
		uploadfile.transferTo(new File(saveFolder + fileDBName));
		logger.info("transferTo path = " + saveFolder + fileDBName);
		// 바뀐 파일명으로 저장
		product.setITEM_IMAGE_FILE(fileDBName);
		}
		
		logger.info(product.toString());// selectKey로 정의한 BAORD_NUM 값 확인해 봅니다.
		int result = productService.productUpdate(product); // 저장 메서드 호출
		
		if(result == 0) {
		logger.info("상품 수정 실패");
		mv.addAttribute("url",request.getRequestURL());
		mv.addAttribute("message", "상품 수정 실패");
		return "error/error";
		}
		
		logger.info("상품 수정 성공");		
		rattr.addFlashAttribute("result","updateSuccess");
		
		String id = (String) p.getName(); 
		return "redirect:my_product?member_id="+id;
		}

	
	@GetMapping("/delete")
	public String delete(int ITEM_ID,
						 Model mv, 
						 HttpServletRequest request,
						 RedirectAttributes rattr, Principal p) {

		int result = productService.productDelete(ITEM_ID);
		
		//삭제 처리 실패한 경우
		if(result == 0) {
			logger.info("상품 삭제 실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "상품 삭제 실패");
			return "error/error";
		}
		logger.info("게시판 삭제 성공");
		rattr.addFlashAttribute("result","deleteSuccess");
		
		String id = (String) p.getName();
		return "redirect:my_product?member_id="+id;
	}
	
	@GetMapping("/order_view")
	public ModelAndView purchase_view(int ITEM_ID,
									 String member_id,
									 ModelAndView mv, 
									 HttpServletRequest request) {

		Product productdata = productService.getDetail(ITEM_ID);		
		
		//글 내용 불러오기 실패
		if(productdata == null) {
			logger.info("구매페이지보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","수정보기 실패입니다.");
			return mv;
		}
		
		logger.info("구매페이지보기 성공");		
		Member memberlist = memberservice.member_info(member_id);		
  
		mv.setViewName("product/order_view");
		mv.addObject("productdata", productdata);
		mv.addObject("memberlist", memberlist);
		return mv;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/purchase")
	public int purchase_view(OrderInfo orderinfo) {

		int result = productService.OrderInsert(orderinfo);
		return result;
	}
	
	
  
	/**나의 찜 목록으로 이동**/
	@RequestMapping(value ="/goToMyWishList")
	public ModelAndView my_wish_list(
										@RequestParam(value = "member_id") String member_id,
										@RequestParam(value = "page", defaultValue = "1", required = false) int page,
										ModelAndView mv
									) {	
		
		int limit = 10; // 한 화면에 출력할 로우 갯수
		int listcount = productService.getMyWishCount(member_id); // 나의 찜목록 갯수
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) endpage = maxpage;
		
		List<Wish> wishList = productService.getMyWishList(member_id, page, limit); //찜목록 리스트
		mv.setViewName("product/wish_list");//order/review_mylist 참고
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("wishList", wishList);
		mv.addObject("limit", limit);
		
		return mv;
		
	}
  
	/**찜목록에 상품이 있는지 확인하기**/
	@RequestMapping(value = "/is_inmywish")
	public void is_inmywish(@RequestParam(value="ITEM_ID") int iTEM_ID, Principal principal,
								HttpServletResponse response) throws Exception {
		//지금 로그인된 아이디
		String member_id = (String) principal.getName();
		logger.info("!!!!Current Login id : " + member_id);
		
		//사용자의 찜목록에 아이템이 있는지 확인, 없으면 null
		Integer result = productService.checkWish(iTEM_ID, member_id);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}
	
	/** 찜 목록에 상품 추가 **/
	@RequestMapping(value = "addWish")
	public void addWish(@RequestParam(value = "ITEM_ID") int item_id, Principal principal,
										HttpServletResponse response, Wish wishItem) throws Exception {
		
		//현재 로그인 아이디
		String member_id = (String) principal.getName();
		
		Product product = productService.getDetail(item_id);
		
		//매퍼에서 wish id는 시퀀스로 넣고 , rsvdate는 sysdate로 넣자 
		wishItem.setWISH_ITEM_ID(product.getITEM_ID());//productdata.getter 메서드로 가져오자
		wishItem.setWISH_ITEM_IMAGE(product.getITEM_IMAGE_FILE());
		wishItem.setWISH_ITEM_NAME(product.getITEM_NAME());
		wishItem.setWISH_ITEM_PRICE(product.getITEM_PRICE());
		wishItem.setWISH_MEMBER_ID(member_id);
		
		int result = productService.WishInsert(wishItem);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}
	
	/**찜 목록에서 상품 삭제**/
	@RequestMapping(value = "deleteWish")
	public void addWish(@RequestParam(value="WISH_ID") int wish_id,
							HttpServletResponse response) throws Exception{
		
		
		int result = productService.deleteWish(wish_id);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
	
	

