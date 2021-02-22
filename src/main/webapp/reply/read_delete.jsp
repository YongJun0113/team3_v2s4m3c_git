<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'> ${replyVO.reply_no } 번 댓글 삭제</DIV>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">댓글을 복구 할 수 없습니다.</div>
    <FORM name='frm_update' id='frm_update' method='POST' action='./delete.do'>
      <input type='hidden' name='reply_no' id='reply_no' value="${replyVO.reply_no }">
     
      
      <label>댓글내용</label>
      <input type='text' name='reply_cont' value="${replyVO.reply_cont}" required="required" style='width: 25%;'>
 
    
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
  
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
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 