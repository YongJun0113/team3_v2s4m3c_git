

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/css/top_menu.css" rel="stylesheet" type="text/css">

<div class="header"> 
<h1><a href="${pageContext.request.contextPath}/">e-book</a></h1> 
<div class="gnb"> <ul> 
<li><a href="#">로그인</a> 
<ul class="sub_gnb"> 
<c:choose>
<c:when test="${sessionScope.id == null}">
<li><A class='top_menu_link'  href='${pageContext.request.contextPath}/member/login.do' >Login</A> <span class='top_menu_sep'> &nbsp; </span> 
     <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/create.do'>회원 가입</A><span class='top_menu_sep'>&nbsp;</span>
      </c:when>
      
       <c:otherwise>
         ${sessionScope.id } <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/logout.do' >Logout</A> <span class='top_menu_sep'> &nbsp; </span>
        </c:otherwise>
      </c:choose>
</ul> 
</li> 
<li><a href="#">카테고리</a> 
<ul class="sub_gnb">
  <li> 
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/adm/categrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'>&nbsp;</span>
  </li>
  <li>    
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/adm/ebook/list.do'>eBook 전체 목록</A><span class='top_menu_sep'>&nbsp;</span>
  </li>
</ul> 
</li> 

<%-- ebook 메뉴 추가 2021-01-26 soongsi --%>
<li><a href='${pageContext.request.contextPath}/ebook/list.do'>Ebook</a></li>

<li><a href="#">문의</a> 
<ul class="sub_gnb">
  <li>
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/event/list.do'>이벤트</A> <span class='top_menu1'> | </span>
  </li>
  <li>
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/qnagrp/list.do'>QNA</A> <span class='top_menu1'> | </span>
  </li>
  <li>
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/customer/list_all.do'>고객센터</A> <span class='top_menu1'> |   </span>
  </li>
</ul> 
</li> 
<li><a href="#">내 페이지</a> 
<ul class="sub_gnb">
  <li>
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/memberph/list.do'>주문 내역</A> <span class='top_menu1'> | </span>
  </li>
  <li> 
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/review/list.do'>리뷰 </A> <span class='top_menu1'> | </span>
  </li>
  <li>
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/notice/list.do'>공지사항</A> <span class='top_menu1'></span>
  </li>
</ul> 
</li> 
<li><a href="#"> 관리자 페이지</a>
<ul class="sub_gnb">  
<c:choose>
        <c:when test="${sessionScope.id_admin == null}">
        <li>
          <A class='top_menu_link'  href='${pageContext.request.contextPath}/admin/login.do' >관리자 Login</A>
        </li>
        </c:when>
        <c:otherwise>
          <li>
          ${sessionScope.id_admin } <A class='top_menu_link'  href='${pageContext.request.contextPath}/admin/logout.do' >관리자 Logout</A><span class='top_menu_sep'>&nbsp;</span>
          </li>
          <li>
            <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/list.do'>회원목록</A><span class='top_menu_sep'>&nbsp;</span>
          </li>
          <li>       
            <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/categrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'>&nbsp;</span>
          </li>
          <li>
            <A class='top_menu_link'  href='${pageContext.request.contextPath}/cate/list_all.do'>전체 카테고리</A><span class='top_menu_sep'>&nbsp;</span>
          </li>
          <li>
            <A class='top_menu_link'  href='${pageContext.request.contextPath}/ebook/list.do'>eBook 전체 목록</A><span class='top_menu_sep'>&nbsp;</span>
          </li>
          <li>    
            <A class='top_menu_link'  href='${pageContext.request.contextPath}/ncate/list_all.do'>공지사항 카테고리 목록</A> <span class='top_menu_sep'></span>
          </li>
        </c:otherwise>
</c:choose>
</ul>
</li>
</div> 
</div> 
<div class="visual"></div>
