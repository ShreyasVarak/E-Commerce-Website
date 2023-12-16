using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UNAME"] != null && Request.Cookies["UPWD"] != null)
            {
                txtUsername.Text = Request.Cookies["UNAME"].Value;
                txtPass.Text = Request.Cookies["UPWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblUse where Username=@username and Password=@pwd", con);

            cmd.Parameters.AddWithValue("@username", txtUsername.Text); // to create parameter 

            cmd.Parameters.AddWithValue("@pwd", txtPass.Text); // to create parameter 

            SqlDataAdapter sda = new SqlDataAdapter(cmd); // Creating object of SqlDataAdapter
            DataTable dt = new DataTable(); // Creating object of DataTable
            sda.Fill(dt); // using fill method() we fill data in data table
            if (dt.Rows.Count != 0)
            {
                Session["USERID"] = dt.Rows[0]["Uid"].ToString();
                Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();

                if (CheckBox1.Checked)
                {
                    Response.Cookies["UNAME"].Value = txtUsername.Text;
                    Response.Cookies["UPWD"].Value = txtPass.Text;

                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(10);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(10);
                }
                else
                {
                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                }

                string Utype;
                Utype = dt.Rows[0][6].ToString().Trim(); //Value of Utype will come from datatable

                if (Utype == "User")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("~/UserHome.aspx");

                }

                if (Utype == "Admin")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("~/AdminHome.aspx");
                }
            }
            else
            {
                lblError.Text = "Invalid Username and Password";
            }

            // Response.Write("<script> alert('Login done Sucessfully'); </script>");
            clr();
            con.Close();
            //lblMsg.Text = "Registration done Sucessfully";
            //lblMsg.ForeColor = System.Drawing.Color.Green;

        }

    }



    private void clr()
    {
        txtPass.Text = string.Empty;
        txtUsername.Text = string.Empty;
        txtUsername.Focus();
    }
}
