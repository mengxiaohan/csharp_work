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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Request内置对象，直接使用；Request(“参数名”)可以获取form提交的数据
            string userName = Request["tstUserName"];
            string userPwd = Request["txtUserPwd"];

            string sessionKey = "SimpleString"; //定义变量的名称
            if (HttpContext.Current.Request.Cookies["cookieName"] != null)
            {
                //Response.Write(HttpContext.Current.Request.Cookies["cookieName"].Value + "");
                Session[sessionKey] = HttpContext.Current.Request.Cookies["cookieName"].Value;
                return;
            }
           
            if (Session[sessionKey] != null)
            {
                return;
            }

            DBUtil util = new DBUtil();
            //如果没登陆，就要查询数据库，判断是否可以登录
            string countsql = "select count(id) from t_user where login_name = '" + userName + "' and login_pwd = '" + userPwd + "'";
            int count = util.Count(countsql);
            //如果登陆成功（count == 1）
            if (count == 1)
            {
                Session[sessionKey] = userName; //保存变量至session,浏览器关闭，session才会需要重新获取

                //新建cookie,然后发送至页面; 真正应该是判断登陆页面是否点击了记住我，才去设置cookie
                HttpCookie cookie = new HttpCookie("cookieName");
                cookie.Value = userName;
                cookie.Expires = DateTime.Now.AddMinutes(1);
                HttpContext.Current.Response.Cookies.Add(cookie); 
            }
            else
            {
                Response.Redirect("/login.aspx?error=yes");
                //Response.Write("登陆失败"); //Reponse可以向客户端发送数据 Response.Write (变量数据或字符串) 
            }

           
        }
    }
}