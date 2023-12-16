<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class ="container">
            <div class ="form-horizontal ">
                <h2>Add Category</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category Name"></asp:Label>
                    <div class ="col-md-3">
                       
                        <asp:TextBox ID="txtCategory" Cssclass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryName" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Brand name" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    </div>


               

             
                
                <div class ="form-group">
                  <div class ="col-md-2"></div>
                    <div class ="col-md-6">
                       
                        <asp:Button ID="btnAddCategory" CssClass="btn btn-success" runat="server" Text="Add Category" OnClick="btnAddCategory_Click"   />
                        

                    </div>
                    </div>



                </div>

              
           <h1>Category</h1>
          <hr />

          <div class="panel panel-default">

           <div class="panel-heading">All Categories</div>


              <asp:Repeater ID="rptrCategories" runat="server">

             
                  <HeaderTemplate>

                   <table class="table">
                  <thead>
                       <tr>
                         <th>#</th>
                         <th>Categories</th>
                         <th>Edit</th>    
                 
                          </tr>
                           </thead>
            
                  <tbody>

              </HeaderTemplate>
            

              <ItemTemplate>

                  <tr>
            <th> <%# Eval("CatID") %></th>
            <td> <%# Eval("CatName") %></td>

            <td>Edit</td>

        </tr>

              </ItemTemplate>


              <FooterTemplate>

                   </table>
                  
                  
                  </div>

              </FooterTemplate>

             </asp:Repeater>

</div>


            </div>

</asp:Content>