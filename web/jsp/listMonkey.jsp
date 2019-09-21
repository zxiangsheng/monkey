<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>展示界面</title>
</head>
<%--导入jq--%>
<script src="${pageContext.request.contextPath}/resource/jquery-1.8.2.min.js"></script>
<body>

<form action="${pageContext.request.contextPath}/monkey/list" method="post">

    姓名：<input type="text"  name="monkeyName" value="${monkey1.monkeyName}"/>

    地址：<select name="address">
    <option value="">全部</option>
    <option value="luan">六安</option>
    <option value="hf">合肥</option>
    <option value="wh">芜湖</option>
    <option value="tl">铜陵</option>
</select>
    <script>
        $("option[value=${monkey1.address}]").attr("selected",true);
    </script>

    <input type="submit" value="搜索" />
</form>

<table border="2px" cellspacing="0" cellpadding="35">
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>性别</td>
        <td>爱好</td>
        <td>地址</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${monkeys}" var="monkey">
        <tr>
            <td>${monkey.monkeyId}</td>
            <td>${monkey.monkeyName}</td>
            <td>${monkey.password}</td>
            <c:choose>
                <c:when test='${monkey.gender == "1"}'>
                    <td>男</td>
                </c:when>
                <c:otherwise>
                    <td>女</td>
                </c:otherwise>
            </c:choose>

            <td>${monkey.hobbies}</td>

            <c:choose>
                <c:when test='${monkey.address=="2"}'>
                    <td>全部</td>
                </c:when>
                <c:when test='${monkey.address=="luan"}'>
                    <td>六安</td>
                </c:when>
                <c:when test='${monkey.address=="hf"}'>
                    <td>合肥</td>
                </c:when>
                <c:when test='${monkey.address=="tl"}'>
                    <td>铜陵</td>
                </c:when>
                <c:otherwise>
                    <td>芜湖</td>
                </c:otherwise>
            </c:choose>

            <td><a href="${pageContext.request.contextPath}/monkey/toMdofy?MonkeyId=${monkey.monkeyId}">修改</a>:<a href="${pageContext.request.contextPath}/monkey/delete?MonkeyId=${monkey.monkeyId}">删除</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/jsp/addMonkey.jsp">添加</a>
<a href="${pageContext.request.contextPath}/sheep/logout">注销</a>
</br>

</body>

</html>
