<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    ${eventVO.name} 
  </DIV>
  <ASIDE class="aside_left">
      <A href="../event/list.do?evnetno=${eventVO.eventno }">${saleweekVO.name}</A>  > 전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do?cateno=${eventVO.eventno }">등록</A>
      <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid1.do?eventno=${eventVO.eventno}">GALLERY</A>
    
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
 
    <col style='width: 30%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
    <col style='width: 11%;'/>
    <col style='width: 7%;'/>
    <col style='width: 7%;'/>
    <col style='width: 11%;'/>
     <col style='width: 13%;'/>      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
         
    <TH class="th_bs">파일 </TH>
    <TH class="th_bs">이벤트 이름</TH>
    <TH class="th_bs">할인 책 이름</TH>
    <TH class="th_bs">할인 율</TH>
    <TH class="th_bs">세일 기간</TH>
    <TH class="th_bs">장르 </TH>
    <TH class="th_bs">날짜 </TH>
    <TH class="th_bs">수정/삭제 </TH>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="saleweekVO" items="${list }">
          <c:set var="eventno" value="${saleweekVO.saleno }" />
          <c:set var="thumb1" value="${saleweekVO.thumb1 }" />  
          
          <tr> 
            <td style='vertical-align: center;'>${saleweekVO.rdate.substring(0, 10)}</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                  <IMG src="./storage/main_images/${thumb1 }"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${contentsVO.file1}
                </c:otherwise>
              </c:choose>
            </td>  
       <TD ><a href="./read.do?saleno=${eventno}">${saleweekVO.name }</a> </TD>
       <td style='vertical-align: middle; text-align: center;'>${saleweekVO.salesbook }</td>
       <td style='vertical-align: middle; text-align: center;'>${saleweekVO.sale }</td>
       <td style='vertical-align: middle; text-align: center;'>${saleweekVO.saleperiod }</td>
       <td style='vertical-align: middle; text-align: center;'>${saleweekVO.contents }</td>
       <td style='vertical-align: middle; text-align: center;'>${eventVO.rdate.substring(5, 10) }</td>
     
  <TD class="td_bs">                                   
        <A href="./update.do?saleno=${saleno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?saleno=${saleno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
     
       </TD>                    
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 