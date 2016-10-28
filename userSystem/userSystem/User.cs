using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace userSystem
{
    public class User
    {
        //创建一个属性，定义set，get方法
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string login_name;

        public string Login_name
        {
            get { return login_name; }
            set { login_name = value; }
        }
        private string login_pwd;
        private string username;
        private string descripition;

        public User() { } //创建类的构造方法

        public User getTest(){
            return new User();
        }
    }
}