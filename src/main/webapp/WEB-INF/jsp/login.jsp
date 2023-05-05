<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        a{
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 align="center">登录页面</h4>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/user/login" method="post" id="login-form">
                        <div class="form-group">
                            <label>用户名</label>
                            <input type="text" class="form-control" name="username" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <input type="submit" class="btn btn-primary" value="登录"/>
                        <span style="color: red" >${msg}</span><br>
                        <label>还没有账号？请先</label>
                        <a href="${pageContext.request.contextPath}/toregister">注册</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</body>
</html>