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
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string profileid = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter adp = new SqlDataAdapter();
                    string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                    string conCmd = "sp_GetUserID";
                    con.ConnectionString = conString;
                    cmd.Parameters.AddWithValue("@userEmail", Session["UserName"].ToString());
                    cmd.CommandText = conCmd;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    adp.SelectCommand = cmd;
                    adp.Fill(ds);
                    string Userid = ds.Tables[0].Rows[0]["ID"].ToString();
                    profileid = Request.QueryString["Profileid"];
                    if (profileid.Equals(Userid))
                    {
                        profileid = null;
                    }
                }
                catch (Exception ex)
                { 
                
                }
                try
                {
                    lblName.ForeColor = System.Drawing.Color.White;
                    if (profileid == null)
                    {
                        imgavatar.Src = "ImageHandle.ashx?pEmail=" + Session["Username"].ToString();
                        imgbckground.Src = "ImageHandle.ashx?pEmail=" + Session["Username"].ToString();
                        DataSet ds = new DataSet();
                        SqlCommand cmd = new SqlCommand();
                        SqlDataAdapter adp = new SqlDataAdapter();
                        string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                        string conCmd = "sp_GetProfileUserName";
                        con.ConnectionString = conString;
                        cmd.Parameters.AddWithValue("@email", Session["UserName"].ToString());
                        cmd.CommandText = conCmd;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        adp.SelectCommand = cmd;
                        adp.Fill(ds);
                        string Name = string.Format(ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString());
                        lblName.Text = Name;
                        lblAboutMe.Text=ds.Tables[0].Rows[0]["AboutMe"].ToString();
                        txtAboutMe.Text = lblAboutMe.Text;
                        txtAboutMe.Text = txtAboutMe.Text.Replace("<br/>", "\r\n");
                        rptrRecentUpdates.DataSource = ds;
                        rptrRecentUpdates.DataBind();
                        
                        
                    }
                    else
                    {
                        Bind();
                    }
                }
                catch (Exception ex)
                {
                    Session.Abandon();
                    Session.RemoveAll();
                    Session.Clear();
                    Response.Redirect("../Error.aspx");
                }
            }
        }

        private void Bind()
        {
            imgavatar.Src = "ImageHandle.ashx?Id=" + Request.QueryString["Profileid"].ToString();
            imgbckground.Src = "ImageHandle.ashx?Id=" + Request.QueryString["Profileid"].ToString();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_ViewProfile";
            con.ConnectionString = conString;
            cmd.Parameters.AddWithValue("@friendid", Request.QueryString["Profileid"].ToString());
            cmd.Parameters.AddWithValue("@useremail", Session["Username"].ToString());
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["ActivationStatus"].ToString() == "1")
                {
                    string Name = string.Format(ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString());
                    lblName.Text = Name;
                    followings.Attributes.Remove("href");
                    lblAboutMeEdit.Visible = false;
                    lblAboutMe.Text = ds.Tables[0].Rows[0]["AboutUser"].ToString();
                    string friendstatus = ds.Tables[0].Rows[0]["FriendStatus"].ToString();
                    string friendID = ds.Tables[0].Rows[0]["FriendID"].ToString();
                    if (friendstatus.Equals("1"))
                    {
                        ds.Dispose();
                        ds = new DataSet();
                        cmd = new SqlCommand();
                        adp = new SqlDataAdapter();
                        conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                        conCmd = "sp_ViewFriendRecentUpdates";
                        con.ConnectionString = conString;
                        cmd.Parameters.AddWithValue("@profileid", Request.QueryString["Profileid"].ToString());
                        cmd.CommandText = conCmd;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        adp.SelectCommand = cmd;
                        adp.Fill(ds);
                        rptrRecentUpdates.DataSource = ds;
                        rptrRecentUpdates.DataBind();
                        lblfriendstatus.Text = "UnFriend";


                    }
                    else if (friendstatus.Equals("pending"))
                    {
                        rptrRecentUpdates.DataSource = null;
                        rptrRecentUpdates.DataBind();
                        lblfriendstatus.Text = "Friend Request Sent";
                    }
                    else if (friendstatus.Equals("toaccept"))
                    {
                        rptrRecentUpdates.DataSource = null;
                        rptrRecentUpdates.DataBind();
                        lblfriendstatus.Text = "Accept Request";
                    }

                    else
                    {
                        lblfriendstatus.Text = "Send Request";
                    }
                }
                else
                {
                    pnlProfile.Visible = false;
                    pnlProfileError.Visible = true;

                }
            }
            else
            {
                pnlProfile.Visible = false;
                pnlProfileError.Visible = true;
            }
        }

        protected void followings_ServerClick(object sender, EventArgs e)
        {
            if (lblfriendstatus.Text.Equals("Send Request"))
            {
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter adp = new SqlDataAdapter();
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                string conCmd = "sp_SendFriendRequest";
                con.ConnectionString = conString;
                cmd.Parameters.AddWithValue("@friendid", Request.QueryString["Profileid"].ToString());
                cmd.Parameters.AddWithValue("@useremail", Session["Username"].ToString());
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result>0)
                {
                    lblfriendstatus.Text = "Friend Request Sent";
                }
            }
            else if (lblfriendstatus.Text.Equals("Accept Request"))
            {
                Response.Redirect("Friends.aspx");
            }
            else if (lblfriendstatus.Text.Equals("Friend List"))
            {
                Response.Redirect("Friends.aspx");
            }
            else if(lblfriendstatus.Text.Equals("UnFriend"))
            {
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter adp = new SqlDataAdapter();
                string conCmd;
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                con.ConnectionString = conString;
                conCmd = "sp_RemoveFriend";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.CommandText = conCmd;
                cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@friendId",Request.QueryString["profileid"]);
                con.Open();
                int result=cmd.ExecuteNonQuery();
                con.Close();
                if(result>0)
                Bind();
            }
        }


        protected void btnPostAboutMe_ServerClick(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_UpdateAboutMe";
            con.ConnectionString = conString;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
            txtAboutMe.Text = txtAboutMe.Text.Replace("\r\n", "<br/>");
            cmd.Parameters.AddWithValue("@ContentAboutMe", txtAboutMe.Text);
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ds = new DataSet();
            cmd = new SqlCommand();
            adp = new SqlDataAdapter();
            conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            conCmd = "sp_GetProfileUserName";
            con.ConnectionString = conString;
            cmd.Parameters.AddWithValue("@email", Session["UserName"].ToString());
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            string Name = string.Format(ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString());
            lblName.Text = Name;
            lblAboutMe.Text = ds.Tables[0].Rows[0]["AboutMe"].ToString();
            txtAboutMe.Text = lblAboutMe.Text;
            txtAboutMe.Text = txtAboutMe.Text.Replace("<br/>", "\r\n");
            rptrRecentUpdates.DataSource = ds;
            rptrRecentUpdates.DataBind();
        }
    }
}