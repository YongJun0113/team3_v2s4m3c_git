<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>event</title>
 
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
 
  <DIV class='title_line'>출판사 정보</DIV>
 
   <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='pub_no' id=''pub_no'' value='${publisherVO.pub_no }'>
      
        <label>구분번호</label>
      <input type='number' name='pub_no' value='${publisherVO.pub_no }' required="required" 
      min='1' max='1000' step='1' style='width: 5%;'>
        
      <label>출판사 이름</label> 
      <input type='text' name='name' value='${publisherVO.name }' required="required" style='width: 31%;'><br>
       
       <label>출판사 주소</label>
      <input type='text' name='http' value='${publisherVO.http }' required="required" style='width: 31%;'><br>
      
       <label>기타사항</label>
      <input type='text' name='etc' value='${publisherVO.etc }' required="required" style='width: 33%;'><br>
      

  
     
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
   <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>    
    <col style='width: 20%;'/>
     <col style='width: 10%;'/>
  </colgroup>
 
  <thead>  
  <TR>
     <TH class="th_bs">이벤트 번호</TH>
    <TH class="th_bs">이벤트 설명</TH>
    <TH class="th_bs">이벤트 번호</TH>
    <TH class="th_bs">기타</TH>
    <TH class="th_bs">수정/삭제</TH>
    
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="publisherVO" items="${list }">
    <c:set var="pub_no" value="${publisherVO.pub_no }" />
    <TR>
      <TD class="td_bs">${publisherVO.pub_no }</TD>
      <TD class="td_bs">${publisherVO.name }</TD>
      <TD class="td_bs">${publisherVO.http }</TD>
      <TD class="td_bs">${publisherVO.etc }</TD>
     
  <TD class="td_bs">                                   
        <A href="./read_update.do?pub_no=${pub_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?pub_no=${pub_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
     
       </TD>                    
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 