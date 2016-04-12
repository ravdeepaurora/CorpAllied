<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="CorpAllied.User.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding">
                       <div class="full col-sm-9">
                          <div class="row">
                            
                                <asp:Repeater ID="rptrEventsOdd" runat="server">
                                    <ItemTemplate>
                                        <div class="col-sm-6">
                               <div class="panel panel-default">
                                 <div class="panel-heading"><a href="EventDetails.aspx?id=<%#Eval("ID") %>" class="pull-right">View</a> <h4><asp:Label Text='<%# Eval("EventName") %>' ID="lblEventText" runat="server"></asp:Label></h4></div>
                                  <div class="panel-body">
                                    <p><a href="#">Event Occurence Date:&nbsp;<asp:Label Text='<%# Eval("EventOccurenceDate") %>' ID="lblEventOccurenceDate" runat="server"></asp:Label></a></p>
                                    
                                    <hr />
                                      <asp:Label runat="server" Text='<%#Eval("EventDetails") %>' />
                                  </div>
                               </div>
                                        </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                             
                              <%--<div class="col-sm-6">
                                  <asp:Repeater ID="rptrEventsEven" runat="server">
                                    <ItemTemplate>
                               <div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Latest Events</h4></div>
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
                              </div>--%>
                              
                                  </div>
                           </div>
                           
                        </div>
                      
</asp:Content>
