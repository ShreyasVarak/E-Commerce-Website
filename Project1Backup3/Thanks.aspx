<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="Thanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />

    <table class="tbl">
        <tr>
            <td class="tblhead">
                <asp:Image ID="Image2" runat="server" Height="81px" 
                    ImageUrl="~/Mobile/NICE.jpg" Width="212px" />
            </td>
        </tr>
        <tr>
            <td>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="font-weight: 700; font-size: x-large; color:black; text-align: center">
                Thank You for Payment,
                <br />
                Your Order has been Placed Successfully...
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
            <asp:Button ID="Button2" runat="server" CssClass="btn" 
                Text="Continue Shopping" PostBackUrl="~/Default.aspx" />
            </td>
        </tr>
    </table>
</asp:Content>

