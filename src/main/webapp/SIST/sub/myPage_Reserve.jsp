<%@page import="java.util.Arrays"%>
<%@page import="java.io.Console"%>
<%@page import="sist.com.dto.RentListBean"%>
<%@page import="sist.com.dto.MemberBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="sist.com.dto.RentCarBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>

 <html class="wide wow-animation" lang="en"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">

$(function(){
	 

	 
});
 

</script>
<head>
<!-- Site Title-->
<title>SIST RENTCAR</title>
<!--     <meta name="format-detection" content="telephone=no"> -->
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta charset="utf-8">
<!-- Stylesheets -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="/orm/SIST/css/bootstrap.css">
    <link rel="stylesheet" href="/orm/SIST/css/style.css">
    <link rel="stylesheet" href="/orm/SIST/css/fonts.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
 
 table#memberInfo{
 padding-left: 500px;
 
 }
 
 #reserve0{
 font-size: 30px;
 align-items: center;
 
 }
</style>

</head>
 
 
 
<body>
 
 

	<!------------------ .page=전체 영역 ------------------->
	<div class="page">
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
								<a class="brand-name" href="../index.jsp"><img
									class="logo-default" src="../../images/logo.png" alt="" width="208"
									height="46" /><img class="logo-inverse"
									src="../images/logo-inverse-208x46.png" alt="" width="208"
									height="46" /></a>
							</div>
						</div>
						<!-- 웹 var. 메뉴바 -->
						<div class="rd-navbar-aside-center">
							<div class="rd-navbar-nav-wrap">
								<ul class="rd-navbar-nav">
									<li><a style="font-size: 25px;">MYPAGE</a> <!-- 예약하기/예약확인/ -->
									</li>
									 <!--  <li class="active"><a href="#branchGuide">마이페이지</a></li>   -->
									<li><a href="/orm/myPage.do">내정보</a></li>
									<li class="active"><a href="/orm/myPageReserve.do" >예약확인</a></li>
													<li><a href="/orm/myQna.do" >문의내역</a></li>
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
									<a class="button button-sm button-secondary button-nina"
										name="mypage" id="mypage" href="/orm/myPage.do">MyPage</a>
									<a class="button button-sm button-secondary button-nina"
										href="/orm/joinRentcar.do">Join</a>
								</c:otherwise>

							</c:choose>

						</div>
					</div>
				</nav><!----- 메뉴바 --------->
			</div>
			 
		 
			 
				 <c:choose>
				 <c:when test="${functions:length(myPageReserveList)==0}">
				 
			 
				<h3 style="text-align: center; margin-top: 200px;"> <c:out value="예약내역이 없습니다"></c:out></h3>
				 </c:when>
				 <c:otherwise>
				  
				 
				 
				 
			<table class="bbsWrite mgb35">
							<caption></caption>
							<colgroup>
								<col width="80"/>
								<col width="130" />
								<col width="130" />
								<col width="130" />
								<col width="130" />
								<col width="200" />
								<col width="130" />
								<col width="130" />
								<col width="130" />
								<col width="130" />
								<col width="130" />
								<col width="230" />
							</colgroup>
							<tbody>
								
							</tbody>
						</table>
					 
					<form action="#" name="delForm" method="post" style="margin-left: 400px; margin-top: 60px;">
					<table class="bbsList">
						<colgroup>
							<col width="130" />
							<col width="130" />
							<col width="130" />
							<col width="130" />
							<col width="130" />
							<col width="100" />
							<col width="130" />
							<col width="130" />
							


						</colgroup>
						<thead >
							<tr>
 
								<th scope="col" class="fir">RENTNO</th>
								<th scope="col" class="fir">RENTDATE</th>
								<th scope="col" class="fir">RETURNDATE</th>
								<th scope="col" class="fir">CARNO</th>
								<th scope="col" class="fir">MEMBERNO</th>
								<th scope="col" class="fir">PSGNUM</th>
								<th scope="col" class="fir">OFCNO</th>
								<th scope="col" class="fir">RPRICE</th>

							</tr>
   
						</thead>			 
						 <tbody>
								<c:forEach var="i" items="${myPageReserveList}" varStatus="cnt">
									<tr>
										<td>${i.rentno}</td>
										<td>${i.rentdate}</td>
										<td>${i.returndate}</td>
										<td>${i. carno}</td>
										<td>${i. memberno}</td>
										<td>${i. psgnum}</td>
										<td>${i. ofcno}</td>
										<td>${i. rprice}</td>
									</tr>

								</c:forEach>
								</c:otherwise>
								</c:choose>



							</tbody> 
					</table>
					</form>
			
			
	<!-- Global Mailform Output-->
	<div class="snackbars" id="form-output-global"></div>
	<!-- Javascript-->
    <script src="/orm/SIST/js/core.min.js"></script>
    <script src="/orm/SIST/js/script.js"></script>
	<!-- coded by barber-->
</body>
</html>