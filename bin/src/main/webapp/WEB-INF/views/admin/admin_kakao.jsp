<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원관리 시스템 관리자모드(회원목록 보기)</title>
 <jsp:include page="../member/header.jsp" />  
 <!-- 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다. -->
 <style>
table caption {
	caption-side: top;
	text-align: center
}

h1 {
	text-align: center
}

li .gray {
	color: gray;
}

body>div>table>tbody>tr>td:last-child>a {
	color: red
}

form {
	margin: 0 auto;
	width: 80%;
	text-align: center
}

select {
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	outline: none;
}

.container {
	width: 60%
}

td:nth-child(1) {
	width: 33%
}

.input-group {
	margin-bottom: 3em
}
</style>
<script src="${pageContext.request.contextPath}/resources/static/Admin/js/list.js"></script>
 <script>
 $(function(){
	 //검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
 	var selectedValue = '${search_field}'
 	if(selectedVaule = '-1')
 		/* -1일 경우 전체 다 나 온 다 .
 		*/
 		$("#viewcount").val(selectedValue);
 	
 	//검색 버튼을 클릭한 경우
 	$("button").click(function(){
 		//검색어 공백 유효성 검사를 합니다.
 		if($("input").val()==''){
 			alert("검색어를 입력하세요.");
 			$("input").focus();
 			return false;
 		}//if val() 끝
 		
 	var word = $(".input-group input").val();
 		if(selectedValue ==2){
 			pattern = /^[0-9]{2}$/;
 			if(!pattern.test(word)){
 				alert("나이는 형식에 맞게 입력하세오(두자리 숫자)");
 				return false;
 			}
 		}else if(selectedValue==3){
 			if(word != "남" && word !="여"){
 				alert("남 또는 여를 입력하세요");
 				return false;
 			}
 		}
 		
 	})//버튼끝
 	
 	//검색어 입력창에 플래스홀더가 나타나도록 합니다.
 	
 	$("#viewcount").change(function(){
 		selectedValue = $(this).val();
 		$("input").val('');
 		message= ["아이디","이름","나이","여 또는 남"]
 		$("input").attr("placeholder",message[selectedValue]+"입력하세요");
 	}) //chane end
 	
 	
 	//회원 목록의 삭제를 클릭한  경우
 	$("tr > td:nth-child(3) > a").click(function(){
 		var answer = confirm("정말 삭제하시겠습니까?");
 		console.log(answer);// 취소를 클릭한 경우 - false
 		if(!answer){ //취소를 클릭한 경우
 			event.preventDefault(); //이동하지 않습니다.	
 		}
 	
 	})//삭제 클릭 end
 	
 	
 
 
 })//펑션 끝
 
 </script>
</head>
<body>

		
	
</body>

<script>
Kakao.API.request({
	  url: '/v2/api/talk/memo/default/send',
	  data: {
	    template_object: {
	      object_type: 'feed',
	      content: {
	        title: '딸기 치즈 케익',
	        description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
	        image_url:
	          'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
	        link: {
	          web_url: 'https://developers.kakao.com',
	          mobile_web_url: 'https://developers.kakao.com',
	        },
	      },
	      item_content: {
	        profile_text: 'Kakao',
	        profile_image_url: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
	        title_image_url: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
	        title_image_text: 'Cheese cake',
	        title_image_category: 'Cake',
	        items: [
	          {
	            item: 'Cake1',
	            item_op: '1000원',
	          },
	          {
	            item: 'Cake2',
	            item_op: '2000원',
	          },
	          {
	            item: 'Cake3',
	            item_op: '3000원',
	          },
	          {
	            item: 'Cake4',
	            item_op: '4000원',
	          },
	          {
	            item: 'Cake5',
	            item_op: '5000원',
	          },
	        ],
	        sum: 'Total',
	        sum_op: '15000원',
	      },
	      social: {
	        like_count: 100,
	        comment_count: 200,
	      },
	      buttons: [
	        {
	          title: '웹으로 보기',
	          link: {
	            mobile_web_url: 'https://developers.kakao.com',
	            web_url: 'https://developers.kakao.com',
	          },
	        },
	        {
	          title: '앱으로 보기',
	          link: {
	            mobile_web_url: 'https://developers.kakao.com',
	            web_url: 'https://developers.kakao.com',
	          },
	        },
	      ],
	    },
	  },
	})
	  .then(function(response) {
	    console.log(response);
	  })
	  .catch(function(error) {
	    console.log(error);
	  });
</script>
</html>