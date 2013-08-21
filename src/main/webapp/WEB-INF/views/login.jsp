<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
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
<p>UDNL PDS</p>
<form id="frm_login" name="frm_login" method="post" action="login.do">
<span style="width:100px; display:inline-block;">ID</span><input type="text" id="id" name="ID" style="width:100px"><span>@udnl.co.kr</span><br/>
<span style="width:100px; display:inline-block;">Password</span><input type="password" id="password" name="PASSWORD" style="width:100px">
</form>
<input type="button" id="btn_sign" value="Sign In" >
</body>
</html>
