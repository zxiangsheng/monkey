<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆界面</title>
</head>
<body>
       <form action="${pageContext.request.contextPath}/monkey/loginCkeck" method="post">
           姓名：<input type="text" name="monkeyName" value=""></br>
           密码：<input type="password" name="password" value=""></br>
            记住密码：
           <input type="radio" checked name="remember" value="30">30天免登陆
       </br>
            <input type="submit" value="登陆" />
        </form>
</body>
</html>
