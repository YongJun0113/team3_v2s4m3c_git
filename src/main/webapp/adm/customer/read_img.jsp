<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />

<c:set var="cs_no" value="${customerVO.cs_no}" />
<c:set var="m_no" value="${customerVO.m_no}" />

  <DIV class="title_line">
   <A href="./list_by_mno_paging.do?m_no=${m_no}&nowPage=${param.nowPage}">
    m_no :「${customerVO.m_no}」님 문의 >
   </A> 
   ${customerVO.cs_title} 
  </DIV>
  <ASIDE class="aside_left">
    <%-- <A href='./list_all.do?nowPage=${param.nowPage}'>1:1 문의</A> -  --%>
    <A href="./list_all.do?nowPage=${param.nowPage}">1:1 문의</A>
  </ASIDE>
  <ASIDE class="aside_right">
    <A href='../customer/create.do'>문의하기</A>
<%--     <c:choose>
      <c:when test="${customerVO.cs_file1.trim().length() > 0 }"> <!-- 메인 이미지가 있을 때  -->
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?cs_no=${cs_no}'>Main 이미지 변경/삭제</A>      <!--  출력 -->
      </c:when>
      <c:otherwise>                                                    <!-- 메인 이미지가 없을 때 -->
        <span class='menu_divide' > | </span> 
        <A href='./img_create.do?cs_no=${cs_no}'>Main 이미지 등록</A>     
      </c:otherwise>
    </c:choose>
    <span class='menu_divide' > | </span>
    <A href='../attachfile/create.do?cs_no=${cs_no}'>파일 첨부하기</A> --%>
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
<%--     <span class='menu_divide' > | </span> 
    <A href='./list_by_mno_table_img1.do'>내 문의 목록</A> 
    <span class='menu_divide' > | </span> 
    <A href='./update.do?cs_no=${cs_no}&cs_type=${customerVO.cs_type}&m_no=${customerVO.m_no}&nowPage=${param.nowPage}'>수정</A>--%>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?cs_no=${cs_no}&nowPage=${param.nowPage}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do' style="margin-top: 10px;">
      <input type="hidden" name="cs_no" value="${cs_no}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            조회수: <span>${customerVO.cs_cnt}</span>
            <span class='menu_divide'>|</span>
            등록일: <span>${customerVO.cs_rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
             <c:set var="cs_file1" value="${customerVO.cs_file1}" />
             <c:if test="${cs_file1.endsWith('jpg') || cs_file1.endsWith('png') || cs_file1.endsWith('gif')}">
                <div style="width: 50%; float: left; margin-right: 10px;">
                  <IMG src="./storage/main_images/${cs_file1}" style="height:450px; ">
                </div>      
             </c:if>
            <DIV>${customerVO.cs_contents}</DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/adm/menu/bottom.jsp" flush='false' /> 