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
	fn_setEvent();
	fn_message();
});

function fn_message(){
	var msg = "${msg}";
	if( !(msg == null || msg == "") ){
		alert(msg);
	}
}

function fn_setEvent(){
	$("#id").keypress(function(e){
		fn_keypress(e);
	});
	
	$("#password").keypress(function(e){
		fn_keypress(e);
	});
	
	$("#btn_sign").click(function(){
		fn_login();
	});
}

function fn_keypress(e){
	if(e.which == 13){
		fn_login();
	}
}

function fn_login(){
	$("#frm_login").submit();
}
</script>	
</head>
<body>
<div style="text-align:center;">
<p style="font-size:50px;margin:50 0 40 0;background-color:#e8e8ff;">UDNL PDS</p>
<form id="frm_login" name="frm_login" method="post" action="login.do">
<table align="center">
<tbody><tr>
	<th style="text-align:left;">ID</th>
	<td>
		<input type="text" id="id" name="ID" style="width:100px"><span>@udnl.co.kr</span>
	</td>

</tr>
<tr>
	<th style="text-align:left;">Password</th>
	<td>
		<input type="password" id="password" name="PASSWORD" style="width:100px">
	</td>

</tr>
</tbody></table>
</form>
<input type="button" value="Sign in" id="btn_sign" style="width:274px;height: 40px;">
<p>copyrightⓒ 2013 All rights reserved by UDNL</p>
</body>
</html>
