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

</head> 
<body>

 <jsp:include page="/menu/top.jsp" flush='false' />
  
  <DIV class="title_line">
    REPLY 
  </DIV>
  <ASIDE class="aside_left">
    REPLY 전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
    
  <div style='width: 100%;'>
    <TABLE class='table_basic table-striped' style='width: 95%;'>
      <colgroup>
        <col style='width: 10%;'/>
        <col style="width: 10%;"/>
        <col style='width: 65%;'/>       
        <col style='width: 15%;'/>
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs">그룹</TH>
        <TH class="th_bs">순서</TH>
        <TH class="th_bs">댓글내용</TH>    
        <TH class="th_bs">기타</TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="replyVO" items="${list}">  <!-- request 객체에 접근 -->
        <c:set var="reply_no" value="${replyVO.reply_no}" />
        <TR>
          <TD class="td_bs">${replyVO.review_no}-${replyVO.reply_no} </TD>
          <TD class="td_bs">${replyVO.reply_no}</TD>
          <TD class="td_bs">${replyVO.reply_cont}</TD>        
          <TD class="td_bs">
             <A href="./read_delete.do?reply_no=${reply_no }"><span class="glyphicon glyphicon-trash"></span></A>
          </TD>             
        </TR>
      </c:forEach>
      </tbody>
     
    </TABLE>
  </div>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>

