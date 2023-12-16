using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class AddProduct : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //when page first time runs this code will execute
            BindBrand();
            BindCategory();
            //ddlCategory.Enabled = false;
            ddlSubCategory.Enabled = false;

            // BindGridview1();
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
        using (SqlConnection con = new SqlConnection(CS))
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
            cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
            cmd.Parameters.AddWithValue("@PSelPrice", txtSellPrice.Text);
            cmd.Parameters.AddWithValue("@PBrandID", ddlBrand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PSubCatID", ddlCategory.SelectedItem.Value);
    //        cmd.Parameters.AddWithValue("@PVarID", ddlVarient.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@PProductDetails", txtPDetails.Text);
            if (chFD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
            }
            if (ch30Ret.Checked == true)
            {
                cmd.Parameters.AddWithValue("@30DayRet", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@30DayRet", 0.ToString());
            }
            if (cbCOD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@COD", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@COD", 0.ToString());
            }
            con.Open();
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

            //Insert Varient quantity
           for (int i = 0; i < ddlVarient.Items.Count; i++)
            {
                if (ddlVarient.Items[i].Selected == true)
                {
                    Int64 VarientID = Convert.ToInt64(ddlVarient.Items[i].Value);
                    int Quantity = Convert.ToInt32(txtQuantity.Text);

                    SqlCommand cmd2 = new SqlCommand("insert into tblProductVarientQuantity values(PID,VarientID,Quantity) values(@PID,@VarientID,@Quantity)", con);
                    cmd2.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                    cmd2.Parameters.AddWithValue("@VarientID", Convert.ToInt32(VarientID));
                    cmd2.Parameters.AddWithValue("@Quantity", Convert.ToInt32(Quantity));
                    cmd2.ExecuteNonQuery();
                }
           }

            //Insert and Upload Images
            if (fuImg01.HasFile)
            {
                string SavePath = Server.MapPath("~/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);

                SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                cmd3.ExecuteNonQuery();
            }

            //2nd fileupload
            if (fuImg02.HasFile)
            {
                string SavePath = Server.MapPath("~/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                cmd4.ExecuteNonQuery();
            }

            //3rd fileupload
            if (fuImg03.HasFile)
            {
                string SavePath = Server.MapPath("~/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                cmd5.ExecuteNonQuery();
            }

            //4th fileupload
            if (fuImg04.HasFile)
            {
                string SavePath = Server.MapPath("~/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);

                SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
                cmd6.ExecuteNonQuery();
            }

            //5th fileupload
            if (fuImg05.HasFile)
            {
                string SavePath = Server.MapPath("~/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg05.PostedFile.FileName);
                fuImg05.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "05" + Extention);

                SqlCommand cmd7 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "05" + "','" + Extention + "')", con);
                cmd7.ExecuteNonQuery();
            }

        }
    }






    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubCategory.Enabled = true;
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
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

    protected void ddlVarient_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            if (con.State == ConnectionState.Closed) { con.Open(); }
            string qr = "Select * from tblVarient where BrandID=@BrandID AND CategoryID=@CategoryID AND SubCategoryID=@SubCategoryID ";
            // qr = "Select * from tblSizes where BrandID='" + ddlBrand.SelectedValue + "' and CategoryID='" + ddlCategory.SelectedValue + "' and SubCategoryID='" + ddlSubCategory.SelectedValue + "' and GenderID='" + ddlGender.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(qr, con);
            cmd.Parameters.AddWithValue("@BrandID", ddlBrand.SelectedValue);
            cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCategoryID", ddlSubCategory.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                ddlVarient.DataSource = dt;
                ddlVarient.DataTextField = "VarientName";
                ddlVarient.DataValueField = "VarientID";
                ddlVarient.DataBind();

            }
        }
    }

    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSubCategory.SelectedIndex != 0)
        {
            ddlVarient.Enabled = true;
        }
        else
        {
            ddlVarient.Enabled = false;
        }
    }

  //  private void BindGridView1()
   // {
     //   SqlConnection con = new SqlConnection(CS);
     //   SqlCommand cmd = new SqlCommand(" select distinct t1.PID,t1.PName,t1.PPrice,t1.PSellPrice,t2.Name as Brand,t3.CatName,t4.SubCatName, t6.VarientName,t8.Quantity from tblProducts as t1  inner join tblBrands as t2 on t2.BrandID=t1.PBrandID  inner join tblCategory as t3 on t3.CatID=t1.PCategoryID  inner join tblSubCategory as t4 on t4.SubCatID=t1.PSubCatID   inner join tblVarient as t6 on t6.CategoryID=t1.PCatID  inner join tblProductVarientQuantity as t8 on t8.PID=t1.PID order by t1.PName", con);
      //  SqlDataAdapter da = new SqlDataAdapter(cmd);
      //  DataTable dt = new DataTable();
      //  da.Fill(dt);
      //  if (dt.Rows.Count > 0)
      //  {
       //     GridView1.DataSource = dt;
       //     GridView1.DataBind();
       // }
       // else
       // {
        //    GridView1.DataSource = null;
         //   GridView1.DataBind();
       // }
    //}
}