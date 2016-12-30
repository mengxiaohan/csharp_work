<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tjkq.aspx.cs" Inherits="AttendanceSystem.tjkq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function beginWork(id) {
            window.location.href = "bckq.aspx?flag=1&id="+id;
        }

        function endWork(id) {
            window.location.href = "bckq.aspx?flag=2&id=" + id;
        }
    </script>
</head>
<body>
   <table id="dataTable" runat="server">
                <tr>
                    <th>ID</th>
		            <th>职工姓名</th>
		            <th>编号</th>
                    <th>
                        操作
                    </th>
                </tr>
            </table>
</body>
</html>
