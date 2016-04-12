<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="NewBlogEvent.aspx.cs" Inherits="CorpAllied.User.NewBlogEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../js/jquery-ui.js"></script>
    <link href="../css/jquery-ui.css" rel="stylesheet" />
      <script>
          $(function () {
              $("#datepicker").datepicker();
          });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="padding">
                       <div class="full col-sm-9">
                         <div class="row">
         <div class="col-lg-6 col-md-6 col-sm-6">
                             <table class="table-condensed">
                                 <tr>
                                     <td>
                                        <span>Event Name</span>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtEventName" CssClass="col-lg-12 col-sm-10 col-md-12 col-xs-9" runat="server" placeholder="Event Name"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                        <span>Event Date</span>
                                     </td>
                                     <td>
                                         <input  id="datepicker" name="txtdatepicker" placeholder="Event Date" type="text" class="col-lg-12 col-sm-10 col-md-12 col-xs-9" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                        <span>Event Details</span>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtEventDetails" runat="server" CssClass="col-lg-12 col-sm-10 col-md-12 col-xs-9" placeholder="Specify Details Here" MaxLength="300" Height="50" TextMode="MultiLine"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td colspan="2">
                                         <asp:Button ID="btnCreateEvent" CssClass="btn btn-primary" runat="server" OnClick="btnCreateEvent_Click" Text="Create Event" />
                                     </td>
                                 </tr>
                             </table>
             </div>
                             <div class="col-lg-6 col-md-6 col-sm-6" >
                                 <table class="table-condensed">
                                 <tr>
                                     <td>
                                        <span>Blog Name</span>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtBlogName" CssClass="col-lg-12 col-sm-10 col-md-12 col-xs-9" runat="server" placeholder="Blog Name"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                        <span>Blog About</span>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtBlogAbout" CssClass="col-lg-12 col-sm-10 col-md-12 col-xs-9" runat="server" placeholder="Blog About"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                        <span>Blog Details</span>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtBlogDetails" runat="server" CssClass="col-lg-12 col-sm-10 col-md-12 col-xs-9" placeholder="Specify Details Here" MaxLength="300" Height="50" TextMode="MultiLine"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td colspan="2">
                                         <asp:Button ID="btnCreateBlog" runat="server" CssClass="btn btn-primary" OnClick="btnCreateBlog_Click" Text="Create Blog" />
                                     </td>
                                 </tr>
                             </table>
                             </div>
                         </div>
                        </div>
                      </div>

</asp:Content>
