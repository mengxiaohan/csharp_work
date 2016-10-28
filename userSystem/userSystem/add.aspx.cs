using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace userSystem
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string id = Request["id"];
            if (id == null) { //新增跳转时候：没有id
                return;
            }

            DBUtil util = new DBUtil();
            String query = "select * from t_user where id = " + id;
            MySqlDataReader dataReader = util.SelectDataReader(query);
            string[] column = { "id", "login_name", "login_pwd", "username", "descripiton" };
            while (dataReader.Read())
            {  
                for (int i = 0; i < column.Length; i++) //循环数据，注意我这里是<=
                {
                    string s = dataReader[column[i]].ToString();
                    if(i == 0){
                        userId.Value = s;
                    }else if (i == 1) {
                        login_name.Value = s;
                    }
                    else if (i == 2)
                    {
                        login_pwd.Value = s;
                    }
                    else if (i == 3)
                    {
                        username.Value = s;
                    }
                    else if (i == 4)
                    {
                        description.Value = s;
                    }
                }
            }
            dataReader.Close();
           
        }
    }
}