<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="userSystem.index" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">

    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function getList(index, aspxURL) {
            $.ajax({
                url: aspxURL,
                global: false,
                type: "POST",
                dataType: "html",
                async: false,
                success: function (msg) {
                    //移除所有的选中效果
                    $(".infos li").each(function () {
                        $(this).removeClass("active");
                    });
                    //给点击的链接增加class
                    $("#li_" + index).addClass("active"); //通过id获取元素

                    //$(".jumbotron").hide(); //通过class获取元素
                    $("#showInfo").hide(); 
                    $("#detailDIV").html(msg);
                }
            })
        }
    </script>
</head>
<body>
     <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="/">用户管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav infos">
            <li id="li_0"><a href="javascript:getList(0, 'list.aspx');">用户列表</a></li>
            <li id="li_1"><a href="javascript:getList(1, 'add.aspx');">新增</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/login.aspx?out=true">退出</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container" >
      <div id="showInfo" class="jumbotron">
        <h1>XXX用户管理系统</h1>
        <p>我这里可以显示系统介绍，以及基本使用方法</p>
      </div>
      <div id="detailDIV" class="jumbotron">
      </div>
    </div>
</body>
</html>
