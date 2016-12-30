using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace AttendanceSystem
{
    public partial class cxkqjg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userInfo = Request["userInfo"];
            string month = Request["month"];

            string countsql = "select id from zhigong where user_name = '" + userInfo + "' or user_number = '" + userInfo + "'";
            DBUtil util = new DBUtil();
            int id = util.Count(countsql);
            if (id == 0)
            {
                Response.ContentType = "text/plain";
                Response.Write("无此职工");
                Response.End();
            }

            string str = DateTime.Now.Year + "-" + month;
            string query = "select * from kaoqing where user_id = " + id + " and day like '" + str + "%' order by day asc";
            SqlDataReader dataReader = util.SelectDataReader(query);
            string[] column = { "day", "begin_time", "end_time" };
            int count = 0;
            int chidao = 0;
            int zaotui = 0;
            int jb = 0;
            int kg = 0;
            while (dataReader.Read())
            {
                HtmlTableRow r = new HtmlTableRow();
                for (int i = 0; i < column.Length; i++)
                {
                    HtmlTableCell c = new HtmlTableCell();
                    string s = dataReader[column[i]].ToString();
                    if (i == 0) {
                        int temp = Convert.ToInt32(DateTime.Parse(s).DayOfWeek);
                        if (temp == 0 || temp == 6)
                        {
                            jb++;
                        }
                        else {
                            DateTime t1 = DateTime.Parse(s + " 09:00:00");
                            DateTime t2 = DateTime.Parse(s + " 17:00:00");

                            Boolean isKG = false;
                            if (dataReader[column[1]].ToString() == ""){
                                kg++;
                                isKG = true;
                            } else {
                                DateTime begin = DateTime.Parse(dataReader[column[1]].ToString());
                                if (DateTime.Compare(begin, t1) > 0){ //上班打卡时间要大于9点，才算迟到
                                    chidao++;
                                }

                                int h = (begin - t1).Hours;
                                if (h >= 2) {
                                    kg++;
                                    isKG = true;
                                }
                            }

                            if (dataReader[column[2]].ToString() == ""){
                                if (!isKG) {
                                    kg++;
                                }
                            }else {
                                DateTime end = DateTime.Parse(dataReader[column[2]].ToString());
                                if (DateTime.Compare(end, t2) < 0){//下班打卡时间要小于17点，才算早退
                                    zaotui++;
                                }

                                int h = (t1 - end).Hours;
                                if (h >= 2 && !isKG)
                                {
                                    kg++;
                                }
                            }
                        }
                    }
                    c.Controls.Add(new LiteralControl(s));
                    r.Cells.Add(c);
                }
                dataTable.Rows.Add(r);

                count++;
            }
            dataReader.Close();

            DateTime dt = DateTime.Now;
            int allDay = DateTime.DaysInMonth(dt.Year, int.Parse(month));
            HtmlTableRow row = new HtmlTableRow();
            for (int i = 0; i < 5; i++)
            {
                HtmlTableCell c = new HtmlTableCell();
                string s = "";
                if (i == 0) {
                    s = count + "";
                }else if(i == 1){
                    s = chidao + "";
                }else if(i == 2){
                    s = zaotui + "";
                }else if (i == 3){
                    s = kg + "";
                }else if (i == 4){
                    s = jb + "";
                }
                c.Controls.Add(new LiteralControl(s));
                row.Cells.Add(c);
            }
            tongJiTable.Rows.Add(row);

        }
    }
}