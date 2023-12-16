using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User : System.Web.UI.MasterPage
{
    public static String CS = ConfigurationManager.ConnectionStrings["EcomDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            btnlogout.Visible = true;
            btnlogin.Visible = false;
            BindCartNumber22();
            Button1.Text = "Welcome: " + Session["Username"].ToString().ToUpper();
            // lblSucess.Text = "Login Sucess, Welcome <b>" + Session["Username"].ToString() + "</b>";
        }
        else
        {
            btnlogout.Visible = false;
            btnlogin.Visible = true;
           // Response.Redirect("~/Default.aspx");
        }
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Response.Redirect("~/Default.aspx");
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }
    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }
    public void BindCartNumber22()
    {
        if (Session["USERID"] != null)
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        pCount.InnerText = CartQuantity;

                    }
                    else
                    {
                        pCount.InnerText = 0.ToString();
                    }
                }
            }
        }
    }
}
