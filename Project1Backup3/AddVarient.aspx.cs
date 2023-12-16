using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddVarient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBrand();
            BindCategory();
            BindrptrVarient();
        }
    }

    private void BindrptrVarient()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("Select A.*,B.*,C.* from tblVarient A inner join tblCategory B on B.CatID = A.CategoryID inner join tblBrands C on C.BrandID = A.BrandID  ", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrVarient.DataSource = dt;
                    rptrVarient.DataBind();
                }
            }
        }
    }

    private void BindCategory()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CatName";
                ddlCategory.DataValueField = "CatID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }
    
    private void BindBrand()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblBrands", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlBrand.DataSource = dt;
                ddlBrand.DataTextField = "Name";
                ddlBrand.DataValueField = "BrandID";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    protected void btnAddVarient_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblVarient(VarientName,BrandID,CategoryID) Values('" + txtVarient.Text + "','" + ddlBrand.SelectedItem.Value + "','" + ddlCategory.SelectedItem.Value + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Varient Added Successfully ');  </script>");
            txtVarient.Text = string.Empty;

            con.Close();
            ddlBrand.ClearSelection();
            ddlBrand.Items.FindByValue("0").Selected = true;

            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;

        }
        BindrptrVarient();
    }
}