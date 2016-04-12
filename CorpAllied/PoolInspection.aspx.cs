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
    public partial class PoolInspection : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        static int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    i = 1;
                    btnSubmit.Visible = false;
                    btnUpdate.Visible = true;
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    SqlDataAdapter adp = new SqlDataAdapter();
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand();
                    string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                    con.ConnectionString = conString;
                    string conCmd = "sp_FetchPool";
                    cmd.Connection = con;
                    cmd.CommandText = conCmd;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    adp.SelectCommand = cmd;
                    adp.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string[] parameter = new string[36];
                        txtDate.Text = ds.Tables[0].Rows[0]["date"].ToString();
                        txtInspectedBy.Text = ds.Tables[0].Rows[0]["inspectedby"].ToString();
                        txtPool.Text = ds.Tables[0].Rows[0]["pool"].ToString();
                        foreach (ListItem items in chckbxYesNo1.Items)
                        {

                            parameter[i] = string.Format("item{0}", i);
                            if (ds.Tables[0].Rows[0][parameter[i]].ToString() == "1")
                            {
                                chckbxYesNo1.Items.FindByValue(i.ToString()).Selected = true;
                            }
                            i++;
                        }
                        foreach (ListItem items in chckbxYesNo2.Items)
                        {
                            parameter[i] = string.Format("item{0}", i);
                            if (ds.Tables[0].Rows[0][parameter[i]].ToString() == "1")
                            {
                                chckbxYesNo2.Items.FindByValue(i.ToString()).Selected = true;
                            }
                            i++;
                        }
                    }
                }


            }
        }
        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            i = 1;
            SqlDataAdapter adp = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString;
            string conCmd = "sp_InsertPool";
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@inspectedby", txtInspectedBy.Text);
            cmd.Parameters.AddWithValue("@pool", txtPool.Text);
            bool[] checkd = new bool[100];
            foreach (ListItem items in chckbxYesNo1.Items)
            {

                if (items.Selected == true)
                {
                    checkd[i] = true;
                }
                else
                    checkd[i] = false;
                i++;
            }
            foreach (ListItem items in chckbxYesNo2.Items)
            {

                if (items.Selected == true)
                {
                    checkd[i] = true;
                }
                else
                    checkd[i] = false;
                i++;
            }
            string[] parameter = new string[i];
            for (int j = 1; j < i; j++)
            {
                parameter[j] = string.Format("@item{0}", j);
                cmd.Parameters.AddWithValue(parameter[j], checkd[j]);
            }
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            i = 1;
            SqlDataAdapter adp = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString;
            string conCmd = "sp_UpdatePool";
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@inspectedby", txtInspectedBy.Text);
            cmd.Parameters.AddWithValue("@pool", txtPool.Text);
            bool[] checkd = new bool[100];
            foreach (ListItem items in chckbxYesNo1.Items)
            {

                if (items.Selected == true)
                {
                    checkd[i] = true;
                }
                else
                    checkd[i] = false;
                i++;
            }
            foreach (ListItem items in chckbxYesNo2.Items)
            {

                if (items.Selected == true)
                {
                    checkd[i] = true;
                }
                else
                    checkd[i] = false;
                i++;
            }
            string[] parameter = new string[i];
            for (int j = 1; j < i; j++)
            {
                parameter[j] = string.Format("@item{0}", j);
                cmd.Parameters.AddWithValue(parameter[j], checkd[j]);
            }
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void btnSubmit_UpdateClick(object sender, EventArgs e)
        {
            i = 1;
            SqlDataAdapter adp = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString;
            string conCmd = "sp_UpdatePool";
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@inspectedby", txtInspectedBy.Text);
            cmd.Parameters.AddWithValue("@pool", txtPool.Text);
            bool[] checkd = new bool[100];
            foreach (ListItem items in chckbxYesNo1.Items)
            {

                if (items.Selected == true)
                {
                    checkd[i] = true;
                }
                else
                    checkd[i] = false;
                i++;
            }
            foreach (ListItem items in chckbxYesNo2.Items)
            {

                if (items.Selected == true)
                {
                    checkd[i] = true;
                }
                else
                    checkd[i] = false;
                i++;
            }
            string[] parameter = new string[i];
            for (int j = 1; j < i; j++)
            {
                parameter[j] = string.Format("@item{0}", j);
                cmd.Parameters.AddWithValue(parameter[j], checkd[j]);
            }
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}