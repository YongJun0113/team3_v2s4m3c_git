<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>E-BOOK</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>주문 내역 목록
    <ASIDE class="aside_right">
      <A href= './create.do'>주문 내역 등록</A>
      <span class='menu_divide' ></span> 
    </ASIDE>
  </DIV>
    
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
    <col style='width: 20%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH style='text-align: center;'>순서</TH>
    <TH style='text-align: center;'>상품 번호</TH>
    <TH style='text-align: center;'>상품 사진</TH>
    <TH style='text-align: center;'>상품 정보</TH>
    <TH style='text-align: center;'>상품 수량</TH>
    <TH style='text-align: center;'>상품 상태</TH>
    <TH style='text-align: center;'>관리</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="memberphVO" items="${list}">
    <c:set var="orderno" value="${memberphVO.orderno }"/>
    <c:set var="thumb1" value="${memberphVO.thumb1 }" />
    <tr>
      <td style='vertical-align: middle; text-align: center;'>${memberphVO.orderno }</td>
      <td style='vertical-align: middle; text-align: center;'>${memberphVO.p_number }</td>
      <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                  <IMG src="./storage/main_images/${thumb1 }" style="width:120px; height:80px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${memberphVO.file1}
                </c:otherwise>
              </c:choose>
            </td> 
      <td class="td_bs_left">${memberphVO.p_infor }</td>
      <TD style='vertical-align: middle; text-align: center;'>${memberphVO.p_amount }</TD> 
      <td style='vertical-align: middle; text-align: center;'>${memberphVO.p_state }</td>  
      <TD style='vertical-align: middle; text-align: center;'>
        <A href="./update.do?orderno=${orderno }" title="상품 내역 수정" ><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./img_update.do?orderno=${orderno }" title="이미지 수정"><span class="glyphicon glyphicon-picture"></span></A>
        <A href="./delete.do?orderno=${orderno }" title="상품 내역 삭제"><span class="glyphicon glyphicon-trash"></span></A>        
      </TD>          
    </tr>
  </c:forEach>
  
 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 