<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <br />
    <br />
    <br />

      <div class="row">
      <div class="col-md-12">
          <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                        Cart <span id="CartBadge" runat="server" class="badge"> 0 </span>
                    </button>
                    <h3>
                        <asp:Label ID="Label1" runat="server" Text="All Products"></asp:Label>
                    </h3>
                    <hr />
                    
      </div>
    </div>

    <div class="row" style="padding-top:50px">


             <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" 
              placeholder="Search Products...." AutoPostBack="true" 
              ontextchanged="txtFilterGrid1Record_TextChanged" ></asp:TextBox>
      <br />
      <hr />


        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
        <div class="col-sm-3 col-md-3">
            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
            <div class="thumbnail">

                <img src="ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>"alt="<%# Eval("ImageName") %>" />
                <div class="caption">
                    <div class="proBrand"><%# Eval("BrandName") %></div>
                    <div class="proName"><%# Eval("PName") %></div>
                    <div class="proPrice">
                        <span class="proOgPrice"><%# Eval("PPrice") %></span><%# Eval("PSellPrice") %><span class="proPriceDiscount">(<%# Eval("DiscAmount") %>off)</span></div>
                        
                    </div>
                 </div>
                </div>
                </a>
                </ItemTemplate>
        </asp:Repeater>
            </div>
        


</asp:Content>

