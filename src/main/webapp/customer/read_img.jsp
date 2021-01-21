<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %> 
<%@ page import="dev.mvc.pay.TypeCode" %>
<%@ page import="dev.mvc.pay.CodeTable" %>

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

<c:set var="cs_no" value="${member_Customer_join.cs_no}" />
<c:set var="m_no" value="${member_Customer_join.m_no }" />

  <DIV class="title_line">
    <A href="./list_my_inquiry.do?m_no=${param.m_no}&m_id=${param.m_id}">나의 1:1 문의</A> > 조회
    <div style="float: right; margin-right: 8px;">
    <A href="./create.do?m_no=${param.m_no}&m_id=${param.m_id}">문의하기</A>
    </div>
  </DIV>
  
  <div class="form-group"  style="width: 100%; margin-left: 10px; padding: 6px 7px;">
    <div class="col-md-3" style="text-align: center;"> 
    <label for="cs_type">문의유형</label>
     <select id="cs_type" name='cs_type' class="form-control" style="width: 100%; text-align: center;">
       <option value="${param.cs_type }" ${param.cs_type=='A03' ? "selected='selected'":"" }
                                                ${param.cs_type=='A01' ? "selected='selected'":"" }
                                                ${param.cs_type=='A02' ? "selected='selected'":"" }
                                                ${param.cs_type=='A04' ? "selected='selected'":"" }
                                                ${param.cs_type=='A99' ? "selected='selected'":"" }>${member_Customer_join.cs_type}</option>
     </select>
    </div>
    <div class="col-md-1" style="text-align: center; margin-left: 45px;  padding: 6px 7px;">
      <A href='./update.do?cs_no=${cs_no}&m_no=${param.m_no}&m_id=${param.m_id}'>수정</A>
      <div style="border-bottom: solid 1px #d8d8d8;"></div>
      <A href='./delete.do?cs_no=${cs_no}&m_no=${param.m_no}&m_id=${param.m_id}'>삭제</A>
    </div>
    <div class="col-md-3" style="text-align: center; margin-left: 45px;  padding: 6px 7px;">
      <c:choose>
        <c:when test="${cs_file1.trim().length() > 0 }"> <!-- 메인 이미지가 있을 때  -->
          <A href='./img_update.do?cs_no=${cs_no}&m_no=${param.m_no}&m_id=${param.m_id}'>첨부파일 변경/삭제</A>      <!--  출력 -->
        </c:when>
        <c:otherwise>                                                    <!-- 메인 이미지가 없을 때 -->
          <A href='./img_create.do?cs_no=${cs_no}&m_no=${param.m_no}&m_id=${param.m_id}'>첨부파일 등록</A>     
        </c:otherwise>
      </c:choose>
      <div style="border-bottom: solid 1px #d8d8d8;;"></div>
      <A href='../attachfile/create.do?cs_no=${cs_no}&m_no=${param.m_no}&m_id=${param.m_id}'>첨부파일 추가</A>
      <span class='menu_divide' > | </span>
      <A href="javascript:location.reload();">새로고침</A>
   </div>
   <div class="col-md-2" style="text-align: center; margin-left: 65px;  padding: 6px 7px;">
     등록일<br>
     <span>${member_Customer_join.cs_rdate.substring(0, 16)}</span>
   </div>
  </div>

  <div class="menu_line" style="border-bottom: dotted 2px #d8d8d8; padding-top: 17px;"></div>     

  <FORM class="contentBox" name='frm'>
      <input type="hidden" name="cs_no" value="${cs_no}">
      <input type="hidden" name="m_no" value="${m_no}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${member_Customer_join.cs_title}</span>
            (조회수 : <span>${member_Customer_join.cs_cnt}</span>)
          </li>
          <li class="li_none">
           <c:set var="cs_file1" value="${member_Customer_join.cs_file1}" />
             <c:if test="${cs_file1.endsWith('jpg') || cs_file1.endsWith('png') || cs_file1.endsWith('gif')}">
                <div style="width: 30%; float: left; margin-right: 10px; margin-left: 10px;">
                   <IMG src="./storage/main_images/${cs_file1}" style="width: 200px; height: 220px;">
                </div>      
             </c:if>
            <DIV>${member_Customer_join.cs_contents}</DIV>
          </li>
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              ${member_Customer_join.r_mname} 님의 답변 메일주소: ${member_Customer_join.r_email}
              <br>
              <span style="color: red;">평균 답변 소요 시간 : 영업일 기준 24시간 이내</span>
            </DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>


<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
