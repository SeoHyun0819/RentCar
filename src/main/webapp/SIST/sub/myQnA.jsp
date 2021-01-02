<%@page import="sist.com.dto.QnaBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="sist.com.dao.BasicDao"%>
<%@page import="sist.com.dto.MemberBean"%>
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

</script>



  <head>
    <!-- Site Title-->
    
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
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
	.smallBtn{
		margin: 0 auto;
	    float: right;
	    padding: 3px 0px;
	    min-width: 100px;
	    margin-right: 5px;
	}
	</style>
	
	<script type="text/javascript">
	
	$(function(){
   //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	    	 if ($("#checkall").is(':checked')) {
	                $("input[type=checkbox]").prop("checked", true);
	            } else {
	                $("input[type=checkbox]").prop("checked", false);
	            }
	        
	        

	 	    $("#checkall").click(function(){
	 	    	 var chk = $("#checkall").prop("checked");
	 	    	 if(chk) {
	 	    	  $("input[type=checkbox]").prop("checked", true);
	 	    	 } else {
	 	    	  $("input[type=checkbox]").prop("checked", false);
	 	    	 }
	 	    	});
	 	
	 	    $("input[type=checkbox]").click(function(){
	 	    	  $("#checkall").prop("checked", false);
	 	    	 });
	        
	    });
	 
	    $('input[type=checkbox]:input[value="no"]').prop("checked", true);  
	    
	 });
	    
			  function onMemberDelete(no){

				  
				  var memberChk = document.getElementsByName("deleteMember");
				  var chked = false;
				  var indexid = false;
				  for(i=0; i < memberChk.length; i++){
				   if(memberChk[i].checked){
				    if(indexid){
				      no = no + '-';
				    }
				    no = no + memberChk[i].value;
				    indexid = true;
				   }
				  }
				  if(!indexid){
				   alert("삭제할 사용자를 체크해 주세요");
				   return;
				  }
				  document.userForm.delUserid.value = no;       // 체크된 사용자 아이디를 '-'로 묶은 userid 를      document.userForm.delUserid 의 value로 저장
				  
				  var agree=confirm("삭제 하시겠습니까?");
				     if (agree){
				   document.userForm.execute.value = "userDel";
				     document.userForm.submit();
				     }
				  }﻿
	    
	    
    
 
 
	 function onMemberDelete(no) {
		 alert('onMemberDelete 삭제? = ' + no) 
	}
				  
				 
	</script>
	
	
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
                <div class="rd-navbar-brand"><a class="brand-name" href="index.jsp"><img class="logo-default" src="/orm/SIST/images/logo.png" alt="" width="208" height="46"/><img class="logo-inverse" src="images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
              </div>
              <!-- 웹 var. 메뉴바 -->
              		<div class="rd-navbar-aside-center">
							<div class="rd-navbar-nav-wrap">
								<ul class="rd-navbar-nav">
									<li><a style="font-size: 25px;">MYPAGE</a> <!-- 예약하기/예약확인/ -->
									</li>
									 <!--  <li class="active"><a href="#branchGuide">마이페이지</a></li>   -->
									<li><a href="/orm/myPage.do">내정보</a></li>
								<li><a href="/orm/myPageReserve.do">예약확인</a></li>
									<li><a href="/orm/myQna.do">문의내역</a></li>
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
          </nav>
        </div>
      </header>
     
     
     <!------------------------------ 내용입력 ------------------------>
    <section class="section section-lg bg-gray-lighter novi-background bg-cover text-center" id="reviews">
    <form name="userForm" method="post">
		<div class="container">
		  <div>
		   <h2></h2>
			   
		  </div>
		
		 	<c:choose>
		 	<c:when test="${functions:length(myQnaList)==0}">
		 	<h3 style="text-align: center; margin-top: 200px;"> <c:out value="문의내역이 없습니다"></c:out></h3>
				 
		 	</c:when>
		 	<c:otherwise>
	 
		 <!--  <p>The .table-hover class enables a hover state on table rows:</p>    -->         
		  <table class="table table-hover">
		    <thead>
		      <tr>
		       <th scope="col" class="fir">TITLE</th>
								<th scope="col" class="fir">CONTENTS</th>
								<th scope="col" class="fir">ANSWER</th>
								<th scope="col" class="fir">STATE</th>
		      </tr>
		    </thead>
 
               
		    <tbody>
		        <c:forEach var="i" items="${myQnaList}">
							<tr>
							<td>${i.qtitle}</td>
							<td>${i.qcontents}</td>
							<td>${i.qanswer}</td>
							<td>${i.qstate}</td>
							</tr>
							 </c:forEach>
				</c:otherwise>
		 	
		 	</c:choose>
			 
							
		    </tbody>
		  </table>
		</div>
	
		</form>
	</section>
 
      <!-------------------------- Footer ---------------------->
      
		</div>
	</div>

	<div class="modal">
	</div>
	</div><!--page전체  -->
	<!-- Global Mailform Output-->
	 
	<!-- Javascript-->
<script src="/orm/SIST/js/core.min.js"></script>
    <script src="/orm/SIST/js/script.js"></script>
	<!-- coded by barber-->
</body>
</html>