function go (page){
	var limit = $('#viewcount').val();
	//검색창 선택하기 . 왜 이름을 limit로 햇지..
	//var가져오면 limit는 0,1,2,3 이런값으로 됨.
	
	var data = "limit=" + limit + "&state=ajax&page=" + page;
	//var data = limit=0&state=ajax&page=page
	ajax(data)

}

//<li class="page-item"><a class="page-link gray">이전&nbsp;</a></li>
//<li class="page-item active"><a class="page-link>1</a></li>
//<li class="page-item"><a class="page-link href="javascript:go(2)">2</a></li>
//<li class="page-item"><a class="page-link href="javascript:go(2)">다음&nbsp;</a></li>

//현재 페이지가 2페이지인 경우 아래와 같은 페이징 코드 처리가 필요
//<li class="page-item"><a class="page-link href="javascript:go(1)>이전&nbsp;</a></li>
//<li class="page-item"><a class="page-link href="javascript:go(1)>1</a></li>
//<li class="page-item active"><a class="page-link">2</a></li>
//<li class="page-item"><a class="page-link gray">다음&nbsp;</a></li>



//1페이지....	
//<div class="center-block">
//<ul class="pagination justify-content center">
//<li class="page-item">		
//<a class="page-link gray">이전&nbsp;</a>
//</li>
//<li class="page-item active>
//<a class="page-link">1</a>
//</li>
//<li class="page-item">
//<a href="list?page=2" class="page-link">2</a>
//</li>
//<li class="page-item">
//<a href="list?page=2" class="page-link">&nbsp;다음</a>
//</li>
//</ul>
//</div>
	
//2페이지
//<div class="center-block">
//<ul class="pagination justify-content center">
//<li class="page-item">
//<a href="list?page=1" class="page-link">이전&nbsp;</a>
//</li>
//<li class="page-item">
//<a href="list?page=1" class="page-link">1</a>
//</li>
//<li class="page-item active">
//<a class="page-link">2</a>
//</li>
//<li class="page-item">
//<a class="page-link gray">&nbsp;다음</a>
//</li>
//</ul>
//</div>
			
//1~3 페이지  줄보기를 쓰지는 않았음 .
			
//<ul class="pagination justify-content-center">				 
//<li class="page-item">
//<a class="page-link gray">이전&nbsp;</a>
//</li>
//<li class="page-item active">
//<a class="page-link">1</a>
//</li>
//<li class="page-item">
//<a href="list?page=2" class="page-link">2</a>
//</li>	
//<li class="page-item">
//<a href="list?page=3" class="page-link">3</a>
//</li>			
//<li class="page-item">
//<a href="list?page=2" class="page-link">&nbsp;다음</a>
//</li>		
//</ul>			
			
//2페이지일때 
			
//<ul class="pagination justify-content-center">		
//<li class="page-item ">
//<a href="list?page=1" class="page-link">이전&nbsp;</a>
//</li> 
//<li class="page-item">
//<a href="list?page=1" class="page-link">1</a>
//</li>	
//<li class="page-item active">
//<a class="page-link">2</a>
//</li>
//<li class="page-item">
//<a href="list?page=3" class="page-link">3</a>
//</li>	
//<li class="page-item">
//<a href="list?page=3" class="page-link">&nbsp;다음</a>
//</li>	
//</ul>
			
//3페이지일때
//<ul class="pagination justify-content-center">		
//<li class="page-item ">
//<a href="list?page=2" class="page-link">이전&nbsp;</a>
//</li> 
//<li class="page-item">
//<a href="list?page=1" class="page-link">1</a>
//</li>	
//<li class="page-item">
//<a href="list?page=2" class="page-link">2</a>
//</li>	
//<li class="page-item active">
//<a class="page-link">3</a>
//</li>
//<li class="page-item">
//<a class="page-link gray">&nbsp;다음</a> 
//</li>
//</ul>			
//			
	
			
//줄보기를 사용했을때 
//<ul class="pagination justify-content-center">
//<li class="page-item">
//<a class="page-link gray">이전&nbsp;</a>
//</li>
//<li class="page-item active">
//<a class="page-link">1</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(2)">2</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(3)">3</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(4)">4</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(5)">5</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(6)">6</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(7)">7</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(2)">&nbsp;다음&nbsp;</a>
//</li>
//</ul>
			
			
			
			
			
			
			
			
//줄보기를 사용했을 때
			
//1페이지....	
//<div class="center-block">
//<ul class="pagination justify-content center">
//<li class="page-item">		
//<a class="page-link gray">이전&nbsp;</a>
//</li>
//<li class="page-item active>
//<a class="page-link">1</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(2)">2</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(2)">&nbsp;다음&nbsp;</a>
//</li>
//</ul>
//</div>
			
			
			
//2페이지
//<div class="center-block">
//<ul class="pagination justify-content center">
//<li class="page-item">
//<a class="page-link" href="javascript:go(1)">이전&nbsp;</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(1)">1</a>
//</li>
//<li class="page-item active">
//<a class="page-link">2</a>
//</li>
//<li class="page-item">
//<a class="page-link gray">&nbsp;다음</a>
//</li>
//</ul>
//</div>

//줄보기를 사용했을때  현재 3페이지에서...
//<ul class="pagination justify-content-center">
//<li class="page-item">
//<a class="page-link" href="javascript:go(2)">이전&nbsp;</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(1)">1</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(2)">2</a>
//</li>
//<li class="page-item active">
//<a class="page-link">3</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(4)">4</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(5)">5</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(6)">6</a>
//</li>
//<li class="page-item">
//<a class="page-link" href="javascript:go(7)">7</a>
//</li><li class="page-item">
//<a class="page-link" href="javascript:go(4)">&nbsp;다음&nbsp;</a>
//</li>
//</ul>

			
			

	



function setPaging(href, digit){
	//setPaging?..........이거는 게시물 처리 같은데?...
	//board_list.jsp에서 이 함수 이름을 써야 사용할수있는것 아닐까?...
	// 
	
	active="";
	gray="";
	
	//href가 빈 문자열인경우?.. 아닌경우는 어떤경우? 페이지 선택이 아닌 그냥 여러 번호중하나?..
	
	
	if(href=="") { //href가 빈문자열인 경우
		if(isNaN(digit)){//이전&nbsp; 또는 다음&nbsp; 숫자가 아니면 true를 반환한다... 
			//digit가 숫자가 아닐때 gray 비활성화..?   digit : 숫자
			gray=" gray"; //공백 줘야함
			
		}else{
		    active=" active";
		    //현재 게시물 일시 active...
		}
	}
	
	//이 페이지처리 함수를 사용하게 된다면 output을 리턴하게 된다.
	//gray와 active를... 이용하게 되는데 .. 
	//처음엔 href와 digit를 공백으로 주고 ... href가 공백으로 주었으니 if문이 돌아가고 숫자가 이다/아니다는 어떻게 알지?
	//html
	
	var output = "<li class='page-item" + active + "'>";
	
	//<li class="page-item">
	//<a class="page-link" href="javascript:go(6)">6</a>
	//</li>
	
	//<li class="page-item active">
	//<a class="page-link">3</a>
	//</li>
	
	//<li class="page-item">
	//<a class="page-link gray">&nbsp;다음</a>
	//</li>
	
	var anchor = "<a class='page-link" + gray + "'"  + href + ">"+ digit + "</a></li>";
	output += anchor;
	return output;
}//페이징 anchor: 닻...


function ajax(sdata){
	console.log("비가오네요"+sdata)
	
	
	$.ajax({
		type : "POST",
		data : sdata,
		url:"list_ajax",
		dataType : "json",
		cache : false,
		success : function(data){
			$("#viewcount").val(data.limit);
			$("table").find('font').text("글 개수 : "  +  data.listcount);
			
			if(data.listcount > 0){//총 개수가 0보다 큰 경우
			$("tbody").remove();
			
			var num = data.listcount - (data.page -1) * data.limit;
			console.log(num)
			var output =  "<tbody>";
			$(data.boardlist).each(
				function(index,item){
					output += '<tr><td>' + (num--) + '</td>'
					blank_count = item.board_RE_LEV * 2 + 1;

					blank = '&nbsp';
					for(var i =0; i<blank_count; i++){
						blank += '&nbsp;&nbsp;';
					}//for문
					
					img="";
					if(item.board_re_lev > 0){
						img = "<img src='image/line.gif'>";
					}
					
					var subject=item.board_SUBJECT.replace(/</g,'&lt;')

					if(subject.length>=20){
						subject =subject.substr(0,20) + "...";//0부터 20개 부분 문자열 추출
					}
					
					output +=  "<td><div>" + blank + img
					output += ' <a href="detail?num=' + item.board_NUM  + '">'
					output += subject + '</a></div></td>'
					output += '<td><div>' + item.board_NAME+'</div></td>'
					output += '<td><div>' + item.board_DATE+'</div></td>'
					output += '<td><div>' + item.board_READCOUNT

		
		})//	$(data.boardlist).each
			
		output +="</tbody>"
		$('table').append(output) // table완성.
		
		$(".pagination").empty();//페이징 처리 영역 내용 제거
		output = "";
		
		digit ='이전&nbsp;'
		href="";
		if(data.page>1){
			href='href=javascript:go(' +(data.page-1) + ')';
			
		}
		output += setPaging(href,digit);
		
		for(var i= data.startpage; i <=data.endpage; i++){
			digit =i;
			href="";
			if(i != data.page){
				href='href=javascript:go('  + i+ ')';
			}
			output += setPaging( href, digit);
			}
			
			digit= '&nbsp;다음&nbsp';
			href="";
			if(data.page<data.maxpage){
				href='href=javascript:go('  + (data.page +1 )+ ')';
			}
			output +=setPaging( href,digit);
			
			$('.pagination').append(output)
			
		}//if(data.listcout)>0 end
		
					
				}, //suceec
				error : function()	{
					console.log('에러')
					
				}
			}) //ajax end
					
					
				}	//펑션 끝
						














$(function(){
	$("button").click(function(){
		location.href="write";
	})
	
	
	$("#viewcount").change(function(){
		go(1); //보여줄 페이지를 1페이지로 설정합니다
	});//change end
	
})//펑션 끝.