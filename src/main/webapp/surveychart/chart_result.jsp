<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); // 절대 경로
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3 ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">

<DIV class="title_line">
 <i class="fas fa-home"></i><a href="../index.do"> 홈 </a> - <a href="../survey/list.do"> 설문조사</a> 
</DIV>
<DIV class="aside_left" style="padding-left: 6px;">결과보기</DIV> 
<DIV class='menu_line'></DIV>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);

      var auto_reload = null;
      
      $(function() {
        auto_reload = setInterval(function() { drawChart() }, 3000); // 3초마다 자동 실행
        // clearInterval(auto_reload); // 자동 실행 중지
      });
    
      function drawChart() {
        var data = google.visualization.arrayToDataTable(
            ${str}
         );

        var options = {
          title: '${survey_title}',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>

    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>


<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

