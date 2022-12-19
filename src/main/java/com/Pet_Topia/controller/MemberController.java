package com.Pet_Topia.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.MailVO;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.service.MemberService;
import com.Pet_Topia.task.SendMail;

@Controller
@RequestMapping(value = "/main") 
public class MemberController {
	// import org.slf4j.Logger;
	// import org.slf4j.LoggerFactory;
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	
	private MemberService memberservice;
	private PasswordEncoder passwordEncoder;
	private SendMail sendMail;
	
	@Autowired
	public MemberController(MemberService memberservice,
			PasswordEncoder passwordEncoder,SendMail sendMail) {
		this.memberservice = memberservice;
		this.passwordEncoder = passwordEncoder;
		this.sendMail = sendMail;
		
	}
	
	//메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		List<Product> list = null;
		list = memberservice.best_item();
		mv.setViewName("member/main");
		mv.addObject("list",list);
		return mv;
	}
	
	//로그인에러시
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login_form";
	}
	
	//회원가입 선택지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/Join/join_member";
	}
	
	//개인 회원가입 1. 이용약관
	@RequestMapping(value = "/join_customer_step1", method = RequestMethod.GET)
	public String join_customer_step1(@RequestParam(value="agree", required=false) String agree,Model m) {
		m.addAttribute("agree",agree);
		return "member/Join/join_customer_step1";
	}
	//개인 회원가입 2. 본인인증
	@RequestMapping(value = "/join_customer_step2", method = RequestMethod.POST)
	public String join_customer_step2() {
		return "member/Join/join_customer_step2";
	}
	
	//개인 회원가입 2. 본인인증 - 인증코드 발송
	@PostMapping(value="/mail_code")
	@ResponseBody
	public  Map<String,String> mail_code(String member_email) {
		
		int result = memberservice.mail_code(member_email);
		
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str = "";
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
		
        String msgg = "";
        msgg+= "<div align='center' style='border:1px solid silver;width:900px;font-family:verdana';>";
        msgg+= "<h3 style='color:gray;'>아래 코드를 회원가입 창으로 돌아가 입력해주세요</h3>";
        msgg+= "<div style='font-size:130%'>";
        msgg+= "CODE : <strong>";
        msgg+= str+"</strong><div>";
        
        Map<String, String> map = new HashMap<String,String>(); 
        
				if(result==-1) {
					MailVO vo = new MailVO();
					vo.setTo(member_email);
					vo.setSubject("반려동물 서비스 제휴 사이트 <펫토피아> 가입 인증코드 입니다.");
					vo.setContent(msgg);
					sendMail.sendMail(vo);
					map.put("code",str);
					map.put("message","success");
				}else {
					map.put("message","fail");
				}
		return map;
	}
	
	//개인 회원가입 3. 정보입력
	@RequestMapping(value = "/join_customer_step3", method = RequestMethod.POST)
	public String customer_join(String member_email, Model m) {
		m.addAttribute("member_email",member_email);
		return "member/Join/join_customer_step3";
	}
	
	//기업 회원가입 1. 이용약관
	@RequestMapping(value = "/join_business_step1", method = RequestMethod.GET)
	public String join_business_step1(@RequestParam(value="agree", required=false) String agree,Model m) {
		m.addAttribute("agree",agree);
		return "member/Join/join_business_step1";
	}
	
	//기업 회원가입 2. 사업자 인증
	@RequestMapping(value = "/join_business_step2", method = RequestMethod.POST)
	public String join_business_step2() {
		return "member/Join/join_business_step2";
	}
	
	//기업 회원가입 3. 정보입력
	@RequestMapping(value = "/join_business_step3", method = RequestMethod.POST)
	public String business_join(String member_name,String member_btype, String member_regnum,Model m) {
		m.addAttribute("member_name",member_name);
		m.addAttribute("member_btype",member_btype);
		m.addAttribute("member_regnum",member_regnum);
		return "member/Join/join_business_step3";
	}
	
	//회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("id") String member_id, 
						HttpServletResponse response) throws Exception {
		int result = memberservice.isId(member_id);
		Logger.info("idcheck");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	//회원가입폼에서 사업자등록번호 검사
		@RequestMapping(value = "/regnum_check", method = RequestMethod.GET)
		public void regnum_check(@RequestParam("reg_num") String member_regnum, 
							HttpServletResponse response) throws Exception {
			int result = memberservice.isRegnum(member_regnum);
			Logger.info("regnum_check");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(result);
		}
	
	//회원가입
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String joinProcess(Member m, String auth,
							RedirectAttributes rattr,
							Model model,
							HttpServletRequest request) {
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(m.getMember_password());
		Logger.info(encPassword);
		m.setMember_password(encPassword);
		
		if(auth=="") {
			m.setAuth("ROLE_SELLER");
		}
		
		int result = memberservice.insert(m);
		
		//삽입이 된 경우
		if(result==1) {
			
	        String msgg = "";
	        msgg+= "<div align='center' style='border:1px solid silver;width:900px;font-family:verdana';>";
	        msgg+= "<h3 style='color:gray;'><b>"+m.getMember_id() +"</b>님 가입을 축하드립니다! </h3>";
	        msgg+= "<p style='padding-top:10px'><a href='http://localhost:9600/pet_topia/'><b>홈페이지 바로가기</b></a></p><div>";
	        
			
			MailVO vo = new MailVO();
			vo.setTo(m.getMember_email());
			vo.setContent(msgg);
			sendMail.sendMail(vo);
			
			rattr.addFlashAttribute("message","JoinSuccess");
			return "redirect:main";
		}else {
			model.addAttribute("url",request.getRequestURL());
			model.addAttribute("message","회원 가입 실패");
			return "error/error";
		}
	}
	
	//아이디 / 비밀번호 찾기 폼
	@RequestMapping(value = "/Find_user", method = RequestMethod.GET)
	public String Find_id_pass() {
				return "member/Find_user/Find_id_pass";
		}
		
	//아이디 찾기
	@GetMapping(value="/Find_id")
	public ModelAndView Find_id(String member_name,String member_email,
			ModelAndView mv) {
			String id = memberservice.find_id(member_name, member_email);
			if(id!=null) {
				mv.setViewName("member/Find_user/Find_id_success");
				mv.addObject("member_id",id);
			}else {
				mv.addObject("message","fail");
				mv.setViewName("member/Find_user/Find_id_pass");
			}
		return mv;
	}
	
	//비밀번호 찾기
	@PostMapping(value="/Find_pass")
	public ModelAndView Find_pass(String member_id,String member_name,String member_email, 
			ModelAndView mv,
			HttpServletRequest request) {
		
		int result = memberservice.find_pass(member_id, member_name, member_email);
		
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str = "";
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
		
        String msgg = "";
        msgg+= "<div align='center' style='border:1px solid silver;width:900px;font-family:verdana';>";
        msgg+= "<h3 style='color:gray;'><b>"+member_id +"</b>님의 임시비밀번호 입니다.</h3>";
        msgg+= "<div style='font-size:130%'>";
        msgg+= "CODE : <strong>";
        msgg+= str+"</strong><p style='padding-top:10px'><a href='http://localhost:9600/pet_topia/'><b>홈페이지 바로가기</b></a></p><div>";
        
				if(result==1) {
					MailVO vo = new MailVO();
					vo.setTo(member_email);
					vo.setSubject("<펫토피아> 임시 비밀번호 발송 메일");
					vo.setContent(msgg);
					sendMail.sendMail(vo);
					//임시비밀번호로 업데이트
					String Password = passwordEncoder.encode(str);
					memberservice.update_pass(Password, member_id);
					mv.setViewName("member/Find_user/Find_pass_success");
					mv.addObject("member_email",member_email);
				}else {
					mv.addObject("message","fail");
					mv.setViewName("member/Find_user/Find_id_pass");
				}
				return mv;
	}
	


	//통합검색
	@GetMapping(value = "/search_item")
	public ModelAndView searchitem(@RequestParam("item") String item,ModelAndView mv) {
		int lc = 0;int tc = 0;int ec = 0;int bc = 0;
		List<Product> list = null;
		list = memberservice.search_item(item);
		lc = memberservice.search_item_count(item);
		
		List<Product> tlist = null;
		tlist = memberservice.search_treat(item);
		tc = memberservice.search_treat_count(item);
		
		List<Product> elist = null;
		elist = memberservice.search_edu(item);
		ec = memberservice.search_edu_count(item);
		
		List<Product> blist = null;
		blist = memberservice.search_beauty(item);
		bc = memberservice.search_beauty_count(item);
		
		mv.setViewName("member/Search_item/Search_item");
		mv.addObject("item",item);
		mv.addObject("p",list);
		mv.addObject("t",tlist);
		mv.addObject("e",elist);
		mv.addObject("b",blist);
		if(lc!=0) {
		mv.addObject("lc",lc);
		mv.addObject("tc",tc);
		mv.addObject("ec",ec);
		mv.addObject("bc",bc);}
		return mv;
	}
	
	@GetMapping(value = "/chating")
	public ModelAndView home(String member_id) {
		ModelAndView mv = new ModelAndView("chat");
		mv.addObject("member_id",member_id);
		mv.setViewName("member/chat");
		return mv;
	}

}
