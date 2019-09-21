<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加页面</title>
</head>
<body>
<%--导入jq--%>
<script src="${pageContext.request.contextPath}/resource/jquery-1.8.2.min.js"></script>
<!--导入css-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/validform/css/style.css"/>
<!--导入js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/validform/js/Validform_v5.3.2_min.js"></script>

<form action="${pageContext.request.contextPath}/monkey/add" method="post">
    <!--要求长度2-5个字符串-->
    <div>
        用户名啊：
        <input type="text" ajaxurl="${pageContext.request.contextPath}/monkey/checkName"  datatype="s2-5" name="monkeyName" value="" />
    </div>

    <div>
        <!--要求5个以上长度字符串-->
        密码啊啊：
        <input  datatype="s5-100" type="password" name="password" id="" value="" />
    </div>

    <div>
        <!--和密码一样-->
        确认密码：
        <input recheck="password" datatype="s5-100" type="password" />
    </div>
    <div>
        性别啊啊：
        <input type="radio" name="gender" value="1"> 男
        <input type="radio" datatype="*" name="gender" value="0"> 女
    </div>

    <div>
        爱好啊啊：
        <input type="checkbox" name="hobbies" value="lol"> lol
        <input type="checkbox" name="hobbies" value="shopping"> shopping
        <input type="checkbox" name="hobbies" value="dance"> dance
        <input type="checkbox" name="hobbies" value="sleep"> sleep
        <input type="checkbox" name="hobbies" value="java"> java
        <input type="checkbox" datatype="*" name="hobbies" value="sing"> sing
    </div>


    <div>
        地址啊啊：
        <select name="address">
            <option value="hf">合肥</option>
            <option value="tl">铜陵</option>
            <option value="luan">六安</option>
            <option value="wh">芜湖</option>
        </select>
    </div>

    <div>
        <input type="submit" value="提交"/>
    </div>

</form>
</body>


<!-- 表单验证初始化 -->
<script type="text/javascript">
    $("form:first").Validform({
        tiptype: 3,
        datatype:{
            "zh2-4" : /^[\u4E00-\u9FA5\uf900-\ufa2d]{2,4}$/,
            "xiaoshu":/^\d{1,2}\.\d{2}$/,
            "need2":function(gets,obj,curform,regxp){
                var need = 3;
                var numselected = 0;
                numselected=curform.find("input[name='"+obj.attr("name")+"']:checked").length;
                return numselected>= need ? true : "请至少选择"+need+"项！";
            }
        }
    });
</script>
</html>
