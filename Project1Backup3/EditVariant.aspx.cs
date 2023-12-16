﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class EditVariant : System.Web.UI.Page
{
    string BrandID = "";
    string VarientName = "";
    string MainCID = "";
    string SubCID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }
    }
    protected void txtID_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString);
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select VarientName,BrandID,CategoryID,SubCategoryID from tblVarient where VarientID=@ID", con);
        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(txtID.Text));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(ds, "dt");
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            BrandID = ds.Tables[0].Rows[0]["BrandID"].ToString();
            BindBrand();
            ddlBrand.SelectedValue = BrandID;

            VarientName = ds.Tables[0].Rows[0]["VarientName"].ToString();
            txtVarient.Text = VarientName;
            MainCID = ds.Tables[0].Rows[0]["CategoryID"].ToString();
            BindMainCategory();
            ddlCategory.SelectedValue = MainCID;

            SubCID = ds.Tables[0].Rows[0]["SubCategoryID"].ToString();
            subcategory();
            ddlSubCategory.SelectedValue = SubCID;
        }
        else
        {

        }
        con.Close();
    }

    private void BindGridview()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString);
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlDataAdapter da = new SqlDataAdapter("select t1.VarientID,t1.VarientName,t2.Name as Brand,t3.CatName as Category,t4.SubCatName as SubCategory from tblVarient as t1 with(nolock) inner join tblBrands as t2 with(nolock) on t2.BrandID=t1.BrandID inner join tblCategory as t3 with(nolock) on t3.CatID=t1.CategoryID inner join tblSubCategory as t4 with(nolock) on t4.SubCatID=t1.SubCategoryID", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }

    protected void btnUpdateSubCategory_Click(object sender, EventArgs e)
    {
        if (txtID.Text != string.Empty && txtVarient.Text != string.Empty && ddlCategory.SelectedIndex != -1)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("update tblVarient set VarientName=@VarientName,BrandID=@BrandID,CategoryID=@CategoryID,SubCategoryID=@SubCategoryID where VarientID=@VarientID", con);
            cmd.Parameters.AddWithValue("@VarientID", Convert.ToInt32(txtID.Text));
            cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCategoryID", ddlSubCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@BrandID", ddlBrand.SelectedValue);
            cmd.Parameters.AddWithValue("@VarientName", txtVarient.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Update successfully')</script>");
            BindGridview();
            txtID.Text = string.Empty;
            ddlBrand.SelectedIndex = -1;
            ddlCategory.SelectedIndex = -1;
            ddlSubCategory.SelectedIndex = -1;
            txtVarient.Text = string.Empty;

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

    private void BindMainCategory()
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


    private void subcategory()
    {
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedValue + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedValue + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }
}