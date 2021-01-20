<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--글만 조회하는 경우 참고 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
<c:set var="eventno" value="${eventVO.eventno}" />
<c:set var="saleno" value="${saleweekVO.saleno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${EventVO.name }
  </DIV>
  
  <ASIDE class="aside_left">
   이벤트 목록 > ${saleweekVO.name }
  </ASIDE>
  <ASIDE class="aside_right">
     <A href="./create.do">글등록</A>
     <span class='menu_divide' > | </span>
    <A href='../attachfile/create.do?saleno=${saleno }&eventno=${eventno }'>파일 등록</A>
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list_all.do?eventno=${eventno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?saleno=${saleno }&eventno=${eventno }''>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?saleno=${saleno }&eventno=${eventno }''>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>
   
  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="saleno" value="${saleno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
              <span>${saleweekVO.name}</span>
             (<span>${saleweekVO.thumb1}</span>) 
            <span>${saleweekVO.rdate.substring(0, 16)}</span>
       
            
            <span>${saleweekVO.salesbook}</span><br>
            <span>${saleweekVO.saleperiod}</span><br>
            <span>${saleweekVO.eventno}</span><br>
            <span>${saleweekVO.contents}</span><br>
            
            
            <span>${saleweekVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>${saleweekVO.contents }</DIV>
          </li>
         
         
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
 