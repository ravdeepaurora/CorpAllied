<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="CorpAllied.User.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                     <div class="padding">
                       <div class="full col-sm-9">
                          <div class="row">
                              <h3><asp:Label runat="server" ID="lblNoMatchFound" Text="Nothing Found" CssClass="label label-danger center-block" Visible="false"></asp:Label></h3>
                              <table class="table">
                        <asp:Repeater ID="rptrSearch" runat="server">
                            <ItemTemplate>
                                <tr>
                                        <td>
                                            <a href='Profile.aspx?profileid=<%#Eval("UserID") %>'><img src='ImageHandle.ashx?pEmail=<%#Eval("Email")%>' class="pull-left" onerror="this.src='http://lorempixel.com/280/140/'" style="max-height:100px;max-width:100px" class="img-thumbnail" /></a>
                                        </td>
                                        <td>
                                            <a href='Profile.aspx?profileid=<%#Eval("UserID") %>'><asp:Label runat="server" ID="lblName" CssClass="pull-left" Text='<%#Eval("FirstName") +" "+ Eval("LastName") %>'></asp:Label></a>
                                        </td>
                                        <td>
                                           <a href='Profile.aspx?profileid=<%#Eval("UserID") %>'> <asp:Label runat="server" ID="lblEmail" CssClass="pull-left" Text='<%#Eval("Email") %>'></asp:Label></a>
                                        </td>
                                    </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                                      
                                </table>
                              </div>
                           </div>
                        </div>
</asp:Content>
