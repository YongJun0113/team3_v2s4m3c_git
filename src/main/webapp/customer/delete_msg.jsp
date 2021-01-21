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
<DIV class="title_line">
  <A href="./list_my_inquiry.do?m_no=${param.m_no}&m_id=${param.m_id}">나의 1:1 문의</A> > 알림
  <div style="float: right; margin-right: 8px;">
  <A href="./create.do?m_no=${param.m_no}&m_id=${param.m_id}">문의하기</A>
  </div>
</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.passwd_cnt == 1}"> <!-- 패스워드 일치 -->
          <c:choose>
            <c:when test="${param.cnt == 1}"> <!-- 글 삭제 성공 -->
              <LI class='li_none' >
                <span class='span_success' style="text-align: center;">『${param.title}』 문의를 삭제했습니다.</span>
              </LI>
            </c:when>
            <c:otherwise>    <!-- 글 삭제 실패 -->
              <LI class='li_none'>
                <span class='span_fail'>『${param.title}』 문의 삭제에 실패했습니다.</span>
              </LI>
              <LI class='li_none'>
                <span class='span_fail'>다시 시도해주세요.</span>
              </LI>
            </c:otherwise>
          </c:choose>
        </c:when>
        <c:otherwise> <!-- 패스워드 불일치 -->
          <LI class='li_none'>
            <span class='span_fail'>패스워드가 일치하지 않습니다. 다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${param.cnt == 1 && param.passwd_cnt == 1}">
          <div class="col-md-8" style="padding: 28px auto; margin-left: -13px;">
            <button type='button' 
                        onclick="location.href='./list_my_inquiry.do?m_no=${param.m_no}&m_id=${param.m_id}'"
                        class="btn_send" style="padding: 16px 20px;;">나의 1:1 문의</button>                        
          </div>
        </c:when>
        <c:otherwise>
        <div class="col-md-9" style="padding-right: 20px;">
         <button type='button' 
                     onclick="location.href='./list_my_inquiry.do?m_no=${param.m_no}&m_id=${param.m_id}'"
                     class="btn_send">나의 1:1 문의</button>
          <button type='button' 
                      onclick="history.back();"
                      class="btn_send" style="background-color: #f2960d;">다시시도</button>              
        </div>
        </c:otherwise> 
      </c:choose>
      
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>