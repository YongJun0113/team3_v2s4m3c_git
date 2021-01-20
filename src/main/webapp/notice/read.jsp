<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3_ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<c:set var="noticeno" value="${noticeVO.noticeno}" />
<jsp:include page="/menu/top.jsp" />

  <DIV class='title_line'>
    ${noticeVO.noticeno }
  </DIV>
  
  <ASIDE class="aside_left">
   ${noticeVO.title}
  </ASIDE>
  <ASIDE class="aside_right">
    <a href="./create.do">글 등록</a>
    <c:choose>
      <c:when test="${noticeVO.nfile1.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?noticeno=${noticeno}'>메인 이미지 변경/삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./img_create.do?noticeno=${noticeno}'>메인 이미지 등록</A>     
      </c:otherwise>
    </c:choose>    
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?noticeno=${noticeno}'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?noticeno=${noticeno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?noticeno=${noticeno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>
 
   <FORM name='frm' method="get" action='./update.do' class="form_bs">
      <input type="hidden" name="noticeno" value="${noticeno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${noticeVO.title}</span>
            (<span>${noticeVO.writer}</span>)
            <span>${noticeVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>${noticeVO.content }</DIV>
          </li>
          
        </ul>
      </fieldset>
  </FORM>
  
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 