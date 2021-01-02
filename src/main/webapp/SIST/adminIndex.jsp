<%@page import="java.util.HashMap"%>
<%@page import="sist.com.dto.RentCarBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

function adminLoadList(){
	
var thisMonthJoin=0; //이번달
var previousMonthJoin1=0; //전달
var previousMonthJoin2=0; //전전달

var gangnamTotal=0;

	$.ajax({
		url:'${pageContext.request.contextPath}/adminMainList.do',
		type:'POST',
		dataType:'json',
		success:function(v){
			console.log(v);
			$(v).each(function(index,dom){
				$("td#totalMember").text(dom.totalMember+"명");
				$("td#todayJoin").text(dom.todayJoin+"명");
				$("b#totalReservation").text(dom.totalReservation+"건");
				$("p#grossSales").text(dom.grossSales+"원");
				thisMonthJoin=dom.thisMonthJoin;
				previousMonthJoin1=dom.previousMonth1;
				previousMonthJoin2=dom.previousMonth2;
				
				gangnamTotal=dom.gangnamTotal;
				
			});
			//구글차트 : 월별 가입자 수
			google.charts.load ( 'current', { 'packages': [ 'bar']});
			google.charts.setOnLoadCallback (drawStuff);

			function drawStuff () {
				  var d= new Date();	//현재 날짜 가져오기. d.getMonth()+1== 이번달
				  var data = new google.visualization.arrayToDataTable([
				    ['', '',{ role: 'style' }],
				    [d.getMonth()+1+'월',thisMonthJoin,'#ffa900'],
				    [d.getMonth()+'월',previousMonthJoin1,'#ffa900'],
				    [d.getMonth()-1+'월',previousMonthJoin2,'#ffa900']
				  ]);

				  var options = {
				    title: 'Chess opening moves',
				    width: 280,
				    legend: { position: 'none' },
				    //chart: { title: '월별 가입자 수'},
				    bars: 'horizontal', // Required for Material Bar Charts.
				    //textStyle:{color: 'black', fontName: <global-font-name>, fontSize: <global-font-size>},

				    
				    axes: {
				      x: {
				        0: { side: 'top', label: '월별 가입자수'} // Top x-axis.
				      }
				    },
				    bar: { groupWidth: "90%" }
				  };

				  var chart = new google.charts.Bar(document.getElementById('top_x_div'));
				  chart.draw(data, options);
				};
			
				//구글차트 : 지점별 총매출
				
				google.charts.load("current", {packages:["corechart"]});
				google.charts.setOnLoadCallback(drawChart);
				   function drawChart() {
				        var data = google.visualization.arrayToDataTable([
			          ['지점', '총매출'],
			          ['잠실지점', 90000],
			          ['강남지점', gangnamTotal],
			          ['구로지점', 0]
			        ]);
			        var options = {
			          title: '지점별 매출 비율',
			          pieHole: 0.4,
			          chartArea:{left:0,top:'1px',width:'110%'},
			          sliceVisibilityThreshold: .2,
			          colors:['#dc3545','#ffa900','#20c997']
			        };
			
			        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
			        chart.draw(data, options);
			      }
			
			
		},error:function(){
			alert('ERROR!');
		}
	});
}

$(function(){
	adminLoadList();
	 
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
	<link href="https://fonts.googleapis.c
	om/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
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
                <div class="rd-navbar-brand"><a class="brand-name" href="adminIndex.jsp"><img class="logo-default" src="/orm/SIST/images/logo.png" alt="" width="208" height="46"/><img class="logo-inverse" src="images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
              </div>
              <!-- 웹 var. 메뉴바 -->
              <div class="rd-navbar-aside-center">
                <div class="rd-navbar-nav-wrap">
                  <ul class="rd-navbar-nav">
                    <li><a href="/orm/memberList.do">회원관리</a>
                    </li>
                    <li><a href="/orm/rentList.do">예약관리</a>
                    </li>
                    <li><a href="/orm/goOffice.do">지점관리</a>
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
           
              	 
				<!--   추가 -->
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
	  <!--------------- 내용 -------------------------->
	  <!-- 6.14 최혜진  추가 -->
	  <section class="section section-lg bg-gray-lighter novi-background bg-cover text-center" id="reviews">
        <div class="container container-wide">
          <!-- <h3>이용후기</h3> 
          <div class="divider divider-decorate"></div>-->
          <div class="row row-50 justify-content-sm-center text-left">
            <div class="col-sm-10 col-md-6 col-xl-3">
              <article class="box-minimal box-minimal-border bgWhite">
                <table>
               		<thead>
	                    <tr>
	                        <th>전체회원수</th>
	                        <th style="padding-left: 50px;">오늘 가입자 수</th>
<!-- 	                        <th>누적예약수</th> -->
	                    </tr>
                    </thead>
                    <tbody>
	                    <tr>
	                        <td id="totalMember">--명</td>
	                        <td id="todayJoin" style="padding-left: 50px;">-명</td>
	                    </tr>
                	</tbody>
                </table>
                <hr style="margin: 15px 0;">
                <!--월별 회원수 차트-->
                
                <!-- <script src="/orm/SIST/js/adminChart.js"></script> -->
                <script type ="text/javascript">

			    </script>
  				 <div id="top_x_div" style="width: 90%; background:rgba(255,255,255,0);"></div>
              </article>
            </div>
            
            <div class="col-sm-10 col-md-6 col-xl-3">
              <article class="box-minimal box-minimal-border bgWhite">
                	<div style="width:100%; height:25px; ">
               			<a href="#" style="font-weight:bold;font-size: 20px;">예약 승인대기</a>
                		<b style="font-weight:bold; font-size:20px;float:right;">-건</b>
               		</div>
                	<div style="width:100%; height:25px; margin-top:95px;">
               			<a href="#" style="font-weight:bold;font-size: 20px;">예약 중</a>
                		<b style="font-weight:bold; font-size:20px;float:right;">-건</b>
               		</div>
               		<hr style="margin: 50px 0;">
                	<div style="width:100%; height:25px;">
               			<a href="#" style="font-weight:bold;font-size: 20px;">누적 예약수</a>
                		<b style="font-weight:bold; font-size:20px;float:right;" id="totalReservation">-건</b>
               		</div>

              </article>
            </div>
            
            
            <div class="col-sm-10 col-md-6 col-xl-3">
              <article class="box-minimal box-minimal-border bgWhite">
<!--                 <div class="box-minimal-icon novi-icon mdi mdi-map"></div> -->
                <b style="font-weight:bold;">누적 판매액</b>
                <p class="big box-minimal-title" id="grossSales">0,000,000원</p>
                <hr style="margin:0; margin-top:10px;">
				    <script type="text/javascript">

				    </script>
				    <div id="donutchart" style="width: 100%; height:200px;" class="box-minimal-text text-spacing-sm"></div>

              </article>
            </div>


            <div class="col-sm-10 col-md-6 col-xl-3">
              <article class="box-minimal box-minimal-border bgWhite">
              	<div style="width:100%; height:25px;">
                <b style="font-weight:bold; margin-bottom:20px; font-size:20px;">새로운 게시글</b>
               	<a href="#" style="font-weight:bold;font-size: 43px;float:right;line-height: 24px;">+</a>
               	</div>
				<ul class="nav nav-tabs nav-justified nav-bordered mb-3" style="margin-top: 1.5rem;">
				    <li class="nav-item">
				        <a href="#home-b2" data-toggle="tab" aria-expanded="false" class="nav-link">
				            <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
				            <span class="d-none d-lg-block">문의</span>
				        </a>
				    </li>
				    <li class="nav-item">
				        <a href="#profile-b2" data-toggle="tab" aria-expanded="true"
				            class="nav-link active">
				            <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
				            <span class="d-none d-lg-block">후기</span>
				        </a>
				    </li>
				    <li class="nav-item">
				        <a href="#settings-b2" data-toggle="tab" aria-expanded="false" class="nav-link">
				            <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
				            <span class="d-none d-lg-block">공지</span>
				        </a>
				    </li>
				</ul>
				
				<div class="tab-content">
				    <div class="tab-pane" id="home-b2">
				        <p>Leggings occaecat dolor sit amet, consectetuer adipiscing elit. Aenean
				            commodo ligula eget dolor.</p>

				    </div>
				    <div class="tab-pane show active" id="profile-b2">
				        <p>Leggings occaecat dolor sit amet, consectetuer adipiscing elit. Aenean
				            commodo ligula eget dolor.</p>
				    </div>
				    <div class="tab-pane" id="settings-b2">
				        <p>Leggings occaecat dolor sit amet, consectetuer adipiscing elit. Aenean
				            commodo ligula eget dolor.</p>
				    </div>
				</div>
              </article>
            </div>            
            
            
            
          </div>
        </div>
      </section>
 
      <!-------------------------- Footer ---------------------->
      <footer class="section page-footer page-footer-minimal novi-background bg-cover text-center bg-gray-darker">
        <div class="container container-wide">
          <div class="row row-fix justify-content-sm-center align-items-md-center row-30">
            <div class="col-md-10 col-lg-7 col-xl-4 text-xl-left"><a href="index.html"><img class="inverse-logo" src="/orm/SIST/images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
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