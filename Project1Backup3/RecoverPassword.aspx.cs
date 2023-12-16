using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class RecoverPassword : System.Web.UI.Page
{
    String GUIDvalue;
    DataTable dt = new DataTable();
    int Uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
        {
            GUIDvalue = Request.QueryString["id"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("select * from ForgetPass where Id=@Id", con);
                con.Open();
                cmd.Parameters.AddWithValue("@Id", GUIDvalue);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    lblMsg.Text = "Your Password Reset link is expired or invalid!...try again";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        if (IsPostBack)
        {
            if (dt.Rows.Count != 0)
            {
                txtConfirmPass.Visible = true;
                txtNewPass.Visible = true;
                lblNewPassword.Visible = true;
                lblNewPassword.Visible = true;
                btnResetPass.Visible = true;
            }
            else
            {
                lblMsg.Text = "Your Password Reset link is expired or invalid!...try again";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {

        if (txtNewPass.Text != "" && txtConfirmPass.Text != "" && txtNewPass.Text == txtConfirmPass.Text)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("Update tblUse set Password=@p where Uid=@uid", con);
                cmd.Parameters.AddWithValue("@p", txtNewPass.Text);
                cmd.Parameters.AddWithValue("@Uid", Uid);
                cmd.ExecuteNonQuery();


                SqlCommand cmd2 = new SqlCommand("delete from ForgetPass where Uid='" + Uid + "'", con);
                cmd2.ExecuteNonQuery();
                Response.Write("<script> alert('Password Reset Succesfully done'); </script>");
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}