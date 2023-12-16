<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset your Password</title>

     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" >
    <meta http-equiv="content-language" content="IE-edge" >
    <link href="css/Custom.css" rel="stylesheet" />
   
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
                          <li><a href="#">About</a></li>
                          <li><a href="#">Contact Us</a></li>
                          <li><a href="#">Blog</a></li>
                      
                         
                         <li class ="dropdown">
                             <a href ="#" class ="dropdown-toggle" data-toggle="dropdown">Products<b class ="caret"></b></a>
                             <ul class ="dropdown-menu">
                                <li> <a href="Mobile.aspx">Mobiles</a></li>
                               <!---        <li> <a href="Laptop.aspx">Laptops</a></li> -->
                                       <li> <a href="Television.aspx">Television</a></li>
<!--                                       <li> <a href="Refrigerator.aspx">Refrigerators</a></li>  -->
                                       <li> <a href="Washingmachine.aspx">Washing Machine</a></li>  
                                       <li> <a href="Ac.aspx">Air-Conditioner</a></li>
                                   </ul>
                             </li>
                         
                         <li><a href="SignIn.aspx">SignIn</a></li>
                         </ul>
                 </div>
               </div>
                 </div>


        </div>

            <div class="container">
                <div class="form-horizontal">
                                     <br />
                    <br />
                    <br />

                    <h2>Reset Password</h2>
                    <hr />
                    <h3></h3>

                    <div class="form-group">
                        <asp:Label ID="lblMsg" CssClass="col-md-2 control-label" runat="server" Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        </div>
                    
                    
                    <div class="form-group">
                        <asp:Label ID="lblNewPassword" CssClass="col-md-2 control-label" runat="server" Text="Enter New Password" Visible="False"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtNewPass" CssClass="form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPass" CssClass="Text-danger" runat="server" ErrorMessage="Enter New Password" ControlToValidate="txtNewPass" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>

                        </div>

                    </div>

                     <div class="form-group">
                        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Confirm New Password" Visible="False"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtConfirmPass" CssClass="form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" CssClass="Text-danger" runat="server" ErrorMessage="Confirm New Password" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="Compare Password not matched!...Try again " ControlToCompare="txtNewPass" ForeColor="Red" ControlToValidate="txtConfirmPass"></asp:CompareValidator>
                        </div>

                    </div>
                    

                    
                    <div class="form-group">
                        <div class="col-md-2"></div>
                        
                         <div class="col-md-6">
                             <asp:Button ID="btnResetPass" CssClass="btn btn-default" runat="server" Text="Reset" Visible="False" OnClick="btnResetPass_Click"   />
                             

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
