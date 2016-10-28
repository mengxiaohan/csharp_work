using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

//using ：引入命名空间，可以使用命名空间下的对象，比如Console(System)

namespace userSystem
{
    public partial class index_ajax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Request内置对象，直接使用；Request(“参数名”)可以获取form提交的数据
            string userName = Request["tstUserName"];
            string userPwd = Request["txtUserPwd"];

             DBUtil util = new DBUtil();
            //如果没登陆，就要查询数据库，判断是否可以登录
            string countsql = "select count(id) from t_user where login_name = '" + userName + "' and login_pwd = '" + userPwd + "'";
            int count = util.Count(countsql);
            //如果登陆成功（count == 1）
            Response.ContentType = "text/plain";
            if (count == 1)
            {
                Response.Write("success");
            }
            else
            {
                Response.Write("fail");
            }
            Response.End();
        }
    }
}