<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">

</script> 

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
   <DIV class='title_line'>
      카테고리 이름
   </DIV>

  <ASIDE class="aside_left">
    <A href=''>리뷰</A> > ${reviewVO.review_no} 번 수정
  </ASIDE>
  <ASIDE  class="aside_right">
    <A href='./list.do'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>

  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do'>
      <input type="hidden" name="eb_no" value="1">
      <input type="hidden" name="memberno" value="1">
      <input type='hidden' name='review_no' id='review_no' value='${reviewVO.review_no}'>
      
      <div class="form-group">
        <label class="control-label col-md-2">리뷰 내용</label>
        <div class="col-md-10">
          <textarea id="test" name="review_content" rows="5" cols="70">${reviewVO.review_content}</textarea>
        </div>
      </div>
  
      <div class="form-group">
        <label class="control-label col-md-2">리뷰 평점</label>
          <div class="col-md-10">
          <input type='number' name='review_grade' value='${reviewVO.review_grade}' required="required" 
                   placeholder="" min="1" max="10" step="0.5" 
                   style='width: 30%;' class="form-control" >
          </div>
      </div>
  
      <div class="form-group">
         <label class="control-label col-md-2">추천수</label>
         <div class="col-md-10">
           <input type='number' name='review_good' value='${reviewVO.review_good }' required="required" 
                     placeholder="" min="1" max="9999" step="1" 
                     style='width: 30%;' class="form-control" >
         </div>
      </div> 
  
      <div class="form-group">
         <label class="control-label col-md-2">패스워드</label>
         <div class="col-md-10">
         <input type='text' name='review_pw' value='${reviewVO.review_pw }' required="required" 
             autofocus="autofocus" class="form-control" style='width: 30%;'>
         </div>
      </div>  
    
      <div class="content_bottom_menu" style="padding-right: 20%;">
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'" >목록</button>
      </div>

    </FORM>
  
  </DIV>


  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>