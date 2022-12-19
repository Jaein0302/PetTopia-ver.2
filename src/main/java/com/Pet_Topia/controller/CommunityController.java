package com.Pet_Topia.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.MySaveFolder;
import com.Pet_Topia.service.CommunityService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value = "/community")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	private CommunityService service;
	private MySaveFolder mysavefolder;

	@Autowired
	public CommunityController(CommunityService service, MySaveFolder mysavefolder) {
		this.service = service;
		this.mysavefolder = mysavefolder;
	}

	// 게시판 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView baordList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value="search_word",defaultValue="",required=false)String search_word,
			@RequestParam(value="search_field",defaultValue="-1",required=false)int index,
			ModelAndView mv) {
		int limit = 8; // 한 화면에 출력할 로우 갯수
		int listcount = service.getListCount(index, search_word); // 총 리스트 수를 받아옴
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Community> hlist = service.hot_List();

		List<Community> boardlist = service.getBoardList(index, search_word, page, limit); // 리스트를 받아옴
		mv.setViewName("community/comm_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("hlist", hlist);
		mv.addObject("limit", limit);
		return mv;
	}

	// 글쓰기 폼 이동
	@GetMapping(value = "/write")
	public String boardwrite() {
		return "community/comm_write";
	}

	// 글쓰기
	@PostMapping("/add")
	public String add(Community comm, HttpServletRequest request) throws Exception {
		
		MultipartFile uploadfile = comm.getUploadfile();

		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명 
			comm.setCommu_original(fileName);// 원래 파일명 저장 
			String saveFolder = mysavefolder.getSavefolder();
			
			logger.info("fileName=" + fileName);
			logger.info("mysavefolder=" + mysavefolder);
			logger.info("saveFolder=" + saveFolder);

			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);

			uploadfile.transferTo(new File(saveFolder + fileDBName));
			logger.info("transferTo path = " + saveFolder + fileDBName); // 바뀐 파일명으로 저장
			comm.setCommu_file(fileDBName);
		}
		
		// 이미지 태그를 추출하기 위한 정규식.
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
		// 추출할 내용.
		String content = comm.getCommu_content();
		// 내용 중에서 이미지 태그를 찾아라!
		Matcher match = pattern.matcher(content);
		String imgTag = null;
		if(match.find()){ // 이미지 태그를 찾았다면,,
		    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
		}
		// 결과값은 name1.jpg
		System.out.println("imgTag : " + imgTag);
		comm.setCommu_thumbnail(imgTag);
		
		service.insert(comm); // 저장 메서드 호출
		return "redirect:list";
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

	@GetMapping(value = "/detail")
	public ModelAndView detail(int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value = "referer") String beforeURL) {
		service.setReadCountUpdate(num);
		List<Community> hlist = service.hot_List();
		Community community = service.getDetail(num);
		// board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.
		if (community == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			mv.setViewName("community/comm_detail");
			mv.addObject("hlist", hlist);
			mv.addObject("c", community);
		}
		return mv;
	}

	@GetMapping(value = "/modifyView")
	public ModelAndView modifyView(int num, ModelAndView mv, HttpServletRequest request) {
		Community boarddata = service.getDetail(num);

		// 글 내용 불러오기 실패한 경우 입니다.
		if (boarddata == null) {
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "수정보기 실패입니다.");
			return mv;
		}
		logger.info("(수정)상세보기 성공");
		mv.setViewName("community/comm_modify");
		mv.addObject("c", boarddata);
		return mv;
	}

	// 수정
			@PostMapping("/update")
			public String update(Community comm, String check, Model mv, HttpServletRequest request, RedirectAttributes rattr) throws Exception {
				String url="";
				MultipartFile uploadfile = comm.getUploadfile();

				if (check != null && !check.equals("")) { // 기존파일 그대로 사용하는 경우입니다.
					logger.info("기존파일 그대로 사용합니다.");			
					comm.setCommu_original(check);
				} else {
					if (uploadfile!=null && !uploadfile.isEmpty()) { 
						logger.info("파일 변경되었습니다.");	
						String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
						comm.setCommu_original(fileName);
						String saveFolder = mysavefolder.getSavefolder();
						String fileDBName = fileDBName(fileName, saveFolder);
						logger.info("fileDBName = " + fileDBName);
						uploadfile.transferTo(new File(saveFolder + fileDBName));
						logger.info("transferTo path = " + saveFolder + fileDBName);
						// 바뀐 파일명으로 저장
						comm.setCommu_file(fileDBName);
					} else {//기존 파일이 없는데 파일 선택하지 않은 경우 또는 기존 파일이 있었는데 삭제한 경우
						logger.info("선택 파일 없습니다.");
						comm.setCommu_file("");//""로 초기화 합니다.
						comm.setCommu_original("");//""로 초기화 합니다.
					}//else end
				}//else end
				
				// 이미지 태그를 추출하기 위한 정규식.
				Pattern pattern  =  Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
				// 추출할 내용.
				String content = comm.getCommu_content();
				// 내용 중에서 이미지 태그를 찾아라!
				Matcher match = pattern.matcher(content);
				String imgTag = null;
				if(match.find()){ // 이미지 태그를 찾았다면,,
				    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
				}
				// 결과값은 name1.jpg
				System.out.println("imgTag : " + imgTag);
				comm.setCommu_thumbnail(imgTag);
				
				
				int result = service.udpate(comm);

				if (result == 0) {
					logger.info("게시판 수정 실패");
					mv.addAttribute("url", request.getRequestURL());
					mv.addAttribute("message", "게시판 수정 실패");
					url="error/error";
				} else { // 수정 성공의 경우
					logger.info("게시판 수정 완료");
					// 수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기위해 경로를 설정합니다.
					url = "redirect:detail";
					rattr.addAttribute("num", comm.getCommu_num());
				}
				return url;
			}

	
	
	
	@GetMapping("/delete")
	public String delete(int num, Model mv, HttpServletRequest request, RedirectAttributes rattr) {

		int result = service.delete(num);

		// 삭제 처리 실패한 경우
		if (result == 0) {
			logger.info("게시판 삭제 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "게시판 삭제 실패");
			return "error/error";
		}
		// 삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
		logger.info("게시판 삭제 성공");
		rattr.addFlashAttribute("result", "deleteSuccess");
		return "redirect:list";
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
	

}
