<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html class="wide wow-animation" lang="en"> 


<!-- 200730 서현추가 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
 
$(function(){
	
    $("#allcheck").click(function(){
        //클릭되었으면
    	 if ($("#allcheck").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }  

	$("input[type=checkbox]").click(function() {
				$("#allcheck").prop("checked", false);
			});

		});
	
    
    var checkArr = []; // 배열 초기화
	$("#del").click(function() {
			 
			$("input[type=checkbox]:checked").each(function(i) {
				checkArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push

				$.ajax({
					url : '/orm/reviewDel.do',
					type : 'post',
					dataType : 'text',
					data : {
						valueArrTest : checkArr
					}
				});
				location.reload();
			});
		});

	});
</script>

<!-- 200730 서현추가 끝 -->



  <head>
    <!-- Site Title-->
    <title>SIST RENTCAR</title>
<!--     <meta name="format-detection" content="telephone=no"> -->
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta charset="utf-8">
 <!-- Stylesheets -->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/fonts.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  
  
  <!-- 200730 서현추가 버튼정렬  -->
  	<style>		
	.list{
	margin-left: 10px;
    margin-bottom: 46px;
    float: right;
	}
	</style>
	<!-- 200730끝  -->
	
	
	
	
  
  </head>
  <body>
    <!------------------ .page=전체 영역 ------------------->
    <div class="page" id="page">
      <!------------------ Header ------------------->
      <header class="section page-header">
        <div class="rd-navbar-wrap rd-navbar-corporate">
          <!----- 메뉴바 --------->
          <nav class="rd-navbar"  id="menu">
            <div class="rd-navbar-inner">
              <!-- 모바일 var - 메뉴토글-->
              <div class="rd-navbar-panel">
                <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                <!-- logo -->
                <div class="rd-navbar-brand"><a class="brand-name" href="../index.jsp"><img class="logo-default" src="../images/logo.png" alt="" width="208" height="46"/><img class="logo-inverse" src="../images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
              </div>
              <!-- 웹 var. 메뉴바 -->
              <div class="rd-navbar-aside-center">
                <div class="rd-navbar-nav-wrap">
                  <ul class="rd-navbar-nav">
                    <li><a href="../index.jsp">HOME</a>
                    </li>
                    <li><a href="../index.jsp">예약하기</a>
                    </li>
                    <li><a href="community.jsp">커뮤니티</a>
                    </li>
                    <li><a href="review.jsp">이용후기</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="rd-navbar-aside-right">
              	<a class="button button-sm button-secondary button-nina" href="login.jsp">Login</a>
              	<a class="button button-sm button-secondary button-nina" href="join.jsp">Join</a>
              </div>
            </div>
          </nav>
        </div>
      </header>


	<!----------------- 추가내용 ------------------->
	  
	  
	  
 <!-- 200730서현추가 -->
    <section class="section section-lg bg-gray-lighter novi-background bg-cover text-center" id="reviews">
		<div class="container">
		  <div>
		   <h2>리뷰 목록</h2>
			   <a class="button button-sm button-secondary button-nina list" href="reviewWrite.jsp">등록</a>
			 
			   <a class="button button-sm button-secondary button-nina list" id="del" name="del" id="${i.reviewno}">삭제</a>
		  </div>
		
		  
		 <!--  <p>The .table-hover class enables a hover state on table rows:</p>    -->         
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th> <input type="checkbox" id="allcheck" name="nt" value="${i.reviewno}" />번호 </th>
		        <th>제목</th>     
		        <th>작성자</th>
		        <th>비밀번호</th>
		        <th>내용</th>
		        <th>점수</th>
		        <th>작성날짜</th>
		        <th>렌트번호</th>
		      </tr>
		    </thead>
		  <%--    <tbody>
		     
							<c:forEach var="i" items="${reviewList}" varStatus="cnt">
								<tr lang="${i.reviewno}">
									<td><input type="checkbox" id="${i.reviewno}" name="nt" value="${i.reviewno}" />${cnt.count}1</td>
									<td>${i.rtitle}안녕하쇼</td>
									<td>${i.ruser}서현</td>
									<td>${i.rpass}ㅈㄷㅈㄷ</td>
									<td>${i.rcontents}ㅋㅋㅋㅋ</td>
									<td>${i.score}5</td>
									<td>${i.regdate}1212</td>
									<td>${i.rentno}13113</td>
								</tr>
							</c:forEach>

						</tbody>  --%>
					
						
			<tbody>
				<td><input type="checkbox" id="${i.reviewno}" name="nt" value="${i.reviewno}" />1</td>
									<td>안녕하쇼</td>
									<td>서현</td>
									<td>ㅈㄷㅈㄷ</td>
									<td>ㅋㅋㅋㅋ</td>
									<td>5</td>
									<td>1212</td>
									<td>13113</td>
			</tbody>
			
			
			
			
			
		  </table>
		</div>
	</form>
		
	</section>
<!-- 200730 서현추가 끝 -->  
  
  
  
    
    
    
    
    
    

      <!-------------------------- Footer ---------------------->
      <footer class="section page-footer page-footer-minimal novi-background bg-cover text-center bg-gray-darker">
        <div class="container container-wide">
          <div class="row row-fix justify-content-sm-center align-items-md-center row-30">
            <div class="col-md-10 col-lg-7 col-xl-4 text-xl-left"><a href="index.html"><img class="inverse-logo" src="../images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
            <div class="col-md-10 col-lg-7 col-xl-4">
              <p class="right">가시안이며 비상업적 취업지원 포트폴리오 용도로만 사용됩니다.<br/>오른쪽 이니셜 클릭시 개별 email로 연결됩니다.</p>
            </div>
            <div class="col-md-10 col-lg-7 col-xl-4 text-xl-right">
              <ul class="group-xs group-middle"> 
                <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi" href="#">CHJ</a></li>
                <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi" href="#">PIC</a></li>
                <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi" href="#">YMM</a></li>
                <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi" href="#">CSH</a></li>
                <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi" href="#">LHJ</a></li>
              </ul>
            </div>
            
            
          </div>
        </div>
      </footer>
    </div>
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"> </div>
    <!-- Javascript-->
    <script src="../js/core.min.js"></script>
    <script src="../js/script.js"></script>
    <!-- coded by barber-->
  </body>
</html>