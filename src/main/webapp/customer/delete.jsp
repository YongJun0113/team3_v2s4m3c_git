<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>eBooks3</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/modal_style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    <A href="./list_my_inquiry.do?m_no=${param.m_no}&m_id=${param.m_id}">나의 1:1 문의</A> > ${member_Customer_join.r_mname}님 문의 삭제
    <div style="float: right; margin-right: 8px;">
    <A href="./create.do?m_no=${param.m_no}&m_id=${param.m_id}">문의하기</A>
    </div>
  </DIV>
 
  <FORM name='frm' method='POST' action='./delete.do' class="container_modal form-horizontal">
    <input type='hidden' name='cs_no' value='${param.cs_no}'>
    <input type="hidden" name="m_no" value="${member_Customer_join.m_no}">
    <input type="hidden" name="m_id" value="${param.m_id}">
     <div class="modal_contentBox">
      <div class="inner_container">         
        <div  style='text-align: center; padding: 30px 0 30px 0;'>
          삭제 문의 제목: ${member_Customer_join.cs_title }<br><br>
          <span style="color: red;">삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
          <div class="col-md-12">
            <input type='password' class="form-control" name='r_mpasswd'  value='' placeholder="계정 패스워드" style='width: 25%; margin-right: -28px;' required="required">
          </div>
          
          <div class="clearfix">   
           <button type = "button" onclick = "history.back()" class="btn_cancel" style="background-color: #808080;">취소</button>
           <button type = "submit" class="btn_send" style="background-color: #f2960d;">삭제</button>
          </div>
       </div> <!-- end text-align: center; padding: 30px 0 30px 0;  -->
      </div>  <!--  end "inner_container"       -->
    </div>    <!--  end  "modal_contentBox"  -->
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>