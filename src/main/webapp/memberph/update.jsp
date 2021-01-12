<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>E-BOOK</title>
 
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
    회원정보 수정
  </DIV>
  <ASIDE class="aside_right">
    <A href='./list.jsp'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'>
       
      
    <div class="form-group">
       <label class="control-label col-md-3">상품 번호</label>
       <div class="col-md-9">
         <input type='number' name='p_number' value='1' required="required" 
                   placeholder="" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-3">상품 정보</label>
       <div class="col-md-9">
         <input type='text' name='p_infor' value='${memberphVO.p_infor }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 30%;'>
       </div>
    </div>  
  
    <div class="form-group">
       <label class="control-label col-md-3">상품 수량</label>
       <div class="col-md-9">
         <input type='number' name='p_amount' value='${memberphVO.p_amount }' required="required" 
                   placeholder="" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>   
    
    <div class="form-group">
       <label class="control-label col-md-3">상품 상태</label>
       <div class="col-md-9">
         <input type='text' name='p_state' value='${memberphVO.p_state }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 30%;'>
       </div>
    </div> 
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?orderno=${param.orderno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>