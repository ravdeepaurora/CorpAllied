<%@ Page Title="" Language="C#" MasterPageFile="~/Company/Company.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CorpAllied.Company.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="padding">
                    <div class="full col-sm-9">
                        <!-- content -->                      
                      	<div class="row">
                              <div class="col-sm-12">
                                  <h4>Jobs Posted and Active By You:</h4>
                                  <br />
                                  <!-- main col left -->
                                  <%--<asp:Repeater ID="rptrjobs" runat="server">
                                    <ItemTemplate>--%>
                                  <div class="col-sm-6">
                                      <div class="panel panel-default">
                                          <div class="panel-heading">
                                              <a href="#" class="text-muted pull-right">View</a>
                                              <h4><asp:Label ID="lblJobName" runat="server" Text='<%#Eval("JobName")%>'></asp:Label></h4>
                                          </div>
                                          <div class="panel-body">
                                              <asp:Label ID="lblJobProfile" runat="server" Text='<%#Eval("JobProfile")%>'></asp:Label><br />
                                              <asp:Label ID="lblJobPackage" runat="server" Text='<%#Eval("JobPackage")%>'></asp:Label><br />
                                              <asp:Label ID="lblJobJoiningDate" runat="server" Text='<%#Eval("JobJoining")%>'></asp:Label><br />
                                              <asp:Label ID="lblJobLastApplyDate" runat="server" Text='<%#Eval("JobLastApplyDate")%>'></asp:Label><br />
                                              <asp:Label ID="lblJobDescription" runat="server" Text='<%#Eval("JobDescription")%>'></asp:Label>
                                              <asp:HiddenField ID="hdnfldJobID" runat="server" Value='<%#Eval("JobID")%>'></asp:HiddenField>
                                              <div class="clearfix"></div>
                                              <asp:Button ID="btnApply" runat="server" Text="Apply" CssClass="btn btn-info" />
                                          </div>
                                      </div>
                                  </div>
                                  <%-- </ItemTemplate>
                                </asp:Repeater>--%>
                              </div>
                              </div>
                        </div>
         </div>
</asp:Content>