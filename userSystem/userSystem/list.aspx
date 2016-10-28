<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="userSystem.list" %>


    <script>
        function goToAdd() { 
            window.location.href = "/add.aspx"
        }

        function search() {
            var value = document.getElementById("nameQuery").value;
            window.location.href = "/index.aspx?nameQuery=" + value;
        }

        function delData(id) {
            window.location.href = "/delete.aspx?id=" + id;
        }
        
        //编辑的跳转
        function editData(id) {
            window.location.href = "/add.aspx?id=" + id;
        }

    </script>

    <div class="panel panel-primary" style="min-height:500px;">
        <div class="panel-heading">用户列表</div>
        <div style="float:right;margin-top:-32px;">
             <input type="text" id="nameQuery"/><button id="search" onclick="search()" runat="server">查询</button>
             <button id="batchDelete" runat="server">批量删除</button>
        </div>
        <div>
            <table id="dataTable"  class="table table-bordered" runat="server">
                <tr>
                    <th>ID</th>
		            <th>登陆名</th>
		            <th>密码</th>
		            <th>用户姓名</th>
		            <th>描述</th>
                    <th>
                        操作
                    </th>
                </tr>
            </table>
        </div>
    </div>
