<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>E-Book Store</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="./css/ebook.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

    <section class="page-section cta">
      <div class="container">
      <c:import url="/ebook/menu.do" />
       <%-- <%@ include file="./menu/top_nav.jsp" %> --%>
        <!-- Page Features -->
        <div class="row text-center">
          <fmt:setLocale value = "ko_KR"/>
          <c:forEach var="ebookVO" items="${list }" varStatus="status">
            <%-- 하나의 행에 이미지를 4개씩 출력 후 행 변경 --%>
            <c:if test="${status.index % 4 == 0 && status.index != 0 }">

            </c:if>
            <div class="ebook_list_thumb col-6 col-sm-6 col-md-4 col-lg-3 my-3">
              <div class="card h-100">
                <c:set var="thumb" value="${ebookVO.eb_thumb }"/>
                <c:choose>
                    <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                      <a href="./read.do?eb_no=${ebookVO.eb_no }"><img class="card-img-top" src="./storage/main_images/${thumb }" alt=""></a>
                    </c:when>
                    <c:otherwise>
                      <a><img class="card-img-top" src="http://placehold.it/300x400" alt=""></a>            
                    </c:otherwise>
                </c:choose>
                <div class="card-body">
                  <h5 class="card-title" style="text-align: left;">
                    <a href="./read.do?eb_no=${ebookVO.eb_no }">${ebookVO.eb_title }</a>
                  </h5>
                    <ul class="ebinfo card-text" style="text-align: left;list-style: none;">
                      <li class="author">
                      <c:choose>
                        <c:when test="${ebookVO.eb_author.length() > 20 }">
                          ${ebookVO.eb_author.substring(0, 17) } ...
                        </c:when>
                        <c:otherwise>
                          ${ebookVO.eb_author }
                        </c:otherwise>
                      </c:choose>
                      </li>
                      <li class="publisher">${ebookVO.eb_publisher }</li>
                      <li class="price">
                        <fmt:formatNumber value="${ebookVO.eb_price}" pattern="#,### 원"/>
                      </li>
                    </ul>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
        <!-- /.row -->
      </div>
      <div class='ebook_paging my-4'>${paging }</div>
    </section>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>