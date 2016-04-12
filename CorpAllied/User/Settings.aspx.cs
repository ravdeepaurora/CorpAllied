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
    public partial class Settings : System.Web.UI.Page
    {
        Guid varn = Guid.NewGuid();
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        string conCmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cmd = new SqlCommand();
                adp = new SqlDataAdapter();
                ds = new DataSet();
                conCmd = "sp_GetUserID";
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.ConnectionString = conString;
                try
                {
                    cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
                }
                catch (Exception ex)
                {
                    Response.Redirect("../Login.aspx");
                }
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                { }
                    //image_upload_preview.Src = "ImageHandle.ashx?profileid=" + ds.Tables[0].Rows[0][0].ToString();
            }
        }

        protected void btnUpdateEmail_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand();
            adp = new SqlDataAdapter();
            ds = new DataSet();
          conCmd = "sp_VerifyCurrentEmail";
          cmd.CommandText = conCmd;
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Connection = con;
          con.ConnectionString = conString;
          cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
          adp.SelectCommand = cmd;
          adp.Fill(ds);
          if ((ds.Tables[0].Rows.Count>0)&&(ds.Tables[0].Rows[0]["UCEmail"].ToString().Equals(Session["Username"].ToString())&&(ds.Tables[0].Rows[0]["Password"].ToString().Equals(txtCurrentPassword.Text))))
          {
              con.ConnectionString = conString;
              cmd = new SqlCommand();
              adp = new SqlDataAdapter();
              ds = new DataSet();
              conCmd = "sp_UpdateEmail";
              cmd.CommandText = conCmd;
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Connection = con;
              cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
              cmd.Parameters.AddWithValue("@userAltnerateEmail", txtNewEmail.Text);
              cmd.Parameters.AddWithValue("@activationcode", varn);
              SendEmail();
              con.Open();
              int result=cmd.ExecuteNonQuery();
              con.Close();
              if (result > 0)
              {
                  btnUpdateEmail.Text = "Success! Kindly Check Mail!";
                  btnUpdateEmail.Enabled = false;
                  btnUpdateEmail.CssClass = "btn btn-success";
              }
              else
              {
                  btnUpdateEmail.Text = "Failed! Retry";
                  btnUpdateEmail.Enabled = true;
                  btnUpdateEmail.CssClass = "btn btn-danger";
              }
          }
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand();
            adp = new SqlDataAdapter();
            ds = new DataSet();
            conCmd = "sp_UpdatePassword";
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            con.ConnectionString = conString;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
            cmd.Parameters.AddWithValue("@currentpassword", txtOldPassword.Text);
            cmd.Parameters.AddWithValue("@newPassword", txtNewPassword.Text);
            con.Open();
            int result=cmd.ExecuteNonQuery();
            con.Close();
            if (result > 0)
            {
                btnUpdatePassword.Text = "Success";
                btnUpdatePassword.Enabled = false;
                btnUpdatePassword.CssClass = "btn btn-success";
            }
            else
            {
                btnUpdatePassword.Text = "Failed! Retry";
                btnUpdatePassword.Enabled = true;
                btnUpdatePassword.CssClass = "btn btn-danger";
            
            }
        }

        protected void btnUploadProfilePic_Click(object sender, EventArgs e)
        {
            if (fileuploadProfilePic.PostedFile.ContentLength > 0)
            {
                int length = fileuploadProfilePic.PostedFile.ContentLength;
                //create a byte array to store the binary image data  
                byte[] imgbyte = new byte[length];
                //store the currently selected file in memeory  
                HttpPostedFile img = fileuploadProfilePic.PostedFile;
                //set the binary data  
                img.InputStream.Read(imgbyte, 0, length);
                cmd = new SqlCommand();
                adp = new SqlDataAdapter();
                ds = new DataSet();
                conCmd = "sp_UpdateProfilePic";
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.ConnectionString = conString;
                cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@pic", imgbyte);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    btnUploadProfilePic.Text = "Success";
                    btnUploadProfilePic.Enabled = false;
                    btnUploadProfilePic.CssClass = "btn btn-success center-block";
                }
                else
                {
                    btnUploadProfilePic.Text = "Failed!..Retry";
                    btnUploadProfilePic.Enabled = true;
                    btnUploadProfilePic.CssClass = "btn btn-danger";
                }
                
            }
        }
        protected void SendEmail()
        {
            using (MailMessage mm = new MailMessage("impingetesting@gmail.com", txtNewEmail.Text))
            {
                var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                mm.Subject = "Welcome to Corp Allied!";
                string link = string.Format("<a href=http://ravdeep.azurewebsites.net/User/Activation.aspx?activationcode={0}> Click Here </a>", varn.ToString());
                mm.Body = string.Format("Welcome to CorpAllied.....<br> Kindly {0} or copy the link below into your browser to activate your account <br> http://localhost:4077/User/Activation.aspx?activationcode={1}", link, varn.ToString());
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
    }
}