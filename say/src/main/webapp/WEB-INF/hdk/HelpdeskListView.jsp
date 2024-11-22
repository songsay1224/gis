<%-- <%--
  Class Name :HelpdeskListView.jsp
  Description : 헬프데스크
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2023.05.19   och       초기버전
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css, js import -->
<link rel="stylesheet" href="/resources/css/member/common.css">
<link rel="stylesheet" href="/resources/css/member/page.css">


</head>
<body>
	<div class="wrapper">

		<div class="body">
			<div class="top_title">헬프데스크 게시판입니다.</div>
			<div class="wrap_contents">
				<div class="area_search">
					<form method="post" name="formHelpdesk" id="formHelpdesk">
						<input type="hidden" name="id" id="id" value="" />

						<table class="tbl_search">
							<tr>
								<th>요청일</th>
								<th><input type="text" placeholder="yyyy-mm-dd"
									class="date" name="reqDate" id="reqDate"> <img
									src="/images/main/i_calendar.png" alt="" class="i_calendar">
								</th>
								<th>처리일</th>
								<th><input type="text" placeholder="yyyy-mm-dd"
									class="date" name="ansDate" id="ansDate"> <img
									src="/images/main/i_calendar.png" alt="" class="i_calendar">
								</th>
								<th>요청자</th>
								<th colspan="2"><input type="text" class="requester"
									name="requester" id="requester" spellcheck="false"></th>
							</tr>
							<tr>
								<th>진행상태</th>
								<th><select name="progress" id="progress"
									style="width: 150px;">
										<option value="9">완료</option>
										<option value="1">처리중</option>
								</select></th>



								<th>유형</th>
								<th><select name="category" id="category"
									style="width: 150px;">
										<option value="1">업무문의</option>
										<option value="2">기능문의</option>
										<option value="3">오류문의</option>
										<option value="4">자료요청</option>
										<option value="5">기타문의</option>
								</select></th>
								<th>경로</th>
								<th><select name="route" id="route" style="width: 150px;">
										<option value="1">전화</option>
										<option value="2">게시판</option>
								</select></th>
								<th>자주 묻는 질문
									<button type="button" class="btn_form"
										onclick="javascript:faqSelectPopup();">검색</button>
								</th>
							</tr>
							<tr>
								<th>문의사항</th>
								<th colspan="6"><input id="reqContent" name="reqContent"
									type="text" placeholder='문의사항을 입력하세요.' spellcheck="false">
								</th>
							</tr>
							<tr>
								<th>답변사항</th>
								<th colspan="6"><input id="ansContent" name="ansContent"
									type="text" placeholder='답변을 입력하세요.' spellcheck="false">
								</th>
							</tr>
						</table>
					</form>
					<div style="text-align: right;">
						<button type="button" id="reset" class="reset_btn_form"
							onclick="javascript:resetData();">초기화</button>
						<button type="button" id="reg" class="btn_form"
							onclick="javascript:saveHelpdesk()">등록</button>
						<button type="button" id="update" class="mod_btn_form"
							onclick="javascript:updateHelpdesk()" style="display: none">수정</button>
						<button type="button" id="del" class="del_btn_form"
							onclick="javascript:deleteHelpdesk()" style="display: none">삭제</button>
					</div>
				</div>
				<div style="padding-top: 30px">
					<div class="bg_table_filer">
						<table class="tbl_filter">
							<tbody>
								<tr>
									<th style="width: 450px;">요청일 <input type="text"
										placeholder="yyyy-mm-dd" class="date" name="searchReqDate1"
										id="searchReqDate1"> <img
										src="/images/main/i_calendar.png" alt="" class="i_calendar">
										<span> - </span> <input type="text" placeholder="yyyy-mm-dd"
										class="date" name="searchReqDate2" id="searchReqDate2">
										<img src="/images/main/i_calendar.png" alt=""
										class="i_calendar">
									</th>
									<th style="width: 250px;">요청자 <input type="text"
										style="width: 180px;" id="searchRequester">
									</th>
									<th style="width: 200px;">유형 <select name="searchCategory"
										id="searchCategory">
											<option value="">전체</option>
											<option value="1">업무문의</option>
											<option value="2">기능문의</option>
											<option value="3">오류문의</option>
											<option value="4">자료요청</option>
											<option value="5">기타문의</option>
									</select>
									</th>
									<th style="width: 200px;">진행상태 <select
										name="searchProgress" id="searchProgress">
											<option value="">전체</option>
											<option value="9">완료</option>
											<option value="1">처리중</option>
									</select>
									</th>
									<th style="width: 320px;">경로 <select name="searchRoute"
										id="searchRoute">
											<option value="">전체</option>
											<option value="1">전화</option>
											<option value="2">게시판</option>
									</select> <span  style="border: none; text-align: right;">
										<img src="/images/arrow-circle.png" style="width:25px;height:25px; border-bottom: #2b2b2b" alt="리셋버튼" class="reset" onclick="reset();">
										<img src="/images/i_search.png" alt="검색" class="i_search" id="i_search" onClick="selectList(1);">
									    <img src="/images/i_excel.png" alt="엑셀다운로드" class="i_excel"  id="excelDown">  
										

									</span>
									</th>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- html -->
					<span id="htmlContents" />
				</div>
			</div>
		</div>
		
		

<div class="table_wrap">
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
			  <c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.bno}"/></td>
                <td><c:out value="${list.title}"/></td>
                <td><c:out value="${list.writer}"/></td>
                 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
            </tr>
        </c:forEach>
			
	</table>
</div>

<script>
$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "enrol success"){
			alert("등록이 완료되었습니다.");
		}
		
	}	
	
});
</script>
		
	</div>
</body>
</html>
