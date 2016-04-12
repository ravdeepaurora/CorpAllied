using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Auth.OAuth2;
namespace CorpAllied
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                lblError.Visible = false;
                try
                {
                    if (!Session["UserName"].Equals(null))
                    {
                        Response.Redirect("/User/Default.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Session["Error"] = ex;
                }
            }
        }

        protected void lnkbtnForgetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter adp = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand();
                DataSet ds = new DataSet();
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                string conCmd;
                if (rdoLoginProfile.SelectedItem.Value == "User")
                {
                    conCmd = "sp_FetchUserDB";
                }
                else
                {
                    conCmd = "sp_FetchCompanyDB";
                }
                con.ConnectionString = conString;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.CommandText = conCmd;
                cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                con.Open();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                con.Close();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["ActivationStatus"].ToString() == "1")
                    {
                        Session["Name"] = ds.Tables[0].Rows[0]["FirstName"].ToString();
                        Session["UserID"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                        Session["Username"] = ds.Tables[0].Rows[0]["Email"].ToString();
                        if (conCmd == "sp_FetchUserDB")
                            Response.Redirect("/User/Default.aspx");
                        else
                            Response.Redirect("/Company/Default.aspx");
                    }
                    else
                        lblError.Visible = true;
                }
                else
                    lblError.Visible = true;
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
            }
        }

    }
}