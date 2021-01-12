<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
// String root = request.getContextPath(); // /resort 
// ${pageContext.request.contextPath}
%>

<DIV class='container' style='width: 100%;'>
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_img'>
    <DIV class='top_menu_label'>[TEST] TEAM3 PROJECT</DIV>
    <NAV class='top_menu'  style='background-color: gray;'>
      <span style='padding-left: 0.5%;'></span>
      <A class='top_menu_link'  href='${pageContext.request.contextPath}' >HOME</A> <span class='top_menu1'> | </span>
      
       <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/login.do' >Login</A> <span class='top_menu_sep'> &nbsp; </span>
          <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/create.do'>회원 가입</A><span class='top_menu_sep'>&nbsp;</span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/logout.do' >Logout</A> <span class='top_menu_sep'> &nbsp; </span>
        </c:otherwise>
      </c:choose>
      
      <A class='top_menu_link'  href='${pageContext.request.contextPath}/memberph/list.do'>주문 내역</A> <span class='top_menu1'> | </span>  
          
      [
      <c:choose>
        <c:when test="${sessionScope.id_admin == null}">
          <A class='top_menu_link'  href='${pageContext.request.contextPath}/admin/login.do' >관리자 Login</A>
        </c:when>
        <c:otherwise>
          ${sessionScope.id_admin } <A class='top_menu_link'  href='${pageContext.request.contextPath}/admin/logout.do' >관리자 Logout</A><span class='top_menu_sep'>&nbsp;</span>
          <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/list.do'>회원목록</A><span class='top_menu_sep'>&nbsp;</span>           
        </c:otherwise>
      </c:choose>
      ]           
          
    </NAV>
  </DIV>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'></DIV>
    <DIV class="col-sm-3 col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${pageContext.request.contextPath}/menu/images/book2.png' style='width: 50%;'>
      <div style='margin-top: 5px;'>
        <img src='${pageContext.request.contextPath}/menu/images/book1.png' style='width: 30%;'>E-BOOK
      </div>
       ▷ <A href='${pageContext.request.contextPath}/contents/list_all.do'>전체글</A>
       <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <%-- <c:import url="/cate/list_index_left.do" /> --%>  
    </div>
      
    <DIV class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
      <DIV class='content'>





