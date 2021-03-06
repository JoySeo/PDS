<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@include file="header.jsp"%>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<style type="text/css">

dt,dd{display:inline-block;}
dt{width:140px;}
dl{margin:10px 0 10px 0;}
dd{margin-left:0}
fieldset input{width:120px;}

</style>	
<script type="text/javascript">
$(document).ready(function(){
	fn_initPage();
});

function fn_initPage(){
	fn_setEvent();
}

function fn_setEvent(){
	$("form input").keypress(function(e){
		if(e.which == 13){
			fn_changePass();
		}	
	});
	
	$("#btn_change").click(function(){
		fn_changePass();
	});
}

function fn_changePass(){
	
	if(fn_validation() == 1){
		return;
	}
	
	if( !confirm("비밀번호를 변경 하시겠습니까?") ){
		return;
	}
	
	$.post("changePass.do", $("form").serialize(),
			function(data){
				alert(data.msg);
				if(data.errcode == 0){
					//이전 페이지로 이동
					history.back();
				}else if(data.errcode == 2){
					document.location.href="/";
				}
			}, "json");
}

function fn_validation(){
	var sCurrPass = $("#currPass").val();
	var sNewPass = $("#newPass").val();
	var sNewPassOk = $("#newPassOk").val();
	
	if(sCurrPass == null || sCurrPass == ""){
		alert("현재 비밀번호를 입력하세요.");
		return 1;
	}
	
	if(sNewPass == null || sNewPass == ""){
		alert("신규 비밀번호를 입력하세요.");
		return 1;
	}
	
	if(sNewPassOk == null || sNewPassOk == ""){
		alert("신규 비밀번호 확인을 입력하세요.");
		return 1;
	}
	
	if(sNewPass != sNewPassOk){
		alert("신규 비밀번호 확인이 맞지 않습니다.");
		return 1;
	}
	
	return 0;
}

</script>	
</head>
<body>
<div>
<form>
<fieldset>
<legend>비밀번호 변경</legend>
	<dl>
		<dt>현재 비밀번호</dt>
		<dd><input type="password" id="currPass" name="currPass" value=""></dd>
	</dl>
	<dl>
		<dt>신규 비밀번호</dt>
		<dd><input type="password" id="newPass" name="newPass" value=""></dd>
	</dl>
	<dl>
		<dt>신규 비밀번호 확인</dt>
		<dd><input type="password" id="newPassOk" name="newPassOk" value=""></dd>
	</dl>
</fieldset>
</form>
</div>
<div>
<input type="button" id="btn_change" value="변경" style="width:70px;height: 30px;">
</div>
<%@include file="footer.jsp"%>
</body>
</html>
