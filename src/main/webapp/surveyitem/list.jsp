<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
  <a href="../survey/list.do">설문조사</a>
</DIV>
<DIV class="aside_left" style="padding-left: 6px;">
  <A href="javascript:location.reload();">새로고침</A>
</DIV> 
<DIV class='menu_line'></DIV>

<form name='frm_surveyitem' id='frm_surveyitem' method="post" action="./update_rcnt_up.do">
  <input type="hidden" name="survey_no" id="survey_no" value="${param.survey_no}">
  <TABLE class='table table-hover'  style='width: 96%; margin: 10px auto;'>
    <colgroup>
        <col style='width: 98%;'/>
    </colgroup>
    <thead style="margin: 30px auto;">
      <tr>  
        <TH class="th_bs" style="margin: 10px auto; background-color: #f0f0f5; padding: 10px 12px;">${survey_title}</TH>
      </tr>
    </thead>
  
    <tbody>
      <c:forEach var="surveyitemVO"  items="${list}" >  <!-- request 객체에 접근 -->
        <c:set var="item_no" value="${surveyitemVO.item_no}" />
        <c:set var="item_title" value="${surveyitemVO.item_title}" />
        <TR>             
          <TD class="td_bs_left" style="padding:6px 0 6px 0;">
          <label class="radio-inline">
            <input type="radio" name="item_no" id="item_no" value="${item_no}" required="required">${item_title}
          </label>  
          </TD>                                    
        </TR>                                                        
      </c:forEach>                  
      <TR>
        <TH class="th_bs">
          <button type="submit" class="btn_send" style="padding:8px 12px; color: #fff;">참여</button>
        </TH>                        
      </TR>      
    </tbody>
  </TABLE>
</form>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

