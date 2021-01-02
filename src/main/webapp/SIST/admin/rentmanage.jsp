<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(function() {

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
.smallBtn {
	margin: 0 auto;
	float: right;
	padding: 3px 0px;
	min-width: 100px;
	margin-right: 5px;
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
								<a class="brand-name" href="/orm/SIST/adminIndex.jsp"><img
									class="logo-default" src="/orm/SIST/images/logo.png" alt=""
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
									<li><a href="/orm/rentList.do">예약관리</a></li>
									<li><a href="/orm/goOffice.do">지점관리</a></li>
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

		<!------------------------------ 내용입력 ------------------------>
		<section
			class="section section-lg bg-gray-lighter novi-background bg-cover text-center"
			id="reviews">
			<form name="userForm" method="post">
				<div class="container">
					<div>
						<h2>예약 관리</h2>
						<br>
					</div>

					<!--  <p>The .table-hover class enables a hover state on table rows:</p>    -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>렌트번호</th>
								<th>대여일</th>
								<th>반납일</th>
								<th>차량번호</th>
								<th>회원ID</th>
								<th>탑승자</th>
								<th>지점명</th>
								<th>렌트비용</th>
							</tr>
						</thead>


						<tbody>

							<c:forEach var="i" items="${rentListView}">
								<tr>
									<td>${i.rentno}</td>
									<td>${i.rentdate}</td>
									<td>${i.returndate}</td>
									<td>${i.rcmodel}</td>
									<td>${i.memid}</td>
									<td>${i.psgnum}</td>
									<td>${i.ofcname}</td>
									<td>${i.rcprice}</td>
									<%-- <input type="hidden" name="carno" value="${i.carno}"> --%>
									<!-- 뿌리기 -->
									
									<td><a class="button button-sm button-secondary button-nina smallBtn"
										href="rentSubmit.do?carno=${i.carno}" lang="mod">승인</a> 
										<a class="button button-sm button-secondary button-nina smallBtn"
										name="deleteMember" id="deleteMember"
										href="rentListDelete.do?rentno=${i.rentno}&carno=${i.carno}">거절</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

			</form>
		</section>

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