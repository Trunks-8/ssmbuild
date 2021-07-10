<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021
  Time: 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap,美化界面 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表——显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
            <a class="btn btn-success" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
        </div>
        <div class="col-md-6 column">
            <!-- 查询书籍 -->
            <form action="${pageContext.request.contextPath}/book/queryBook" method="post"
                  class="form-inline" style="float: right">
                <span style="color:deeppink;font-weight: bold">${error}</span>
                <!-- name="queryBookName"提交到后台BookController中的方法String queryBook() -->
                <input type="submit" class="btn btn-warning" value="查询">
                <label>
                    <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书籍名称">
                </label>
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <!-- 表格头部 -->
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!-- 表格中间内容 -->
                <tbody>
                <!-- 书籍从数据库中查询出来，从这个list中遍历出来：foreach -->
                <c:forEach var="book" items="${requestScope.get('list')}">
                    <tr>
                        <td>${book.getBookID()}</td>
                        <td>${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td>${book.getDetail()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.getBookID()}">修改</a> |
                            <a href="${pageContext.request.contextPath}/book/delete/${book.getBookID()}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>