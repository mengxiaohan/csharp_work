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
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sessionKey = "SimpleString"; //定义变量的名称
            //如果已经登陆
            if (Session[sessionKey] != null) {
                string query = "select * from t_user";
                string userName = Session[sessionKey].ToString();
                if (userName == "admin")
                {
                    //如果是管理员、则查询所有用户信息，并显示
                }
                else
                {   //如果是普通用户，只查询自己的信息
                    query = "select * from t_user where login_name = '" + userName + "'";
                }

                DBUtil util = new DBUtil();
                string nameQuery = Request["nameQuery"];
                if (nameQuery != null)
                {
                    query += " where username like '%" + nameQuery + "%'";
                }

                MySqlDataReader dataReader = util.SelectDataReader(query);
                string[] column = { "id", "login_name", "login_pwd", "username", "descripiton"};
                while (dataReader.Read())
                {
                    HtmlTableRow r = new HtmlTableRow();
                    for (int i = 0; i <= column.Length; i++) //循环数据，注意我这里是<=
                    {
                        HtmlTableCell c = new HtmlTableCell();
                        string s = "";
                        if (i == column.Length) //i==5 第6次
                        {
                            s = "<button onclick='editData(" + dataReader[column[0]] + ")'>编辑</button>";
                            if (userName == "admin" && dataReader[column[3]].ToString() != "管理员")
                            {
                                 s += "<button onclick='delData(" + dataReader[column[0]] + ")'>删除</button>";
                            }
                        }
                        else { // 0-4 5次
                           s = dataReader[column[i]].ToString();
                        }
                        c.Controls.Add(new LiteralControl(s));
                        r.Cells.Add(c);
                    }
                    //dataTable aspx中必须有个table，且有属性runat="server"
                    dataTable.Rows.Add(r);
                }
                //dataTable.Border = 2;
                dataReader.Close();
            }
        }
    }
}