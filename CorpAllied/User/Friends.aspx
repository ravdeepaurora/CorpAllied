<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="CorpAllied.User.Friends" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="../css/lightbox.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding">
                       <div class="full col-sm-9">
                          <div class="row">
                            <div class="col-sm-12">
                               <h4><asp:Label ID="lblEmptyID" runat="server" Visible="false" Text="No New Requests!" CssClass="control-label"></asp:Label></h4> 
                                
                                     <table>
                                <asp:Repeater ID="rptrFriends" runat="server" OnItemCommand="rptrFriends_ItemCommand">
                                    <ItemTemplate>
                               
                                         <tr>
                                             <td class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                     <h4 class="pull-left"><asp:Label ID="lblFriendName" runat="server" Text='<%#Eval("FirstName") %>' ></asp:Label></h4></td>
                                             <td class="col-lg-1"><asp:Button runat="server" Text="Accept Request" ID="btnRequestStatus" CommandName="AcceptRequest" CssClass="btn btn-info pull-right" />
                                                 <asp:HiddenField ID="hdnfldReqID" runat="server" Value='<%#Eval ("RequestID") %>' /></td>
                                  <%--<div class="panel-body">
                                    <p><a href="#"><asp:Label Text="Demo Text" ID="lblEventText" runat="server"></asp:Label></a></p>
                                    <div class="clearfix"></div>
                                    <hr>
                                    Design, build, test, and prototype using Bootstrap in real-time from your Web browser. Bootply combines the power of hand-coded HTML, CSS and JavaScript with the benefits of responsive design using Bootstrap. Find and showcase Bootstrap-ready snippets in the 100% free Bootply.com code repository.
                                      <asp:Label ID="Label1" runat="server" Text='<% #Eval("ID") %>'></asp:Label> --%>
                                   </tr>
                             

                                      </ItemTemplate>
                                    </asp:Repeater>
                                               </table>
                                                <br />
                                
                                          <table class="table-responsive table table-hover">
                                <asp:Repeater ID="rptrFriendList" runat="server" OnItemCommand="rptrFriendList_ItemCommand">
                                    <ItemTemplate>
                                        
                                            <tr>
                                                <td class="col-lg-4">
                                                    <a href='ImageHandle.ashx?pEmail=<%# Eval("Email")%>' data-lightbox='image-<%# Eval("FriendID") %>' data-title='<%#Eval("FriendName") %>' onerror="this.href='http://lorempixel.com/140/140/'">
                                                    <img src='ImageHandle.ashx?pemail=<%#Eval("Email") %>' onerror="this.src='http://lorempixel.com/140/140/'" style="max-height:50px;max-width:50px" class="img-thumbnail" /></a>
                                                </td>
                                               <td class="col-lg-4">
                                                   <asp:HiddenField runat="server" ID="hdnfldfrndID" Value='<%#Eval("FriendID") %>' />
                                                <a href='Profile.aspx?profileid=<%# Eval("FriendID") %>' >   <asp:Label ID="lblFriendName" runat="server" Text='<%#Eval("FriendName") %>'></asp:Label></a>
                                                </td>
                                           
                                                <td class="col-lg-4">
                                                    <asp:Button ID="btnSendMsg" CssClass="btn btn-primary" runat="server" CommandName="SendMsg" Text="Message" />
                                                    <asp:Button ID="btnRemove" CssClass="btn btn-danger" runat="server" CommandName="Remove" Text="UnFriend" />
                                                </td>

                                            </tr>
                                        
                                           </ItemTemplate>
                                </asp:Repeater>
                                              </table>
                                            
                             </div>
                               </div>
                           </div>
         </div>
    <script src="../js/lightbox-plus-jquery.min.js"></script>
</asp:Content>
