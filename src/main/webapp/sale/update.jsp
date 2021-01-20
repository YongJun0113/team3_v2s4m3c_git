<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    카테고리 이름
  </DIV>

  <ASIDE class="aside_left">
    <A href=''>카테고리 그룹</A> > 
    <A href=''>카테고리</A> > 수정
  </ASIDE>
  <ASIDE class="aside_right">
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
     
      <!-- FK eventno 지정 -->
      <input type='hidden' name='eventno' id='eventno' value='1'>
      
      <input type='hidden' name='saleno' id='saleno' value='${contentsVO.contentsno }'>
      
    <div class="form-group">
     <label class="control-label col-md-3">이벤트 구분</label>
     
     <div class="col-md-9">
       <input type='number' name='eventno' value='1' required="required" 
                 placeholder="${eventno}" min="1" max="1000" step="1" 
                 style='width: 30%;' class="form-control" >
     </div>
  </div>  
  
  <div class="form-group">
     <label class="control-label col-md-3">할인 구분</label>
     
     <div class="col-md-9">
       <input type='number' name='saleno' value='1' required="required" 
                 placeholder="${saleno}" min="1" max="1000" step="1" 
                 style='width: 30%;' class="form-control" >
     </div>
  </div>  
  
   <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='salesbook' id='salesbook' rows='10' placeholder="내용">전나무 숲길</textarea>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF --%>
          <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
        </div>
      </div>
  
  <div class="form-group">
     <label class="control-label col-md-3">이벤트 이름</label>
     <div class="col-md-9">
       <input type='text' name='name' value='name' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
   </div>
   
   
   
   <div class="form-group">
     <label class="control-label col-md-3">할인 책 이름</label>
     <div class="col-md-9">
       <input type='text' name='salesbook' value='salesbook' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
   </div>
   
   <div class="form-group">
     <label class="control-label col-md-3">할인율</label>
     <div class="col-md-9">
       <input type='text' name='sale' value='sale' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
   </div>
   
    <div class="form-group">
     <label class="control-label col-md-3">세일 기간</label>
     <div class="col-md-9">
       <input type='text' name='saleperiod' value='saleperiod' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
   </div>
   
   <div class="form-group">
     <label class="control-label col-md-3">책 분류(ex:소설,만화)</label>
     <div class="col-md-9">
       <input type='text' name='contents' value='contents' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
      
      <div class="form-group">
     <label class="control-label col-md-3">password</label>
     <div class="col-md-9">
       <input type='text' name='passwd' value='1234' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
   </div>
 
      
   </div>
   
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?saleno=${param.saleno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>