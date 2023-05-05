<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>课程展示</title>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
<style>
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
<div class="container">
    <h1 class="text-center">
        <small>课程列表-----显示所有课程</small>
    </h1>
    <li style="left: auto;">您好：${USER_SESSION.username}</li>
    <li style="left: auto;"><a href="${pageContext.request.contextPath}/user/goOut">注销</a></li>
    <div class="text-center">
        <a href="${pageContext.request.contextPath}/course/toAddCourse" class="btn btn-primary">新增课程</a>
        <a href="${pageContext.request.contextPath}/course/allCourse" class="btn btn-primary">显示全部课程</a>
    </div>
    <div class="text-center mt-3">
        <form action="${pageContext.request.contextPath}/course/queryCourse" method="post">
            <div class="input-group mb-3">
                <input type="text" name="queryCourseName" class="form-control" placeholder="请输入要查询的课程名称">
                <button class="btn btn-outline-secondary" type="submit">查询</button>
            </div>
            <span style="color: red">${error}</span>
        </form>
    </div>
</div>

<table class="table table-bordered table-striped mt-3">
    <thead class="table-dark">
    <tr>
        <th>课程编号</th>
        <th>课程封面图</th>
        <th>课程名</th>
        <th>学时数</th>
        <th>开课学院</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="course" items="${list}">
        <tr>
            <td>${course.id}</td>
            <td>
                <img src="${pageContext.request.contextPath}/statics/img/${course.coverImage}" height="100" alt="${course.name}的封面图"/>
            </td>
            <td>${course.name}</td>
            <td>${course.hours}</td>
            <td>${course.schools}</td>
            <td>
                <a href="${pageContext.request.contextPath}/course/toUpdate?id=${course.id}" class="btn btn-primary">修改</a>
                <a href="${pageContext.request.contextPath}/course/deleteCourse/${course.id}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>
