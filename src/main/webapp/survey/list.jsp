<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3 ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">
   
  <DIV class="title_line">
    설문조사
  </DIV>
  <DIV class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </DIV> 
  <DIV class='menu_line'></DIV>
  
    
  <div style='width: 100%;'>
    <TABLE class='table_basic table-hover' style='width: 96%; margin: 10px auto;'>
      <colgroup>
        <col style='width: 10%;'/>
        <col style='width: 40%;'/>
        <col style="width: 15%;"/>
        <col style="width: 15%;"/>
        <col style="width: 10%;"/>
        <col style="width: 10%;"/>
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs">번호</TH>     
        <TH class="th_bs">설문</TH>
        <TH class="th_bs">시작일</TH>
        <TH class="th_bs">종료일</TH>
        <TH class="th_bs">상태</TH>
        <TH class="th_bs">설문결과</TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="surveyVO" items="${list}" >  <!-- request 객체에 접근 -->
        <c:set var="survey_no" value="${surveyVO.survey_no}" />
        <c:set var="seqno" value="${surveyVO.seqno}" />
        <c:set var="title" value="${surveyVO.title}" />
        <c:set var="startdate" value="${surveyVO.startdate}" />
        <c:set var="enddate" value="${surveyVO.enddate}" />
        <c:set var="continueyn" value="${surveyVO.continueyn}" />
        <c:set var="survey_result" value="${surveyVO.survey_result}" />
        <TR>
          <TD class="td_bs">${seqno}</TD>
          <TD class="td_bs_left" style="padding:6px 0 6px 0;">
            <A href="../surveyitem/list.do?survey_no=${survey_no}">${title}</A>
          </TD>               
          <TD class="td_bs">${startdate}</TD>           
          <TD class="td_bs">${enddate}</TD> 
          <TD class="td_bs">
          <c:choose>
            <c:when test="${surveyVO.continueyn =='Y'}">
             <img src="./images/ongoing.png">
            </c:when>
            <c:otherwise>
             <img src="./images/blocked.png">
            </c:otherwise>
          </c:choose>
          </TD>  
          <TD class="td_bs"><a href="../surveychart/chart_result.do?survey_no=${survey_no}">${survey_result}</a></TD>                         
      </c:forEach>                  
      </tbody>
    </TABLE>
  </div>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>