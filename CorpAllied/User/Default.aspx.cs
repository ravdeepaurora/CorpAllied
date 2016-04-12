using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorpAllied.User
{
    public partial class Default : System.Web.UI.Page
    {
        static int i; static int k;
   SqlConnection con = new SqlConnection();
   SqlDataAdapter adp = new SqlDataAdapter();
   SqlCommand cmd = new SqlCommand();
   DataSet ds = new DataSet();
   string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
   string conCmd; int num = 0;
   protected void Page_Load(object sender, EventArgs e)
   {
       if (!Page.IsPostBack)
       {
           try
           {
               string Email = Session["Username"].ToString();
           }
           catch (Exception ex)
           {
               Response.Redirect("../Login.aspx");
           }
           num = 2;
           //store this num value in ViewState so that we can get this value on Load more data button click 
           ViewState["num"] = num;
           bind(num);
           latestevents();
           latestblogs();
           
       }
   }

   private void latestblogs()
   {
       adp = new SqlDataAdapter();
       cmd = new SqlCommand();
       ds = new DataSet();
       conCmd = "sp_LatestBlogs";
       con.ConnectionString = conString;
       cmd.CommandText = conCmd;
       cmd.CommandType = CommandType.StoredProcedure;
       cmd.Connection = con;
       adp.SelectCommand = cmd;
       adp.Fill(ds);
       rptrLatestBlog.DataSource = ds;
       rptrLatestBlog.DataBind();
   }

   private void latestevents()
   {
       adp = new SqlDataAdapter();
       cmd = new SqlCommand();
       ds = new DataSet();
       conCmd = "sp_LatestEvent";
       con.ConnectionString = conString;
       cmd.CommandText = conCmd;
       cmd.CommandType = CommandType.StoredProcedure;
       cmd.Connection = con;
       adp.SelectCommand = cmd;
       adp.Fill(ds);
       rptrLatestEvent.DataSource = ds;
       rptrLatestEvent.DataBind();
   }

   private void bind(int numOfRows)
   {
       adp = new SqlDataAdapter();
       cmd = new SqlCommand();
       ds = new DataSet();
       conCmd = "sp_FetchUserStatus";
       con.ConnectionString = conString;
       cmd.CommandText = conCmd;
       cmd.CommandType = CommandType.StoredProcedure;
       cmd.Parameters.AddWithValue("@topVal", numOfRows);
       cmd.Parameters.AddWithValue("@userEmail", Session["Username"].ToString());
       cmd.Connection = con;
       adp.SelectCommand = cmd;
       try
       {
           int rCount = rowCount();
           if (numOfRows > rCount)
           {
               btnLoadMore.Visible = false;
           }
           adp.Fill(ds);

           if (ds.Tables[0].Rows.Count > 0)
           {
               rptrStatus.DataSource = ds;
               rptrStatus.DataBind();
           }
           else
           {
               rptrStatus.DataSource = null;
               rptrStatus.DataBind();
           }
       }
       catch (Exception ex)
       {
           ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! Error occured: " + ex.Message.ToString() + "');", true);
       }
       con.Close();
       cmd.Dispose();
       adp = null;
       ds.Clear();
       ds.Dispose();
       int i=0,j=0;
       adp = new SqlDataAdapter();
       cmd = new SqlCommand();
       ds = new DataSet();
       conCmd = "sp_FetchUserLikes";
       con.ConnectionString = conString;
       cmd.CommandText = conCmd;
       cmd.CommandType = CommandType.StoredProcedure;
       cmd.Connection = con;
       adp.SelectCommand = cmd;
       adp.Fill(ds);
       foreach (RepeaterItem item in rptrStatus.Items)
       {
           Panel plceholderbr = (Panel)item.FindControl("plceholderbr");
           Image img = (Image)item.FindControl("imgStatus");
           Label lblStatusID = (Label)item.FindControl("lblStatusID");
           Button Likes = (Button)item.FindControl("btnStatusThumbsup");
           Button DeleteStatus = (Button)item.FindControl("btnPostDel");         
           if (ds.Tables[0].Rows.Count > 0)
           {
               int count = ds.Tables[0].Rows.Count;
               for (i = 0; i < count;i++)
               {
                   if (!(ds.Tables[0].Rows[i]["Statusimage"].ToString().Equals("")) && (ds.Tables[0].Rows[i]["StatusID"].ToString().Equals(lblStatusID.Text)))
                   {
                       img.Visible = true;
                       plceholderbr.Visible = true;
                       
                       
                   }
                   if ((ds.Tables[0].Rows[i]["StatusPostUEmail"].ToString().Equals(Session["Username"].ToString()))&&(ds.Tables[0].Rows[i]["StatusID"].ToString().Equals(lblStatusID.Text)))
                   {
                       DeleteStatus.Visible = true;
                   }
                   if ((ds.Tables[0].Rows[i]["LikerEmail"].ToString().Equals(Session["Username"].ToString())) && (ds.Tables[0].Rows[i]["liked"].ToString().Equals("1")) && (ds.Tables[0].Rows[i]["StatusID"].ToString().Equals(lblStatusID.Text)))
                   {
                       Likes.BackColor = System.Drawing.ColorTranslator.FromHtml("#3b5999");
                       Likes.ForeColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
                   }
                   //else
                   //{
                   //    Likes.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
                   //    Likes.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                   //}
               }
           }
       }
       foreach (RepeaterItem item in rptrStatus.Items)
       {
           Repeater rptr = item.FindControl("rptrComments") as Repeater;
           Panel pnlComments = item.FindControl("pnlComments") as Panel;
           Label lbl = (Label)item.FindControl("lblStatusID");
           CommentRptrBind(rptr, lbl, pnlComments);
       }
    }

   private int rowCount()
   {
      int NoOfRows = 0;
        SqlCommand cmd = new SqlCommand("sp_StatusRowCount", con);
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            con.Open();
            NoOfRows = Convert.ToInt32(cmd.ExecuteScalar());
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! Error occured: " + ex.Message.ToString() + "');", true);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return NoOfRows;
    }

    protected void btnLoadMore_Click(object sender, EventArgs e)
    {
        //On every click of this button it will add 2 to the ViewState["num"] whose value was set to 2 initially on page load. So numval is 4 now.
        int numVal = Convert.ToInt32(ViewState["num"]) + 2;
        //Now pass numVal whose value is 4 to the BindRepeater function to get 4 rows.
        bind(numVal);
        //Set ViewState["num"] is equal to the numVal i.e. 4 so that when we again click this button it will be 4 + 2= 6 and so on.
        ViewState["num"] = numVal;
    }

        //[System.Web.Services.WebMethod]
        //public static bool SetLikes(string name)
        //{
        //    if (i == 0)
        //    {
        //        i = 1;
        //        return true;
        //    }
        //    else
        //    {
        //        i = 0;
        //        return false;
        //    }
        //}
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static bool LogOut(string name)
        {
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Clear();
            return true;
        }

        protected void btnPost_Click(object sender, EventArgs e)
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
            txtStatus.Text=txtStatus.Text.Replace("\r\n", "<br/>");
            cmd.Parameters.AddWithValue("@status", txtStatus.Text);
            if (fileupldStatus.PostedFile.ContentLength > 0)
            {
                int length = fileupldStatus.PostedFile.ContentLength;
                //create a byte array to store the binary image data  
                byte[] imgbyte = new byte[length];
                //store the currently selected file in memeory  
                HttpPostedFile img = fileupldStatus.PostedFile;
                //set the binary data  
                img.InputStream.Read(imgbyte, 0, length);
                cmd.Parameters.AddWithValue("@pic", imgbyte);
            }
            con.Open();
            int result=cmd.ExecuteNonQuery();
            con.Close();
            bind(Convert.ToInt32(ViewState["num"].ToString()));
            txtStatus.Text = "";
            string message = "Posted Successfully";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("');");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(btnPost.GetType(), "alert", sb.ToString());
        }

        protected void btnThumbsup_Click(Button b,Label l)
        {
            cmd = new SqlCommand();
            adp = new SqlDataAdapter();
            ds = new DataSet();
            conCmd = "sp_StatusLikeStatus";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Useremail", Session["Username"].ToString());
            cmd.Parameters.AddWithValue("@statusid", l.Text);
            adp.SelectCommand = cmd;
            adp.Fill(ds);

            if ((b.BackColor == System.Drawing.ColorTranslator.FromHtml("#3b5999")&&(ds.Tables[0].Rows[0]["Liked"].ToString().Equals("1"))))
            {
                b.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
                b.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                cmd = new SqlCommand();
                adp = new SqlDataAdapter();
                ds = new DataSet();
                conCmd = "sp_DelikeStatus";
                con.ConnectionString = conString;
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@statusid", l.Text);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if(result>0)
                    bind(Convert.ToInt32(ViewState["num"]));
                b.Enabled = true;
            }
            else if(ds.Tables[0].Rows.Count==0)
            {
                b.BackColor = System.Drawing.ColorTranslator.FromHtml("#3b5999");
                b.ForeColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
                cmd = new SqlCommand();
                adp = new SqlDataAdapter();
                ds = new DataSet();
                conCmd = "sp_LikeStatus";
                con.ConnectionString = conString;
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@statusid", l.Text);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if(result>0)
                bind(Convert.ToInt32(ViewState["num"]));
                b.Enabled = true;
            }
        }

        protected void rptrStatus_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Button b = e.Item.FindControl("btnStatusThumbsup") as Button;
                b.Enabled = false;
                Label l = e.Item.FindControl("lblStatusID") as Label;
                btnThumbsup_Click(b, l);
            }
            else if (e.CommandName == "Delete")
            {
                Button b = e.Item.FindControl("btnPostDel") as Button;
                Label l = e.Item.FindControl("lblStatusID") as Label;
                Panel pnl=e.Item. FindControl("pnlAfterDel") as Panel;
                Button DelYes = e.Item.FindControl("btnYes") as Button;
                Button DelNo = e.Item.FindControl("btnNo") as Button;
                b.Visible = false;
                pnl.Visible = true;
            }
            else if (e.CommandName == "ConfirmDelete")
            {
                Button b = e.Item.FindControl("btnYes") as Button;
                Label l = e.Item.FindControl("lblStatusID") as Label;
                btnPostDel(b, l);
            }
            else if (e.CommandName == "ConfirmCancel")
            {
                Panel pnl = e.Item.FindControl("pnlAfterDel") as Panel;
                pnl.Visible = false;
                Button b = e.Item.FindControl("btnPostDel") as Button;
                b.Visible = true;
            }
            else if (e.CommandName == "InsertComment")
            {
                Label lblStatusID = e.Item.FindControl("lblStatusID") as Label;
                LinkButton lnkComment = e.Item.FindControl("btnComment") as LinkButton;
                Repeater rptrComments = e.Item.FindControl("rptrComments") as Repeater;
                TextBox txtComment = e.Item.FindControl("txtComment") as TextBox;
                Panel pnl = e.Item.FindControl("pnlComments") as Panel;
                btnComments_ServerClick(lblStatusID, rptrComments,txtComment,pnl);
                txtComment.Text = "";
                lnkComment.Enabled = true;
            }
        }

        protected void btnPostDel(Button b,Label l)
        {
                adp = new SqlDataAdapter();
                cmd = new SqlCommand();
                ds = new DataSet();
                conCmd = "sp_DelUserStatus";
                con.ConnectionString = conString;
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatusID", l.Text);
                cmd.Connection = con;
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    bind(Convert.ToInt32(ViewState["num"]));
                }
        }

        protected void btnComments_ServerClick(Label l, Repeater rptr,TextBox txt,Panel pnl)
        {
            adp = new SqlDataAdapter();
            cmd = new SqlCommand();
            ds = new DataSet();
            conCmd = "sp_InsertStatusComments";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StatusID", l.Text);
            cmd.Parameters.AddWithValue("@UserEmail", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@Comment", txt.Text);
            cmd.Connection = con;
            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result > 0)
                CommentRptrBind(rptr,l,pnl);
        }

        private void CommentRptrBind(Repeater rptr,Label l, Panel pnl)
        {
            adp = new SqlDataAdapter();
            cmd = new SqlCommand();
            ds = new DataSet();
            conCmd = "sp_FetchStatusComments";
            cmd.Parameters.AddWithValue("@StatusID", l.Text);
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptr.DataSource = ds;
                pnl.Visible = true;
                rptr.DataBind();
                adp = new SqlDataAdapter();
                cmd = new SqlCommand();
                ds = new DataSet();
                conCmd = "sp_CommentUserCheck";
                cmd.Parameters.AddWithValue("@StatusID", l.Text);
                con.ConnectionString = conString;
                cmd.CommandText = conCmd;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                foreach (RepeaterItem items in rptr.Items)
                {
                    Button btnPostDelComment = items.FindControl("btnPostDelComment") as Button;
                    HiddenField hdnfldCommentID = items.FindControl("hdnfldCommentID") as HiddenField;
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int jk = 0; jk < ds.Tables[0].Rows.Count; jk++)
                        {
                            if (ds.Tables[0].Rows[jk]["CommentID"].ToString().Equals(hdnfldCommentID.Value))
                            {
                                if ((ds.Tables[0].Rows[jk]["StatusPostEmail"].ToString().Equals(Session["Username"].ToString()))) 
                                {
                                    btnPostDelComment.Visible = true;
                                }
                                if (ds.Tables[0].Rows[jk]["CommentingEmail"].ToString().Equals(Session["Username"].ToString()))
                                {
                                btnPostDelComment.Visible = true;
                                }
                            }
                        }
                    }
                }
            }
            else
                pnl.Visible = false;
            
        }
        protected void rptrComments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Button btnDel = e.Item.FindControl("btnPostDelComment") as Button;
            Panel pnlDelComments = e.Item.FindControl("pnlAfterDelComment") as Panel;
            Button btnYesDelComment = e.Item.FindControl("btnYesCommentDel") as Button;
            Button btnCancelDelComment = e.Item.FindControl("btnNoComment") as Button;
            HiddenField hdnfldCommentID = e.Item.FindControl("hdnfldCommentID") as HiddenField;
            if (e.CommandName == "DeleteComment")
            {
                btnDel.Visible = false;
                pnlDelComments.Visible = true;
            }
            if (e.CommandName == "ConfirmCancelComment")
            {
                btnDel.Visible = true;
                pnlDelComments.Visible = false;
            }
            if (e.CommandName == "ConfirmDeleteComment")
            {
                DeleteComment(hdnfldCommentID);
                
            }
        }

        private void DeleteComment(HiddenField hdnfld)
        {
            adp = new SqlDataAdapter();
            cmd = new SqlCommand();
            ds = new DataSet();
            conCmd = "sp_DelUserStatusComment";
            con.ConnectionString = conString;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CommentID", hdnfld.Value);
            cmd.Connection = con;
            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if(result>0)
           bind(Convert.ToInt32(ViewState["num"]));
        }
       }
    }
