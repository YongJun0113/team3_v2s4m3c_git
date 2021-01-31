<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3_ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../ebook/css/ebook.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>

<jsp:include page="/menu/top.jsp" flush='false' />

<script>
     
    $(function(){  // 자동 실행
        $("#total_sum").html("0 원");  // 초기값 0 원
    }); 
    
     /* 체크된 체크박스 값만 더하여 누적합계 산출 */
     function price_sum() {
       var sum=0;
       var cnt = $(".ck_box").length;

       for(var i = 0; i < cnt; i++) {
         if($(".ck_box")[i].checked == true  ) {
             sum += parseInt($(".ck_box")[i].value);
         } 
       } 
       $("#total_sum").html(sum+" 원");
    }

    

</script>

<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">

  <DIV class="title_line">
    장바구니
  </DIV>
  <DIV class="aside_left">
    <A href="../ebook/list.do">ebook 전체 보기</A>
  </DIV>
  <DIV class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </DIV> 
  <DIV class='menu_line'></DIV>
  
    
  <div style='width: 100%;'>
    <TABLE class='table_basic table-striped' style='width: 100%;'>
      <colgroup>
        <col style='width: 20%;'/>
        <col style='width: 50%;'/>
        <col style="width: 15%;"/>
        <col style="width: 15%;"/>
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs"><input type="checkbox" name="check_all" id="check_all"> 전체 선택
          <script>
              /*     체크박스 전체 선택/전체 해제      */
              $('#check_all').click(function() {
                 if ($('#check_all').prop("checked")) { 
                    $(".ck_box").prop("checked", true);
                    price_sum();  
                 } else {
                   $(".ck_box").prop("checked", false);
                   price_sum();
                 }
              })    
          </script>     
        </TH>     
        <TH class="th_bs">상품</TH>
        <TH class="th_bs">가격</TH>
        <TH class="th_bs">
          <button type="button" class="btn_select_delete" style="background:#eee; margin: 7px auto; padding: 10px 12px; ">
            선택 삭제
          </button>
          <script> /*  선택 삭제   */
              $(".btn_select_delete").click(function () {
                    var double_check = confirm("선택하신 상품이 삭제됩니다.");
                    if(double_check) {
                         var cartno_list = [];
                         
                         $("input[name='ck_box']:checked").each(function() {
                             cartno_list.push($(this).attr("data-cartno"));  
                          }); // 체크된 항목을 배열에 저장

                          var param = { 
                              "cartno_list" : cartno_list
                          };  // 카트번호 배열 저장
                          
                         $.ajax({
                             url: "./delete_ajax.do",
                             dataType: "json",
                             type: "post",
                             data: param,
                             success: function(rdata){
                                  if(rdata.result != 0) {
                                    location.href="./list.do";
                                  } else {
                                    alert("삭제 X");
                                  }
                                }, 
                                error: function(request, status, error) {
                                  var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                                  console.log(msg); // Chrome console 출력
                                }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 

                          });  //   ajax 호출
                    } 
               });

          </script>          
        </TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="cartVO" items="${list}">  <!-- request 객체에 접근 -->
        <c:set var="cart_no" value="${cartVO.cart_no}" />
        <c:set var="user_id" value="${sessionScope.id}" />
        <c:set var="eb_no" value="${cartVO.eb_no}" />
        <c:set var="eb_title" value="${cartVO.eb_title}" />
        <c:set var="eb_price" value="${cartVO.eb_price}" />
        <TR>
          <TD class="td_bs"><input type="checkbox" name="ck_box" class="ck_box" data-cartno="${cart_no}" 
                                               value="${eb_price}"  onClick="price_sum()" />
              <script>
               $(".ck_box").click(function(){
                    $("#check_all").prop("checked", false);  // 전체 선택 체크박스 체크 해제
                    price_sum();
               });
              </script>                                                                                  
          </TD>
          <TD class="td_bs_left" style="padding:6px 0 6px 0;">
          <A href="../ebook/read.do?eb_no=${eb_no}">
            <c:set var="thumb" value="${cartVO.eb_thumb }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <img src="./storage/main_images/${thumb}" >
                </c:when>
                <c:otherwise>
                   <img class="card-img-top" src="http://placehold.it/300x400" style="width: 120px; height: 160px;">  
                </c:otherwise> 
              </c:choose>
               ${eb_title}
             </A>
          </TD>               
          <TD class="td_bs">
            <fmt:formatNumber  value="${eb_price}" pattern="#,###" /><span class="won"> 원</span>
          </TD>           
          <TD class="td_bs">
            <button type="button" class="btn_delete_${cart_no}" data-cartno="${cart_no}" 
                        style="background:#eee; padding: 7px 9px; ">삭제</button>
            <script> /*  선택 삭제   */
                $(".btn_delete_${cart_no}").click(function () {
                      var double_check = confirm("선택된 상품을 삭제하시겠습니까?");
                      if(double_check) {
                           var cartno_list = [];
                           
                           cartno_list.push($(this).attr("data-cartno"));  

                            var param = { 
                                "cartno_list" : cartno_list
                            };  // 카트번호 배열 저장
                            
                           $.ajax({
                               url: "./delete_ajax.do",
                               dataType: "json",
                               type: "post",
                               data: param,
                               success: function(rdata){
                                    if(rdata.result != 0) {
                                      location.href="./list.do";
                                    } else {
                                      alert("삭제 X");
                                    }
                                  }, 
                                  error: function(request, status, error) {
                                    var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                                    console.log(msg); // Chrome console 출력
                                  }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 
  
                            });  //   ajax 호출
                      } 
                 });
  
            </script>                                               
          </TD>           
        </TR>               
      </c:forEach>  
      <TR style="height: 100px; font-weight: bolder; font-size: 1.4em;">
        <TD class="td_bs"  rowspan="2">결제 합계</TD>
        <TD class="td_bs"  rowspan="2" colspan="3" id="total_sum"></TD>        
      </TR>                  
      </tbody>
    </TABLE>
  </div>
  
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>
