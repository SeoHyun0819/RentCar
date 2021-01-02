<%@page import="sist.com.dto.ZipBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>쌍용정보통신</title>
<link href="/orm/css/common.css" rel="stylesheet" type="text/css" />
<link href="/orm/css/user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script  src="/orm/js/member.js" charset="UTF-8"></script>
<script>

$(function(){
	$("a[name='addr']").click(function(){
		window.opener.document.joinFrm.post1.value=$(this).text().trim().split("-")[0];
		window.opener.document.joinFrm.post2.value=$(this).text().trim().split("-")[1];
		window.opener.document.joinFrm.address1.value=$(this).text().trim().split("-")[2];
		self.close();
	});
 
});
 
</script>
</head>
 
<body>
	<form action="/orm/searchAdress.do" name="searchFrm" method="post">
		<table width="400" height="380" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top" background="/orm/img/join_pop_bg1.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="45" colspan="3"><img
								src="/orm/img/join_pop_title4.gif" width="115" height="20"></td>
						</tr>
						<tr>
							<td width="50" height="30">&nbsp;</td>
							<td>&nbsp;</td>
							<td width="50">&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center" style="padding: 10">찾고자 하는 지역의
								&quot;읍,면,동&quot; 이름을 입력하세요.<br> 예: 구의동일 경우, '구의' 로 검색하세요.
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td></td>
							<td height="7"></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="40" align="center" bgcolor="F5F5F5">주소검색 <input
								name="dong" id="dong" type="text" size="25" class="input"> <input id="searchDong"
									type="image" src="../adressCss/img/btn_search.gif" width="36"
									height="18" border="0" align="absmiddle"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="7">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="padding: 1" bgcolor="#DDDDDD">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr height="1" bgcolor="f4f4f4">
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr bgcolor="ddddddd">
										<td width="1" bgcolor="f4f4f4"></td>
										<td height="10" align="center" bgcolor="EEEEEE">
										해당 주소를선택하세요.</td>
										<td width="1" bgcolor="f4f4f4"></td>
									</tr>
									
									
										</table>
								<div style="height: 120px; width: 300; overflow: auto;">
									<table width="100%" height="120" border="0" cellpadding="0"
										cellspacing="0" bgcolor="#FFFFFF" class="gray_blue">
  
										<c:forEach var="i" items="${dongList}" varStatus="status">
										 
										  
										<tr>
											<td height="8"></td>
											
 
										</tr>
										<tr>
											<td height="20" style="padding-left: 25;width: 200px;">
											<a href="#" name="addr">${i.zipcode}-  ${i.sido}  ${i.gugun} ${i.dong}</a> </td>
										</tr>
										 </c:forEach>
										</table>
								</div>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
