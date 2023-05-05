<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增课程</title>
    <!-- 引入Bootstrap样式文件 -->
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.4.js"></script>
    <script>
        function a() {
            $.post({
                url:"${pageContext.request.contextPath}/course/isCourseExist",
                data:{"name":$("#cname").val()},//#cname取输入框的课程名
                success:function (data) {
                    if (data){
                        alert(data);
                    }
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <h1 class="text-center text-info mt-5">新增课程</h1>
    <form action="${pageContext.request.contextPath}/course/addCourse" method="post" id="f1" enctype="multipart/form-data">
        <div class="form-group">
            <label for="cover">课程封面图</label>
            <input type="file" class="form-control-file" id="cover" name="file">
        </div>
        <div class="form-group">
            <label for="cname">课程名</label>
            <input type="text" class="form-control" id="cname" name="name" required onblur="a()">
            <span id="remind"></span>
        </div>
        <div class="form-group">
            <label for="chours">学时数</label>
            <input type="text" class="form-control" id="chours" name="hours" required>
        </div>
        <div class="form-group">
            <label for="sid">开课学院</label>
            <input type="text" class="form-control" id="sid" name="schools" required>
        </div>
        <button type="submit" class="btn btn-primary">添加</button>
    </form>
</div>
<!-- 引入jQuery和Bootstrap的JavaScript文件 -->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</body>
</html>