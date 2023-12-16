<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>

       <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" >
    <meta http-equiv="content-language" content="IE-edge" >
    <link href="css/Cust.css" rel="stylesheet" />
   
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

             <div class ="navbar navbar-default navbar-fixed-top" role="navigation">
             <div class ="container">
                 <div class ="navbar-header">
                      <button type="button"class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                         <span class ="sr-only">Toggle Navigation</span>
                         <span class ="icon-bar"></span>
                         <span class ="icon-bar"></span>
                         <span class ="icon-bar"></span>
                        </button>

                      <a class="navbar-brand" href="Default.aspx"><span><img src="icon/Logo.png" alt="E-Commerce Website" height="40"  /></span>E-Commerce Website</a>
                     </div>

                 
                 <div class="navbar-collapse collapse">
                     <ul class ="nav navbar-nav navbar-right">
                         <li ><a href="Default.aspx">Home</a></li>
                          
                          <li><a href="Contactus.aspx">Contact Us</a></li>
                         <li><a href="Products.aspx">Products</a></li>
                      
                         
                         
                         
                         <li><a href="SignIn.aspx">SignIn</a></li>
                         </ul>
                 </div>
               </div>
                 </div>
            </div>
            <div class="container">
                <div class="form-horizontal">
                    <h2>Recovery</h2>
                    <hr />
                    <h3>Please Enter Your Email, we will send you the recovery link for your password</h3>

                    <div class="form-group">
                        <asp:Label ID="lblEmail" CssClass="col-md-2 control-label" runat="server" Text="Enter Email"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtEmailID" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="Text-danger" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmailID" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>

                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-2"></div>
                        
                         <div class="col-md-6">
                             <asp:Button ID="btnResetPass" CssClass="btn btn-default" runat="server" Text="Send" OnClick="btnResetPass_Click"  />
                              <asp:Label ID="lblResetPassMsg" CssClass ="text-sucess" runat="server" ></asp:Label>

                         </div>

                    </div>

                </div>
           

        </div>
    </form>
      <!---Footer Start---->
        <hr/>
        <footer class="footer-pos">
            <div class ="container">
                <p class ="pull-right"><a href ="#">Back to top</a></p>
            </div>
        </footer>
        <!----Footer Ends---->
</body>
</html>
