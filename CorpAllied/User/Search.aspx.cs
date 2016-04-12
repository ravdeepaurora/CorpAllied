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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            if (!Page.IsPostBack)
            {
                try
                {
                    string srchString = Request.QueryString["s"].ToString();
                    DataSet ds = new DataSet();
                    string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                    con.ConnectionString = conString;
                    SqlDataAdapter adp = new SqlDataAdapter();
                    SqlCommand cmd = new SqlCommand();
                    string conCMD = "sp_SearchUser";
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = conCMD;
                    cmd.Parameters.AddWithValue("@SearchStr", srchString);
                    adp.SelectCommand = cmd;
                    adp.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        rptrSearch.DataSource = ds;
                        rptrSearch.DataBind();
                    }
                    else
                        lblNoMatchFound.Visible = true;
                }
                catch (Exception ex)
                {
                    Response.Redirect("../Login.aspx");
                }
            }
        }
    }
}