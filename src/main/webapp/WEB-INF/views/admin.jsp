<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@include file="header.jsp"%>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<style type="text/css">

th{text-align:left;}

</style>	
<script type="text/javascript">
$(document).ready(function(){
	fn_initPage();
});

function fn_initPage(){
	fn_checkAuth();
	fn_setEvent();
}

function fn_checkAuth(){
	//권한이 없는사용자는 back 시킨다
	var sAuth = "${auth}";
	if(sAuth != "SYSADMIN"){
		alert("권한이 없습니다.");
		history.back();
	}
}

function fn_setEvent(){
	
}

</script>	
</head>
<body>
준비중 입니다.
<%@include file="footer.jsp"%>
</body>
</html>
