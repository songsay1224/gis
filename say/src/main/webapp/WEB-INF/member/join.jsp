<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/css/bootstrap.min/bootstrap.min.css">
	
<script
  src="https://code.jquery.com/jquery-3.4.1.js"> </script>
</head>
<body class="bg-light">
	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<form id="join_form" method="POST"
			class="w-50 p-4 bg-white shadow rounded">
			<div class="text-center mb-4">
				<h1>회원가입</h1>
			</div>
			<div class="mb-3">
				<label for="memberId" class="form-label">아이디</label> <input
					type="text" class="form-control" id="memberId" name="memberId">
			</div>
			<div class="mb-3">
				<label for="memberPw" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="memberPw" name="memberPw">
			</div>
			<div class="mb-3">
				<label for="memberPwck" class="form-label">비밀번호 확인</label> <input
					type="password" class="form-control" id="memberPwck">
			</div>
			<div class="d-grid gap-2">
				<input class="btn btn-primary join_button" type="button" value="가입하기">
			</div>
		</form>
	</div>
</body>

<script>
	$(document).ready(function() {
		//회원가입 버튼(회원가입 기능 작동)
		$(".join_button").click(function() {
			$("#join_form").attr("action", "join.do");
			$("#join_form").submit();
			alert("회원가입 성공");
		});
	});
</script>


</body>
</html>