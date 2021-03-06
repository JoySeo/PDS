<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@include file="header.jsp"%>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<title>UDNL PDS</title>
<style type="text/css">
.boardlist { width:100%; font-size:12px;}
.boardlist th { padding:9px 0 7px 0; white-space:nowrap; text-align:center; line-height:normal; background:#f6f6f6; border-bottom:1px solid #ddd; color:#666;}
.boardlist ul { width:10px; display:inline-block; vertical-align:middle;}
.boardlist ul li {width:10px; line-height:0; margin-bottom:2px;}
.boardlist td { height:29px; padding:2px 10px 0; white-space:nowrap; text-align:center; color:#666; line-height:normal; border-bottom:1px solid #ddd; }
.boardlist td.subject { white-space:normal; text-align:left; }
.boardlist td.subject a:hover { color:#000; }
.boardlist td span { padding-right:3px; }
.arrow {font-size:14px;}
a {text-decoration:none; color:#444;}
</style>	
<script type="text/javascript">
$(document).ready(function(){
	fn_setEvent();
	fn_searchPds(1,1);
});

function fn_setEvent(){
	$("#sel_period").change(function(){
		//기간별 검색
		fn_searchPds( $(this).val(), 1 );
	});
	
	$("#btn_regist").click(function(){
		//신규등록 페이지로 이동
		document.location.href="regDetail.do?flag=C";
	});
	
	$("body").delegate("#resultTableTr", "mouseenter", function(){
		$(this).css("background-color","darkgray");
	});
	
	$("body").delegate("#resultTableTr", "mouseleave", function(){
		$(this).css("background-color","");
	});
	
	$("body").delegate("#resultTableTr", "mousedown", function(){
		$(this).css("background-color","gray");
	});
	
	$("body").delegate("#resultTableTr", "mouseup", function(){
		$(this).css("background-color","");
	});
	
	$("#sp_name").click(function(){
		document.location.href = "changAcc.do";
	});
}

function fn_searchPds(sPeriodVal,page){
	//pds 목록 가져오기
	$.getJSON("list.do", {"period":sPeriodVal,"page":page},	function(data){
		if(data.errcode > 0){
			alert(data.errmsg);
			if(data.errcode == 1){
				//로그인페이지로 이동
				document.location.href = "/";
			}
		}
		fn_setResult(data);
		fn_setPageing(data,page);
	});
}

function fn_setResult(data){
	
	$("#result").empty();
	
	var html = "";
	
	if(data.pdsList.length == 0){
		html += '<tr>';
		html += '<td colspan="100%">조회된 데이터가 없습니다.</td>';
		html += '</tr>';
		$("#result").append(html);
		return;
	}
	
	for(var i=0 ; i<data.pdsList.length ; i++){
		html += '<tr id="resultTableTr" style="cursor:pointer" onclick="fn_viewDetail(\''+data.pdsList[i].SEQ+'\')">';
		html += '<td>' + data.pdsList[i].NO + '</td>';
		html += '<td>' + data.pdsList[i].BIZ_CODE + '</td>';
		html += '<td style="text-align:left;"><pre>' + data.pdsList[i].BIZ_ITEM + '</pre></td>';
		html += '<td style="text-align:left;"><pre>' + data.pdsList[i].TARGET_RESULT + '</pre></td>';
		html += '<td style="text-align:right;">' + data.pdsList[i].PROG_RATE + '</pre></td>';
		html += '<td style="text-align:left;"><pre>' + data.pdsList[i].PLAN_DO + '</pre></td>';
		html += '<td>' + data.pdsList[i].SCHEDULE_DT + '</td>';
		html += '<td>' + data.pdsList[i].REG_DT + '</td>';
		html += '<td>' + data.pdsList[i].REG_USER + '</td>';
		html += '</tr>';
	}                                      
	
	$("#result").append(html);
}

function fn_setPageing(data,page){
	//total cnt 로 페이징 넘버를 만든다
	var sTotalCnt = data.pdsList[0].TOT_CNT;
	var nTotalPage = Math.ceil(sTotalCnt/10);
	var html = "";
	
	$("p#page").empty();
	
	if(parseInt(page/10) > 0){
		html += "&nbsp;<a href='javascript:fn_searchPdsPage("+(page-10)+")' class='arrow'>◀◀</a>";
	}
	
	if(page > 1){
		html += "&nbsp;<a href='javascript:fn_searchPdsPage("+(page-1)+")' class='arrow'>◀</a>";
	}
	
	for(var i=1 ; i<=nTotalPage ; i++){
		if(page == i){
			html += "&nbsp;<a href='javascript:fn_searchPdsPage("+i+")' style='font-weight: bold;'>"+i+"</a>";	
		}else{
			html += "&nbsp;<a href='javascript:fn_searchPdsPage("+i+")'>"+i+"</a>";
		}
	}
	if(page < nTotalPage){
		html += "&nbsp;<a href='javascript:fn_searchPdsPage("+(page+1)+")' class='arrow'>▶</a>";
	}
	
	if(parseInt(page/10) < parseInt(nTotalPage/10)){
		html += "&nbsp;<a href='javascript:fn_searchPdsPage("+( ( (page+10) > nTotalPage)? nTotalPage : (page+10) )+")' class='arrow'>▶▶</a>";
	}
	
	html.replace("&nbsp;","");
	
	$("p#page").append(html);
}

function fn_viewDetail(seq){
// 	alert("상세보기 seq:"+seq);
	//flag R: 상세보기, C: 신규등록, U: 수정
	document.location.href = "regDetail.do?flag=R&seq="+seq;
}

function fn_searchPdsPage(page){
	fn_searchPds( $("#sel_period").val(), page);
}
</script>	
</head>
<body>
<div>
	<select id="sel_period" style="width:80px; margin-bottom:0 auto;">
		<option value="1">일주일</option>
		<option value="2">한달</option>
		<option value="3">일년</option>
	</select>
	<input type="button" id="btn_regist" value="신규등록" style="position:absolute; right:10px; width:90px; ">
</div>
<div style="width:100%; overFlow-x : auto;">
<table class="boardlist" summary="">
	<colgroup>
		<col width="30px" />
		<col width="30px" />
		<col width="200px" />
		<col width="200px" />
		<col width="40px" />
		<col width="200px" />
		<col width="50px" />
		<col width="50px" />
		<col width="40px" />
	</colgroup>
	<thead>
		<tr>
            <th scope="col"><span id="header" name="NO" >No</span></th>
	        <th scope="col"><span id="header" name="BIZ_CODE" >업무코드</span></th>
	        <th scope="col"><span id="header" name="BIZ_ITEM" >업무항목</span></th>
	        <th scope="col"><span id="header" name="TARGET_RESULT" >목표결과</span></th>
	        <th scope="col"><span id="header" name="PROG_RATE" >진행률(%)</span></th>
	        <th scope="col"><span id="header" name="PLAN_DO" >계획및수행</span></th>
	        <th scope="col"><span id="header" name="SCHEDULE_DT" >이행일</span></th>
	        <th scope="col"><span id="header" name="REG_DT" >작성일</span></th>
	        <th scope="col"><span id="header" name="REG_USER" >작성자</span></th>
		</tr>
	</thead>			  
	<tbody id="result">
	</tbody>
</table>
</div>	
<div>
<p id="page" style="text-align:center;"></p>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
