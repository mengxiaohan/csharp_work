<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cxkqjg.aspx.cs" Inherits="AttendanceSystem.cxkqjg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    考勤详细
    <table id="dataTable" runat="server">
        <tr>
            <th>日期</th>
		    <th>上班时间</th>
            <th>下班时间</th>
        </tr>
    </table>
     <br/>
    考勤月统计
     <table id="tongJiTable" runat="server">
        <tr>
            <th>出勤率</th>
		    <th>迟到率</th>
            <th>早退率</th>
            <th>旷工率</th>
            <th>加班率</th>
        </tr>
    </table>
</body>
</html>
