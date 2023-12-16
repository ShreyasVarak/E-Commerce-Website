<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignIn</title>
    
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
                          
                        <li class="drodown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b
                            class="caret"></b></a>
                            <ul class="dropdown-menu ">
                                <li><a href="Products.aspx">All Products</a></li>
                                <li role="separator" class="divider "></li>

    
                                <li><a href="Mobile.aspx">Mobiles</a></li>
                                <li><a href="Refrigerator.aspx">Refrigerator</a></li>
                                <li><a href="Ac.aspx">Air-Conditioner</a></li>
                                <li><a href="Laptop.aspx">Laptops</a></li>
                                <li><a href="Television.aspx">Television</a></li>
                                <li><a href="Washingmachine.aspx">Washing Machine</a></li>

                   
                            </ul>
                        </li>
                         
                        
                          <li><a href="SignUp.aspx">SignUp</a></li>
                         <li class="active"><a href="SignIn.aspx">SignIn</a></li>
                         </ul>
                 </div>
               </div>
                 </div>
        </div>

        <br />
        <br />
        <br />

         <!----Signin form Start ---->
         
        <div class ="container">
            <div class ="form-horizontal ">
                <h2>Login Form</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Username"></asp:Label>
                    <div class ="col-md-3">
                       
                        <asp:TextBox ID="txtUsername" Cssclass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Username" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    </div>


                <div class ="form-group">
                    <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Password"></asp:Label>
                    <div class ="col-md-3">
                       
                        <asp:TextBox ID="txtPass" Cssclass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Password" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    </div>

             
                <div class ="form-group">
                  <div class ="col-md-2"></div>
                    <div class ="col-md-6">
                       
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                          <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Remember me"></asp:Label>

                    </div>
                    </div>


                
                <div class ="form-group">
                  <div class ="col-md-2"></div>
                    <div class ="col-md-6">
                       
                        <asp:Button ID="btnLogin" CssClass="btn btn-success" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Don't have an account? Sign Up</asp:HyperLink>

                    </div>
                    </div>

                <!----Forget Password---->

                 <div class ="form-group">
                  <div class ="col-md-2"></div>
                    <div class ="col-md-6">

                        <asp:HyperLink ID="HyForgetPass" runat="server" NavigateUrl="~/ForgetPassword.aspx">Forget Password</asp:HyperLink>
                  
                        
                    </div>
                    </div>



                <!----Forget Password End---->

                 <div class ="form-group">
                  <div class ="col-md-2"></div>
                    <div class ="col-md-6">

                        <asp:Label ID="lblError" CssClass ="text-danger" runat="server" ></asp:Label>
                    </div>
                    </div>


                </div>

              
            </div>
   
          <!----Signin form End ---->




         
         <!---Footer Start---->
        <hr/>
        <footer class="footer-pos">
            <div class ="container">
                <p class ="pull-right"><a href ="#">Back to top</a></p>
            </div>
        </footer>
        <!----Footer Ends---->


    </form>
</body>
</html>
