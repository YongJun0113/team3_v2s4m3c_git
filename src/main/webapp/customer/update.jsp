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
<DIV class='title_line'> 
  <A href="./list_all.do">
   모든 문의 내역
  </A>
  > 수정
</DIV>

<FORM name='frm' method='POST' action='./update.do' class="container_modal form-horizontal">
 <div class="modal_contentBox">
  <input type='hidden' name='cs_no' id='cs_no' value="${param.cs_no }">
  <%--   <input type='hidden' name='m_no' id='m_no' value="${param.m_no }">
  <input type='hidden' name='m_id' id='m_id' value="${param.m_id}"> --%>

  <div class="inner_container">
   <label class="col-md-2 control-label" for="cs_type" style="text-align: center;">문의유형</label>
   <div class="col-md-10">
    <select id="cs_type" name='cs_type' class="form-control" style='width: 25%;'>
     <option value="${param.cs_type }" ${param.cs_type=='A03' ? "selected='selected'":"" }
                                                  ${param.cs_type=='A01' ? "selected='selected'":"" }
                                                  ${param.cs_type=='A02' ? "selected='selected'":"" }
                                                  ${param.cs_type=='A04' ? "selected='selected'":"" }
                                                  ${param.cs_type=='A99' ? "selected='selected'":"" }>${member_Customer_join.cs_type }</option>
    </select>
   </div>
  <hr>
  
  <div style="padding: 30px 0 30px 0;">
   <label class="col-md-2 control-label" style="text-align: center;">제목</label>
   <div class="col-md-10">
     <input type='text' name='cs_title' value='${member_Customer_join.cs_title}' required="required" 
                 placeholder="" class="form-control" >
   </div>
    
   <label class="col-md-2 control-label" style="text-align: center;">내용</label>
   <div class="col-md-10">
     <textarea name='cs_contents' required="required" placeholder="" rows='10' class="form-control" >${member_Customer_join.cs_contents}</textarea>
   </div> 
  
   <label class="col-md-2 control-label" style="text-align: center;">답변받을 이메일</label>
   <div class="col-md-10">
       <input type='text' class="form-control" name='email' value='${member_Customer_join.r_email }' placeholder="문의 답변을 받으실 이메일" required="required" style='width: 45%;'>
   </div>
   <hr>
     
   <label class="col-md-2 control-label" style="text-align: center;">패스워드</label>
   <div class="col-md-10">
       <input type="password" class="form-control" name='r_mpasswd' value='' placeholder="패스워드" required="required" style='width: 45%;'>
   </div>
  </div> <!-- end  padding: 30px 0 30px 0;  -->

   <div class="clearfix">
    <button type="button" onclick="javascript:history.back();" class="btn_cancel" style="background-color: #f44336;">취소</button>  
    <button  type="submit" class="btn_send">수정</button>
   </div>

  </div>  <!--  End inner_container  --> 
 </div>  <!--  End modal_contentBox -->

</FORM>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>