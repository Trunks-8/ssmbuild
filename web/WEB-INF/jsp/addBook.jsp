<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>新增书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap,美化界面 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <!-- 数据表单 -->
    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <label for="bookName">书籍名称：</label>
        <input type="text" name="bookName" id="bookName" class="form-control" required><br><br>
        <label for="bookCounts">书籍数量：</label>
        <input type="text" name="bookCounts" id="bookCounts" class="form-control" required><br><br>
        <label for="detail">书籍详情：</label>
        <input type="text" name="detail" id="detail" class="form-control" required><br><br>
        <input type="submit" value="添加">
    </form>
</div>

</body>
</html>

