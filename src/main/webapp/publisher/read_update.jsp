<%@ page contentType="text/html; charset=UTF-8" %>
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
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
   <DIV class='title_line'>출판사 정보</DIV>
 
  <DIV class='title_line'>출판사 정보 > ${publishVO.name } 조회(수정)</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='pub_no' id='pub_no' value='${publisherVO.pub_no }'>
        
        <label>구분번호</label>
      <input type='number' name='pub_no' value='${publisherVO.pub_no }' required="required" 
      min='1' max='1000' step='1' style='width: 5%;'>
      
       <label>사진 업로드</label>  
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' >
        
        <input type='file' name='file1MF', id='file1MF'  value='${publisherVO.file1MF }' required="required" placeholder="파일 선택"
                  style='width: 10%;'>
        
      <label>출판사 이름</label> 
      <input type='text' name='name' value='${publisherVO.name }' required="required" style='width: 31%;'><br>
       
       <label>출판사 주소</label>
      <input type='text' name='http' value='${publisherVO.http }' required="required" style='width: 31%;'><br>
      
       <label>기타사항</label>
      <input type='text' name='etc' value='${publisherVO.etc }' required="required" style='width: 33%;'><br>
      

  
     
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
<colgroup>
   <col style='width: 5%;'/>
   <col style='width: 25%;'/>
   <col style='width: 20%;'/>
   <col style='width: 20%;'/>    
   <col style='width: 20%;'/>
   <col style='width: 10%;'/>
   <col style='width: 10%;'/>
   
  </colgroup>
 
  <thead>  
<TR>
    <TH class="th_bs">구분번호 </TH>
    <TH class="th_bs"> 이미지   </TH>
    <TH class="th_bs">출판사 이름</TH>
    <TH class="th_bs">출판사 주소</TH>
    <TH class="th_bs">기타사항</TH>
    <TH class="th_bs">등록 시간</TH>
    <TH class="th_bs"> 수정/삭제   </TH>
    
  </TR>
  </thead>
  
  <tbody>
 <c:forEach var="publisherVO" items="${list }">
    <c:set var="pub_no" value="${publisherVO.pub_no }" />
    <c:set var="thumb1" value="${publisherVO.thumb1 }" />  
    <TR>
    <TD class="td_bs">${publisherVO.pub_no }</TD>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                  <IMG src="./storage/main_images/${thumb1 }"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${publisherVO.file1}
                </c:otherwise>
              </c:choose>
      </TD>        
      <TD class="td_bs">${publisherVO.pub_no }</TD>
      <TD class="td_bs">${publisherVO.name }</TD>
      <TD class="td_bs">${publisherVO.http }</TD>
      <TD class="td_bs">${publisherVO.etc }</TD>
     
  <TD class="td_bs">                                   
        <A href="./read_update.do?pub_no=${pub_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?pub_no=${pub_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
     
       </TD>                    
    </TR>   
  </c:forEach>   
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 