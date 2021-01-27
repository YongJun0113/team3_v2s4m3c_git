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
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<section class="page-section cta">
  <div class="container">
    <c:import url="/ebook/menu.do" />
    <div class="heading-section">
      <h2>${ebookVO.eb_title }</h2>
    </div>
    
    <img src="./storage/main_images/${ebookVO.eb_thumb }">
    
    <div class="row text-center">
      <div class="col-md-6">
        <div id="slider" class="owl-carousel product-slider">
          <div class="item">
              <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80" />
          </div>
          <div class="item">
              <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
          </div>
          <div class="item">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
          </div>
          <div class="item">
              <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
          </div>
          <div class="item">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
          </div>
          <div class="item">
              <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
          </div>
          <div class="item">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
          </div>
        </div>
        <div id="thumb" class="owl-carousel product-thumb">
          <div class="item">
              <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80" />
          </div>
          <div class="item">
              <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
          </div>
          <div class="item">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
          </div>
          <div class="item">
              <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
          </div>
          <div class="item">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
          </div>
          <div class="item">
              <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
          </div>
          <div class="item">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
          </div>
        </div>
      </div>
    </div>  
  </div>

</section>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>