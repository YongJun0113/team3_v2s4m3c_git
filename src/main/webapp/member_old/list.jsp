<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>E-BOOK</title>
 
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
 
  <DIV class='title_line'>회원 정보 목록
    <ASIDE class="aside_right">
      <A href= './create.do'>회원 등록</A>
      <span class='menu_divide' ></span> 
    </ASIDE>
  </DIV>
    
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
    <col style='width: 25%;'/>
    <col style='width: 30%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">순서</TH>
    <TH class="th_bs">아이디</TH>
    <TH class="th_bs">이메일</TH>
    <TH class="th_bs">주소</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">관리</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="memberVO" items="${list}">
    <c:set var="memberno" value="${memberVO.memberno }"/>
    <tr>
      <td class="td_bs">${memberVO.memberno }</td>
      <td class="td_bs_left">${memberVO.id }</td>
      <td class="td_bs_left">${memberVO.email }</td>
      <TD class="td_bs_left">${memberVO.address }</TD> 
      <td class="td_bs">${memberVO.rdate.substring(0,10) }</td>  
      <TD class="td_bs">
        <A href="./update_check.do?memberno=${memberno }" title="회원 정보 수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./delete.do?memberno=${memberno }" title="회원 정보 삭제"><span class="glyphicon glyphicon-trash"></span></A>        
      </TD>          
    </tr>
  </c:forEach>
  
 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 