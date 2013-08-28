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
dt{width:40px;}
dl{margin:10px 0 10px 0;}

</style>	
<script type="text/javascript">
$(document).ready(function(){
	fn_initPage();
});

function fn_initPage(){
	fn_checkAuth();
	fn_setEvent();
	fn_setAuthList();
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
	$("#btn_new").click(function(){
		fn_createUser();		
	});
}

function fn_setAuthList(){
	//권한 목록을 가져와 select에 세팅한다
	$.getJSON("getAuth.do", function(data){
		if(data.errcode > 0){
			alert(data.errmsg);
		}
		fn_setResult(data);
	});
}

function fn_setResult(data){
	//가져온 data수만큼 권한 select의 option을 만든다
	var html = "";
	for(var i=0 ; i<data.list.length ; i++){
		var sAuthId = data.list[i].AUTH_ID;
		var sAuthNm = data.list[i].AUTH_NM;
		if(sAuthId == "USER"){
			html += "<option value='"+sAuthId+"' selected='selected'>"+sAuthNm+"</option>";			
		}else{
			html += "<option value='"+sAuthId+"'>"+sAuthNm+"</option>";
		}
	}
	$("#sel_auth").append(html);
}

function fn_createUser(){
	//신규유저생성
	if($("#inp_id").val() == "" || $("#inp_name").val() == ""){
		alert("ID 또는 이름을 입력하세요.");
		return;
	}
	
	var sSelAuthNm = $("#sel_auth option:selected").text(); 
	if( !confirm(sSelAuthNm+" 를 신규 추가 하시겠습니까?") ){
		return;	
	}	
	
	$.post(
			"createUser.do", 
			$("fieldset").serialize(), 
			function(data){
				alert(data.msg);
				
				if(data.errcode == 0){
					document.location.reload();
				}
			}, 
			"json" );
}

</script>	
</head>
<body>
<fieldset>
<legend>신규 사용자 추가</legend>
	<dl>
		<dt>ID</dt>
		<dd><input type="text" id="inp_id" name="ID"></dd>
	</dl>
	<dl>
		<dt>이름</dt>
		<dd><input type="text" id="inp_name" name="NAME"></dd>
	</dl>
	<dl>
		<dt>권한</dt>
		<dd>
			<select id="sel_auth" name="AUTH">
			</select>
		</dd>
	</dl>
</fieldset>
<div>
<input type="button" id="btn_new" value="추가" style="width:70px; height:30px;">
</div>
<%@include file="footer.jsp"%>
</body>
</html>
