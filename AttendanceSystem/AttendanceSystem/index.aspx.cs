using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceSystem
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBUtil util = new DBUtil();
            string countsql = "select count(id) from zhigong where user_name = '张三'";
            int count = util.Count(countsql);
            if (count != 1){
                Response.ContentType = "text/plain";
                Response.Write("数据库连接失败");
                Response.End();
            }else{
                //Response.ContentType = "text/plain";
                //Response.Write(DateTime.Now.ToString());
                //Response.End();
            }
             
        }
    }
}