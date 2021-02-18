<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.payway.PaywayCode" %>
<%@ page import="dev.mvc.payway.CodeTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL enum ���</title>
<style type="text/css">
  *{ font-size: 36px; }
</style>
</head>
<body>
<%
  // ���, Controller���� ���� �� ��.
ArrayList<PaywayCode> list = CodeTable.getPaywayCode();
request.setAttribute("list", list);
%>

������� 1:<br>
  <c:forEach var="orderreqVO" items="${list}" varStatus="info">
    ${info.count }. ${orderreqVO.payway }: ${orderreqVO.code }<br>
  </c:forEach>

<br>
������� 2:
  <select name='payway'>
  <c:forEach var="orderreqVO" items="${list}" varStatus="info">
      <option value="${orderreqVO.code }">${orderreqVO.payway }</option>
  </c:forEach>
  </select>

<br>
������� 3:
  <select name='payway'>
  <c:forEach var="orderreqVO" items="${list}" varStatus="info">
      <option value="${orderreqVO.code }" ${orderreqVO.code=='CARD' ? "selected='selected'":"" }>${orderreqVO.payway }</option>
  </c:forEach>
  </select>

</body>
</html>






 
 