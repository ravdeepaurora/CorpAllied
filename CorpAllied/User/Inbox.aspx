<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="CorpAllied.User.Inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding">
    <div class="full col-sm-9">
<div class="row">
    <div class="col-md-8">
        <div class="panel panel-info">
            <div class="panel-heading">
                RECENT CHAT HISTORY
            </div>
            <div class="panel-body" style="overflow-x:auto;height:420px">
                <h3><%--<asp:Label ID="lblFriendClick" Text="Click on a Friend to Start Ghup-Shup and His Bak Bak" CssClass="label label-default" runat="server"></asp:Label>--%></h3>
<ul class="media-list">
    <li class="media" id="FriendSelect" runat="server" visible="true">
                        <span class="label label-default" style="background-color:#D9EDF7;color:#3170A9">Select a Friend to start a Ghup-Shup and His Bak Bak</span>
                    </li>
    <asp:Repeater ID="rptrChats" runat="server">
                    <ItemTemplate>
                                    <li class="media">
                                        <div class="media-body">
                                            <div class="media">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object img-thumbnail " src='ImageHandle.ashx?pEmail=<%#Eval("Email") %>' onerror="this.src='ImageHandle.ashx?pEmail=ravdeepsinghaurora@gmail.com'" style="max-height:50px;max-width:50px" />
                                                </a>
                                                <div class="media-body" >
                                                    <asp:Label ID="lblMsgText" runat="server" Text='<%# Eval("Message") %>' style="word-wrap:break-word"></asp:Label>
                                                    <br />
                                                   <small class="text-muted"><asp:Label ID="lblUserName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label> | <asp:Label ID="lblMsgDate" runat="server"><%#Eval("DateAndTime") %></asp:Label></small>
                                                    <hr />
                                                </div>
                                            </div>

                                        </div>
                                    </li>
     
                                
                    </ItemTemplate>
                    </asp:Repeater>
    </ul>
            </div>
            <div class="panel-footer">
                <div class="input-group">
                                    <textarea class="form-control" name="txtMsgBox" id="txtMsgBox" placeholder="Enter Message"></textarea>
                                    <span class="input-group-btn">
                                        <button disabled="disabled" class="btn btn-info" runat="server" id="btnSendMsg" onserverclick="btnSendMsg_ServerClick" type="button">SEND</button>
                                    </span>
                                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading">
               Friend List
            </div>
            <div class="panel-body" style="overflow-x:auto;height:470px">
                <ul class="media-list">
                    
                    <asp:Repeater runat="server" ID="rptrFriendList" OnItemCommand="rptrFriendList_ItemCommand">
                        <ItemTemplate>
                            <li class="media">
                                        <div class="media-body">
                                            <div class="media">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object img-circle" style="max-height:40px;max-width:40px;" src='ImageHandle.ashx?pEmail=<%#Eval("Email") %>' onerror="this.src='ImageHandle.ashx?pEmail=ravdeepsinghaurora@gmail.com'" />
                                                </a>
                                                <div class="media-body" >
                                                    <h5 style="padding-top:0.5em"><asp:Label ID="lblFriendName" runat="server" Text='<%#Eval("FriendName") %>'></asp:Label> </h5>
                                                    <small><asp:LinkButton runat="server" ID="lnkFriendSelect" CommandName="FriendSelect" CommandArgument='<%#Eval("FriendID") %>' Text="Click Here to Chat"></asp:LinkButton></small><asp:HiddenField Value='<%#Eval("FriendID") %>' runat="server" ID="hdnFriendID" />
                                                </div>
                                            </div>

                                        </div>
                                    </li>
                        </ItemTemplate>
                    </asp:Repeater>
                                </ul>
                </div>
            </div>
        
    </div>
</div>
  </div>
    </div>

<%--    <div class="row">
        <div class="col-xs-2 col-sm-3">
            <img src="ImageHandle.ashx?pEmail=ravdeepsinghaurora@gmail.com" class="img-thumbnail" style="max-height:100px;max-width:100px" />
        </div>
        <div class="col-xs-10 col-sm-9">
            <asp:Label ID="lblName" runat="server" Text="Ravdeep"></asp:Label>
        </div>
    </div>
        <div class="clearfix">
            <hr />
        </div>
    <div class="row">
        <div class="col-xs-12">
            <div style="overflow-x:auto;height:270px;width:100%;scrollbar-arrow-color:#000;scrollbar-base-color:#3B5999;scrollbar-face-color:#0a48f3">
            <asp:Repeater ID="rptrMessages" runat="server">
                <ItemTemplate>
                    <div class="col-lg-12 pull-left" style="word-wrap:break-word;" >
                        Message1<br />Message1<br />Message1<br />Message1<br />
                    </div>
                    <br/>
                    <div class="col-lg-12 pull-right">
                        Message2<br />Message2<br />Message2<br />Message2<br />
                    </div>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
                </div>
            <br />
            <div>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtMsg" Height="150"  CssClass="col-lg-10"></asp:TextBox>
            <asp:Button runat="server" Height="50" ID="btnSendMsg" CssClass="col-lg-2" Text="Send" />
                </div>
            </div>
        
        </div>
    </div>
</div>--%>
</asp:Content>




<%-- <%--  <%-- <div class="padding">
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
      <div class="padding">
                    <div class="full col-sm-9">
       <div class="container-fluid">
           <asp:Repeater ID="rptrChats" runat="server">
               <ItemTemplate>
	<div class="row" style="border:1px solid grey">
		<div class="col-md-4" >
			<div class="row">
				<div class="col-md-4" >
					<img alt="Profile Pic" src="http://lorempixel.com/140/140/" class="img-thumbnail">
				</div>
				<div class="col-md-8">
					<h4>
						<asp:Label ID="lblName" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
					</h4>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="panel-group" id='panel-59070<%# Eval("ID") %>'>
				<div class="panel panel-default">
					<div class="panel-heading">
				         <a class="panel-title" data-toggle="collapse" data-parent='#panel-59070<%# Eval("ID") %>' href='#panel-element-24655<%# Eval("ID") %>'>Collapsible Group Item <%# Eval("ID") %></a>
					</div>
					<div id='panel-element-24655<%# Eval("ID") %>' class="panel-collapse collapse out">
						<div class="panel-body">
							Anim pariatur cliche...
                            <asp:Label ID="lblLastMessage" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-59070" href="#panel-element-534875">Collapsible Group Item #2</a>
					</div>
					<div id="panel-element-534875" class="panel-collapse collapse">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
                   </ItemTemplate>
               </asp:Repeater>
</div>
</div>
          </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script> --%>  