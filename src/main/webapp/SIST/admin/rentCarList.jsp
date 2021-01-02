<%@page import="sist.com.dto.RentCarBean"%>
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
					url : '/orm/retncarDel.do',
					type : 'post',
					dataType : 'text',
					data : {
						valueArrTest : checkArr
					}
				});
				location.reload();
			});
		});
	
	
	$("#rcReturn").click(function() {
			$("input[type=checkbox]:checked").each(function(i) {
				checkArr.push($(this).val());  

				$.ajax({
					url : '/orm/modRcState.do',
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
 
  <%-- <%=no %> --%>
   <form action="office.jsp" name="delForm" method="post">    
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
                 <div class="rd-navbar-brand"><a class="brand-name" href="adminIndex.jsp"><img class="logo-default" src="/orm/SIST/images/logo.png" alt="" width="208" height="46"/><img class="logo-inverse" src="images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>>
              </div>
              <!-- 웹 var. 메뉴바 -->
              <div class="rd-navbar-aside-center">
                <div class="rd-navbar-nav-wrap">
                  <ul class="rd-navbar-nav">
                  	 <li><a href="/orm/memberList.do">회원관리</a>
                    </li>
                    <li><a href="/orm/rentList.do">예약관리</a>
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
		   <h2>차량 목록</h2>
			   <a class="button button-sm button-secondary button-nina list" href="/orm/goinsertcar.do">등록</a>
			 
			   <a class="button button-sm button-secondary button-nina list" id="del" name="del" id="${i.no}">삭제</a>
			   <a class="button button-sm button-secondary button-nina list" id="rcReturn" name="rcReturn" id="${i.no}">반납</a>
		  </div>
		
		  
		 <!--  <p>The .table-hover class enables a hover state on table rows:</p>    -->         
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th> <input type="checkbox" id="allcheck" name="nt" value="${i.rcno}" />번호 </th>
		        <th>이미지</th>
		        <th>차량모델</th>     
		        <th>가격</th>
		        <th>지점</th>
		        <th>네비게이션</th>
		        <th>연료</th>
		        <th>크기</th>
		        <th>브랜드</th>
		        <th>상태</th>
		        
		      </tr>
		    </thead>
		     <tbody>

							<c:forEach var="i" items="${adminRentCarList}" varStatus="cnt">
								<tr lang="${i.rcno}">
									<td><input type="checkbox" id="${i.rcno}" name="nt" value="${i.rcno}" />${cnt.count}</td>
								 
									 
									<td><img src="/orm/SIST/images/${i.rcimg}" width="100" height="100" /></td>
									 
									
									<td><a  href="/orm/rentCarInfo.do?rcno=${i.rcno}">${i.rcmodel}</a></td>
									 
									<td>${i.rcprice}</td>
									
									<td>${i.ofcname}</td>

									<c:choose>
										<c:when test="${i.naviname eq 'NONAVIGATION'}">
											<td>네비게이션 X</td>
										</c:when>
										<c:otherwise>
											<td>네비게이션 O</td>
										</c:otherwise>
									</c:choose>

									<td>${i.fuelname}</td>
									<td>${i.sgmtname}</td>
									<td>${i.mname}</td>
									<c:choose>
									  <c:when test="${i.rcstate eq '예약가능' }">
								     	<td style="color: blue;">${i.rcstate}</td>
									  </c:when>
									  	  <c:when test="${i.rcstate eq '승인대기' }">
								     	<td style="color: orange;">${i.rcstate}</td>
									  </c:when>
									  	  <c:when test="${i.rcstate eq '승인' }">
								     	<td style="color: red;">${i.rcstate}</td>
									  </c:when>
									</c:choose>

								</tr>


							</c:forEach>

						</tbody> 
		  </table>
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