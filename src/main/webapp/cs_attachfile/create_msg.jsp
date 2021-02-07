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

  <DIV class='title_line'>
    <a href="../list.do">고객센터</a> > 첨부 파일
  </DIV>

  <div class="aside_left">
    등록
  </div>
  <div class="aside_right">
    <A href='../list.do?cs_no=${param.cs_no }'>고객센터 전체 문의</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </div> 
 
  <div class='menu_line'></div>

    <DIV class='message'>
      <fieldset class='fieldset_basic'>
        <UL>
          <c:choose>
            <c:when test="${param.upload_count > 0 }">
              <LI class='li_none'>
                <span class='span_success'>파일을 등록했습니다.</span>
              </LI>
              <LI class='li_none'>
                <span class='span_success'>정상 등록된 파일 ${param.upload_count} 건</span>
              </LI>
            </c:when>
            <c:otherwise>
              <LI class='li_none'>
                <span class='span_fail'>파일 등록에 실패했습니다.</span>
              </LI>
            </c:otherwise>
          </c:choose>
          <LI class='li_none'>
          <div class="bottom_menu">
            <button type='button' 
                        onclick="location.href='../customer/read.do?cs_no=${param.cs_no }'"
                        class="bottom_button">업로드된 파일 확인</button>
            <button type='button' 
                        onclick="location.href='../customer/list.do'"
                        class="bottom_button">고객센터 목록</button>       
            </div>            
          </LI>
         </UL>
      </fieldset>
     
    </DIV>

 
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>