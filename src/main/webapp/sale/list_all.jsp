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
 
   <DIV class='title_line'>
   >이벤트 이름 > 할인 이벤트  
    ★<A href=../sale/create.do>등록</A>★
   </DIV>
 
 
  
 
  

 
  <TABLE class='table table-striped'>
  <colgroup>
      <col style='width: 22%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
     <col style='width: 13%;'/>      
     
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">파일 </TH>
    <TH class="th_bs">이벤트 이름</TH>
    <TH class="th_bs">할인 책 이름</TH>
    <TH class="th_bs">할인 율</TH>
    <TH class="th_bs">세일 기간</TH>
    <TH class="th_bs">장르 </TH>
    <TH class="th_bs">날짜 </TH>
    <TH class="th_bs">수정/삭제 </TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="saleweekVO" items="${list }">
     <c:set var="thumb1" value="${saleweekVO.thumb1 }" />  
    <TR>
      <TD class="td_bs">${saleweekVO.eventno }</TD>
      <TD class="td_bs">${saleweekVO.saleno }</TD>
      <TD >
        <a href="./read.do?saleno=${saleno}">${saleweekVO.name }</a> 
      </TD>
      <TD class="td_bs">${saleweekVO.salesbook }</TD>
      <TD class="td_bs">${saleweekVO.sale }</TD>
      <TD class="td_bs">${saleweekVO.saleperiod }</TD>
      <TD class="td_bs">${saleweekVO.contents }</TD>
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
 
 
 