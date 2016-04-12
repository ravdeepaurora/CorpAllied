using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorpAllied.User
{
    public partial class Activation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void SendEmail(string Email)
        {
            using (MailMessage mm = new MailMessage("impingetesting@gmail.com", Email))
            {
                var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                mm.Subject = "Welcome to Corp Allied!";
                mm.Body = string.Format("Welcome to CorpAllied.....<br> Your Email Has been successfully verified..<br> Kindly login with your credentials entered during registration..");
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = smtpSection.Network.Host;
                smtp.EnableSsl = smtpSection.Network.EnableSsl;
                NetworkCredential NetworkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                smtp.Credentials = NetworkCred;
                smtp.Port = smtpSection.Network.Port;
                smtp.Send(mm);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {
                if (Request.QueryString["activationcode"] == null)
                {
                    lblActivationStatus.Text = "Oops! Activation Failed ";
                    AnchorClickhere.HRef = "../Default.aspx";
                    Response.AppendHeader("Refresh", "5;url=../Default.aspx");
                }
                else
                {
                    DataSet ds = new DataSet();
                    string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                    SqlDataAdapter adp = new SqlDataAdapter();
                    SqlCommand cmd = new SqlCommand();
                    string conCmd = "sp_AccountActivation";
                    con.ConnectionString = conString;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.CommandText = conCmd;
                    cmd.Parameters.AddWithValue("@activationcode", Request.QueryString["activationcode"]);
                    adp.SelectCommand = cmd;
                    adp.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string linkaid = Request.QueryString["activationcode"].ToLower();
                        string dbaid = ds.Tables[0].Rows[0]["activationcode"].ToString();
                        string accountstatus = ds.Tables[0].Rows[0]["ActivationStatus"].ToString();
                        string userid = ds.Tables[0].Rows[0]["userid"].ToString();
                        string type = ds.Tables[0].Rows[0]["type"].ToString();
                        string email = ds.Tables[0].Rows[0]["email"].ToString();
                        if ((linkaid.Equals(dbaid)) && (accountstatus.Equals("0")))
                        {
                            adp = new SqlDataAdapter();
                            cmd = new SqlCommand();
                            ds = new DataSet();
                            conCmd = "sp_ActivateAccount";
                            con.ConnectionString = conString;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = con;
                            cmd.CommandText = conCmd;
                            cmd.Parameters.AddWithValue("@userid", userid);
                            cmd.Parameters.AddWithValue("@type", type);
                            con.Open();
                            int result = cmd.ExecuteNonQuery();
                            con.Close();
                            if (result > 0)
                            {
                                lblActivationStatus.Text = "Success!";
                                AnchorClickhere.HRef = "../Login.aspx";
                                SendEmail(email);
                                Response.AppendHeader("Refresh", "5;url=../Login.aspx");
                            }
                        }
                        else if ((linkaid.Equals(dbaid)) && (accountstatus.Equals("1")))
                        {
                            lblActivationStatus.Text = "Account Already Activated! Kindly Login";
                            AnchorClickhere.HRef = "../Login.aspx";
                            Response.AppendHeader("Refresh", "5;url=../Login.aspx");
                        }
                        else
                        {
                            lblActivationStatus.Text = "Invalid Token!";
                            AnchorClickhere.HRef = "../Register.aspx";
                            Response.AppendHeader("Refresh", "5;url=../Register.aspx");
                        }
                    }
                    else
                    {
                        lblActivationStatus.Text = "Invalid Token!";
                        AnchorClickhere.HRef = "../Register.aspx";
                        Response.AppendHeader("Refresh", "5;url=../Register.aspx");
                    }
                }
            }
        }
    }
}