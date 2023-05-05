<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <style>
        a{
            text-decoration: none;
            color: #fd7e14;
            background: #c7dbd2;
            background-size: auto;
        }
        h1{
            font-size: large;
            color: #e5c7ca;
            background: #6ea8fe;
            font-family: "Microsoft YaHei UI", serif ;
            width: 300px;
            height: 50px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            border-radius: 5px;
        }
        li{
            color: cadetblue;
            font-size: medium;
            font-family: "Microsoft YaHei UI", serif;
            padding: 10px;
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <h1>首页</h1>
    <li>您好：${USER_SESSION.username}</li>
    <li><a href="${pageContext.request.contextPath}/user/goOut">注销</a></li>
    <li><a href="${pageContext.request.contextPath}/course/allCourse">课程信息</a> </li>
</body>

</body>
</html>