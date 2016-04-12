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
    public partial class Events : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bind();
            }
            
        }

        private void bind()
        {
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "Select * from events order by id desc";
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.Text;
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            //DataSet dsOdd = ds.Clone();
            //DataSet dsEven = ds.Clone();
            //for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
            //{
            //    if (i % 2 != 0)
            //    {
            //        dsOdd.Tables[0].ImportRow(ds.Tables[0].Rows[i]);
            //    }
            //    else
            //    {
            //        dsEven.Tables[0].ImportRow(ds.Tables[0].Rows[i]);
            //    }
            //}
            rptrEventsOdd.DataSource = ds;
            rptrEventsOdd.DataBind();
            //rptrEventsEven.DataSource = dsEven;
            //rptrEventsEven.DataBind();
        }
    }
}