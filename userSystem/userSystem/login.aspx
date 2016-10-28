<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="userSystem.login" %>

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

</head>
<body>
    <!--
        下面的表单拥有两个输入字段以及一个提交按钮，当提交表单时(点击type=submit的button，会自动提交表单)，表单数据会提交到名为 "login.aspx" 的页面：
        form提交默认是get方式
    -->
    <div class="container">
      <form class="form-signin" role="form" action="index.aspx" method="post">
        <h2 class="form-signin-heading">请登陆</h2>
        <input type="text" name="tstUserName" class="form-control" placeholder="Email address" required autofocus>
        <input type="password" name="txtUserPwd" class="form-control" placeholder="Password" required style="margin-top:15px;">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我的登陆（1分钟有效）
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
      </form>
    </div>
</body>
</html>
