<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="JobDetail.aspx.cs" Inherits="CorpAllied.User.JobDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="padding">
                       <div class="full col-sm-9">
                          <div class="row">
                            <div class="col-sm-12">
                               <h1><asp:Label ID="lblEmptyID" runat="server" Visible="false" Text="Oops Nothing to Display Here" CssClass="control-label"></asp:Label></h1> 
                                <asp:Repeater ID="rptrJobDetail" runat="server">
                                    <ItemTemplate>
                               <div class="panel panel-default">
                                 <div class="panel-heading"><h4>Latest Events</h4></div>
                                  <div class="panel-body">
                                    <p><a href="#"><asp:Label Text="Demo Text" ID="lblEventText" runat="server"></asp:Label></a></p>
                                    <div class="clearfix"></div>
                                    <hr>
                                    Design, build, test, and prototype using Bootstrap in real-time from your Web browser. Bootply combines the power of hand-coded HTML, CSS and JavaScript with the benefits of responsive design using Bootstrap. Find and showcase Bootstrap-ready snippets in the 100% free Bootply.com code repository.
                                      <asp:Label ID="Label1" runat="server" Text='<% #Eval("ID") %>'></asp:Label>
                                  </div>
                               </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                             </div>
                               </div>
                           </div>
         </div>
</asp:Content>
