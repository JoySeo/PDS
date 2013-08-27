<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	fn_initPageHeader();
});

function fn_initPageHeader(){
	fn_setAdminHeader();
	fn_setEventHeader();
}

function fn_setAdminHeader(){
	//권한이 시스템관리자이면 시스템관리 메뉴를 보인다
	
	var sAuth = "${auth}";
	var html = "";
	if(sAuth == "SYSADMIN"){
		html += '<span id="sp_admin" style="cursor:pointer; text-decoration:underline;" title="" onclick="javascript:fn_moveAdminHeader()">관리</span>';	
		$("div#div_header").append(html);
	}
}

function fn_setEventHeader(){
	
	$("#sp_name").click(function(){
		document.location.href = "changAcc.do";
	});
}

function fn_moveAdminHeader(){
	//시스템 관리자 페이지로 이동
	document.location.href = "admin.do";
}

</script>	
</head>
<body>
<div id="div_header" style="background-color:#e8e8ff; margin-bottom:15px;">
<span style="font-size:30px; margin:10px">UDNL PDS</span>
<span id="sp_name" style="cursor:pointer; text-decoration:underline;" title="비밀번호 변경">${userNm} 님</span>
</div>
</body>
</html>
