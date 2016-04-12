using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorpAllied.Company
{
    public partial class Company : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
                try
                {
                    Session["Username"] = "Ravdeep";
                    lblUserName.Text = Session["Username"].ToString();
                }
                catch (Exception ex)
                {
                    Session.Abandon();
                    Session.RemoveAll();
                    Session.Clear();
                    Response.Redirect("../Error.aspx");
                }
                lblTime.Text = DateTime.Now.ToString();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }

        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
           Session.Abandon();
           Session.RemoveAll();
           Session.Clear();
           Response.Redirect("../Default.aspx");
        }

        protected void btnPostStatus_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            SqlDataAdapter adp = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd;
            conCmd = "sp_uploadUserStatus";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@username", Session["Username"].ToString());
            txtPostStatusTxt.Text = txtPostStatusTxt.Text.Replace("\r\n", "<br/>");
            cmd.Parameters.AddWithValue("@status", txtPostStatusTxt.Text);
            if (fileupldStatusPost.PostedFile.ContentLength > 0)
            {
                int length = fileupldStatusPost.PostedFile.ContentLength;
                //create a byte array to store the binary image data  
                byte[] imgbyte = new byte[length];
                //store the currently selected file in memeory  
                HttpPostedFile img = fileupldStatusPost.PostedFile;
                //set the binary data  
                img.InputStream.Read(imgbyte, 0, length);
                cmd.Parameters.AddWithValue("@pic", imgbyte);
            }
            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            Response.AppendHeader("Refresh", "1");
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx?s="+srchterm.Value);
        }
        
    }
}