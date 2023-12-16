<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Home Page</title>

    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous">

    </script>

   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" >
    <meta http-equiv="content-language" content="IE-edge" >
    <link href="css/Cust.css" rel="stylesheet" />
   
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     
    <script>

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/Cart.aspx";
            });
        });

    </script>

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
                     <a class="navbar-brand" href="Default.aspx"><span><img src="icon/Logo.png" alt="E-Commerce Website" height="30" /></span>E-Commerce Website</a>
                     </div>

                     <div class="navbar-collapse collapse" >
                     <ul class ="nav navbar-nav navbar-right">
                         <li class="active"><a href="Default.aspx">Home</a></li>
                          
                          <li id="btnContactus" runat="server"><a href="Contactus.aspx">Contact Us</a></li>
                          
                        

                             <li class="drodown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b
                            class="caret"></b></a>
                            <ul class="dropdown-menu ">
                                <li><a href="Products.aspx">All Products</a></li>
                                <li role="separator" class="divider "></li>

    
                                <li><a href="Mobile.aspx"><b>Mobiles</b></a></li>
                                 <li role="separator" class="divider "></li>
                                <li> <a href ="Mseries.aspx">M-Series</a></li>
                                <li> <a href="Aseries.aspx">A-Series</a></li>
                                <li> <a href ="Fseries.aspx">F-Series</a></li>
                                <li role="separator" class ="divider "></li>

                          <!---      <li><a href="Refrigerator.aspx">Refrigerator</a></li>  -->
                                
                                <li><a href="Ac.aspx"><b>Air-Conditioner</b></a></li>
                                 <li role="separator" class ="divider "></li>
                                <li> <a href ="Split.aspx">Split</a></li>
                                 <li role="separator" class ="divider "></li>

 <!----                               <li><a href="Laptop.aspx">Laptops</a></li> -->

                                 <li><a href="Television.aspx"><b>Television</b></a></li>  
                                 <li role="separator" class ="divider "></li>
                                <li> <a href ="Smart.aspx">Smart</a></li>
                                 <li role="separator" class ="divider "></li>
                                <li><a href="Washingmachine.aspx"><b>Washing Machine</b></a></li>
                                 <li role="separator" class ="divider "></li>
                                 <li> <a href ="Front.aspx">Front Load</a></li>           
                                 <li> <a href ="Top.aspx">Top Load</a></li>           
                                 <li role="separator" class ="divider "></li>
                            </ul>
                        </li>

                         <li>
                             <button id="btnCart" class="btn btn-primary navbar-btn" type="button">
                                 Cart<span class="badge" id="pCount" runat="server"></span>


                             </button>
                         </li>

                         <li >

                            <asp:Button ID="btnlogin" CssClass ="btn btn-default navbar-btn " runat="server" Text="SignIn" OnClick="btnlogin_Click" />
                            <asp:Button ID="btnlogout" CssClass ="btn btn-default navbar-btn " runat="server" Text="Sign Out" OnClick="btnlogout_Click" />
                            
                        </li>
                          <li>
                        <asp:Button ID="Button1" CssClass ="btn btn-link navbar-btn " runat="server" Text=""  />
                        </li>
                             </ul>
                          </div>
                       </div>
         </div>
            </div>
       
                 
            <br />
        <br />
        <br />
        <br />
        <br />
        <br />


        <asp:Label ID="lblSuccess" runat="server" CssClass ="text-success "></asp:Label>

        <!---image slider---->

            <div class="container">
                <hr />
                <hr />
  <h2> </h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="slider/99.jfif"alt="1" style="width:100%;">
      </div>

      <div class="item">
        <img src="slider/96.jfif" alt="2" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="slider/98.jfif" alt="4" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


            <!----image slider end---->
 </div> 

        
            <!----Middle Content---->
        <hr/>

        <div class ="container center">
            <div class ="row">
                <div class ="col-lg-4">
                    <img class ="img-circle" src="Mobile/galaxy.jpg" alt="thumb" width="120" height="120" />
                    <h2>Mobile Phones</h2>
                    <p>Select from different range of mobile phones</p>
                    <p> <a class ="btn btn-default" href="Mobile.aspx" role="button">View More &raquo; </a></p>
                </div>
          
                  <div class ="col-lg-4">
                    <img class ="img-circle" src="Mobile/stv5.jpg" alt="thumb" width="120" height="120" />
                    <h2>Television</h2>
                    <p>Select from different range of Televisions</p>
                    <p> <a class ="btn btn-default" href="Television.aspx" role="button">View More &raquo; </a></p>
                </div>
          

                  <div class ="col-lg-4">
                    <img class ="img-circle" src="Mobile/ip.jpg" alt="thumb" width="120" height="120" />
                    <h2>Mobile</h2>
                    <p>Select from different range of mobile phones</p>                
                    <p> <a class ="btn btn-default" href="Mobile.aspx" role="button">View More &raquo; </a></p>
                </div>
               
                  
                 
            </div>




        </div>

             <!----Middle Content end---->

            <!---Footer Start---->
        <hr/>
            <div class ="container">
                <p class ="pull-right"><a href ="#">Back to top</a></p>
            </div>
        
        <!----Footer Ends---->

                
    </form>
</body>

</html>
