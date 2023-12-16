using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCategoryRepeater();
    }

    private void BindCategoryRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategory", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrCategories.DataSource = dt;
                    rptrCategories.DataBind();
                }
            }
        }
    }

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblCategory(CatName) Values('" + txtCategory.Text + "')", con);

            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Category Added Sucessfully'); </script>");
            txtCategory.Text = string.Empty;
            con.Close();
            //lblMsg.Text = "Registration done Sucessfully";
            //lblMsg.ForeColor = System.Drawing.Color.Green;
            txtCategory.Focus();
        }
    }
}