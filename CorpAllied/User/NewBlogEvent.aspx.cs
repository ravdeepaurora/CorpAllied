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
    public partial class NewBlogEvent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            
            }

        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            DataSet ds=new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_CreateEvent";
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@eventName", txtEventName.Text);
            cmd.Parameters.AddWithValue("@eventDate", Request.Form["txtdatepicker"].ToString());
            cmd.Parameters.AddWithValue("@UserEmail", Session["Username"].ToString());
            cmd.Parameters.AddWithValue("@eventDetails", txtEventDetails.Text);
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("EventDetails.aspx?ID=" + ds.Tables[0].Rows[0][0].ToString());
            }

        }

        protected void btnCreateBlog_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_CreateBlog";
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@BlogName", txtBlogName.Text);
            cmd.Parameters.AddWithValue("@BlogAbout",txtBlogAbout.Text);
            cmd.Parameters.AddWithValue("@UserEmail", Session["Username"].ToString());
            cmd.Parameters.AddWithValue("@BlogDetails", txtBlogDetails.Text);
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("BlogDetails.aspx?ID=" + ds.Tables[0].Rows[0][0].ToString());
            }

        }
    }
}