using FineUI;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmptyProjectNet45_FineUI
{
    public partial class registe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
                string insertnum = (Convert.ToInt32(Session["last"]) + 1).ToString();
                string sqlStr = "Insert into [login](id,password) Values ('" + tbxUserName.Text + "','" + tbxPassword.Text + "')";
                string Connstring = ConfigurationManager.ConnectionStrings["sherlock.schoolcar.dbo"].ConnectionString;
                SqlConnection conn = new SqlConnection(Connstring);
                SqlCommand sqlCom = new SqlCommand(sqlStr, conn);   //创建实例，两个参数，前者时SQL语句，后者时连接对象
                conn.Open();
                // Response.Write(sqlStr);

                int count = sqlCom.ExecuteNonQuery();  //编辑的行数
                if (count > 0)
                {
                    Alert.ShowInTop("注册成功！");
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Alert.ShowInTop("注册失败！");
                }
                conn.Close();
            }


        }
    }
