using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorpAllied.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
            
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_AdminVerify";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count>0)
            {
                Session["Username"] = ds.Tables[0].Rows[0]["Username"].ToString();
                Response.Redirect("AdminPanel.aspx");
            }
        }
    }
}