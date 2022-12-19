package com.Pet_Topia.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;
import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.domain.MySaveFolder;
import com.Pet_Topia.service.AdminAskCommentService;
import com.Pet_Topia.service.AdminAskService;
import com.Pet_Topia.service.AdminService;
import com.Pet_Topia.service.MemberService;
import com.Pet_Topia.task.UserExcelExporter;
import com.Pet_Topia.task.UserPdfExporter;
import com.google.gson.JsonObject;

//@RestController
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

   private AdminService adminservice;
   // 회원 관리 및 공지사항 일반 및 메인 작성 인터페이스

   private AdminAskService adminaskservice;

   private AdminAskCommentService adminaskcommentservice;
   private MemberService mservice;
   private MySaveFolder mysavefolder;

   // 여기서 로직이 어떻게 되는거지?...
   // 생성자를 생성안하고 오토와이저로?..

   public AdminController(AdminService adminservice, AdminAskService adminaskservice,
         AdminAskCommentService adminaskcommentservice, MySaveFolder mysavefolder,MemberService mservice) {
      this.adminservice = adminservice;
      this.adminaskservice = adminaskservice;
      this.adminaskcommentservice = adminaskcommentservice;
      this.mysavefolder = mysavefolder;
      this.mservice = mservice;
      
   }

   @RequestMapping(value = "/admin_list")
   public ModelAndView memberList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
         @RequestParam(value = "limit", defaultValue = "10", required = false) int limit, ModelAndView mv,
         @RequestParam(value = "search_field", defaultValue = "0", required = false) int index,
         @RequestParam(value = "search_word", defaultValue = "", required = false) String search_word,
         Principal userPrincipal)
   {
      
      if(userPrincipal != null) {
         String admin_login = userPrincipal.getName();
         logger.info("admin_login = " + admin_login);
         int listcount = adminservice.getSearchMemberListCount(index, search_word);
         List<Member> list = adminservice.getSearchMemberList(index, search_word, page, limit);

         int maxpage = (listcount + limit - 1) / limit;
         int startpage = ((page - 1) / 10) * 10 + 1;
         int endpage = startpage + 10 - 1;

         if (endpage > maxpage)
            endpage = maxpage;

         mv.setViewName("admin/admin_list");
         mv.addObject("page", page);
         mv.addObject("maxpage", maxpage);
         mv.addObject("startpage", startpage);
         mv.addObject("endpage", endpage);
         mv.addObject("listcount", listcount);
         mv.addObject("memberlist", list);
         mv.addObject("search_field", index);
         mv.addObject("search_word", search_word);
         return mv;
      }else {
         
         logger.info("어드민만 볼수있어요");
         mv.setViewName("redirect:/admin/admin_notice");
         return mv;
      }

   }
   
   
   @GetMapping("/admin_list_info")
   public ModelAndView admin_list_info(String member_id, ModelAndView mv) {
	   Member m = mservice.getMemberdata(member_id);
	   mv.addObject("m",m);
	   mv.setViewName("admin/admin_info");
	   return mv;
   }
   

   // 회원 명단 엑셀 및 pdf 출력
   @GetMapping("/export_excel")
   public void exportToExcel(HttpServletResponse response) throws IOException {
      response.setContentType("application/octet-stream");
      String headerKey = "Content-Disposition";

      DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:MM:ss");
      String currentDateTime = dateFormatter.format(new Date());
      String fileName = "petofia_member" + currentDateTime + ".xlsx";
      String headerValue = "attachment; filename=" + fileName;
      response.setHeader(headerKey, headerValue);
      List<Member> listMembers = adminservice.listAll();

      UserExcelExporter excelExporter = new UserExcelExporter(listMembers);

      excelExporter.export(response);

   }

   @GetMapping("/export_pdf")
   public void exportToPdf(HttpServletResponse response) throws IOException {
      response.setContentType("application/pdf;charset=UTF-8");
      // response.setContentType("application/octet-stream");
      DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
      String currentDateTime = dateFormatter.format(new Date());

      String headerKey = "Content-Disposition";
      String headerValue = "attachment; filename=users_" + currentDateTime + ".pdf";
      response.setHeader(headerKey, headerValue);
      List<Member> listMembers = adminservice.listAll();

      UserPdfExporter exporter = new UserPdfExporter(listMembers);
      exporter.export_pdf(response);

   }

   // 공지사항 게시물 보여주기.
   @RequestMapping(value = "/admin_notice", method = RequestMethod.GET)
   public ModelAndView Admin_notice_board(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
         ModelAndView mv, Principal userPrincipal) {

      // 공지를 불러오는것을 따로 처리

      String division_main = "중요";
      String division = "일반";

      List<Abn> division_main_list = adminservice.getDivisionMain(division_main);
      int limit = 10; // 한 화면에 출력할 로우 갯수
      int listcount = adminservice.getDivisionCount(); //일반만 들어갔을때 listcount가  세고 있고 중요에 대해서는 있어도 listcount가 세지를 못하는데
     
      // 총 페이지 수
      int maxpage = (listcount + limit - 1) / limit;
      // 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
      int startpage = ((page - 1) / 10) * 10 + 1;
      // 현재 페이지에 보여줄 마지막 페이지 수(10,20,30 등..)
      int endpage = startpage + 10 - 1;
      int num = listcount-(page-1)*limit;

      if (endpage > maxpage)
         endpage = maxpage;

      List<Abn> admin_notice_boardlist = adminservice.getAdminNoticeList(page, limit, division); // 리스트를 받아옴

      mv.setViewName("admin/admin_notice");
      mv.addObject("page", page);
      mv.addObject("maxpage", maxpage);
      mv.addObject("startpage", startpage);
      mv.addObject("endpage", endpage);
      mv.addObject("listcount", listcount);
      mv.addObject("admin_notice_boardlist", admin_notice_boardlist);
      mv.addObject("limit", limit);
      mv.addObject("division_main_list", division_main_list);
      mv.addObject("num",num);
      
      return mv;

   }


   // detail?num=9 요청시 파라미터 num의 값을 int num에 저장합니다.
   @GetMapping("/detailNotice")
   public ModelAndView Detail(int num, ModelAndView mv, HttpServletRequest request
   // @RequestHeader(value="referer") String beforeURL
   ) {

      Abn abn = adminservice.getNoticeDetail(num);

      // board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.

      if (abn == null) {
         logger.info("공지사항 글 상세보기 실패");
         mv.setViewName("error/error");
         // mv.addObject("url", request.getRequestURL());
         mv.addObject("message", "상세보기 실패입니다.");
      } else {
         logger.info("공지사항 글 상세보기 성공");
         mv.setViewName("admin/admin_notice_view");
         mv.addObject("abn", abn);
      }
      return mv;

   }//

   // 공지사항 수정을 클릭했을 때

   @GetMapping("/updateNoticeView")
   public ModelAndView BoardModifyView(int num, ModelAndView mv, HttpServletRequest request) {

      Abn abn = adminservice.getNoticeDetail(num);

      // 글 내용을 불러오기 실패하는 경우 입니다
      if (abn == null) {
         logger.info("수정보기 실패");
         mv.setViewName("error/error");
         mv.addObject("url", request.getRequestURI());
         mv.addObject("message", "수정보기 실패입니다");
         return mv;

      }
      logger.info("(수정)상세보기 수정 버튼 클릭시 이동 뷰 ");
      // 수정 폼에지로 이동할때 원문 글 내용을 보여주기 때문에 boarddata 객체를
      // ModelAndView 객체에 저장합니다.
      mv.addObject("abn", abn);
      mv.setViewName("admin/admin_write_notice_detail");
      return mv;

   }

   // 공지사항 글 수정
   // 다른 메서드는 모르겠지만 여기는 무조건 Post로 받아야함.

   @PostMapping(value = "/admin_write_notice_update_Action")
   public String admin_write_notice_update(Abn abn, RedirectAttributes rattr, Model mv, String check,
         HttpServletRequest request) throws Exception

   {

      MultipartFile uploadfile = abn.getUploadfile();
      String url = "";

      if (check != null && !check.equals("")) {// 기존 파일 그대로 사용하는 경우입니다.
         logger.info("기존 파일 그대로 사용합니다.");
         String saveFolder = mysavefolder.getSavefolder();

         abn.setABN_ORIGINAL(saveFolder);
         // <input type = "hidden" name ="BOARD_FILE" value="${boarddata.BOARD_FILE}">
         // 위 문장때문에 board.setBOARD_FILE()값은 자동 저장 됩니다.

      } else {

         if (uploadfile != null && !uploadfile.isEmpty()) {
            logger.info("파일 변경되었습니다.");

            String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
            abn.setABN_ORIGINAL(fileName);
            String saveFolder = mysavefolder.getSavefolder();
            String fileDBName = fileDBName(fileName, saveFolder);
            logger.info("fileDBNAME =" + fileDBName);
            // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
            uploadfile.transferTo(new File(saveFolder + fileDBName));
            logger.info("transferTo path = " + saveFolder + fileDBName);
            // 바뀐파일명으로 저장
            abn.setABN_FILE(fileDBName);

         } else {// 기존파일이 없는데 파일 선택하지 않은 경우 또는 기존파일이 있었는데 삭제한 경우
            logger.info("선택 파일이 없습니다");
            // <input type="hidden" name="BOARD FILE" value="${boarddata.BOARD_FILE">
            // 위 태그의 값이 있다면 ""로 값을 변경합니다.
            abn.setABN_FILE("");
            abn.setABN_ORIGINAL("");
         } // else end

      } // else end

      // DAO에서 수정 메서드를 호출하여 수정합니다.

      int result = adminservice.admin_write_notice_update(abn);

      // 수정에 실패한 경우
      if (result == 0) {
         logger.info("게시판 수정 실패");
         mv.addAttribute("url", request.getRequestURI());
         mv.addAttribute("message", "게시판 수정 실패");
         url = "error/error";

      } else {// 수정 성공한 경우
         logger.info("게시판 수정 완료");
         // 수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기 위해 경로를 설정합니다.
         url = "redirect:admin_notice";
         rattr.addAttribute("num", abn.getABN_NUMBER());

      }
      return url;
   }

   // 공지사항 삭제하기 <a href="detailNotice?num=${abn.ABN_NUMBER}">

   @GetMapping("/deleteNotice")
   public String deleteNotice(int num, HttpServletRequest request, HttpServletResponse response) {

      int deleteNotice = adminservice.deleteNotice(num);

      logger.info("deleteNotice = " + deleteNotice);

      return "redirect:admin_notice";

   }

   // response는 겟으로 간다.. 그러면 재처리방법이 없음..
//                  @PostMapping(value = "/admin_write_notice_update")   
//                  public String admin_write_notice_update(Abn abn, RedirectAttributes re) 
//                                  
//                  {      
//                     
//                     Map<String,Object> map = new HashMap<String,Object>();
//                     
//                     map.put("ABN_SUBJECT", abn.getABN_SUBJECT());
//                     map.put("ABN_CONTENT", abn.getABN_CONTENT());
//                     map.put("ABN_NUMBER", abn.getABN_NUMBER());
//                     re.addFlashAttribute("main", map);
//                     
//                     int admin_write_notice_update = adminservice.admin_write_notice_update(map);
//                     
//                     logger.info("admin_write_notice_update = " + admin_write_notice_update);
//            
//                     return "redirect:/admin_notice";
//                     
//                  }

   // 공지사항 글 제출시 쓰는 형식
//            <select id="viewcount" name="search_field">
//            <option value="main" >공지</option>
//            <option value="all" selected>일반</option>
   //
//         </select>

   // <a href="deleteNotice?num=${abn.ABN_NUMBER}"> 글 삭제

//   @GetMapping("/deleteNotice")
//   public String deleteNotice(int num, HttpServletRequest request
//   // @RequestHeader(value="referer") String beforeURL
//   ) {
//
//      
//
//   }// 
//   

   // 글쓰기
   @PostMapping("/admin_write_notice")
   public String admin_write_notice(Abn abn, HttpServletRequest request,

         @RequestParam(value = "ABN_DIVISION", defaultValue = "all", required = false) String ABN_DIVISION,
         ModelAndView mv

   ) throws Exception {

      try {

         // 일반 및 공지 확인
         logger.info("ABN_DIVISION = " + ABN_DIVISION);
         MultipartFile uploadfile = abn.getUploadfile();

         if (!uploadfile.isEmpty()) {
            String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
            abn.setABN_ORIGINAL(fileName);

            String saveFolder = mysavefolder.getSavefolder();
            String fileDBName = fileDBName(fileName, saveFolder);

            logger.info("fileName=" + fileName);
            logger.info("mysavefolder=" + mysavefolder);
            logger.info("saveFolder=" + saveFolder);
            logger.info("fileDBName = " + fileDBName);

            uploadfile.transferTo(new File(saveFolder + fileDBName));
            logger.info("transferTo path = " + saveFolder + fileDBName); // 바뀐 파일명으로 저장
            abn.setABN_FILE(fileDBName);
         }

         // 이미지 태그를 추출하기 위한 정규식.
         Pattern pattern = Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
         // 추출할 내용.
         String content = abn.getABN_CONTENT();
         // 내용 중에서 이미지 태그를 찾아라!
         Matcher match = pattern.matcher(content);
         String imgTag = null;
         if (match.find()) { // 이미지 태그를 찾았다면,,
            imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
         }
         // 결과값은 name1.jpg
         System.out.println("imgTag : " + imgTag);

         adminservice.admin_write_notice(abn); // 저장 메서드 호출

         return "redirect:admin_notice";

      } catch (Exception e) {
         logger.info("글쓰기 에러 " + e);
         return "redirect:admin_notice";

      }

   }

   private String fileDBName(String fileName, String saveFolder) {
      // 새로운 폴더 이름 : 오늘 년+월+일
      Calendar c = Calendar.getInstance();
      int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
      int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
      int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

      String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
      logger.info(homedir);
      File path1 = new File(homedir);
      if (!(path1.exists())) {
         path1.mkdir(); // 새로운 폴더를 생성
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
      /*** 확장자 구하기 끝 ***/

      // 새로운 파일명
      String refileName = "bbs" + year + month + date + random + "." + fileExtension;
      logger.info("refileName = " + refileName);

      // 오라클 디비에 저장될 파일 명
      // String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
      String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
      logger.info("fileDBName = " + fileDBName);
      return fileDBName;
   }

   // 메인페이지
   @RequestMapping(value = "/admin_main", method = RequestMethod.GET)
   public String main() {
      return "admin/admin_main";
   }
   
   
   @GetMapping(value = "/admin_ask_list")
   public ModelAndView admin_ask_list_main(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
	         @RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
	         // 왜 limit를 3으로 했을때 jsp에서 2개만 보이는걸까?
	         ModelAndView mv, Principal userPrincipal,
	         @RequestParam(value = "search_field_one", defaultValue = "0", required = false) int search_field_one,
	         //-1이면 jsp에서 전체보기가 셀렉트됨.
	         @RequestParam(value = "search_field_two", defaultValue = "0", required = false) int search_field_two,
	         //-1이면 
	         @RequestParam(value = "search_word", defaultValue = "", required = false) String search_word,
	         RedirectAttributes rattr) {
	   
	   
	   if(userPrincipal != null) {
		   
	   
		   
		if(userPrincipal.getName().equals("admin")) {   
	   logger.info("admin_ask_list 화면입니다 겟맵핑 ");
	   List<Aam> list = adminaskservice.getAskColumnList(page,limit,search_field_one,search_field_two,search_word);
       
       int listcount = adminaskservice.getAskColumnListCount(search_field_one,search_field_two,search_word);
        int maxpage = (listcount + limit - 1) / limit;
       int startpage = ((page - 1) / 10) * 10 + 1;
       int endpage = startpage + 10 - 1;
       int num = listcount-(page-1)*limit;

        if (endpage > maxpage)
        endpage = maxpage;

        logger.info("page 확인용 " + page);
        logger.info("startpage 확인용 " + startpage);
        logger.info("endpage 확인용 " + endpage);
        logger.info("listcount 확인용 " + listcount);
        logger.info("maxpage 확인용 " + maxpage);
        
        
       mv.setViewName("admin/admin_ask_list");
       mv.addObject("page", page);
       mv.addObject("startpage", startpage);
       mv.addObject("endpage", endpage);
       mv.addObject("listcount", listcount);
       mv.addObject("maxpage", maxpage);
       mv.addObject("list", list);
       mv.addObject("num",num);
       mv.addObject("search_field_one",search_field_one);
       mv.addObject("search_field_two",search_field_two);
       mv.addObject("search_word",search_word);
       
       
       return mv;
       
		}else {
			logger.info("admin_ask_list 개인 유저 로그인 화면입니다");
			String login_id = userPrincipal.getName();
			List<Aam> list = adminaskservice.getAskMemberOwnList(page,limit,login_id);
		       int listcount = adminaskservice.getAskMemberOwnListCount(login_id);
			  int maxpage = (listcount + limit - 1) / limit;

		       int startpage = ((page - 1) / 10) * 10 + 1;

		       int endpage = startpage + 10 - 1;
		       int num = listcount-(page-1)*limit;
		       
		        if (endpage > maxpage)
		        endpage = maxpage;

		       mv.setViewName("admin/admin_ask_list");
		       mv.addObject("page", page);
		       mv.addObject("startpage", startpage);
		       mv.addObject("endpage", endpage);
		       mv.addObject("listcount", listcount);
		       mv.addObject("maxpage", maxpage);
		       mv.addObject("list", list);
		       mv.addObject("num",num);
		         mv.addObject("search_field_one",search_field_one);
		         mv.addObject("search_field_two",search_field_two);
		         mv.addObject("search_word",search_word);
		         
		       return mv;
		}
	   }else {
		   mv.setViewName("redirect:/main/main");
		   rattr.addFlashAttribute("login_check", "로그인하세요");
		   return mv;
		   
	   }
	   
	   
	   
	   
   }
   
   
   
   
   
   
   
   
   // 1:1 문의글을 불러오기에서 검색을 했을 때.
   @PostMapping(value = "/admin_ask_list_post")
   public ModelAndView admin_ask_list(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
         @RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
         // 왜 limit를 3으로 했을때 jsp에서 2개만 보이는걸까?
         ModelAndView mv, Principal userPrincipal,
         @RequestParam(value = "search_field_one", defaultValue = "0", required = false) int search_field_one,
         //-1이면 jsp에서 전체보기가 셀렉트됨.
         @RequestParam(value = "search_field_two", defaultValue = "0", required = false) int search_field_two,
         //-1이면 
         @RequestParam(value = "search_word", defaultValue = "", required = false) String search_word,
         RedirectAttributes rattr) {

	
	   
      if (userPrincipal == null) {

         rattr.addFlashAttribute("login_check", "로그인하세요");
         mv.setViewName("redirect:/main/main");

         return mv;

      } else if (userPrincipal.getName().equals("admin")) {
         // 관리자는
         // 1. 전체보기, 답변 대기, 답변 완료를 볼수 있다.
    	  logger.info("어드민 검색 POST ");
    	  
    	 
         List<Aam> list = adminaskservice.getAskColumnList(page,limit,search_field_one,search_field_two,search_word);
         
         int listcount = adminaskservice.getAskColumnListCount(search_field_one,search_field_two,search_word);
         int maxpage = (listcount + limit - 1) / limit;
         int startpage = ((page - 1) / 10) * 10 + 1;
         int endpage = startpage + 10 - 1;
         int num = listcount-(page-1)*limit;
          if (endpage > maxpage)
          endpage = maxpage;

         mv.setViewName("admin/admin_ask_list");
         mv.addObject("page", page);
         mv.addObject("startpage", startpage);
         mv.addObject("endpage", endpage);
         mv.addObject("listcount", listcount);
         mv.addObject("maxpage", maxpage);
         mv.addObject("list", list);
         mv.addObject("num",num);
         mv.addObject("search_field_one",search_field_one);
         mv.addObject("search_field_two",search_field_two);
         mv.addObject("search_word",search_word);
         return mv;

      } else {
    	  logger.info("일반회원 고객센터 접속");
    	  String login_id =userPrincipal.getName(); 
    	  List<Aam> list = adminaskservice.getAskMemberOwnList(page,limit,login_id);
         int listcount = adminaskservice.getAskMemberOwnListCount(login_id);
          int maxpage = (listcount + limit - 1) / limit;
         int startpage = ((page - 1) / 10) * 10 + 1;
         int endpage = startpage + 10 - 1;
         int num = listcount-(page-1)*limit;
         
          if (endpage > maxpage)
          endpage = maxpage;
         mv.setViewName("admin/admin_ask_list");
         mv.addObject("page", page);
         mv.addObject("startpage", startpage);
         mv.addObject("endpage", endpage);
         mv.addObject("listcount", listcount);
         mv.addObject("maxpage", maxpage);
         mv.addObject("list", list);         
         mv.addObject("num",num);
         mv.addObject("search_field_one",search_field_one);
         mv.addObject("search_field_two",search_field_two);
         mv.addObject("search_word",search_word);
         
         
         return mv;

      }

   }

   //@RequestMapping(value = "/user", method = RequestMethod.POST)
//   @ResponseBody
//   @PostMapping(value = "/comment_add")
   
   @ResponseBody
   @RequestMapping(value = "/comment_add", method = RequestMethod.POST)
   public String Admin_ask_commnet(Aac aac)

   {
	   
	  int comment_add_number =  aac.getAAC_NUMBER();
	  String AAC_CONTENT = aac.getAAC_CONTENT();
	  logger.info("AAC_CONTENT 555555 = "+AAC_CONTENT);
	  logger.info("확인용 ㅈㅇㅈㅇㅈㅇㅈ" + comment_add_number);

      int AnswerUpdate = adminaskservice.AnswerUpdate(comment_add_number);

      logger.info("확인용 : comment_add : " + comment_add_number);
      logger.info("확인용 : AnswerUpdate : " + AnswerUpdate);

       adminaskcommentservice.Admin_ask_comment(aac);
       return "redirect:/admin/AskToAdminView?num="+comment_add_number;
       
   }
   
   

   @PostMapping(value = "/comment_update")
   public ModelAndView Admin_ask_commnet_update(Aac aac,ModelAndView mv)

   {
		  int comment_add_number =  aac.getAAC_NUMBER();
      logger.info("확인용 : comment_add");
      adminaskcommentservice.Admin_ask_comment_update(aac);
   
      mv.setViewName("redirect:/admin/admin_notice");
      return mv;
   }

   //고객센터 글쓰기
   @RequestMapping(value = "/admin_ask_to_admin", method = RequestMethod.GET)
   public ModelAndView admin_ask_to_admin(ModelAndView mv, Principal userPrincipal, HttpServletResponse response) {

      
      if(userPrincipal == null) {
         mv.setViewName("redirect:/admin/admin_notice");
         return mv;
         
      }else {
         mv.setViewName("admin/admin_ask_write");
         logger.info("userPrincipal.getName() "+ userPrincipal.getName());
         return mv;
      }

   }
   
   // 고객센터 insert
   @PostMapping(value = "/write_to_admin_form")
   public ModelAndView write_to_admin_form(Aam aam, ModelAndView mv, Principal userPrincipal){
      
      int write_to_admin_form = adminaskservice.write_to_admin_form(aam);
      logger.info("확인용 : write_to_admin_form : " + write_to_admin_form);
      
      mv.setViewName("redirect:/admin/admin_ask_list");
      return mv;
   }
   

   @GetMapping(value = "/admin_ask_list_main")
   public ModelAndView admin_ask_list_main(ModelAndView mv) {
      mv.setViewName("admin/admin_ask_list_main");
      return mv;
   }

   @GetMapping(value = "/admin_write_notice")
   public ModelAndView admin_write_notice(ModelAndView mv) {
      mv.setViewName("admin/admin_write_notice");
      return mv;
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
	
	//1:1문의 글 클릭시 보여줄 뷰.
	
	   @GetMapping("/AskToAdminView")
	   public ModelAndView AskToAdminView(int num, ModelAndView mv, HttpServletRequest request
	   // @RequestHeader(value="referer") String beforeURL
	   ) {

	      Aam aam = adminaskservice.ask_to_admin_view(num);
	      Aac aac = adminaskcommentservice.getComment(num);
	      
	      
	      // board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.

	      if (aam == null) {
	         logger.info("1:1문의 글 상세보기 실패");
	         mv.setViewName("error/error");
	         // mv.addObject("url", request.getRequestURL());
	         mv.addObject("message", "상세보기 실패입니다.");
	      } else {
	         logger.info("1:1문의 글 상세보기 성공");
	         mv.setViewName("admin/admin_ask_view");
	         mv.addObject("Aam", aam);
	         mv.addObject("Aac", aac);
	      }
	      return mv;

	   }//
	
	   
	   
	   @GetMapping("/commentView")
	   public ModelAndView commentView(int num, ModelAndView mv, HttpServletRequest request
	   // @RequestHeader(value="referer") String beforeURL
	   ) {

	      Aam aam = adminaskservice.ask_to_admin_view(num);

	      // board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.

	      if (aam == null) {
	         logger.info("1:1문의 글 상세보기 실패");
	         mv.setViewName("error/error");
	         // mv.addObject("url", request.getRequestURL());
	         mv.addObject("message", "상세보기 실패입니다.");
	      } else {
	         logger.info("1:1문의 글 상세보기 성공");
	         mv.setViewName("admin/admin_ask_view");
	         mv.addObject("Aam", aam);
	      }
	      return mv;

	   }//
	   
	   
	  
	
	
	

}