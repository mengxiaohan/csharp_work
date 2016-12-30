using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace AttendanceSystem
{
    public partial class tjkq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBUtil util = new DBUtil();
            string query = "select * from zhigong";
            SqlDataReader dataReader = util.SelectDataReader(query);
            string[] column = { "id", "user_name", "user_number"};
            while (dataReader.Read())
            {
                HtmlTableRow r = new HtmlTableRow();
                for (int i = 0; i <= column.Length; i++)
                {
                    HtmlTableCell c = new HtmlTableCell();
                    string s = "";
                    if (i == column.Length)
                    {
                        s = "<button onclick='beginWork(" + dataReader[column[0]] + ")'>上班</button>";
                        s += "<button onclick='endWork(" + dataReader[column[0]] + ")'>下班</button>";
                    }
                    else
                    {
                        s = dataReader[column[i]].ToString();
                    }
                    c.Controls.Add(new LiteralControl(s));
                    r.Cells.Add(c);
                }
                dataTable.Rows.Add(r);
            }
            dataReader.Close();
        }
    }
}