<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
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
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>카테고리 그룹 > ${categrpVO.name } 삭제</DIV>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='eventno' id='eventno' value='${eventVO.eventno }'>
        
      <label>이벤트 이름</label>: ${eventVO.name } &nbsp;
      <label>이벤트 내용</label>: ${eventVO.whatevent } &nbsp; 
      <label>이벤트 번호</label>: ${eventVO.eventno } &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
   
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">이벤트 내용</TH>
    <TH class="th_bs">이벤트 설명</TH>
    <TH class="th_bs">이벤트 번호</TH>
    <TH class="th_bs">입력날짜</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
 <c:forEach var="eventVO" items="${list}">
    <c:set var="eventno" value="${eventVO.eventno }" />
    <TR>
      <TD class="td_bs">${eventVO.name }</TD>
      <TD class="td_bs_left">${eventVO.whatevent }</TD>
      <TD class="td_bs">${eventVO.saleno }</TD>
      <TD class="td_bs">${eventVO.rdate.substring(0, 10) }</TD>
      <TD class="td_bs">
          <A href="./read_update.do?eventno=${eventno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?eventno=${eventno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
      </TD>
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 