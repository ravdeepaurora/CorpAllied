using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorpAllied
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        static string userid,type;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter adp = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            string conString=ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd="sp_VerifyUserName";
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            cmd.Parameters.AddWithValue("@profile", rdoCompanyorUser.SelectedItem.Value);
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count >0)
            {
                rdoCompanyorUser.Enabled = false;
                userid = ds.Tables[0].Rows[0]["Userid"].ToString();
                type = rdoCompanyorUser.SelectedItem.Value;
                if (type == "User")
                {
                    conCmd = "sp_FetchUserSecurityQts";
                }
                else 
                {
                    conCmd = "sp_FetchCompanySecurityQts";
                }
                cmd = new SqlCommand();
                adp = new SqlDataAdapter();
                ds = new DataSet();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = conCmd;
                cmd.Parameters.AddWithValue("@userid", userid);
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblSecurityQtsRetrieved.Text = ds.Tables[0].Rows[0]["SecurityQuestion"].ToString();
                    txtSecurityAnswer.Enabled = true;
                    txtUserName.Enabled = false;
                    btnVerifyAnswer.Enabled = true;
                   
                }
            }
        }

     
        protected void btnVerifyAnswer_Click(object sender, EventArgs e)
        {
            if (txtSecurityAnswer.Text != null)
            {
                SqlDataAdapter adp = new SqlDataAdapter();
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand();
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                string conCmd;
                if (type == "User")
                    conCmd = "sp_VerifyUserSecurityAnswer";
                else
                    conCmd = "sp_VerifyCompanySecurityAnswer";
                con.ConnectionString = conString;
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = conCmd;
                cmd.Parameters.AddWithValue("@userid", userid);
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                if (txtSecurityAnswer.Text.ToString() == ds.Tables[0].Rows[0]["SecurityAnswer"].ToString())
                {
                    txtNewPassword.Enabled = true;
                    txtConfirmPassword.Enabled = true;
                    txtUserName.Enabled = false;
                    txtSecurityAnswer.Enabled = false;
                    btnReset.Enabled = true;
                    btnVerifyAnswer.Enabled = false;
                }

            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            SqlDataAdapter adp = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd;
            if (type == "User")
                conCmd = "sp_ResetUserPassword";
            else
                conCmd = "sp_ResetCompanyPassword";
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@password", txtNewPassword.Text);
            if ((txtNewPassword.Text == txtConfirmPassword.Text) && (txtNewPassword.Text != null))
            {
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                    lblStatus.Visible = true;
                Response.AppendHeader("Refresh", "3;url=Login.aspx");
            }
        }
    }
}