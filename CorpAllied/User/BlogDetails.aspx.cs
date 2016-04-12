using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorpAllied.User
{
    public partial class BlogDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptrJobDetail.Visible = true;
                lblEmptyID.Visible = false;
                if (Request.QueryString["id"] == null)
                {
                    lblEmptyID.Visible = true;
                    rptrJobDetail.Visible = false;
                }
                else
                {
                    bind();

                }
            }
        }

        private void bind()
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conCmd;
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            int id = Convert.ToInt32(Request.QueryString["id"]);
            con.ConnectionString = conString;
            conCmd = "Select * from Blogs where id=@id";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@id", id);
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                rptrJobDetail.Visible = false;
                lblEmptyID.Visible = true;
            }
            else
            {
                rptrJobDetail.DataSource = ds;
                rptrJobDetail.DataBind();
            }
        }
    }
}