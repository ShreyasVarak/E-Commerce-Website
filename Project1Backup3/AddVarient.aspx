<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddVarient.aspx.cs" Inherits="AddVarient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class ="container ">
            <div class ="form-horizontal ">
                <br />
                <br />

                <h2>Add Variant</h2>
                <hr />

                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="Varient Name"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtVarient" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorVarient" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Varient" ControlToValidate="txtVarient" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class ="form-group">
                    <asp:Label ID="Label3" CssClass ="col-md-2 control-label " runat="server" Text="Brand"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:DropDownList ID="ddlBrand" CssClass ="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlBrand" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter CategoryID" ControlToValidate="ddlBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class ="form-group">
                    <asp:Label ID="Label4" CssClass ="col-md-2 control-label " runat="server" Text="Category"></asp:Label>
                    <div class ="col-md-3 ">


                        <asp:DropDownList ID="ddlCategory" CssClass ="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter  Category" ControlToValidate="ddlCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>



                 <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnAddVarient" CssClass ="btn btn-success " runat="server" Text="Add Variant" OnClick="btnAddVarient_Click"    />
                        
                    </div>
                </div>
                

            </div>

<h1>Variants</h1>
        <hr />

 <div class="panel panel-default">

               <div class="panel-heading"> All Variants</div>


     <asp:repeater ID="rptrVarient" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Variant</th>
                        <th>Brand</th>
                        <th>Category</th>
                      
                        <th>Edit</th>

                    </tr>

                </thead>



            <tbody>
         </HeaderTemplate>


         <ItemTemplate>
             <tr>
                    <th> <%# Eval("VarientID") %> </th>
                    <td><%# Eval("VarientName") %>   </td>
                  <td><%# Eval("Name") %>   </td>
                  <td><%# Eval("CatName") %>   </td>
                
                    <td>Edit</td>
                </tr>
         </ItemTemplate>


         <FooterTemplate>
             </tbody>

              </table>
         </FooterTemplate>

         </asp:repeater>

              
                
            

   
</div>


        </div>

</asp:Content>

