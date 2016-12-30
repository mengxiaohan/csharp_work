using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceSystem
{
    public partial class bckq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string flag = Request["flag"];
            string id = Request["id"];

            string str = DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day;
            string countsql = "select count(id) from kaoqing where day = '" + str + "' and user_id = " + id;
            DBUtil util = new DBUtil();
            int count = util.Count(countsql);
            if (count == 1)
            {
                string update = "";
                if (flag == "1")
                {
                    update = "update kaoqing set begin_time = '" + DateTime.Now.ToString() + "'";
                }
                else {
                    update = "update kaoqing set end_time = '" + DateTime.Now.ToString() + "'";
                }
                update += " where day = '" + str + "' and user_id = " + id;
                util.Insert(update);
            }
            else {
                if (flag == "1")
                {
                    string sql = "insert into kaoqing (user_id, begin_time, day) values (";
                    sql += id + ", '" + DateTime.Now.ToString() + "', '" + str + "')";
                    util.Insert(sql);
                }
                else {
                    string sql = "insert into kaoqing (user_id, end_time, day) values (";
                    sql += id + ", '" + DateTime.Now.ToString() + "', '" + str + "')";
                    util.Insert(sql);
                }
            }
            Response.Redirect("/index.aspx");
        }
    }
}