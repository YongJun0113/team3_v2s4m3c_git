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
    전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">댓글작성</A> | 
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
    
  <div style='width: 100%;'>
    <TABLE class='table_basic table-striped' style='width: 95%;'>
      <colgroup>
        <col style="width: 5%;"/>
        <col style="width: 5%;"/>
        <col style="width: 5%;"/>
        <col style="width: 10%;"/>
        <col style="width: 70%;"/>
        <col style='width: 5%;'/>       
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs">댓글<br>번호</TH>
        <TH class="th_bs">리뷰<br>번호</TH>
        <TH class="th_bs">회원<br>번호</TH>
        <TH class="th_bs">회원id</TH>
        <TH class="th_bs">댓글내용</TH>         
        <TH class="th_bs">기타</TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="replyMemberVO" items="${list }">
          <c:set var="reply_no" value="${replyMemberVO.reply_no }" />
          <c:set var="review_no" value="${replyMemberVO.review_no }" />
          <c:set var="m_no" value="${replyMemberVO.m_no }" />
          <c:set var="id" value="${replyMemberVO.id }" />
          <c:set var="reply_cont" value="${replyMemberVO.reply_cont }" />      
          
          <tr style='height: 50px;'> 
            <td style='text-align: center; vertical-align: middle;'>
              ${reply_no }
            </td>  
            <td style='text-align: center; vertical-align: middle;'>
              ${review_no }
            </td>          
            <td style='text-align: center; vertical-align: middle;'>
              ${m_no }
            </td>  
             <td style='text-align: center; vertical-align: middle;'>
              ${id }
            </td>
            <td style='text-align: left; vertical-align: middle;'>${reply_cont}</td>          
            <td style='text-align: center; vertical-align: middle;'>
              <a href="./read_delete.do?reply_no=${reply_no }"><img src="./images/close.png" title="삭제"  border='0' /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
     
    </TABLE>
  </div>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>

