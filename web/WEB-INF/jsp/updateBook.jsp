<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍信息</title>
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
                    <small>修改书籍信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <!-- 1. 出现的问题：提交了修改的SQL请求，但修改失败。初次考虑，是事务问题，配置完毕事务，依旧失败 -->
        <!-- 2. 看一下sql语句，能否执行成功：sql执行失败，修改未完成 -->
        <!-- 3. 前端传递隐藏域，bookID，修改成功 -->
        <input type="hidden" name="bookID" value="${book.getBookID()}"/>
        <label for="bookName">书籍名称：</label>
        <input type="text" name="bookName" value="${book.getBookName()}"
               id="bookName" class="form-control"/><br><br>
        <label for="bookCounts">书籍数量：</label>
        <input type="text" name="bookCounts" value="${book.getBookCounts()}"
               id="bookCounts" class="form-control"/><br><br>
        <label for="detail">书籍详情：</label>
        <input type="text" name="detail" value="${book.getDetail() }" id="detail"
               id="detail" class="form-control"/><br><br>
        <input type="submit" value="提交"/>
    </form>
</div>

</body>
</html>
