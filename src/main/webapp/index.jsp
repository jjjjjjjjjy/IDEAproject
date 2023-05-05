<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
    <style>
      a{
        text-decoration: none;
        color: gold;
      }
      h2{
        width: 300px;
        height: 50px;
        margin: 100px auto;
        text-align: center;
        line-height: 38px;
        background: deeppink;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
  <h1>
    <a href="${pageContext.request.contextPath}/user/goLogin">登录页面</a>
  </h1>
  <h1>
    <a href="${pageContext.request.contextPath}/user/main">首页</a>
  </h1>
  <h2>
    <a href="${pageContext.request.contextPath}/course/allCourse">进入课程页面</a>
  </h2>
  </body>
</html>

