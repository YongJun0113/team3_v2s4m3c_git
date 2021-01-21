<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %> 
<%@ page import="dev.mvc.pay.TypeCode" %>
<%@ page import="dev.mvc.pay.CodeTable" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>eBooks3</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/modal_style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<!-- <ASIDE class="aside_left">
  <A href='./list_all.do'>접수된 문의내역</A>
</ASIDE> 
<div class='menu_line'></div> -->

<DIV style='width: 100%; margin: 0px auto;'>
  <FORM name='frm' method='POST' action='./create.do' class="container_modal form-horizontal" enctype="multipart/form-data">
     <div class="modal_contentBox">   
       <h1 style="margin-left: 15px;">1:1 문의하기</h1>  
       <hr style="border-color: #ccc;">

        <%-- FK 전달 --%>
        <input type='hidden' name='m_no' id='m_no' value="${param.m_no}">
        
        <div class="inner_container">
         <label class="col-md-2 control-label" for="cs_type" style="text-align: center;">문의유형</label>
         <div class="col-md-10">
          <select id="cs_type" name='cs_type' class="form-control" style='width: 20%;' required="required">
           <c:forEach var="code" items="${type_list}" varStatus="info"> <!-- code:  -->
            <option value="${code.value}">${code.pay}</option>
           </c:forEach>
          </select>
         </div>
         <hr>
         <div style="padding: 30px 0 30px 0;">
           <label class="col-md-2 control-label" style="text-align: center;">제목</label>
           <div class="col-md-10">
             <input type='text' name='cs_title' value='' required="required" 
                       placeholder="" class="form-control" >
           </div>
                
           <label class="col-md-2 control-label" style="text-align: center;">내용</label>
           <div class="col-md-10">
             <textarea name='cs_contents' required="required" 
                       placeholder="" rows='10' class="form-control" ></textarea>
           </div>
           <br><br>
           <label class="col-md-2 control-label" style="text-align: center;">첨부파일</label>
           <div class="col-md-10">
                <input type='file' class="form-control" name='file1MF' id='file1MF' 
                          value='' placeholder="파일 선택">
           </div>
         </div>
         <div class="clearfix">
           <button type="button" onclick="javascript:history.back();" class="btn_cancel" style="background-color: #f44336;">취소</button>  
           <button type="submit" class="btn_send">등록</button>
         </div>
       </div>  <!--  End inner_container  --> 
     </div>  <!--  End modal_contentBox -->
  </FORM>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>