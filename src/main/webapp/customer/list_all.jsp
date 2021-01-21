<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>eBooks3</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    1:1 문의 내역
  </DIV>
  
  <ASIDE class="aside_left">
    <A href="../member/list_all.do">고객 리스트</A> >
    <A href="./list_all.do"> 모든 1:1 문의</A>
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">문의하기</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_mno_grid1.do?m_no=${customerVO.m_no}">GRID GALLERY</A>    
  </ASIDE>
  
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>문의유형</th>          
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>회원번호</th>
          <th style='text-align: center;'>조회수</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="customerVO" items="${list}">
          <c:set var="cs_no" value="${customerVO.cs_no}" />
          <c:set var="cs_thumb1" value="${customerVO.cs_thumb1}" />
          <tr> 
            <td style='vertical-align: middle; text-align: center;'>${customerVO.cs_rdate.substring(0, 10)}</td>
            <td style='vertical-align: middle; text-align: center;'>${customerVO.cs_type}</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${cs_thumb1.endsWith('jpg') || cs_thumb1.endsWith('png') || cs_thumb1.endsWith('gif')}">
                  <IMG src="./storage/main_images/${cs_thumb1}" style="width: 120px height:80px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${customerVO.cs_file1}
                </c:otherwise>
              </c:choose>
            </td>  
            <td style='vertical-align: middle; text-align: center;'>
              <a href="./read.do?cs_no=${cs_no}">${customerVO.cs_title}</a> 
            </td> 
            <td style='vertical-align: middle; text-align: center;'>${customerVO.m_no}</td>
            <td style='vertical-align: middle; text-align: center;'>${customerVO.cs_cnt}</td>  
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>