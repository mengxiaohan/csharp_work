<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_ajax.aspx.cs" Inherits="userSystem.login_ajax" %>

<!DOCTYPE html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script>
        function getLogin() {
            //var u = document.getElementById("").value;
            var tstUserName = loginForm.tstUserName.value; //这也是原生的方法，获取input标签的值，前提是在form里面
            var txtUserPwd = loginForm.txtUserPwd.value;

            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            var url = "index_ajax.aspx?tstUserName=" + tstUserName + "&txtUserPwd=" + txtUserPwd; //接口服务，网页地址

            /*
            * open方法参数：
            * 第一个：请求方式
            * 第二个：请求地址
            * 第三个：Async 同步方式： 
            *  true 异步：发送数据，不等待服务器是否返回；
            *  false 同步：JavaScript 会等到服务器响应就绪才继续执行。如果服务器繁忙或缓慢，应用程序会挂起或停止(一直等)
            */
            xmlhttp.open("GET", url, false);
            //xmlhttp.setRequestHeader(header, value); 
            xmlhttp.send(); //xmlhttp.send("fname=Bill&lname=Gates");
            var result = xmlhttp.responseText;
            dealResult(result);
        }

        //定义函数，并传入一个参数
        function dealResult(result) {
            console.info(result);

            if (result == "success") {
                //window.location.href = "http://www.baidu.com";
                window.location.href = "index.aspx";
            } else {
                document.getElementById("msg").style.display = "block";
                console.error("用户名或密码错误");
            }
        }

        //$(function(){});=$(document).ready(function
        $(document).ready(function () {
            $(".btn").on("click", function () {
                var tstUserName = loginForm.tstUserName.value;
                var txtUserPwd = loginForm.txtUserPwd.value;
                var url = "index_ajax.aspx?tstUserName=" + tstUserName + "&txtUserPwd=" + txtUserPwd;

                //jquery实现ajax
                $.ajax({
                    type: 'GET',
                    url: url,
                    dataType: 'text',
                    async: false,
                    success: function success(result) {
                        dealResult(result)
                    }
                });
            });
        });
    </script>
</head>
<body>
    <!--
        下面的表单拥有两个输入字段以及一个提交按钮，当提交表单时(点击type=submit的button，会自动提交表单)，表单数据会提交到名为 "login.aspx" 的页面：
        form提交默认是get方式
    -->
    <div class="container">
      <form class="form-signin" role="form" name="loginForm" action="index.aspx" method="post">
        <h2 class="form-signin-heading">请登陆</h2>
        <input type="text" name="tstUserName" class="form-control" placeholder="Email address" required autofocus>
        <input type="password" name="txtUserPwd" class="form-control" placeholder="Password" required style="margin-top:15px;">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我的登陆（1分钟有效）
          </label>
        </div>
        <span style="color:red; display:none" id="msg">用户名或密码错误</span>
        <input class="btn btn-lg btn-primary btn-block" type="button"  value="登陆"/>
      </form>
    </div>
</body>
</html>
