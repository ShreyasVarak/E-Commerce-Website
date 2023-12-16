using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtsignup_Click(object sender, EventArgs e)
    {
        if (isformvalid())
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblUse(Name,Username,Password,Mobileno,Email,Usertype) Values('" + txtName.Text + "','" + txtUname.Text + "','" + txtPass.Text +
                    "','" + txtMobno.Text + "','" + txtEmail.Text + "','User')", con);

                cmd.ExecuteNonQuery(); // used when inserting a record

                Response.Write("<script> alert('Registration done Sucessfully'); </script>");
                clr();
                con.Close();
                lblMsg.Text = "Registration done Sucessfully";
                lblMsg.ForeColor = System.Drawing.Color.Green;

            }
            Response.Redirect("~/SignIn.aspx");
        }
        else
        {
            Response.Write("<script> alert('Registration Failed'); </script>");
            lblMsg.Text = "All fields are mandatory";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    private bool isformvalid()
    {
        if (txtName.Text == "")
        {
            Response.Write("<script> alert('Invalid Name'); </script>");
            txtName.Focus();
            return false;

        }
        else if (txtUname.Text == "")
        {
            Response.Write("<script> alert('Invalid Username'); </script>");
            txtUname.Focus();
            return false;
        }
        else if (txtPass.Text == "")
        {
            Response.Write("<script> alert('Invalid Password'); </script>");
            txtPass.Focus();
            return false;
        }
        else if (txtPass.Text != txtConPass.Text)
        {
            Response.Write("<script> alert('Password'); </script>");
            txtConPass.Focus();
            return false;
        }
        else if (txtMobno.Text == "")
        {
            Response.Write("<script> alert('Invalid Mobile no'); </script>");
            txtMobno.Focus();
            return false;
        }
        else if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('Invalid Email'); </script>");
            txtEmail.Focus();
            return false;
        }
        return true;
    }
    private void clr()
    {
        txtName.Text = string.Empty;
        txtUname.Text = string.Empty;
        txtPass.Text = string.Empty;
        txtConPass.Text = string.Empty;
        txtMobno.Text = string.Empty;
        txtEmail.Text = string.Empty;
    }

}