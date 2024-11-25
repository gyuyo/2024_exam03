<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error</title>
    <script type="text/javascript">
        alert("비밀번호를 확인해주세요");
        setTimeout(function() {
            window.location.href = "/usr/member/checkPw";
        }, 100);
    </script>
</head>
<body>
</body>
</html>