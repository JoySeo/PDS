<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@include file="header.jsp"%>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<style type="text/css">
fieldset{border:0px}
dt,dd{display:inline-block;}
dt{width:60px;}
dl{margin:10px 0 10px 0;}
dd{margin-left:0;}
.ui-tabs .ui-tabs-nav li { font-size: 10pt; }
.ui-widget {font-size:10pt !important;}
.ui-tabs .ui-tabs-panel {
    padding: 1em !important;
}

</style>
<link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	fn_initPage();
});

function fn_initPage(){
	$( "#tabs" ).tabs();
	fn_checkAuth();
	fn_setEvent();
	fn_setAuthList();
	fn_setUsers();
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
	
	$("#sel_user").change(function(){
		fn_setUserAuth($(this));
	});
	
	$("#btn_initPass").click(function(){
		fn_initPass();
	});
	
	$("#btn_mod").click(function(){
		fn_modifyUser();
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
	$("#sel_userAuth").append(html);
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
			$("form#frm_new").serialize(), 
			function(data){
				alert(data.msg);
				
				if(data.errcode == 0){
					document.location.reload();
				}
			}, 
			"json" );
}

function fn_setUsers(){
	//사용자를 가져와 세팅한다
	$.getJSON("getUsers.do", function(data){
		if(data.errcode > 0){
			alert(data.errmsg);
		}
		fn_setUsersResult(data);
	});
}

function fn_setUsersResult(data){
	var html = "";
	html += "<option value='' auth=''>-선택-</option>";
	for(var i=0 ; i<data.list.length ; i++){
		var sUserId = data.list[i].ID;
		var sUserAuth = data.list[i].AUTH;
		var sUser = data.list[i].NAME;
		html += "<option value='"+sUserId+"' auth='"+sUserAuth+"'>"+sUser+"</option>";
	}
	$("#sel_user").append(html);
}

function fn_setUserAuth(oUser){
	//사용자 선택시 해당사용자 이름,권
	var oSelected = oUser.find("option:selected");
	var sSelectedId = oSelected.val();
	var sSelectedNm = oSelected.text();
	var sSelectedAuth = oSelected.attr("auth");
	
	if( sSelectedId == null || sSelectedId == "" ){
		//초기화
		$("#inp_nameMod").val("");
		$("#sel_userAuth option[value=USER]").attr("selected",true);
	}else{
		$("#inp_nameMod").val(sSelectedNm.split("(")[0]);
 		$("#sel_userAuth option[value="+sSelectedAuth+"]").attr("selected",true);
//  		$("#sel_userAuth option[value!="+sSelectedAuth+"]").attr("selected",false);
	}
}

function fn_initPass(){
	//사용자 비번 초기화 - 아이디뒤에 123붙임
	var oSelUser = $("#sel_user option:selected");
	var sSelId = oSelUser.val();
	
	if(sSelId == null || sSelId == ""){
		alert("사용자를 선택하세요.");
		return;	
	}
	
	if( !confirm(oSelUser.text()+"님의 비밀번호를 초기화 하시겠습니까?") ){
		return;	
	}
	
	$.getJSON("initPass.do", {userId:sSelId},function(data){
		alert(data.msg);
	});
}

function fn_modifyUser(){
	//사용자 정보 변경
	var oSelUser = $("#sel_user option:selected");
	var sSelId = oSelUser.val();
	
	if(sSelId == null || sSelId == ""){
		alert("사용자를 선택하세요.");
		return;	
	}
	
	if( !confirm(oSelUser.text()+"님의 사용자 정보를 변경 하시겠습니까?") ){
		return;	
	}
	
	$.post(
			"modifyUser.do", 
			$("form#frm_mod").serialize(), 
			function(data){
				alert(data.msg);
				
				if(data.errcode == 0){
					window.location.reload(true);
				}
			}, 
			"json" );
}
</script>	
</head>
<body>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">사용자 추가</a></li>
    <li><a href="#tabs-2">사용자 변경</a></li>
  </ul>
  <div id="tabs-1">
  <form id="frm_new">
  	<fieldset id="fds_new">
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
	</form>
	<div>
	<input type="button" id="btn_new" value="추가" style="width:70px; height:30px;">
	</div>
  </div> <!-- div id="tabs-1" -->
  <div id="tabs-2">
  <form id="frm_mod">
  	<fieldset id="fds_mod">
		<dl>
			<dt>사용자</dt>
			<dd>
				<select id="sel_user" name="ID">
				</select>
			</dd>
		</dl>
		<dl>
			<dt>이름</dt>
			<dd><input type="text" id="inp_nameMod" name="NAME"></dd>
		</dl>
		<dl>
			<dt>권한</dt>
			<dd>
				<select id="sel_userAuth" name="AUTH">
				</select>
			</dd>
		</dl>
		<dl>
			<dt>비밀번호</dt>
			<dd>
				<input type="button" id="btn_initPass" value="초기화">
			</dd>
		</dl>
	</fieldset>
	</form>
	<div>
	<input type="button" id="btn_mod" value="변경" style="width:70px; height:30px;">
	</div>
  </div>	<!-- div id="tabs-2" -->
</div>


<%@include file="footer.jsp"%>
</body>
</html>
