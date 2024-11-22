<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SR시스템 구현</title>
<link rel="stylesheet"
	href="/resources/css/bootstrap.min/bootstrap.min.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>

	<body class="bg-light">

    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <form id="login_form" method="post" class="w-50 p-4 bg-white shadow rounded">
            <div class="text-center mb-4">
                <h1>SR시스템</h1>
            </div>
            <div class="mb-3">
                <label for="memberId" class="form-label">아이디</label>
                <input type="text" class="form-control" id="memberId" name="memberId">
            </div>
            <div class="mb-3">
                <label for="memberPw" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="memberPw" name="memberPw" maxlength="25">
            </div>

            <c:if test="${result == 0 }">
                <div class="alert alert-danger text-center">사용자 ID 또는 비밀번호를 확인해주세요.</div>
            </c:if>

            <div class="d-grid gap-2">
                <button type="button" class="btn btn-primary login_button">로그인</button>
                <button type="button" class="btn btn-secondary join_click">회원가입</button>
            </div>
        </form>
    </div>

 
    <script>
    $(document).ready(function() {
        // 로그인 버튼 클릭 시 폼 제출
        $(".login_button").click(function() {
            $("#login_form").attr("action", "main.do");
            $("#login_form").submit();
        });

        // 회원가입 버튼 클릭 시 회원가입 페이지로 이동
        $(".join_click").click(function() {
            window.location.href = "join.do";
        });

        // 비밀번호 입력창에서 엔터키를 눌렀을 때 폼 제출
        $("#memberPw").on('keydown', function(event) { // 비밀번호 입력 필드의 ID 사용
            if (event.key === 'Enter') {
                $("#login_form").attr("action", "main.do"); // 액션 설정
                $("#login_form").submit(); // 폼 제출
            }
        });
    });
    </script>

</body>
</html>