using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace userSystem
{
    public partial class save : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = Request["userId"];
            string login_name = Request["login_name"];
            string login_pwd = Request["login_pwd"];
            string username = Request["username"];
            string description = Request["description"];

            DBUtil util = new DBUtil();
            //没有有主键ID,执行新增过程
            if (id == null || id == "")
            {
                string query = "INSERT INTO `t_user` (login_name, login_pwd, username, descripiton) VALUES ('" + login_name + "', '" + login_pwd + "', '" + username + "', '" + description + "'); ";
                util.Insert(query);
            }
            else //有主键ID,执行修改过程
            {
                string query = "update `t_user` set login_name = '" + login_name  + "'";
                query += ", login_pwd = '" + login_pwd + "'";
                query += ", username = '" + username + "'";
                query += ", descripiton = '" + description + "'";
                query += " where id = " + id;
                util.Update(query);
            }

            Response.Redirect("/index.aspx");
            //Response.Redirect("/index.aspx?tstUserName=admin&txtUserPwd=a");
        }
    }
}