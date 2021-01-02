<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(function() {
		$("a#save").click(function() {
			if ($("input[name='rcno']").val().length == 0) {
				alert('차량번호를 입력해주세요');
				$("input[name='rcno']").val('');
				return false;
			} else {
				if (isNaN($("input[name='rcno']").val())) {
					alert('숫자로 입력해주세요');
					$("input[name='rcno']").val('');
					return false;
				}
			}//rcno
			
			if ($("input[name='rcprice']").val().length == 0) {
				alert('차량모델을 입력해주세요');
				$("input[name='rcprice']").val('');
				return false;
			} else {
				$("input[name='rcprice']").val();
			}//rcmodel
			
			if ($("input[name='rcprice']").val().length == 0) {
				alert('가격을 입력해주세요');
				$("input[name='rcprice']").val('');
				return false;
			} else {
				if (isNaN($("input[name='rcprice']").val())) {
					alert('숫자로 입력해주세요');
					$("input[name='rcprice']").val('');
					return false;
				}
			}//rcprice
			
			$("form").submit();
		});
	});
</script>
 


  <head>
    <!-- Site Title-->
    <title>Admin var.SIST RENTCAR</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta charset="utf-8">
 	<!---------------------- Stylesheets ------------------->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="/orm/SIST/css/bootstrap.css">
    <link rel="stylesheet" href="/orm/SIST/css/style.css">
    <link rel="stylesheet" href="/orm/SIST/css/fonts.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
	<style>
	.list{
	margin-left: 10px;
    margin-bottom: 46px;
    float: right;
	
	}
	</style>
	
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
                <div class="rd-navbar-brand"><a class="brand-name" href="../adminIndex.jsp"><img class="logo-default" src="../images/logo.png" alt="" width="208" height="46"/><img class="logo-inverse" src="../images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
              </div>
              <!-- 웹 var. 메뉴바 -->
              <div class="rd-navbar-aside-center">
                <div class="rd-navbar-nav-wrap">
                  <ul class="rd-navbar-nav">
                  	 <li><a href="/orm/memberList.do">회원관리</a>
                    </li>
                    <li><a href="#">예약관리</a>
                    </li>
                    
                    <li><a href="/orm/goRentCarList.do">차량관리</a>
                    </li>
                    <li><a href="#">게시판관리</a>
                    </li>
                    <li><a href="#">통계</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="rd-navbar-aside-right">
              	 <c:choose>
								<c:when test="${sessionScope.userId == null}">
									<a class="button button-sm button-secondary button-nina"
										href="/orm/indexlogin.do">Login</a>
									<a class="button button-sm button-secondary button-nina"
										href="/orm/joinRentcar.do">Join</a>
								</c:when>

								<c:otherwise>
									<b>${sessionScope.userId} 님 환영합니다</b>
									<a class="button button-sm button-secondary button-nina"
										href="/orm/logoutPro.do">Logout</a>
								</c:otherwise>

							</c:choose>
              </div>
            </div>
          </nav>
        </div>
      </header>
     
     
<%--      <%
     request.setCharacterEncoding("UTF-8");
     List<OfficeBean> list =null;
     list=RentCarDAO.selectOffice();
     %> --%>
     <!------------------------------ 내용입력 ------------------------>
    <section class="section section-lg bg-gray-lighter novi-background bg-cover text-center" id="reviews">
		<div class="container">
		  <div>
		   <h2>차량 등록</h2>
			 <br>
		  </div>
		<form action="/orm/insertRentCar.do" name="frm" method="post"  enctype="multipart/form-data">
		<table class="bbsWrite mgb10" style="margin-left: 350px;">
									<caption></caption>
									<colgroup>
										<col width="95" />
										<col />
									</colgroup>
									<tbody>
										<tr>
											<th>차량번호</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="rcno" id="rcno" class="inputText"
												size="50" /></td>
										</tr>
										 
										<tr>
											<th>차량모델</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="rcmodel" id="rcmodel" class="inputText"
												size="50" />
												 
												</td>
										</tr>
										<tr>
											<th>가격</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="rcprice" id="rcprice"  class="inputText"
												size="50" />
 
												</td>
										</tr>
										<tr>
											<th>지점</th>
											<td>
											<input type="checkbox"  name="ofcno" id="ofcno" value="1"  class="inputText"  /> 강남
											<input type="checkbox"  name="ofcno" id="ofcno" value="2"  class="inputText"  /> 잠실
											<input type="checkbox"  name="ofcno" id="ofcno" value="3"  class="inputText"  /> 구로
										 	  
											</td>
										</tr>
										<tr>
											<th>네비게이션</th>
											<td>
											<input type="checkbox"  name="navino" id="navino" value="0"  class="inputText"  /> 네비게이션 X
											<input type="checkbox"  name="navino" id="navino" value="1"  class="inputText"  /> ANDROIDAUTO
											<input type="checkbox"  name="navino" id="navino" value="2"  class="inputText"  /> APPLECARPLAY
											 
										 	 
											</td>
										</tr>
										 
										<tr>
											<th>연료</th>
											<td>
										 <input type="checkbox"  name="fuelno" id="fuelno" value="1"  class="inputText"  /> 휘발유
										 <input type="checkbox"  name="fuelno" id="fuelno" value="2"  class="inputText"  /> 경유
										 <input type="checkbox"  name="fuelno" id="fuelno" value="3"  class="inputText"  /> 전기차
										 
											</td>
										</tr>
										<tr>
											<th>크기</th>
											<td>
											 <input type="checkbox" name="sgmtno" id="sgmtno" value="1"  class="inputText"/> 준중형  
											 <input type="checkbox" name="sgmtno" id="sgmtno" value="2"  class="inputText"/> 중형
											 <input type="checkbox" name="sgmtno" id="sgmtno" value="3"  class="inputText"/> 대형  
											 <input type="checkbox" name="sgmtno" id="sgmtno" value="4"  class="inputText"/> 승합 	
											 
											 </td>	
										</tr>
										<tr>
											<th>브랜드</th>
											<td>
											<input type="checkbox" name="makerno" id="makerno" value="1" class="inputText"/> 현대 
											<input type="checkbox" name="makerno" id="makerno" value="2" class="inputText"/> 벤츠
											<input type="checkbox" name="makerno" id="makerno" value="3" class="inputText"/> 쌍용 
											<input type="checkbox" name="makerno" id="makerno" value="4" class="inputText"/> BMW 
											<input type="checkbox" name="makerno" id="makerno" value="5" class="inputText"/> 테슬라 
											 
											</td>	
											 
												 
										</tr>
										<tr>
											<th>이미지파일</th>
											<td>
											 <input type="file" name="file" id="rcimg"  value="rcimg" class="inputText"/> 
												</td>	
										</tr>
										 
	 
										 
									</tbody>
								</table>
								<span class="button"><a href="#" id="save">저장</a></span>
								</form>
		  
		 <!--  <p>The .table-hover class enables a hover state on table rows:</p>    -->         
	 
		</div>
	</form>
		
	</section>
 
      <!-------------------------- Footer ---------------------->
      <footer class="section page-footer page-footer-minimal novi-background bg-cover text-center bg-gray-darker">
        <div class="container container-wide">
          <div class="row row-fix justify-content-sm-center align-items-md-center row-30">
            <div class="col-md-10 col-lg-7 col-xl-4 text-xl-left"><a href="../adminIndex.jsp"><img class="inverse-logo" src="../images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
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
  	<script src="/orm/SIST/js/core.min.js"></script>
	<script src="/orm/SIST/js/script.js"></script>
    <!-- coded by barber-->
  </body>
</html>