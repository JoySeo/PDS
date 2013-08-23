<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>UDNL PDS</title>
<style type="text/css">
.tblType01 { width:100%; }
.tblType01 th { width:115px; border-bottom:1px solid #e2e2e2; padding:11px 0 10px 15px; text-align:left; background:#f6f6f6;}
.tblType01 td { width:600px; padding:10px 0 10px 10px; border-bottom:1px solid #e2e2e2;}
.tblType01 td.w210 { width:210px; padding:10px 0 10px 10px; border-bottom:1px solid #e2e2e2;}
.tblType01 td label {margin-right:15px;}
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
}

function fn_setDisable(sFlag){
	
	if(sFlag == "R"){
		//상세보기 화면 입력 disable
		$(".tblType01 input").attr("readonly",true);
		$(".tblType01 textarea").attr("readonly",true);
		$("#btn_update").css("display","");
		$("#btn_save").css("display","none");
	}else if(sFlag == "C"){
		//신규 등록 입력 enable
		$(".tblType01 input").attr("readonly",false);
		$(".tblType01 textarea").attr("readonly",false);
		$("#btn_update").css("display","none");
		$("#btn_save").css("display","");
	}else if(sFlag == "U"){
		//수정
		//날짜 기준으로 지난것은 수정 못하게 한다? 아닌데 일부 수정 가능하게 한다?
		$(".tblType01 input").attr("readonly",false);
		$(".tblType01 textarea").attr("readonly",false);
		$("#btn_update").css("display","none");
		$("#btn_save").css("display","");
	}
}

function fn_savePds(){
	if( confirm("현재 항목을 저장 하시겠습니까?") ){
		//저장
	}
}

function fn_deletePds(){
	if( confirm("현재 항목을 삭제 하시겠습니까?") ){
		//삭제
	}
}

</script>	
</head>
<body>
<p>UDNL PDS</p>
<p>${userNm}님</p>
상세보기 및 등록/수정
<div>
<table class="tblType01" >
	<tr>
		<th>이행일</th>
		<td>
			<input type="date" id="" name="" value="${result[0].SCHEDULE_DT}">
		</td>
	</tr>
	<tr>
		<th>업무항목</th>
		<td>
			<textarea id="" name="" rows="" cols="">${result[0].BIZ_ITEM}</textarea>
		</td>
	</tr>
	<tr>
		<th>목표결과</th>
		<td>
			<textarea id="" name="" rows="" cols="">${result[0].TARGET_RESULT}</textarea>
		</td>
	</tr>
	<tr>
		<th>목표투입시간</th>
		<td>
			<input type="text" id="" name="" value="${result[0].TARGET_TIME}">H 
		</td>
	</tr>
	<tr>
		<th>실제투입시간</th>
		<td>
			<input type="text" id="" name="" value="${result[0].REAL_TIME}">H
		</td>
	</tr>
	<tr>
		<th>진행률</th>
		<td>
			<input type="text" id="" name="" value="${result[0].PROG_RATE}">%
		</td>
	</tr>
	<tr>
		<th>계획 및 실행</th>
		<td>
			<textarea id="" name="" rows="" cols="">${result[0].PLAN_DO}</textarea>
        </td>
	</tr>
	<tr>
		<th>Gab분석 및 향후진행</th>
		<td>
			<textarea id="" name="" rows="" cols="">${result[0].GAB_ANAL}</textarea>
        </td>
	</tr>
</table>
</div>
<div>
<input type="button" id="btn_update" value="수정">
<input type="button" id="btn_save" value="저장">
<input type="button" id="btn_delete" value="삭제">
</div>
</body>
</html>
