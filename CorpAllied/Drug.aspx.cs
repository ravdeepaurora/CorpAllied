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
    public partial class Drug : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
            if(Request.QueryString["id"]==null)
            {
            btnUpdate.Visible=false;
            }
            else
            {
            btnSubmit.Visible=false;
             DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString; ;
            string conCmd = "sp_FetchDrugTest";
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@id",Request.QueryString["id"]);
            adp.SelectCommand=cmd;
            adp.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                txtEmployer.Text=ds.Tables[0].Rows[0][0].ToString();
                txtAddress.Text=ds.Tables[0].Rows[0][1].ToString();
                txtCity.Text=ds.Tables[0].Rows[0][2].ToString();
                txtState.Text=ds.Tables[0].Rows[0][3].ToString();
                txtZIP.Text=ds.Tables[0].Rows[0][4].ToString();
                txtDonorName.Text=ds.Tables[0].Rows[0][5].ToString();
                txtIDType.Text=ds.Tables[0].Rows[0][6].ToString();
                txtLast4SS.Text=ds.Tables[0].Rows[0][7].ToString();
                txtDonorSign.Text=ds.Tables[0].Rows[0][8].ToString();
                txtDonorsigndate.Text=ds.Tables[0].Rows[0][9].ToString();
                txtCollectorssign.Text=ds.Tables[0].Rows[0][10].ToString();
                txtCollectordate.Text=ds.Tables[0].Rows[0][11].ToString();
                if(ds.Tables[0].Rows[0][12].ToString().Equals("1"))
                chckbxOratect.Checked=true;
                else
                    chckbxOratect.Checked=false;
                if(ds.Tables[0].Rows[0][13].ToString().Equals("1"))
                    chckbxALCO.Checked=true;
                else
                    chckbxALCO.Checked=false;
                txtOratectLotNo.Text=ds.Tables[0].Rows[0][14].ToString();
                txtOExpirationDate.Text=ds.Tables[0].Rows[0][15].ToString();
                txtALCOLotNo.Text=ds.Tables[0].Rows[0][16].ToString();
                txtAExpirationDate.Text=ds.Tables[0].Rows[0][17].ToString();
                int i=1,j=18;
                foreach(ListItem items in chckbxTestResultsNeg.Items)
                {
                 if(ds.Tables[0].Rows[0][j].ToString().Equals("1"))
                    {
                    items.Selected=true;
                    }
                    j++;
                }
                foreach(ListItem items in chckbxTestResultsPos.Items)
                {
                 if(ds.Tables[0].Rows[0][j].ToString().Equals("1"))
                    {
                    items.Selected=true;
                    }
                    j++;
                }
                chckbxConfirmTest.Items.FindByValue(ds.Tables[0].Rows[0][32].ToString()).Selected=true;
            }
            }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            string conString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            con.ConnectionString = conString; ;
            string conCmd = "sp_InsertDrugTest";
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Employer", txtEmployer.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@State",txtState.Text);
            cmd.Parameters.AddWithValue("@ZIP", txtZIP.Text);
            cmd.Parameters.AddWithValue("@donorname", txtDonorName.Text);
            cmd.Parameters.AddWithValue("@Idtype", txtIDType.Text);
            cmd.Parameters.AddWithValue("@Last4SS", txtLast4SS.Text);
            cmd.Parameters.AddWithValue("@DonorSign", txtDonorSign.Text);
            cmd.Parameters.AddWithValue("@DDate", txtDonorsigndate.Text);
            cmd.Parameters.AddWithValue("@CollectorSign", txtCollectorssign.Text);
            cmd.Parameters.AddWithValue("@Cdate", txtCollectordate.Text);
            if (chckbxOratect.Checked)
                cmd.Parameters.AddWithValue("@Oratect", "1");
            else
                cmd.Parameters.AddWithValue("@Oratect", "0");
            if(chckbxALCO.Checked)
                cmd.Parameters.AddWithValue("@ALCO", "1");
            else
                cmd.Parameters.AddWithValue("@ALCO", "0");
            cmd.Parameters.AddWithValue("@OLotNo", txtOratectLotNo.Text);
            cmd.Parameters.AddWithValue("@OExpiry", txtOExpirationDate.Text);
            cmd.Parameters.AddWithValue("@ALot", txtALCOLotNo.Text);
            cmd.Parameters.AddWithValue("@AExpiry", txtAExpirationDate.Text);
            string negtest,postest;int i=1;
            foreach (ListItem items in chckbxTestResultsNeg.Items)
            {
                negtest=string.Format("@item{0}",i);
                if (items.Selected == true)
                {
                    cmd.Parameters.AddWithValue(negtest, "1");
                }
                else
                    cmd.Parameters.AddWithValue(negtest, "0");
                i++;
            }
            foreach (ListItem items in chckbxTestResultsPos.Items)
            {
                postest = string.Format("@item{0}", i);
                if (items.Selected == true)
                {
                    cmd.Parameters.AddWithValue(postest, "1");
                }
                else
                    cmd.Parameters.AddWithValue(postest, "0");
                i++;
            }
            cmd.Parameters.AddWithValue("@confirmTest", chckbxConfirmTest.SelectedItem.Value.ToString());
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
            con.ConnectionString = conString; ;
            string conCmd = "sp_UpdateDrug";
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Employer", txtEmployer.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);
            cmd.Parameters.AddWithValue("@ZIP", txtZIP.Text);
            cmd.Parameters.AddWithValue("@donorname", txtDonorName.Text);
            cmd.Parameters.AddWithValue("@Idtype", txtIDType.Text);
            cmd.Parameters.AddWithValue("@Last4SS", txtLast4SS.Text);
            cmd.Parameters.AddWithValue("@DonorSign", txtDonorSign.Text);
            cmd.Parameters.AddWithValue("@DDate", txtDonorsigndate.Text);
            cmd.Parameters.AddWithValue("@CollectorSign", txtCollectorssign.Text);
            cmd.Parameters.AddWithValue("@Cdate", txtCollectordate.Text);
            if (chckbxOratect.Checked)
                cmd.Parameters.AddWithValue("@Oratect", "1");
            else
                cmd.Parameters.AddWithValue("@Oratect", "0");
            if (chckbxALCO.Checked)
                cmd.Parameters.AddWithValue("@ALCO", "1");
            else
                cmd.Parameters.AddWithValue("@ALCO", "0");
            cmd.Parameters.AddWithValue("@OLotNo", txtOratectLotNo.Text);
            cmd.Parameters.AddWithValue("@OExpiry", txtOExpirationDate.Text);
            cmd.Parameters.AddWithValue("@ALot", txtALCOLotNo.Text);
            cmd.Parameters.AddWithValue("@AExpiry", txtAExpirationDate.Text);
            string negtest, postest; int i = 1;
            foreach (ListItem items in chckbxTestResultsNeg.Items)
            {
                negtest = string.Format("@item{0}", i);
                if (items.Selected == true)
                {
                    cmd.Parameters.AddWithValue(negtest, "1");
                }
                else
                    cmd.Parameters.AddWithValue(negtest, "0");
                i++;
            }
            foreach (ListItem items in chckbxTestResultsPos.Items)
            {
                postest = string.Format("@item{0}", i);
                if (items.Selected == true)
                {
                    cmd.Parameters.AddWithValue(postest, "1");
                }
                else
                    cmd.Parameters.AddWithValue(postest, "0");
                i++;
            }
            cmd.Parameters.AddWithValue("@confirmTest", chckbxConfirmTest.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@id",Request.QueryString["id"]);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        
    }
}