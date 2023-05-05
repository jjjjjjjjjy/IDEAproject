<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改课程</title>
    <!-- 引入Bootstrap样式文件 -->
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="text-center">修改课程</h1>
    <form action="${pageContext.request.contextPath}/course/updateCourse" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${QCourse.id}">
        <div class="form-group">
            <label for="cover">课程封面</label>
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="cover" name="file" value="${QCourse.coverImage}">
                <label class="custom-file-label" for="cover">选择文件</label>
            </div>
            <img id="preview" src="${pageContext.request.contextPath}/statics/img/${QCourse.coverImage}" alt="默认图片" height="70" width="100">
        </div>
        <div class="form-group">
            <label for="cname">课程名</label>
            <input type="text" class="form-control" id="cname" name="name" value="${QCourse.name}" required>
        </div>
        <div class="form-group">
            <label for="chours">课时</label>
            <input type="text" class="form-control" id="chours" name="hours" value="${QCourse.hours}" required>
        </div>
        <div class="form-group">
            <label for="sid">院系号</label>
            <input type="text" class="form-control" id="sid" name="schools" value="${QCourse.schools}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="修改">
        </div>
    </form>
</div>
<!-- 引入jQuery和Bootstrap的JavaScript文件 -->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</body>
</html>