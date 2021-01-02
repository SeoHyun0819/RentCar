<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html class="wide wow-animation" lang="en">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">



	$(function() {
		$("span#save").hide();
		$("select").hide();
		$("span#mod").click(function() {
			 var text1 = $("#rcmodel").text();
			 var text2 = $("#rcprice").text();
		 
			$("span#save").show();
			$("select").show();
			 $("#rcmodel").html("<input type='text' value='"+text1+"' id='rcmodel'>");
			 $("#rcprice").html("<input type='text' value='"+text2+"' id='rcmodel'>");
 });
		
		$("span#save").click(function() {
		alert( $("input#rcmodel").val());
		alert( $("input#rcprice").val());
		
		alert( $("select[name='selofcname'] option:selected").val());
		alert( $("select[name='selnaviname'] option:selected").val());
		alert( $("select[name='selfuelname'] option:selected").val());
		alert( $("select[name='selsgmtname'] option:selected").val());
		alert( $("select[name='selmname'] option:selected").val());
		 
		
		$("form").submit();
		 });
	});
</script>



<head>
<!-- Site Title-->
<title>Admin var.SIST RENTCAR</title>
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0">
<meta charset="utf-8">
<!---------------------- Stylesheets ------------------->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
<link rel="stylesheet" href="/orm/SIST/css/bootstrap.css">
<link rel="stylesheet" href="/orm/SIST/css/style.css">
<link rel="stylesheet" href="/orm/SIST/css/fonts.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<style>
.list {
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
				<nav class="rd-navbar" id="menu">
					<div class="rd-navbar-inner">
						<!-- 모바일 var - 메뉴토글-->
						<div class="rd-navbar-panel">
							<button class="rd-navbar-toggle"
								data-rd-navbar-toggle=".rd-navbar-nav-wrap">
								<span></span>
							</button>
							<!-- logo -->
							<div class="rd-navbar-brand">
								<a class="brand-name" href="../adminIndex.jsp"><img
									class="logo-default" src="../images/logo.png" alt=""
									width="208" height="46" /><img class="logo-inverse"
									src="../images/logo-inverse-208x46.png" alt="" width="208"
									height="46" /></a>
							</div>
						</div>
						<!-- 웹 var. 메뉴바 -->
						<div class="rd-navbar-aside-center">
							<div class="rd-navbar-nav-wrap">
								<ul class="rd-navbar-nav">
									<li><a href="/orm/memberList.do">회원관리</a></li>
									<li><a href="#">예약관리</a></li>  
									 <li><a href="/orm/goRentCarList.do">차량관리</a></li>
									<li><a href="#">게시판관리</a></li>
									<li><a href="#">통계</a></li>
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
		<div class="contents">
			<div class="btnSet clfix mgb15">
				<div>
					<h2 style="margin-top: 70px; height: 100px;" align="center">차량정보</h2>
				</div>
					 <span class="fr"> 
			<span class="button" id="mod" style=" margin-left: 1000px;"><a href="#">수정</a></span>
			</span>
 
			</div>
			<br>
			<table class="bbsList" style="margin:0px auto;" >


				<c:forEach var="i" items="${rentCarInfoList}" varStatus="cnt">
			<form action="/orm/modCar.do?rcno=${i.rcno}" method="post" > 

					<tr id="rcno" lang="${i.rcno}" style="width: 500px;">
						<td rowspan="8" style="width: 500px;"><img  src="/orm/SIST/images/${i.rcimg}" style="width: 400px; height: 300px; float: left;"/></td>
					</tr> 
					 
					<tr>
						<th width="200px;">차량모델:</th>
						<td id="rcmodel">${i.rcmodel}<br></td>
					</tr>
					<tr>
						<th>차량가격:</th>
						<td id="rcprice">${i.rcprice}</td>
					</tr>
					<tr>
						<th>지점:</th>
						<td>${i.ofcname}<select name="selofcname" onchange="this.form.submit()">
								<option value="9">강남</option>
								<option value="3">잠실</option>
								<option value="2" selected="selected">구로</option>
						</select></td>
					</tr>
					<tr>
						<th>네비게이션 유무:</th> 
						<c:choose>
							<c:when test="${i.naviname eq 'NONAVIGATION'}">
								<td>네비게이션 X</td>
							</c:when>
							<c:otherwise>
								<td>네비게이션 O</td>
							</c:otherwise>
						</c:choose>
						<td><select name="selnaviname" onchange="this.form.submit()">
								<option value="0" selected="selected">네비게이션 X</option>
								<option value="1">네비게이션 O</option>
						</select></td>
					</tr>
					<tr>
						<th>연료:</th>
						<td>${i.fuelname}<select name="selfuelname" onchange="this.form.submit()">
								<option value="1" selected="selected">휘발유</option>
								<option value="1">휘발유</option>
								<option value="2">경유</option>
								<option value="3" selected="selected">전기차</option>
						</select></td>
					</tr>
					<tr>

						<th>크기:</th>
						<td>${i.sgmtname}<select name="selsgmtname" onchange="this.form.submit()">
								<option value="1">준중형</option>
								<option value="2">중형</option>
								<option value="3" selected="selected">대형</option>
								<option value="4">승합</option>
						</select></td>
					</tr>
					<tr>
						<th>브랜드:</th>
						<td>${i.mname}<select name="selmname" onchange="this.form.submit()">
								<option value="1">현대</option>
								<option value="2">벤츠</option>
								<option value="3" selected="selected">쌍용</option>
								<option value="4">BMW</option>
						</select>
						</td>
					</tr>
					 


			</form>
				</c:forEach>
			</table>
			<br>
			<span class="fr"> 
			<span class="button" style="margin-left:650px;" id="save"><a href="#">저장 </a></span>
			</span>
			 
		</div>
		<br>
		<!-------------------------- Footer ---------------------->
		<footer
			class="section page-footer page-footer-minimal novi-background bg-cover text-center bg-gray-darker">
			<div class="container container-wide">
				<div
					class="row row-fix justify-content-sm-center align-items-md-center row-30">
					<div class="col-md-10 col-lg-7 col-xl-4 text-xl-left">
						<a href="../adminIndex.jsp"><img class="inverse-logo"
							src="../images/logo-inverse-208x46.png" alt="" width="208"
							height="46" /></a>
					</div>
					<div class="col-md-10 col-lg-7 col-xl-4">
						<p class="right">
							가시안이며 비상업적 취업지원 포트폴리오 용도로만 사용됩니다.<br />오른쪽 이니셜 클릭시 개별 email로
							연결됩니다.
						</p>
					</div>
					<div class="col-md-10 col-lg-7 col-xl-4 text-xl-right">
						<ul class="group-xs group-middle">
							<li><a
								class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi"
								href="#">CHJ</a></li>
							<li><a
								class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi"
								href="#">PIC</a></li>
							<li><a
								class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi"
								href="#">YMM</a></li>
							<li><a
								class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi"
								href="#">CSH</a></li>
							<li><a
								class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi"
								href="#">LHJ</a></li>
						</ul>
					</div>



				</div>
			</div>
		</footer>
	</div>
	<!-- Global Mailform Output-->
	<div class="snackbars" id="form-output-global"></div>
	<!-- Javascript-->
	<script src="/orm/SIST/js/core.min.js"></script>
	<script src="/orm/SIST/js/script.js"></script>
	<!-- coded by barber-->
</body>
</html>