<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3_ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../ebook/css/ebook.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>

<jsp:include page="/menu/top.jsp" flush='false' />

  <div  style="margin: 4.6% auto;"></div> 
  <DIV class='title_line'>
    <a href="../list.do">고객센터</a> > <a href="./list.do" >전체 파일 목록</a>
  </DIV>

  <div class="aside_left">
    등록
  </div>
  <div class="aside_right">
    <A href='../customer/list.do?cs_no=${param.cs_no }'>고객센터 전체 문의</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </div> 
 
  <div class='menu_line'></div>

  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
                enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK cateno 지정 -->
      <input type='hidden' name='m_no' id=',_no' value="${sessionScope.m_no }">
      <input type='hidden' name='cs_no' id='cs_no' value="${param.cs_no }">
      
      <div class="form-group"> 
        <label class="control-label col-md-2">파일 등록</label>  
        <div class="col-md-10 display-rightside">
          <input type='file' class="form-control" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='bottom_menu'>
        <button type="submit" class="bottom_button">파일 전송</button>
        <button type="button" 
                    onclick="location.href='../customer/read.do?cs_no=${param.cs_no}'" 
                    class="bottom_button">취소</button>
      </DIV>
       
    </FORM>
  </DIV>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>