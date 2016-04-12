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
    public partial class Friends : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    rptrFriends.Visible = true;
                    lblEmptyID.Visible = false;
                    if (Request.QueryString["showPendingRequests"] != null)
                    {
                        lblEmptyID.Visible = true;
                        rptrFriends.Visible = false;
                    }
                    else
                    {
                        bind();
                        bindFriendList();

                    }
                }
                catch (Exception ex)
                {
                    Response.Redirect("../Login.aspx");
                }
            }
        }

        private void bindFriendList()
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conCmd;
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString;
            conCmd = "sp_FriendList";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
                rptrFriendList.Visible = false;
            else
            {
                rptrFriendList.DataSource = ds;
                rptrFriendList.DataBind();
            }
        }

        private void bind()
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conCmd;
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString;
            conCmd = "sp_PendingFRequests";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@userEmail",Session["Username"].ToString());
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                rptrFriends.Visible = false;
                lblEmptyID.Visible = true;
            }
            else
            {
                rptrFriends.DataSource = ds;
                rptrFriends.DataBind();
            }
        }

        protected void btnRequestStatus_Click(string val)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conCmd;
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString;
            conCmd = "sp_AcceptFRequests";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
            cmd.Parameters.AddWithValue("@ReqID", val);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            bindFriendList();
            bind();
            
        }

        protected void rptrFriends_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AcceptRequest")
            {
                HiddenField hdnfld = e.Item.FindControl("hdnfldReqID") as HiddenField;
                btnRequestStatus_Click(hdnfld.Value);
                bind();
            }
        }

        protected void rptrFriendList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Button btnRemove = e.Item.FindControl("btnRemove") as Button;
            HiddenField hdnfld = e.Item.FindControl("hdnfldfrndID") as HiddenField;
            if (e.CommandName == "Remove")
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
                cmd.Parameters.AddWithValue("@friendId", hdnfld.Value);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            if (e.CommandName == "SendMsg")
            {
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter adp = new SqlDataAdapter();
                string conCmd;
                string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                con.ConnectionString = conString;
                conCmd = "sp_SendMsg";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.CommandText = conCmd;
                cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@friendId", hdnfld.Value);
                cmd.Parameters.AddWithValue("@Message", "HI");
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            bindFriendList();
        }

 

    }
}