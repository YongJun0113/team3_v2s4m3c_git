<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function() {
    $('#ncate_send').on('click', send);
  }); 

  function send() {
    var params = $('#frm').serialize(); 

    var msg = '';
    $.ajax({
      url: './create_ajax.do', // spring execute
      type: 'post',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        if (rdata.ncate_cnt > 0) {
          msg = "〖" + $('#ncate_name').val() + "〗 카테고리를 등록했습니다."
          msg += " <button type='button' class='btn btn-success' onclick='location.reload(true)'>확인</button>";
        } else {
          msg = "〖" + $('#ncate_name').val() + "〗 카테고리 등록에 실패했습니다."
        }
        $('#panel1').html(msg); // 메시지 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR\n';
        msg += 'request.status: '+request.status + '\n';
        msg += 'message: '+error;
        console.log(msg);
      }
    });
      
    // 처리중 출력
    var gif = '';
    gif +="<div style='margin: 0px auto; text-align: center;'>";
    gif +="  <img src='./images/loading.gif' style='width: 20%;'>";
    gif +="</div>";
      
    $('#panel1').html(gif);
    $('#panel1').show(); 
  }

  function update_ncate_form(ncate_no) {

	    $("#ncate_send").off("click");
	    $('#ncate_send').on('click', update_proc);	    
	    var params = 'ncate_no=' + ncate_no;
	    var msg = '';
	    $.ajax({
	      url: './read_ajax.do', // spring execute
	      type: 'get',  // post, get
	      cache: false, // 응답 결과 임시 저장 취소
	      async: true,  // true: 비동기 통신
	      dataType: 'json', // 응답 형식: json, html, xml...
	      data: params,      // 데이터
	      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
	        var frm = $('#frm');
	        $('#ncate_no', frm).val(rdata.ncate_no);
	        $('#ncate_name', frm).val(rdata.ncate_name);
	        $('#nseqno', frm).val(rdata.nseqno);
	        $('#nvisible', frm).val(rdata.nvisible);

	        $('#ncate_send').html('수정');
	        
	        $('#panel1').hide(); // 숨기기    
	      },
	      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	      error: function(request, status, error) { // callback 함수
	        var msg = 'ERROR\n';
	        msg += 'request.status: '+request.status + '\n';
	        msg += 'message: '+error;
	        console.log(msg);
	      }
	    });
	      
	    // 처리중 출력
	    var gif = '';
	    gif +="<div style='margin: 0px auto; text-align: center;'>";
	    gif +="  <img src='./images/loading.gif' style='width: 20%;'>";
	    gif +="</div>";
	      
	    $('#panel1').html(gif);
	    $('#panel1').show(); // 출력 */    
	  }

	  function cancel() {
	    $('#ncate_no', frm).val(0);
	    $('#ncate_name', frm).val('');
	    $('#nseqno', frm).val('');
	    $('#nvisible', frm).val('Y');

	    $('#ncate_send').html('등록');
	  }

	  function update_proc() {
		    $('#frm').attr('action', './update_ajax.do');
		   
		    var params = $('#frm').serialize(); 

		    var msg = '';
		    $.ajax({
		      url: './update_ajax.do', // spring execute
		      type: 'post',  // post
		      cache: false, // 응답 결과 임시 저장 취소
		      async: true,  // true: 비동기 통신
		      dataType: 'json', // 응답 형식: json, html, xml...
		      data: params,      // 데이터
		      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
		        if (rdata.ncate_cnt > 0) {
		          msg = $('#ncate_name').val() + " 카테고리를 수정했습니다."
		          msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
		        } else {
		          msg = $('#ncate_name').val() + " 카테고리 수정에 실패했습니다."
		        }
		        $('#panel1').html(msg); 
		      },
		      
		      error: function(request, status, error) { // callback 함수
		        var msg = 'ERROR\n';
		        msg += 'request.status: '+request.status + '\n';
		        msg += 'message: '+error;
		        console.log(msg);
		      }
		    });
		      
		    // 처리중 출력
		    var gif = '';
		    gif +="<div style='margin: 0px auto; text-align: center;'>";
		    gif +="  <img src='./images/loading.gif' style='width: 20%;'>";
		    gif +="</div>";
		      
		    $('#panel1').html(gif);
		    $('#panel1').show(); // 출력 */    
		  } 

	  function delete_ncate_form(ncate_no) {
		  
		    var params = 'ncate_no=' + ncate_no;		   
		    var msg = '';
		    $.ajax({
		      url: './read_ajax.do', // spring execute
		      type: 'get',  // post, get
		      cache: false, // 응답 결과 임시 저장 취소
		      async: true,  // true: 비동기 통신
		      dataType: 'json', // 응답 형식: json, html, xml...
		      data: params,      // 데이터
		      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
		        if (rdata.ncate_name.length > 0) {
		          msg = "『" + rdata.ncate_name + "』 카테고리를 삭제하시겠습니까?<br>";
		          msg += "카테고리를 삭제하면 복구 할 수 없습니다.";
		          msg += " <button type=\"button\" class=\"btn btn-danger\" onclick=\"delete_proc("+ncate_no+", '"+rdata.ncate_name+"')\">삭제 진행</button>";
		          msg += " <button type='button' class='btn btn-dark' onclick='cancel()'>취소</button>";
		        } else {
		          msg = "『" + rdata.ncate_name + "』 카테고리 정보가 없습니다.";
		          msg += " <button type='button' class='btn btn-dark' onclick='location.reload(true)'>확인</button>";
		        }
		        $('#panel1').html(msg); // 메시지 출력
		      },
		      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
		      error: function(request, status, error) { // callback 함수
		        var msg = 'ERROR\n';
		        msg += 'request.status: '+request.status + '\n';
		        msg += 'message: '+error;
		        console.log(msg);
		      }
		    });
		      
		    // 처리중 출력
		    var gif = '';
		    gif +="<div style='margin: 0px auto; text-align: center;'>";
		    gif +="  <img src='./images/loading.gif' style='width: 20%;'>";
		    gif +="</div>";
		      
		    $('#panel1').html(gif);
		    $('#panel1').show(); // 출력 */    
		  }

		  function delete_proc(ncate_no, ncate_name) {

		    var params = 'ncate_no=' + ncate_no;		   
		    var msg = '';
		    $.ajax({
		      url: './delete_ajax.do', // spring execute
		      type: 'post',  // post
		      cache: false, // 응답 결과 임시 저장 취소
		      async: true,  // true: 비동기 통신
		      dataType: 'json', // 응답 형식: json, html, xml...
		      data: params,      // 데이터
		      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
		        if (rdata.ncate_cnt > 0) {
		          msg = "『" + ncate_name + "』 카테고리를 삭제했습니다."
		          msg += " <button type='button' class='btn btn-success' onclick='location.reload(true)'>확인</button>";
		        } else {
		          msg = "『" + ncate_name + "』 카테고리 삭제에 실패했습니다."
		        }
		        $('#panel1').html(msg); // 메시지 출력
		      },
		      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
		      error: function(request, status, error) { // callback 함수
		        var msg = 'ERROR\n';
		        msg += 'request.status: '+request.status + '\n';
		        msg += 'message: '+error;
		        console.log(msg);
		      }
		    });
		      
		    // 처리중 출력
		    var gif = '';
		    gif +="<div style='margin: 0px auto; text-align: center;'>";
		    gif +="  <img src='./images/loading.gif' style='width: 20%;'>";
		    gif +="</div>";
		      
		    $('#panel1').html(gif);
		    $('#panel1').show(); // 출력 */    
		  }
		   
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>공지사항 카테고리 분류</DIV>
 
 <DIV id='panel_create'
    style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm' id='frm' method='POST' action=''>
      <input type='hidden' name='ncate_no' id='ncate_no' value='0'>
       
      <label>카테고리</label>
      <input type='text' name='ncate_name' id='ncate_name' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='nseqno' id='nseqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='nvisible' id='nvisible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="button" class="btn btn-success" id='ncate_send'>등록</button>
      <button type="button" class='btn btn-dark' onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto; display: none;"></DIV>

  <TABLE class='table table-striped'>
    <colgroup>
      <col style="width: 10%;"/>
      <col style="width: 10%;"/>
      <col style='width: 25%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>        
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">출력순서</TH>
      <TH class="th_bs">등록순서</TH>
      <TH class="th_bs">카테고리</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">글수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="ncateVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="ncate_no" value="${ncateVO.ncate_no}" />
      <TR>   
        <TD class="td_bs">${ncateVO.nseqno }</TD>
        <TD class="td_bs">${ncateVO.ncate_no }</TD>
        <TD class="td_bs_left">${ncateVO.ncate_name }</TD>
        <TD class="td_bs">${ncateVO.ncate_rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${ncateVO.nvisible == 'Y'}">
              <A href="./update_nvisible.do?ncate_no=${ncate_no }&nvisible=${ncateVO.nvisible }"><IMG src="./images/open.png"></A>
            </c:when>
            <c:otherwise>
              <A href="./update_nvisible.do?ncate_no=${ncate_no }&nvisible=${ncateVO.nvisible }"><IMG src="./images/close.png"></A>
            </c:otherwise>
          </c:choose>
        </TD>
        <TD class="td_bs">${ncateVO.ncate_cnt}</TD>
        <TD class="td_bs">
          <A href="javascript:update_ncate_form(${ncate_no })"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="javascript:delete_ncate_form(${ncate_no })"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_nseqno_up.do?ncate_no=${ncate_no }"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_nseqno_down.do?ncate_no=${ncate_no }"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>             
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 