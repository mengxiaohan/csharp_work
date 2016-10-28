using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace userSystem
{
    public partial class delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];

            DBUtil util = new DBUtil();
            string query = "delete from `t_user` where id = " + id;
            util.Delete(query);

            Response.Redirect("/index.aspx");
        }
    }
}