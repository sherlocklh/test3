using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using FineUI;
using System.Configuration;

namespace EmptyProjectNet20
{
    public partial class login : System.Web.UI.Page
    {
        string Connstring = ConfigurationManager.ConnectionStrings["sherlock.schoolcar.dbo"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            InitCaptchaCode();
        }

        /// <summary>
        /// 初始化验证码
        /// </summary>
        private void InitCaptchaCode()
        {
            // 创建一个 6 位的随机数并保存在 Session 对象中
            Session["CaptchaImageText"] = GenerateRandomCode();
            imgCaptcha.ImageUrl = "~/captcha/captcha.ashx?w=150&h=30&t=" + DateTime.Now.Ticks;
        }

        /// <summary>
        /// 创建一个 6 位的随机数
        /// </summary>
        /// <returns></returns>
        private string GenerateRandomCode()
        {
            string s = String.Empty;
            Random random = new Random();
            for (int i = 0; i < 6; i++)
            {
                s += random.Next(10).ToString();
            }
            return s;
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            InitCaptchaCode();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("registe.aspx");
        }
        protected void btton_Click(object sender, EventArgs e)
        {
            if (tbxCaptcha.Text != Session["CaptchaImageText"].ToString())
            {
                Alert.ShowInTop("验证码错误！");
                return;
            }
                String b, c;
                b = tbxUserName.Text;
                c = tbxPassword.Text;
                SqlConnection sqlConnection = new SqlConnection(Connstring);//新建数据库连接实例
                sqlConnection.Open();//打开数据库连接
                String sql = "select id,password from login where id='" + b + "'and password='" + c + "'";//SQL语句实现表数据的读取
                SqlCommand sqlCommand = new SqlCommand(sql, sqlConnection);
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                if (sqlDataReader.HasRows)//满足用户名与密码一致，进入下一个界面
                {
                    Session.Remove("id");
                    Session["id"] = tbxUserName.Text;
                    Response.Redirect("default1.aspx");
                }
                else
                {
                    Alert.ShowInTop("用户名或密码错误！", MessageBoxIcon.Error);
                }
            }

        /*protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (tbxCaptcha.Text != Session["CaptchaImageText"].ToString())
            {
                Alert.ShowInTop("验证码错误！");
                return;
            }
            String a, m;
            a = tbxUserName.Text;
            m = tbxPassword.Text;
            SqlConnection sqlConnection = new SqlConnection(Connstring);//新建数据库连接实例
            sqlConnection.Open();//打开数据库连接
            String sql = "select admin,mima from denglu where admin='" + a + "'and mima='" + m + "'";//SQL语句实现表数据的读取
            SqlCommand sqlCommand = new SqlCommand(sql, sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            if (sqlDataReader.HasRows)//满足用户名与密码一致，进入下一个界面
            {
                Session.Remove("admin");
                Session["admin"] = tbxUserName.Text;
                Response.Redirect("default.aspx");
            }
              else//如果登录失败，询问是否注册新用户
            {
                DialogResult dr = MessageBox.Show("是否注册新用户？", "登录失败", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)//打开注册界面
                {
                    Form2 form2 = new Form2();
                    form2.Show();
                    this.Hide();
                }
                else
                {
                    this.Show();
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
            this.Hide();
        }
    }
}*
           /* if (tbxUserName.Text == "admin" && tbxPassword.Text == "admin")
            {
                Alert.ShowInTop("成功登录！");
            }
            else
            {
                Alert.ShowInTop("用户名或密码错误！", MessageBoxIcon.Error);
            }
        }*/

    }
}
