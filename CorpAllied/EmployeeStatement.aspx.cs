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
    public partial class EmployeeStatement : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    btnUpdate.Visible = false;
                    btnsubmit.Visible = true;
                }
                else
                {
                    btnUpdate.Visible = true;
                    btnsubmit.Visible = false;
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter adp = new SqlDataAdapter();
                    string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                    string conCmd = "sp_FetchEmployee";
                    con.ConnectionString = conString;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = conCmd;
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                    adp.SelectCommand = cmd;
                    adp.Fill(ds);
                    int i=0;
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        chckbxContractoremployee.Items.FindByValue(ds.Tables[0].Rows[0][i++].ToString()).Selected=true;
                        txtIncidentNo.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtProperty.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtLocation.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtName.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtAddress.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtHomePhone.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtEmail.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtCellular.Text = ds.Tables[0].Rows[0][i++].ToString();
                        chckbxText.Items.FindByValue(ds.Tables[0].Rows[0][i++].ToString()).Selected = true;
                        txtSupervisorName.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtDepartment.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtSchedule.Text = ds.Tables[0].Rows[0][i++].ToString();
                        foreach (ListItem items in chckbxdaysoff.Items)
                        {
                            if (ds.Tables[0].Rows[0][i++].ToString().Equals("1"))
                            {
                                items.Selected = true;
                            }
                            else
                                items.Selected = false;
                        }
                        txtNarrative.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtWPrintedName.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtWSign.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtDate.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtOPrintedName.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtOSign.Text = ds.Tables[0].Rows[0][i++].ToString();
                        txtTime.Text = ds.Tables[0].Rows[0][i++].ToString();
                    }
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_InsertEmployee";
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@Emptype", chckbxContractoremployee.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Incidentno", txtIncidentNo.Text);
            cmd.Parameters.AddWithValue("@property", txtProperty.Text);
            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@homephone", txtHomePhone.Text);
            if (txtEmail.Text == null)
                txtEmail.Text = "Empty";
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Cellular", txtCellular.Text);
            cmd.Parameters.AddWithValue("@Text", chckbxText.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@SVName", txtSupervisorName.Text);
            cmd.Parameters.AddWithValue("@Dept", txtDepartment.Text);
            cmd.Parameters.AddWithValue("@Schedule", txtSchedule.Text);
            int i = 1; string itemstr;
            foreach (ListItem items in chckbxdaysoff.Items)
            {
                itemstr = string.Format("@item{0}", i);
                if (items.Selected == true)
                {
                    cmd.Parameters.AddWithValue(itemstr, "1");
                }
                else
                {
                    cmd.Parameters.AddWithValue(itemstr, "0");
                }
                i++;
            }
            

            cmd.Parameters.AddWithValue("@narrative", txtNarrative.Text);
            cmd.Parameters.AddWithValue("@wname", txtWPrintedName.Text);
            cmd.Parameters.AddWithValue("@wsign", txtWSign.Text);
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@oname", txtOPrintedName.Text);
            cmd.Parameters.AddWithValue("@osign", txtOSign.Text);
            cmd.Parameters.AddWithValue("@time", txtTime.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            string conCmd = "sp_UpdateEmployee";
            con.ConnectionString = conString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = conCmd;
            cmd.Parameters.AddWithValue("@Emptype", chckbxContractoremployee.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Incidentno", txtIncidentNo.Text);
            cmd.Parameters.AddWithValue("@property", txtProperty.Text);
            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@homephone", txtHomePhone.Text);
            if (txtEmail.Text == null)
                txtEmail.Text = "Empty";
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Cellular", txtCellular.Text);
            cmd.Parameters.AddWithValue("@Text", chckbxText.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@SVName", txtSupervisorName.Text);
            cmd.Parameters.AddWithValue("@Dept", txtDepartment.Text);
            cmd.Parameters.AddWithValue("@Schedule", txtSchedule.Text);
            int i = 1; string itemstr;
            foreach (ListItem items in chckbxdaysoff.Items)
            {
                itemstr = string.Format("@item{0}", i);
                if (items.Selected == true)
                {
                    cmd.Parameters.AddWithValue(itemstr, "1");
                }
                else
                {
                    cmd.Parameters.AddWithValue(itemstr, "0");
                }
                i++;
            }


            cmd.Parameters.AddWithValue("@narrative", txtNarrative.Text);
            cmd.Parameters.AddWithValue("@wname", txtWPrintedName.Text);
            cmd.Parameters.AddWithValue("@wsign", txtWSign.Text);
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@oname", txtOPrintedName.Text);
            cmd.Parameters.AddWithValue("@osign", txtOSign.Text);
            cmd.Parameters.AddWithValue("@time", txtTime.Text);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}