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
 
  <DIV class='title_line'>카테고리 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>이벤트 이름</label> 
      <input type='text' name='name' value='' required="required" style='width: 25%;'><br>
       
       <label>이벤트 내용</label>
      <input type='text' name='whatevent' value='' required="required" style='width: 80%;'><br>
      
      <label>구분번호</label>
      <input type='number' name='saleno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
     
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
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
    <TH class="th_bs">이벤트 이름</TH>
    <TH class="th_bs">이벤트 내용</TH>
    <TH class="th_bs">이벤트 번호</TH>
    <TH class="th_bs">입력날짜</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="eventVO" items="${list }">
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
 
 
 