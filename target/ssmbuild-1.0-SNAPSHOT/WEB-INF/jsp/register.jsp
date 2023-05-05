<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            border-radius: 3px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0069d9;
        }

        .captcha {
            display: flex;
            align-items: center;
        }

        .captcha-img {
            margin-right: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 注册页面 -->
<div class="container">
    <h2 class="text-center mb-4">注册页面</h2>
    <form id="register-form" action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-group">
            <label>用户名：</label>
            <input type="text" name="username" id="username">
        </div>
        <div class="form-group">
            <label>密码：</label>
            <input type="password" name="password" id="password">
        </div>
        <div class="form-group">
            <label>确认密码：</label>
            <input type="password" name="confirm-password" id="confirm-password">
        </div>
        <div class="form-group captcha">
            <label>验证码：</label>
            <input type="text" name="captcha" id="captcha">
            <img src="${pageContext.request.contextPath}/captcha" id="captcha-img" onclick="refreshCaptcha()">
        </div>
        <div class="form-group">
            <input type="submit" value="注册" class="btn btn-primary">
        </div>
        <div class="form-group">
            ${result}
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    // 刷新验证码
    function refreshCaptcha() {
        $('#captcha-img').attr('src', '/captcha?' + Math.random());
    }

    // 表单提交时，验证表单数据
    $('#register-form').submit(function () {
        var username = $('#username').val();
        var password = $('#password').val();
        var confirmPassword = $('#confirm-password').val();
        var captcha = $('#captcha').val();

        if (username===undefined||username==='') {
            alert('请输入用户名');
            return false;
        }

        if (password===undefined||password==='') {
            alert('请输入密码');
            return false;
        }

        if (password !== confirmPassword) {
            alert('两次输入的密码不一致');
            return false;
        }

        if (captcha===undefined||captcha==='') {
            alert('请输入验证码');
            return false;
        }
    });

    // 页面加载时，获取验证码
    $(function() {
        refreshCaptcha();
    });
</script>
</body>
</html>