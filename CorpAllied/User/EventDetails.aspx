<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="CorpAllied.User.EventDetails" %>
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
                                 <div class="panel-heading"><i class="pull-right"><small>By &nbsp;<asp:Label ID="lblEventBy" runat="server" Text='<%# Eval("EventCreatedBy") %>' ></asp:Label></small></i><h4><asp:Label runat="server" ID="lblEventName" Text='<%# Eval("EventName") %>'></asp:Label></h4></div>
                                  <div class="panel-body">
                                    <p><a href="#">Event On:<asp:Label Text='<%#Eval("EventOccurenceDate") %>' ID="lblEventOccurenceOn" runat="server"></asp:Label></a></p>
                                    <p><a href="#">Event Created On:<asp:Label Text='<%#Eval("EventCreateDate") %>' ID="lblEventCreateDate" runat="server"></asp:Label></a></p>
                                    <div class="clearfix"></div>
                                    <hr>                                 
                                      <asp:Label ID="lblEventDetails" runat="server" Text='<% #Eval("EventDetails") %>'></asp:Label>
                                  </div>
                               </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                             </div>
                               </div>
                           </div>
         </div>

</asp:Content>
