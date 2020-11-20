using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmptyProjectNet45_FineUI
{
    public partial class temgrid : System.Web.UI.Page
    {
        string Connstring = ConfigurationManager.ConnectionStrings["sherlock.schoolcar.dbo"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //第一次加载页面时
            if (!Page.IsPostBack)
            {
                Bind();
                Save();
                DisplayCount();
            }
        }
        //绑定数据源及分页设置
        #region Bind
        public void Bind()
        {
            SqlConnection conn = new SqlConnection(Connstring);
            string sqlStr = "select * from [temporary] order by ord";
            SqlDataAdapter adapter = new SqlDataAdapter(sqlStr, conn);//数据适配器，连接dataset与数据库
            DataSet myds = new DataSet();  //内存中的数据库
            conn.Open();
            adapter.Fill(myds, "temporary"); //把数据库填充到适配器
            GridView2.DataSource = myds;
            GridView2.AllowPaging = true;  //分页启用
            GridView2.PageSize = 7;   //每页显示7行数据
            GridView2.DataKeyNames = new String[] { "ord" };   //设定主键
            GridView2.DataBind();
            conn.Close();
        }

        #endregion
        //分页器
        #region page
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex; //当前页的索引
            Bind(); //重新绑定GridView的过程
        }
        #endregion

        //求总行数
        #region countrow
        public int RowCount()
        {
            int rowCount = 0;
            if (GridView2.PageCount > 0)
            {
                GridView2.PageIndex = GridView2.PageCount - 1;   //将当前显示页的索引转到最后一页    

                GridView2.DataBind();
                int lastSize = GridView2.Rows.Count;
                if (GridView2.PageCount > 1)
                {                                                       //总行数=（总页数-1）* 每页行数 +  最后一页的行数
                    return rowCount = GridView2.PageSize * (GridView2.PageCount - 1) + lastSize;
                }
                else return rowCount = lastSize;   //如果页数只有一页，则直接将该页的行数赋给Label
            }
            else return rowCount = 0;     //  如果无记录，页显示0
        }
        public void Save()
        {
            Session["NUM"] = RowCount().ToString();
            Session["last"] = GridView2.DataKeys[GridView2.Rows.Count - 1]["ord"].ToString();
        }
        public void DisplayCount()
        {
            rowcount.Text = RowCount().ToString();
            GridView2.PageIndex = 0;
            GridView2.DataBind();
        }
        #endregion*/

        //编辑功能
        #region edit
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;//获得行的索引值
            Bind();
            Save();
            DisplayCount();
        }

        //选择编辑后显示的更新的功能
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(Connstring);
            string sqlStr = "update [applylicense] set licensenum='"
                + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "',enter='"
                + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "',leave='"
                + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "',hour='"
                + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim() + "',min='"
                + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim() + "' where ord='"
                + GridView2.DataKeys[e.RowIndex]["ord"].ToString() + "'";

            SqlCommand sqlCom = new SqlCommand(sqlStr, conn);   //构造函数生成SqlCommand对象，前者时SQL语句，后者时连接对象
            conn.Open();
            int count = sqlCom.ExecuteNonQuery();  //编辑的行数
            if (count > 0)
            {
                Response.Write("<script>alert('更新成功！')</script>");
            }
            else
            {
                Response.Write("<script>alert('更新失败！')</script>");
            }
            conn.Close();
            GridView2.EditIndex = -1;
            Bind();
            Save();
            DisplayCount();
        }

        //选择编辑后显示的取消的功能
        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1; //没有正在编辑的行
            Bind();
            Save();
            DisplayCount();
        }
        #endregion

        //删除功能
        #region delete
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(Connstring);
            string sqlStr = "delete from [applylicense] where ord='" + GridView2.DataKeys[e.RowIndex]["ord"].ToString() + "'";
            SqlCommand sqlCom = new SqlCommand(sqlStr, conn);
            conn.Open();
            int count = sqlCom.ExecuteNonQuery();  //使行受到影响
            if (count > 0)
            {
                Response.Write("<script>alert('删除成功！')</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败！')</script>");
            }
            conn.Close();
            GridView2.EditIndex = -1;
            Bind();
            Save();
            DisplayCount();
        }
        #endregion

        //操作提示
        #region note
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Note_Operation")
            {
                int index = Convert.ToInt32(e.CommandArgument) + 1;
                ClientScript.RegisterStartupScript(this.GetType(), "提示", "<script>alert('您可以对第" + index + "行进行数据操作了！')</script>");
            }
        }
        #endregion

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //查找
        protected void FINDBUTTOM_Click(object sender, EventArgs e)
        {
            string key = txtfind.Text.Trim();  //trim()
            if (key != "")
            {
                string sqlStr = "Select * from [temporary] "; //模糊查询，%可以替代任意长度字符
                sqlStr += "where licensenum like '%" + key + "%' "; //按姓名搜索
                sqlStr += "or enter like '%" + key + "%' ";//按遗学号搜索
                sqlStr += "or leave like '%" + key + "%' ";//按班级搜索
                SqlConnection conn = new SqlConnection(Connstring);
                SqlDataAdapter adapter = new SqlDataAdapter(sqlStr, conn);
                DataSet ds = new DataSet();
                conn.Open();
                adapter.Fill(ds, "temporary");
                GridView2.DataSource = ds;
                GridView2.AllowPaging = true;  //分页启用
                GridView2.PageSize = 7;   //每页显示7行数据
                GridView2.DataBind();
                conn.Close();
                if (rowcount.Text == "0")
                {
                    Response.Write("<script>alert('查找到0条记录！')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('请输入查找的关键字！')</script>");
            }
        }
        //显示全表
        protected void DISPLAY_Click(object sender, EventArgs e)
        {
            Bind();
            DisplayCount();
        }
    }
}