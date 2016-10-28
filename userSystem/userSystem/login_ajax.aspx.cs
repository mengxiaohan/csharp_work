using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace userSystem
{
    public partial class login_ajax : System.Web.UI.Page
    {
        //1.Page_Load事件的执行是在第一次加载页面时发生(即为了响应客户的请求); 
        //2.Page_Load事件的执行是在把该页面回发到服务器时发生; 
        protected void Page_Load(object sender, EventArgs e)
        {
            string outStr = Request["out"];
            if (outStr != null) //退出操作
            {
                Session.Clear();
                HttpContext.Current.Response.Cookies.Clear();
            }

            string error = Request["error"];
            if (error != null) //退出操作
            {
                Response.Write("登陆失败！！");
            }
        }
    }
}