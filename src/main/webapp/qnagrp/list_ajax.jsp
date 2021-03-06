<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>질문 카테코리</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function() {
  $('#btn_send').on('click', send);
}); 

function send() {
  // alert('send() execute.');
  // return;
  
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './create_ajax.do');
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  // var params = 'contentsno=' + ${param.contentsno};
  var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './create_ajax.do', // spring execute
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.cnt > 0) {
        msg = "『" + $('#name').val() + "』 카테고리 그룹을 등록했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + $('#name').val() + "』 카테고리 그룹 등록에 실패했습니다."
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
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function update_form(qnagrpno) {
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './read_ajax.do');
  $("#btn_send").off("click");
  $('#btn_send').on('click', update_proc);
      
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = 'qnagrpno=' + qnagrpno;
  // var params = 'contentsno=' + ${param.contentsno};
  // var params = $('#frm_create').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

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
      $('#qnagrpno', frm).val(rdata.qnagrpno);
      $('#name', frm).val(rdata.name);
      $('#seqno', frm).val(rdata.seqno);
      $('#visible', frm).val(rdata.visible);

      $('#btn_send').html('수정');
      
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
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function cancel() {
  $('#qnagrpno', frm).val(0);
  $('#name', frm).val('');
  $('#seqno', frm).val('');
  $('#visible', frm).val('Y');

  $('#btn_send').html('등록');

  $('#panel1').html('');
  $('#panel1').hide();
}

function update_proc() {
  // alert('update_proc() execute.');
  // return;
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './update_ajax.do');
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  // var params = 'contentsno=' + ${param.contentsno};
  var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './update_ajax.do', // spring execute
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.cnt > 0) {
        msg = "『" + $('#name').val() + "』 카테고리 그룹을 수정했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + $('#name').val() + "』 카테고리 그룹 수정에 실패했습니다."
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
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function delete_form(categrpno) {
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './read_ajax.do');
      
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = 'categrpno=' + categrpno;
  // var params = 'contentsno=' + ${param.contentsno};
  // var params = $('#frm_create').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './read_ajax.do', // spring execute
    type: 'get',  // post, get
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.name.length > 0) {
        msg = "『" + rdata.name + "』 카테고리 그룹을 삭제하시겠습니까?<br>";
        msg += "카테고리 그룹을 삭제하면 복구 할 수 없습니다.";
        msg += " <button type=\"button\" onclick=\"delete_proc("+qnagrpno+", '"+rdata.name+"')\">삭제 진행</button>";
        msg += " <button type='button' onclick='cancel()'>취소</button>";
      } else {
        msg = "『" + rdata.name + "』 카테고리 정보가 없습니다.";
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
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
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function delete_proc(categrpno, name) {
  // alert('update_proc() execute.');
  // return;
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './update_ajax.do');
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = 'qnagrpno=' + qnagrpno;
  // var params = 'categrpno=' + ${param.categrpno};
  // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './delete_ajax.do', // spring execute
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.cnt > 0) {
        msg = "『" + name + "』 카테고리 그룹을 삭제했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + name + "』 카테고리 그룹 삭제에 실패했습니다."
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
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

</script>

 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>카테고리 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
     <A href=../qnagrp/create.do>등록</A>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 30%;'/>
    <col style='width: 30%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">qna 구분</TH>
    <TH class="th_bs">qna 카테고리</TH>
    <TH class="th_bs">입력날짜</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="qnagrpVO" items="${list }">
    <c:set var="qnagrpno" value="${qnagrpVO.qnagrpno }" />
    <TR>
      <TD class="td_bs">${qnagrpVO.qnagrpno }</TD>
      <TD class="td_bs_left">${qnagrpVO.name }</TD>
      <TD class="td_bs">${qnagrpVO.rdate.substring(0, 10) }</TD>
     
  <TD class="td_bs">                                   
          <A href="javascript:update_form(${qnagrpno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="javascript:delete_form(${qnagrpno })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
     
       </TD>                    
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 