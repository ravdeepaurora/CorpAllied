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
    public partial class Inbox : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    
                    BindFriendList();
                }
                catch (Exception ex)
                {
                    Response.Redirect("../Login.aspx");
                }
            }
        }

        private void BindFriendList()
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_FriendList";
            con.ConnectionString = conString;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"]);
            cmd.CommandText = conCmd;
            cmd.Connection = con;
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            rptrFriendList.DataSource = ds;
            rptrFriendList.DataBind();
        }

        private void BindChats(string friendID)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_UserChats2";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"]);
            cmd.Parameters.AddWithValue("@FriendID", friendID);
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            rptrChats.DataSource = ds;
            rptrChats.DataBind();
        }

        protected void rptrFriendList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            FriendSelect.Visible = false;
            HiddenField hdnFriendID = e.Item.FindControl("hdnFriendID") as HiddenField;
            ViewState["FriendID"] = hdnFriendID.Value;
            btnSendMsg.Disabled = false;
            BindChats(hdnFriendID.Value);
        }

        protected void btnSendMsg_ServerClick(object sender, EventArgs e)
        {
            string message = Request.Form["txtMsgBox"];
            string FriendID = ViewState["FriendID"].ToString();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_sendMessage";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@userEmail", Session["Username"]);
            cmd.Parameters.AddWithValue("@FriendID",FriendID);
            cmd.Parameters.AddWithValue("@Message", message);
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result > 0)
            BindChats(ViewState["FriendID"].ToString());
        }
    }
}