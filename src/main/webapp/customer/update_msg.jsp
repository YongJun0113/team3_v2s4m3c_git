<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>eBooks3</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/modal_style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'> 
  <A href="./list_all.do">문의 내역</A>
  > 수정
</DIV>
<input type='hidden' name='cs_no' id='cs_no' value="${param.cs_no}">
<input type='hidden' name='m_no' id='m_no' value="${sessionScope.m_no}">
<input type='hidden' name='id' id='id' value="${sessionScope.id}">
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.cnt == 1}">
          <LI class='li_none'>
            <span class="span_success">고객님의 문의가 변경 되었습니다. </span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">고객님의 문의 변경에 실패하였습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      </UL> 
      <div class='clearfix'>
        <button type='button' onclick="location.href='./list_all.do'"  class="btn_cancel" style="background-color: #808080;">취소</button>
        <button type='button' onclick="history.back()" class="btn_send" style="background-color: #008040;">다시 시도</button>
      </div>
  </fieldset>

</DIV>

 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>