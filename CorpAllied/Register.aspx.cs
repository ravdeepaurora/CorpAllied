using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Configuration;
using System.Web.Configuration;
namespace CorpAllied
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        Guid varn = Guid.NewGuid();
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblStatus.Visible = false;  
            if (!Page.IsPostBack)
            {
                SqlDataAdapter adp = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand();
                DataSet ds = new DataSet();
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                string conCmd;
                conCmd = "sp_SecurityQts";
                con.ConnectionString = conString;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.CommandText = conCmd;
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                ddlSecurityQts.DataSource = ds;
                ddlSecurityQts.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                SqlDataAdapter adp = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand();
                DataSet ds = new DataSet();
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                string conCmd;
                if (rdolstCompanyUser.SelectedValue == "User")
                {
                    conCmd = "sp_CheckAlreadyUser";

                }
                else
                {
                    conCmd = "sp_CheckAlreadyCompany";
                }
                con.ConnectionString = conString;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.CommandText = conCmd;
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    adp = new SqlDataAdapter();
                    cmd = new SqlCommand();
                    ds = new DataSet();
                    conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                    if (rdolstCompanyUser.SelectedValue == "User")
                    {
                        conCmd = "sp_RegisterUser";

                    }
                    else
                    {
                        conCmd = "sp_RegisterCompany";
                    }
                    con.ConnectionString = conString;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.CommandText = conCmd;
                    cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@username", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@securityqtsid", ddlSecurityQts.SelectedValue);
                    cmd.Parameters.AddWithValue("@securityanswer", txtSecurityAnswer.Text);
                    cmd.Parameters.AddWithValue("@gender", rdolstGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@country", ddlCountryList.SelectedValue);
                    cmd.Parameters.AddWithValue("@activationcode", varn);
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    if (result == 3)
                    {
                        SendEmail();
                        lblStatus.Text = "Registration Successful! Kindly Check mail to Activate Account <br/> Redirecting You to Login Page in 5 seconds!";
                        lblStatus.Visible = true;
                        Response.AppendHeader("Refresh", "5;url=../Login.aspx");
                    }
                }
                else
                {
                    lblStatus.Visible = true;
                    Response.AppendHeader("Refresh", "5;url=../Login.aspx");
                }
            }
            catch (Exception ex)
            {
                Session["Error"] = ex;
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
        protected void SendEmail()
        {
            using (MailMessage mm = new MailMessage("impingetesting@gmail.com", txtEmail.Text))
            {
                var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                mm.Subject = "Welcome to Corp Allied!";
                string link = string.Format("<a href=http://ravdeep.azurewebsites.net/User/Activation.aspx?activationcode={0}> Click Here </a>", varn.ToString());
                mm.Body = string.Format("Welcome to CorpAllied.....<br> Kindly {0} or copy the link below into your browser to activate your account <br> http://localhost:4077/User/Activation.aspx?activationcode={1}" ,link,varn.ToString());
                mm.IsBodyHtml = true ;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = smtpSection.Network.Host;
                smtp.EnableSsl = smtpSection.Network.EnableSsl;
                NetworkCredential NetworkCred = new NetworkCredential(smtpSection.Network.UserName,smtpSection.Network.Password);
                smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                smtp.Credentials = NetworkCred;
                smtp.Port = smtpSection.Network.Port;
                smtp.Send(mm);
              
            }
        }
    }
}