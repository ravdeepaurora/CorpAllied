<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Blogs.aspx.cs" Inherits="CorpAllied.User.Blogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <div class="padding">
                       <div class="full col-sm-9">
                          <div class="row">
                            
                                <asp:Repeater ID="rptrBlogsOdd" runat="server">
                                    <ItemTemplate>
                                        <div class="col-sm-6">
                               <div class="panel panel-default">
                                 <div class="panel-heading"><i class="pull-right"><small><a href='BlogDetails.aspx?ID=<%#Eval("Id") %>'>View</a></small></i><h4><asp:Label runat="server" ID="lblBlogName" Text='<%# Eval("BlogName") %>'></asp:Label></h4></div>
                                  <div class="panel-body">
                                    <p><a href="#">Blog Created On:<asp:Label Text='<%#Eval("BlogDate") %>' ID="lblBlogCreateDate" runat="server"></asp:Label></a></p>
                                    
                                    <hr>                                 
                                      <asp:Label ID="lblBlogText" runat="server" Text='<% #Eval("BlogText") %>'></asp:Label>
                                  </div>
                                <div class="clearfix"></div>
                                    <div class="input-group">
                                      <div class="input-group-btn">
                                      <button class="btn btn-default">+1</button><button class="btn btn-default"><i class="glyphicon glyphicon-share"></i></button>
                                      </div>
                                      <input type="text" class="form-control" placeholder="Add a comment..">
                                    </div>
                                    </form>
           </div>
                               </div>

                                            </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                             
                              <%--<div class="col-sm-6">
                                  <asp:Repeater ID="rptrBlogsEven" runat="server">
                                    <ItemTemplate>
                               <div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Latest Blogs</h4></div>
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
