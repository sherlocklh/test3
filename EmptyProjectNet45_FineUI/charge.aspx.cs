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

namespace EmptyProjectNet45_FineUI
{
    public partial class charge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnResetForm2.OnClientClick = Form2.GetResetReference();
            }
        }
        protected void btnSubmitForm2_Click(object sender, EventArgs e)
        {

            string insertnum = (Convert.ToInt32(Session["last"]) + 1).ToString();
            string sqlStr = "Insert into [charge](licensenum,approver,date,enter,leave,hour,min,state,receivables,Payment) Values ('" + Label4.Text + "','" + DropDownList3.SelectedText + "','" + DatePicker1.Text + "','" + TimePicker1.Text + "','" + TimePicker2.Text + "','" + TextBox11.Text + "','" + TextBox1.Text + "','" + DropDownList1.SelectedText + "','" + Label21.Text + "','"+ Label20.Text + "')";
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

            //Alert.ShowInTop("表单 2 验证并提交成功！");
        }


    }
}