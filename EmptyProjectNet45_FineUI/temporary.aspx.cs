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
    public partial class temporary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string insertnum = (Convert.ToInt32(Session["last"]) + 1).ToString();
            string sqlStr = "Insert into [temporary](licensenum,enter,leave,hour,min) Values ('" + TextBox2.Text + "','" + DatePicker1.Text + "','" + DatePicker2.Text + "','" + TextBox11.Text + "','" + TextBox11.Text + "')";
            string Connstring = ConfigurationManager.ConnectionStrings["sherlock.schoolcar.dbo"].ConnectionString;
            SqlConnection conn = new SqlConnection(Connstring);
            SqlCommand sqlCom = new SqlCommand(sqlStr, conn);   //创建实例，两个参数，前者时SQL语句，后者时连接对象
            conn.Open();
            // Response.Write(sqlStr);

            int count = sqlCom.ExecuteNonQuery();  //编辑的行数
            if (count > 0)
            {
                Alert.ShowInTop("提交成功");
            }
            else
            {
                Alert.ShowInTop("提交失败");
            }
            conn.Close();
        }
    }
}