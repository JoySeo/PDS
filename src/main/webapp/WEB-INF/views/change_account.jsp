<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<style type="text/css">

th{text-align:left;}

</style>	
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
	
	$.post("changePass.do", $("form").serialize(),
			function(data){
				console.log(data);
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
<div style="background-color:#e8e8ff; margin-bottom:15px;">
<span style="font-size:30px; margin:10px">UDNL PDS</span>
<span >${userNm} 님</span>
</div>
<div style="margin-bottom:10px;">
<span style="font-size: 18px;font-weight:bold;">&gt;비밀번호 변경</span>
</div>
<div>
<form>
<table>
	<tr>
		<th>현재 비밀번호</th>
		<td>
			<input type="password" id="currPass" name="currPass" value="">
		</td>
	</tr>
	<tr>
		<th>신규 비밀번호</th>
		<td>
			<input type="password" id="newPass" name="newPass" value="">
		</td>
	</tr>
	<tr>
		<th>신규 비밀번호 확인</th>
		<td>
			<input type="password" id="newPassOk" name="newPassOk" value="">
		</td>
	</tr>
</table>
</form>
</div>
<div>
<input type="button" id="btn_change" value="변경" style="width:70px;height: 30px;">
</div>
<p style="font-size:12px; ">copyrightⓒ 2013 All rights reserved by UDNL</p>
</body>
</html>
