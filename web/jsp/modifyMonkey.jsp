<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改学生</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resource/jquery-1.8.2.min.js"></script>
<!--导入css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/validform/css/style.css">
<!--导入js-->
<script src="${pageContext.request.contextPath}/resource/validform/js/Validform_v5.3.2_min.js"></script>

<form action="${pageContext.request.contextPath}/monkey/modify" method="post">
    <div>
        编号：<input type="text"  readonly="readonly" name="monkeyId" value="${monkey.monkeyId}"  />
    </div>

    <div>
        姓名：<input type="text" datatype="s2-5" ajaxurl="${pageContext.request.contextPath}/monkey/checkName?oldName=${monkey.monkeyName}" name="monkeyName" value="${monkey.monkeyName}"  />
    </div>

    <div>
        密码：<input type="password" datatype="s5-100" name="password" value="${monkey.password}"  />
    </div>

    <div>
        <!--和密码一样-->
        确认密码：
        <input recheck="password" datatype="s5-100" type="password" />
    </div>

    <div>
        选择性别：
        <input type="radio" name="gender" value="1">男
        <input type="radio" name="gender" value="0">女
    </div>
    <%--性别回显--%>
   <script>
       $("input[value=${monkey.gender}]").attr("checked",true);
   </script>
    <div>
        爱好啊啊：
        <input type="checkbox" name="hobbies" value="lol"> lol
        <input type="checkbox" name="hobbies" value="shopping"> shopping
        <input type="checkbox" name="hobbies" value="dance"> dance
        <input type="checkbox" name="hobbies" value="sleep"> sleep
        <input type="checkbox" name="hobbies" value="java"> java
        <input type="checkbox" datatype="*" name="hobbies" value="sing"> sing
    </div>
    <%--爱好回显--%>
  <script>
      var hobbies = "${monkey.hobbies}".split(",")
      for(var i = 0; i < hobbies.length; i++){
          $(":checkbox[value="+hobbies[i]+"]").attr("checked",true);
      }
  </script>

    <div>
        地址啊啊：
        <select name="address">
            <option value="hf">合肥</option>
            <option value="tl">铜陵</option>
            <option value="luan">六安</option>
            <option value="wh">芜湖</option>
        </select>
    </div>
<%--地址回显--%>
<script>
    $("option[value=${monkey.address}]").attr("selected",true);
</script>

    <input type="submit" value="确认修改"/>
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
