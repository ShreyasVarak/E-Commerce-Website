<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>

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
                         <li><a href="Default.aspx">Home</a></li>
                          
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
                         
                        
                         
                           <li class="active"><a href="SignUp.aspx">SignUp</a></li>
                         <li><a href="SignIn.aspx">SignIn</a></li>
                         </ul>
                 </div>
               </div>

        </div>



        </div>

            <!----SignUp page---->
     
        <div class ="center-page">

                      <label class="col-xs-11">Name:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Name"></asp:TextBox>
            </div>


            <label class="col-xs-11">UserName:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtUname" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
            </div>

            
            <label class="col-xs-11">Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
            </div>

            
            <label class="col-xs-11">Confirm Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtConPass" runat="server" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
            </div>

             <label class="col-xs-11">Mobile no:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtMobno" runat="server" CssClass="form-control" placeholder="Enter Mobile no"></asp:TextBox>
            </div>
 
            

            <label class="col-xs-11">Email:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Email"></asp:TextBox>
            </div>
            
            <label class="col-xs-11"></label>
              <div class="col-xs-11">
                  <asp:Button ID="txtsignup" class="btn btn-success" runat="server" Text="SignUp" OnClick="txtsignup_Click"  />
                  &nbsp;&nbsp;
                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            &nbsp;
            </div>

        </div>

        <!----SignUp page ends---->

        
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
