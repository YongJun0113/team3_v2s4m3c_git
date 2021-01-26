

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/css/top_menu.css" rel="stylesheet" type="text/css">

<div class="header"> 
<h1><a href="#">e-book</a></h1> 
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
<li><a href="#">카테코리</a> 
<ul class="sub_gnb"> 
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/adm/categrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'>&nbsp;</span>
    <A class='top_menu_link'  href='${pageContext.request.contextPath}/adm/ebook/list.do'>eBook 전체 목록</A><span class='top_menu_sep'>&nbsp;</span>    
</ul> 
</li> 
<li><a href="#">문의</a> 
<ul class="sub_gnb"> 
<A class='top_menu_link'  href='${pageContext.request.contextPath}/event/list.do'>이벤트</A> <span class='top_menu1'> | </span>
 <A class='top_menu_link'  href='${pageContext.request.contextPath}/qnagrp/list.do'>QNA</A> <span class='top_menu1'> | </span>
 <A class='top_menu_link'  href='${pageContext.request.contextPath}/customer/list_my_inquiry.do?m_no=${param.m_no}&m_id=${sessionScope.m_id}'>고객센터</A> <span class='top_menu1'> | </span> 
      <A class='top_menu_link'  href='${pageContext.request.contextPath}/notice/list.do'>공지사항 </A> <span class='top_menu1'> | </span>
</ul> 
</li> 
<li><a href="#">내 페이지</a> 
<ul class="sub_gnb"> 
<A class='top_menu_link'  href='${pageContext.request.contextPath}/memberph/list.do'>주문 내역</A> <span class='top_menu1'> | </span> 
<A class='top_menu_link'  href='${pageContext.request.contextPath}/review/list.do'>리뷰 </A> <span class='top_menu1'> | </span>
</ul> 
</li> 
<li><a href="#">메뉴5</a></li> 
</ul> 
</div> 
</div> 
<div class="visual"></div>
