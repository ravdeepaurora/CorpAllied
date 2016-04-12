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
    public partial class BuildingInspection : System.Web.UI.Page
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
                    string conCmd = "sp_FetchBuilding";
                    cmd.Connection = con;
                    cmd.CommandText = conCmd;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    adp.SelectCommand = cmd;
                    adp.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string[] parameter=new string[36];
                        txtDate.Text = ds.Tables[0].Rows[0]["date"].ToString();
                        txtBuildingNumber.Text = ds.Tables[0].Rows[0]["buildingno"].ToString();
                        txtInspectedBy.Text=ds.Tables[0].Rows[0]["inspectedby"].ToString();
                        txtWorkOrder.Text = ds.Tables[0].Rows[0]["workorder"].ToString();
                        txtTextArea.Text = ds.Tables[0].Rows[0]["TextArea"].ToString();
                        if (!ds.Tables[0].Rows[0]["item1"].ToString().Equals(""))
                        RadioButtonList0.Items.FindByValue(ds.Tables[0].Rows[0]["item1"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item2"].ToString().Equals(""))
                        RadioButtonList1.Items.FindByValue(ds.Tables[0].Rows[0]["item2"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item3"].ToString().Equals(""))
                        RadioButtonList2.Items.FindByValue(ds.Tables[0].Rows[0]["item3"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item4"].ToString().Equals(""))
                        RadioButtonList3.Items.FindByValue(ds.Tables[0].Rows[0]["item4"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item5"].ToString().Equals(""))
                        RadioButtonList4.Items.FindByValue(ds.Tables[0].Rows[0]["item5"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item6"].ToString().Equals(""))
                        RadioButtonList5.Items.FindByValue(ds.Tables[0].Rows[0]["item6"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item7"].ToString().Equals(""))
                        RadioButtonList6.Items.FindByValue(ds.Tables[0].Rows[0]["item7"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item8"].ToString().Equals(""))
                        RadioButtonList7.Items.FindByValue(ds.Tables[0].Rows[0]["item8"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item9"].ToString().Equals(""))
                        RadioButtonList8.Items.FindByValue(ds.Tables[0].Rows[0]["item9"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item10"].ToString().Equals(""))
                        RadioButtonList9.Items.FindByValue(ds.Tables[0].Rows[0]["item10"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item11"].ToString().Equals(""))
                        RadioButtonList10.Items.FindByValue(ds.Tables[0].Rows[0]["item11"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item12"].ToString().Equals(""))
                        RadioButtonList11.Items.FindByValue(ds.Tables[0].Rows[0]["item12"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item13"].ToString().Equals(""))
                        RadioButtonList12.Items.FindByValue(ds.Tables[0].Rows[0]["item13"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item14"].ToString().Equals(""))
                        RadioButtonList13.Items.FindByValue(ds.Tables[0].Rows[0]["item14"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item15"].ToString().Equals(""))
                        RadioButtonList14.Items.FindByValue(ds.Tables[0].Rows[0]["item15"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item16"].ToString().Equals(""))
                        RadioButtonList15.Items.FindByValue(ds.Tables[0].Rows[0]["item16"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item17"].ToString().Equals(""))
                        RadioButtonList16.Items.FindByValue(ds.Tables[0].Rows[0]["item17"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item18"].ToString().Equals(""))
                        RadioButtonList17.Items.FindByValue(ds.Tables[0].Rows[0]["item18"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item19"].ToString().Equals(""))
                        RadioButtonList18.Items.FindByValue(ds.Tables[0].Rows[0]["item19"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item20"].ToString().Equals(""))
                        RadioButtonList19.Items.FindByValue(ds.Tables[0].Rows[0]["item20"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item21"].ToString().Equals(""))
                        RadioButtonList20.Items.FindByValue(ds.Tables[0].Rows[0]["item21"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item22"].ToString().Equals(""))
                        RadioButtonList21.Items.FindByValue(ds.Tables[0].Rows[0]["item22"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item23"].ToString().Equals(""))
                        RadioButtonList22.Items.FindByValue(ds.Tables[0].Rows[0]["item23"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item24"].ToString().Equals(""))
                        RadioButtonList23.Items.FindByValue(ds.Tables[0].Rows[0]["item24"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item25"].ToString().Equals(""))
                        RadioButtonList24.Items.FindByValue(ds.Tables[0].Rows[0]["item25"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item26"].ToString().Equals(""))
                        RadioButtonList25.Items.FindByValue(ds.Tables[0].Rows[0]["item26"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item27"].ToString().Equals(""))
                        RadioButtonList26.Items.FindByValue(ds.Tables[0].Rows[0]["item27"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item28"].ToString().Equals(""))
                        RadioButtonList27.Items.FindByValue(ds.Tables[0].Rows[0]["item28"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item29"].ToString().Equals(""))
                        RadioButtonList28.Items.FindByValue(ds.Tables[0].Rows[0]["item29"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item30"].ToString().Equals(""))
                        RadioButtonList29.Items.FindByValue(ds.Tables[0].Rows[0]["item30"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item31"].ToString().Equals(""))
                        RadioButtonList30.Items.FindByValue(ds.Tables[0].Rows[0]["item31"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item32"].ToString().Equals(""))
                        RadioButtonList31.Items.FindByValue(ds.Tables[0].Rows[0]["item32"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item33"].ToString().Equals(""))
                        RadioButtonList32.Items.FindByValue(ds.Tables[0].Rows[0]["item33"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item34"].ToString().Equals(""))
                        RadioButtonList33.Items.FindByValue(ds.Tables[0].Rows[0]["item34"].ToString()).Selected = true;
                        if (!ds.Tables[0].Rows[0]["item35"].ToString().Equals(""))
                        RadioButtonList34.Items.FindByValue(ds.Tables[0].Rows[0]["item35"].ToString()).Selected = true;
                        TextBox0.Text = ds.Tables[0].Rows[0]["item1txt"].ToString();
                        TextBox1.Text = ds.Tables[0].Rows[0]["item2txt"].ToString();
                        TextBox2.Text = ds.Tables[0].Rows[0]["item3txt"].ToString();
                        TextBox3.Text = ds.Tables[0].Rows[0]["item4txt"].ToString();
                        TextBox4.Text = ds.Tables[0].Rows[0]["item5txt"].ToString();
                        TextBox5.Text = ds.Tables[0].Rows[0]["item6txt"].ToString();
                        TextBox6.Text = ds.Tables[0].Rows[0]["item7txt"].ToString();
                        TextBox7.Text = ds.Tables[0].Rows[0]["item8txt"].ToString();
                        TextBox8.Text = ds.Tables[0].Rows[0]["item9txt"].ToString();
                        TextBox9.Text = ds.Tables[0].Rows[0]["item10txt"].ToString();
                        TextBox10.Text = ds.Tables[0].Rows[0]["item11txt"].ToString();
                        TextBox11.Text = ds.Tables[0].Rows[0]["item12txt"].ToString();
                        TextBox12.Text = ds.Tables[0].Rows[0]["item13txt"].ToString();
                        TextBox13.Text = ds.Tables[0].Rows[0]["item14txt"].ToString();
                        TextBox14.Text = ds.Tables[0].Rows[0]["item15txt"].ToString();
                        TextBox15.Text = ds.Tables[0].Rows[0]["item16txt"].ToString();
                        TextBox16.Text = ds.Tables[0].Rows[0]["item17txt"].ToString();
                        TextBox17.Text = ds.Tables[0].Rows[0]["item18txt"].ToString();
                        TextBox18.Text = ds.Tables[0].Rows[0]["item19txt"].ToString();
                        TextBox19.Text = ds.Tables[0].Rows[0]["item20txt"].ToString();
                        TextBox20.Text = ds.Tables[0].Rows[0]["item21txt"].ToString();
                        TextBox21.Text = ds.Tables[0].Rows[0]["item22txt"].ToString();
                        TextBox22.Text = ds.Tables[0].Rows[0]["item23txt"].ToString();
                        TextBox23.Text = ds.Tables[0].Rows[0]["item24txt"].ToString();
                        TextBox24.Text = ds.Tables[0].Rows[0]["item25txt"].ToString();
                        TextBox25.Text = ds.Tables[0].Rows[0]["item26txt"].ToString();
                        TextBox26.Text = ds.Tables[0].Rows[0]["item27txt"].ToString();
                        TextBox27.Text = ds.Tables[0].Rows[0]["item28txt"].ToString();
                        TextBox28.Text = ds.Tables[0].Rows[0]["item29txt"].ToString();
                        TextBox29.Text = ds.Tables[0].Rows[0]["item30txt"].ToString();
                        TextBox30.Text = ds.Tables[0].Rows[0]["item31txt"].ToString();
                        TextBox31.Text = ds.Tables[0].Rows[0]["item32txt"].ToString();
                        TextBox32.Text = ds.Tables[0].Rows[0]["item33txt"].ToString();
                        TextBox33.Text = ds.Tables[0].Rows[0]["item34txt"].ToString();
                        TextBox34.Text = ds.Tables[0].Rows[0]["item35txt"].ToString();
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
            string conCmd = "sp_InsertBuilding";
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
           
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@buildingno", txtBuildingNumber.Text);
            cmd.Parameters.AddWithValue("@inspectedby", txtInspectedBy.Text);
            cmd.Parameters.AddWithValue("@workorder", txtWorkOrder.Text);
            cmd.Parameters.AddWithValue("@textarea", txtTextArea.Text);
            cmd.Parameters.AddWithValue("@item1", RadioButtonList0.SelectedValue);
            cmd.Parameters.AddWithValue("@item2", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@item3", RadioButtonList2.SelectedValue);
            cmd.Parameters.AddWithValue("@item4", RadioButtonList3.SelectedValue);
            cmd.Parameters.AddWithValue("@item5", RadioButtonList4.SelectedValue);
            cmd.Parameters.AddWithValue("@item6", RadioButtonList5.SelectedValue);
            cmd.Parameters.AddWithValue("@item7", RadioButtonList6.SelectedValue);
            cmd.Parameters.AddWithValue("@item8", RadioButtonList7.SelectedValue);
            cmd.Parameters.AddWithValue("@item9", RadioButtonList8.SelectedValue);
            cmd.Parameters.AddWithValue("@item10", RadioButtonList9.SelectedValue);
            cmd.Parameters.AddWithValue("@item11", RadioButtonList10.SelectedValue);
            cmd.Parameters.AddWithValue("@item12", RadioButtonList11.SelectedValue);
            cmd.Parameters.AddWithValue("@item13", RadioButtonList12.SelectedValue);
            cmd.Parameters.AddWithValue("@item14", RadioButtonList13.SelectedValue);
            cmd.Parameters.AddWithValue("@item15", RadioButtonList14.SelectedValue);
            cmd.Parameters.AddWithValue("@item16", RadioButtonList15.SelectedValue);
            cmd.Parameters.AddWithValue("@item17", RadioButtonList16.SelectedValue);
            cmd.Parameters.AddWithValue("@item18", RadioButtonList17.SelectedValue);
            cmd.Parameters.AddWithValue("@item19", RadioButtonList18.SelectedValue);
            cmd.Parameters.AddWithValue("@item20", RadioButtonList19.SelectedValue);
            cmd.Parameters.AddWithValue("@item21", RadioButtonList20.SelectedValue);
            cmd.Parameters.AddWithValue("@item22", RadioButtonList21.SelectedValue);
            cmd.Parameters.AddWithValue("@item23", RadioButtonList22.SelectedValue);
            cmd.Parameters.AddWithValue("@item24", RadioButtonList23.SelectedValue);
            cmd.Parameters.AddWithValue("@item25", RadioButtonList24.SelectedValue);
            cmd.Parameters.AddWithValue("@item26", RadioButtonList25.SelectedValue);
            cmd.Parameters.AddWithValue("@item27", RadioButtonList26.SelectedValue);
            cmd.Parameters.AddWithValue("@item28", RadioButtonList27.SelectedValue);
            cmd.Parameters.AddWithValue("@item29", RadioButtonList28.SelectedValue);
            cmd.Parameters.AddWithValue("@item30", RadioButtonList29.SelectedValue);
            cmd.Parameters.AddWithValue("@item31", RadioButtonList30.SelectedValue);
            cmd.Parameters.AddWithValue("@item32", RadioButtonList31.SelectedValue);
            cmd.Parameters.AddWithValue("@item33", RadioButtonList32.SelectedValue);
            cmd.Parameters.AddWithValue("@item34", RadioButtonList33.SelectedValue);
            cmd.Parameters.AddWithValue("@item35", RadioButtonList34.SelectedValue);
            cmd.Parameters.AddWithValue("@item1txt", TextBox0.Text);
            cmd.Parameters.AddWithValue("@item2txt", TextBox1.Text);
            cmd.Parameters.AddWithValue("@item3txt", TextBox2.Text);
            cmd.Parameters.AddWithValue("@item4txt", TextBox3.Text);
            cmd.Parameters.AddWithValue("@item5txt", TextBox4.Text);
            cmd.Parameters.AddWithValue("@item6txt", TextBox5.Text);
            cmd.Parameters.AddWithValue("@item7txt", TextBox6.Text);
            cmd.Parameters.AddWithValue("@item8txt", TextBox7.Text);
            cmd.Parameters.AddWithValue("@item9txt", TextBox8.Text);
            cmd.Parameters.AddWithValue("@item10txt", TextBox9.Text);
            cmd.Parameters.AddWithValue("@item11txt", TextBox10.Text);
            cmd.Parameters.AddWithValue("@item12txt", TextBox11.Text);
            cmd.Parameters.AddWithValue("@item13txt", TextBox12.Text);
            cmd.Parameters.AddWithValue("@item14txt", TextBox13.Text);
            cmd.Parameters.AddWithValue("@item15txt", TextBox14.Text);
            cmd.Parameters.AddWithValue("@item16txt", TextBox15.Text);
            cmd.Parameters.AddWithValue("@item17txt", TextBox16.Text);
            cmd.Parameters.AddWithValue("@item18txt", TextBox17.Text);
            cmd.Parameters.AddWithValue("@item19txt", TextBox18.Text);
            cmd.Parameters.AddWithValue("@item20txt", TextBox19.Text);
            cmd.Parameters.AddWithValue("@item21txt", TextBox20.Text);
            cmd.Parameters.AddWithValue("@item22txt", TextBox21.Text);
            cmd.Parameters.AddWithValue("@item23txt", TextBox22.Text);
            cmd.Parameters.AddWithValue("@item24txt", TextBox23.Text);
            cmd.Parameters.AddWithValue("@item25txt", TextBox24.Text);
            cmd.Parameters.AddWithValue("@item26txt", TextBox25.Text);
            cmd.Parameters.AddWithValue("@item27txt", TextBox26.Text);
            cmd.Parameters.AddWithValue("@item28txt", TextBox27.Text);
            cmd.Parameters.AddWithValue("@item29txt", TextBox28.Text);
            cmd.Parameters.AddWithValue("@item30txt", TextBox29.Text);
            cmd.Parameters.AddWithValue("@item31txt", TextBox30.Text);
            cmd.Parameters.AddWithValue("@item32txt", TextBox31.Text);
            cmd.Parameters.AddWithValue("@item33txt", TextBox32.Text);
            cmd.Parameters.AddWithValue("@item34txt", TextBox33.Text);
            cmd.Parameters.AddWithValue("@item35txt", TextBox34.Text);
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
            string conCmd = "sp_UpdateBuilding";
            cmd.Connection = con;
            cmd.CommandText = conCmd;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@buildingno", txtBuildingNumber.Text);
            cmd.Parameters.AddWithValue("@inspectedby", txtInspectedBy.Text);
            cmd.Parameters.AddWithValue("@workorder", txtWorkOrder.Text);
            cmd.Parameters.AddWithValue("@textarea", txtTextArea.Text);
            cmd.Parameters.AddWithValue("@item1", RadioButtonList0.SelectedValue);
            cmd.Parameters.AddWithValue("@item2", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@item3", RadioButtonList2.SelectedValue);
            cmd.Parameters.AddWithValue("@item4", RadioButtonList3.SelectedValue);
            cmd.Parameters.AddWithValue("@item5", RadioButtonList4.SelectedValue);
            cmd.Parameters.AddWithValue("@item6", RadioButtonList5.SelectedValue);
            cmd.Parameters.AddWithValue("@item7", RadioButtonList6.SelectedValue);
            cmd.Parameters.AddWithValue("@item8", RadioButtonList7.SelectedValue);
            cmd.Parameters.AddWithValue("@item9", RadioButtonList8.SelectedValue);
            cmd.Parameters.AddWithValue("@item10", RadioButtonList9.SelectedValue);
            cmd.Parameters.AddWithValue("@item11", RadioButtonList10.SelectedValue);
            cmd.Parameters.AddWithValue("@item12", RadioButtonList11.SelectedValue);
            cmd.Parameters.AddWithValue("@item13", RadioButtonList12.SelectedValue);
            cmd.Parameters.AddWithValue("@item14", RadioButtonList13.SelectedValue);
            cmd.Parameters.AddWithValue("@item15", RadioButtonList14.SelectedValue);
            cmd.Parameters.AddWithValue("@item16", RadioButtonList15.SelectedValue);
            cmd.Parameters.AddWithValue("@item17", RadioButtonList16.SelectedValue);
            cmd.Parameters.AddWithValue("@item18", RadioButtonList17.SelectedValue);
            cmd.Parameters.AddWithValue("@item19", RadioButtonList18.SelectedValue);
            cmd.Parameters.AddWithValue("@item20", RadioButtonList19.SelectedValue);
            cmd.Parameters.AddWithValue("@item21", RadioButtonList20.SelectedValue);
            cmd.Parameters.AddWithValue("@item22", RadioButtonList21.SelectedValue);
            cmd.Parameters.AddWithValue("@item23", RadioButtonList22.SelectedValue);
            cmd.Parameters.AddWithValue("@item24", RadioButtonList23.SelectedValue);
            cmd.Parameters.AddWithValue("@item25", RadioButtonList24.SelectedValue);
            cmd.Parameters.AddWithValue("@item26", RadioButtonList25.SelectedValue);
            cmd.Parameters.AddWithValue("@item27", RadioButtonList26.SelectedValue);
            cmd.Parameters.AddWithValue("@item28", RadioButtonList27.SelectedValue);
            cmd.Parameters.AddWithValue("@item29", RadioButtonList28.SelectedValue);
            cmd.Parameters.AddWithValue("@item30", RadioButtonList29.SelectedValue);
            cmd.Parameters.AddWithValue("@item31", RadioButtonList30.SelectedValue);
            cmd.Parameters.AddWithValue("@item32", RadioButtonList31.SelectedValue);
            cmd.Parameters.AddWithValue("@item33", RadioButtonList32.SelectedValue);
            cmd.Parameters.AddWithValue("@item34", RadioButtonList33.SelectedValue);
            cmd.Parameters.AddWithValue("@item35", RadioButtonList34.SelectedValue);
            cmd.Parameters.AddWithValue("@item1txt", TextBox0.Text);
            cmd.Parameters.AddWithValue("@item2txt", TextBox1.Text);
            cmd.Parameters.AddWithValue("@item3txt", TextBox2.Text);
            cmd.Parameters.AddWithValue("@item4txt", TextBox3.Text);
            cmd.Parameters.AddWithValue("@item5txt", TextBox4.Text);
            cmd.Parameters.AddWithValue("@item6txt", TextBox5.Text);
            cmd.Parameters.AddWithValue("@item7txt", TextBox6.Text);
            cmd.Parameters.AddWithValue("@item8txt", TextBox7.Text);
            cmd.Parameters.AddWithValue("@item9txt", TextBox8.Text);
            cmd.Parameters.AddWithValue("@item10txt", TextBox9.Text);
            cmd.Parameters.AddWithValue("@item11txt", TextBox10.Text);
            cmd.Parameters.AddWithValue("@item12txt", TextBox11.Text);
            cmd.Parameters.AddWithValue("@item13txt", TextBox12.Text);
            cmd.Parameters.AddWithValue("@item14txt", TextBox13.Text);
            cmd.Parameters.AddWithValue("@item15txt", TextBox14.Text);
            cmd.Parameters.AddWithValue("@item16txt", TextBox15.Text);
            cmd.Parameters.AddWithValue("@item17txt", TextBox16.Text);
            cmd.Parameters.AddWithValue("@item18txt", TextBox17.Text);
            cmd.Parameters.AddWithValue("@item19txt", TextBox18.Text);
            cmd.Parameters.AddWithValue("@item20txt", TextBox19.Text);
            cmd.Parameters.AddWithValue("@item21txt", TextBox20.Text);
            cmd.Parameters.AddWithValue("@item22txt", TextBox21.Text);
            cmd.Parameters.AddWithValue("@item23txt", TextBox22.Text);
            cmd.Parameters.AddWithValue("@item24txt", TextBox23.Text);
            cmd.Parameters.AddWithValue("@item25txt", TextBox24.Text);
            cmd.Parameters.AddWithValue("@item26txt", TextBox25.Text);
            cmd.Parameters.AddWithValue("@item27txt", TextBox26.Text);
            cmd.Parameters.AddWithValue("@item28txt", TextBox27.Text);
            cmd.Parameters.AddWithValue("@item29txt", TextBox28.Text);
            cmd.Parameters.AddWithValue("@item30txt", TextBox29.Text);
            cmd.Parameters.AddWithValue("@item31txt", TextBox30.Text);
            cmd.Parameters.AddWithValue("@item32txt", TextBox31.Text);
            cmd.Parameters.AddWithValue("@item33txt", TextBox32.Text);
            cmd.Parameters.AddWithValue("@item34txt", TextBox33.Text);
            cmd.Parameters.AddWithValue("@item35txt", TextBox34.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}