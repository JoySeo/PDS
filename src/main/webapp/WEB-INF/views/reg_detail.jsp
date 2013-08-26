<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<style type="text/css">
.tblType01 { width:100%; font-size:12px;}
.tblType01 th { width:150px; border-bottom:1px solid #e2e2e2; padding:11px 0px 10px 5px; text-align:left; background:#f6f6f6;}
.tblType01 td { width:600px; padding:10px; border-bottom:1px solid #e2e2e2;}
.tblType01 td label {margin-right:15px;}
textarea {width:100%;}

</style>	
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	fn_initPage();
});

function fn_initPage(){
	fn_setEvent();
	fn_setDisable("${flag}");
}

function fn_setEvent(){
	$("#btn_update").click(function(){
		fn_setDisable("U");
	});
	
	$("#btn_save").click(function(){
		fn_savePds();
	});
	
	$("#btn_delete").click(function(){
		fn_deletePds();
	});
	
	$("#sp_name").click(function(){
		document.location.href = "changAcc.do";
	});
}

function fn_setDisable(sFlag){
	
	if(sFlag == "R"){
		//상세보기 화면 입력 disable
		$(".tblType01 input").attr("readonly",true);
		$(".tblType01 textarea").attr("readonly",true);
		$(".tblType01 input").css("background-color","#f8f8ff");
		$(".tblType01 textarea").css("background-color","#f8f8ff");
		$("#btn_update").css("display","");
		$("#btn_save").css("display","none");
	}else if(sFlag == "C"){
		//신규 등록 입력 enable
		$(".tblType01 input").attr("readonly",false);
		$(".tblType01 textarea").attr("readonly",false);
		$(".tblType01 input").css("background-color","");
		$(".tblType01 textarea").css("background-color","");
		$("#btn_update").css("display","none");
		$("#btn_save").css("display","");
	}else if(sFlag == "U"){
		//수정
		//날짜 기준으로 지난것은 수정 못하게 한다? 아닌데 일부 수정 가능하게 한다?
		$(".tblType01 input").attr("readonly",false);
		$(".tblType01 textarea").attr("readonly",false);
		$(".tblType01 input").css("background-color","");
		$(".tblType01 textarea").css("background-color","");
		$("#btn_update").css("display","none");
		$("#btn_save").css("display","");
	}
}

function fn_savePds(){
	if( !confirm("현재 항목을 저장 하시겠습니까?") ){
		return;
	}
	
	//저장
	$.post("save.do", $("form").serialize()+"&SEQ=${seq}",
		function(data){
			alert(data.msg);
			if(data.errcode == 0){
				//목록 페이지로 이동
				document.location.href="viewList.do";
			}else if(data.errcode == 2){
				document.location.href="/";
			}
		}, "json");
}

function fn_deletePds(){
	if( !confirm("현재 항목을 삭제 하시겠습니까?") ){
		return;
	}
	
	//삭제
	$.post("delete.do", {SEQ:"${seq}"},
		function(data){
			alert(data.msg);
			if(data.errcode == 0){
				//목록 페이지로 이동
				document.location.href="viewList.do";
			}else if(data.errcode == 2){
				document.location.href="/";
			}
		}, "json");
}

</script>	
</head>
<body>
<div style="background-color:#e8e8ff; margin-bottom:15px;">
<span style="font-size:30px; margin:10px">UDNL PDS</span>
<span id="sp_name" style="cursor:pointer;" title="비밀번호 변경">${userNm} 님</span>
</div>
<div>
<form>
<table class="tblType01" >
	<tr>
		<th>이행일</th>
		<td>
			<input type="date" id="" name="SCHEDULE_DT" value="${result[0].SCHEDULE_DT}">
		</td>
	</tr>
	<tr>
		<th>업무코드</th>
		<td>
			<input type="text" id="" name="BIZ_CODE" value="${result[0].BIZ_CODE}" maxlength="4" style="text-transform:uppercase; ime-mode:inactive; width:50px;">
		</td>
	</tr>
	<tr>
		<th>업무항목</th>
		<td>
			<textarea id="" name="BIZ_ITEM" rows="4" >${result[0].BIZ_ITEM}</textarea>
		</td>
	</tr>
	<tr>
		<th>목표결과</th>
		<td>
			<textarea id="" name="TARGET_RESULT" rows="4" >${result[0].TARGET_RESULT}</textarea>
		</td>
	</tr>
	<tr>
		<th>목표투입시간</th>
		<td>
			<input type="text" id="" name="TARGET_TIME" value="${result[0].TARGET_TIME}" maxlength="2" style="width:50px; text-align:right;">H 
		</td>
	</tr>
	<tr>
		<th>실제투입시간</th>
		<td>
			<input type="text" id="" name="REAL_TIME" value="${result[0].REAL_TIME}" maxlength="2" style="width:50px; text-align:right;">H
		</td>
	</tr>
	<tr>
		<th>진행률</th>
		<td>
			<input type="text" id="" name="PROG_RATE" value="${result[0].PROG_RATE}" maxlength="3" style="width:50px; text-align:right;">%
		</td>
	</tr>
	<tr>
		<th>계획 및 실행</th>
		<td>
			<textarea id="" name="PLAN_DO" rows="4" >${result[0].PLAN_DO}</textarea>
        </td>
	</tr>
	<tr>
		<th>Gab분석 및 향후진행</th>
		<td>
			<textarea id="" name="GAB_ANAL" rows="4" >${result[0].GAB_ANAL}</textarea>
        </td>
	</tr>
</table>
</form>
</div>
<div style="text-align:right;">
<input type="button" id="btn_update" value="수정" style="width:70px">
<input type="button" id="btn_save" value="저장" style="width:70px">
<input type="button" id="btn_delete" value="삭제" style="width:70px">
</div>
<p style="font-size:12px; text-align:center;">copyrightⓒ 2013 All rights reserved by UDNL</p>
</body>
</html>
