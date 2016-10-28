<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="userSystem.add" %>

<!DOCTYPE html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <script>
        function goBack() {
            window.location.href = "/index.aspx";
        }
    </script>
</head>
<body>
    <div class="panel panel-default">
        <div class="panel-heading">用户编辑</div>
       
        <form id="form1" class="form-horizontal" style="margin-top:10px;" runat="server" action="save.aspx" method="post" role="form">
            <div class="form-group">
                <label for="userId" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="userId" id="userId" disabled runat="server">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">登陆名</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="login_name" id="login_name" runat="server"/>
                </div>
            </div>
        
            <div class="form-group">
                <label class="col-sm-2 control-label">登陆密码</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="login_pwd" id="login_pwd" runat="server"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">真实姓名</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="username" id="username" runat="server"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">描述</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="description" id="description" runat="server"/>
                </div>
            </div>


            <div class="form-group" style="text-align:center">
                 <button type="submit" class="btn btn-primary">保存</button>
                 <button type="button" class="btn" onclick="goBack()">返回</button>
            </div>
        </form>
    </div>
</body>
</html>
