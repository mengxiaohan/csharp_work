<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cxkq.aspx.cs" Inherits="AttendanceSystem.cxkq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function getResult() {
            var userInfo = document.getElementById("userInfo").value;
            if (userInfo == "" || userInfo == undefined) {
                return;
            }
            var month = document.getElementById("month").value;
            window.location.href = "cxkqjg.aspx?userInfo=" + userInfo + "&month=" + month;
        }
    </script>
</head>
<body>
    请输入职工姓名或者职工号
    <input id="userInfo"/>
    <br/>
    统计月份
    <select id="month">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
    </select>
    <button onclick="getResult()"> 查询</button>
</body>
</html>
