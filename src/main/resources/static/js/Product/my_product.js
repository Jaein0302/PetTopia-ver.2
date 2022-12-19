$(function() {

  //등록 성공 alert창
  var result = "${result}";
  if(result == 'addSuccess'){
    alert("등록 성공 입니다.");
  }
  if(result == 'updateSuccess'){
    alert("수정 성공 입니다.");
  }
  if(result == 'deleteSuccess'){
    alert("삭제 성공 입니다.");
  }

  //checkbox 하나만 선택할 수 있도록 함
  $('input[name="ITEM_CATEGORY"]').click(function(){
    if($(this).prop('checked')){
      $('input[name="ITEM_CATEGORY"]').prop('checked',false);
      $(this).prop('checked',true);
    }
  })
  $('input[name="ITEM_SEX"]').click(function(){
    if($(this).prop('checked')){
      $('input[name="ITEM_SEX"]').prop('checked',false);
      $(this).prop('checked',true);
    }
  })
  $('input[name="ITEM_WEIGHT"]').click(function(){
    if($(this).prop('checked')){
      $('input[name="ITEM_WEIGHT"]').prop('checked',false);
      $(this).prop('checked',true);
    }
  })
  $('input[name="ITEM_SPECIES"]').click(function(){
    if($(this).prop('checked')){
      $('input[name="ITEM_SPECIES"]').prop('checked',false);
      $(this).prop('checked',true);
    }
  })

  //상품옵션 평소에는 안보이게
  $(".option").slideUp();

  //수술/치료일때만 상품 옵션 보이기
  $('input[name="ITEM_CATEGORY"][value="treat"]').click(function(){
    $(".option").slideDown();
  })

  $('input[name="ITEM_CATEGORY"][value="education"]').click(function(){
    $(".option").slideUp();
  })

  $('input[name="ITEM_CATEGORY"][value="beauty"]').click(function(){
    $(".option").slideUp();
  })

  //모든 항목 클릭해야만 상품등록 가능
  $('#p_add').on('click', function() {

    var name = $.trim($('input[name="ITEM_NAME"]').val());
    if (name == '') {
      alert("상품이름을 입력하세요");
      return false;
    }

    var price = $.trim($('input[name="ITEM_PRICE"]').val());
    if (price == '') {
      alert("상품가격을 입력하세요");
      return false;
    }

    var content = $.trim($('input[name="ITEM_SELLER"]').val());
    if (content == '') {
      alert("판매자명을 입력하세요");
      return false;
    }

    var uploadfile = $.trim($('input[name="uploadfile"]').val());
    if (uploadfile == '') {
      alert("상품파일을 업로드해주세요");
      return false;
    }
  })

  //삭제 confirm창
  $('#delete').on('click',function(){
    confirm("정말 삭제하시겠습니까?")
  })

  //이미지 첨부할때 썸네일 나오기
  var sel_files = [];

  $("#upfile").on("change", handleImgFileSelect);

  function handleImgFileSelect(e) {

    //이미지 정보들을 초기화
    sel_files = [];

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {
      if(!f.type.match("image.*")) {
        alert("확장자는 이미지 확장자만 가능합니다.");
        return;
      }

      sel_files.push(f);

      var reader = new FileReader();
      reader.onload = function(e) {
        var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\""
                    + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' id=\"preview\"></a>";
        $(".imgs_wrap").append(html);
        index++;
      }
      reader.readAsDataURL(f);
    })
  }



})
