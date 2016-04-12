<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CorpAllied.User.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/userprofile.js"></script>
    <link href="../css/userprofile.css" rel="stylesheet" />
    <link href="../css/ChatBox.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("#addClass").click(function () {
                $('#qnimate').addClass('popup-box-on');
            });

            $("#removeClass").click(function () {
                $('#qnimate').removeClass('popup-box-on');
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlProfile" runat="server">
    <div class="padding">
        <div class="full col-sm-12">
            <div class="row">               
                <div class="col-lg-12 col-sm-12">
                    <div class="card hovercard">
                        <div class="card-background">
                            <img class="card-bkimg" alt="" src=".." runat="server" id="imgbckground" onerror="this.src='http://lorempixel.com/140/140/'" />
                        </div>
                        <div class="useravatar">
                        <img alt="" src=".." runat="server" id="imgavatar" onerror="this.src='http://lorempixel.com/140/140/'">
                        </div>
                        <div class="card-info"> <span class="card-title"><asp:Label ID="lblName" runat="server"></asp:Label></span>
                        </div>
                    </div>
                <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            <div class="hidden-xs">About Me </div>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <div class="hidden-xs">Recent Updates </div>
                        </button>
                        </div>
                        <div class="btn-group" role="group">
                        <button type="button" onserverclick="followings_ServerClick" runat="server" id="followings" class="btn btn-default"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            <div class="hidden-xs"><asp:Label ID="lblfriendstatus" runat="server" Text="Friend List" /></div>
                        </button>
                        </div>
                    <div class="btn-group" role="group"><a href="#" id="addClass">
                        <button type="button" id="Button1" class="btn btn-default" runat="server"  data-toggle="tab"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                            <div class="hidden-xs"><asp:Label ID="lblMessage" runat="server" Text="Message" /></div>
                        </button></a>
                        </div>
                 </div>

                <div class="well">
                    <div class="tab-content">
                        
                        <div class="tab-pane fade in active" id="tab1" >
                            <table>
                                <tr>
                                    <td class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                    <h3 style="font-family:BlackChancery;outline-color:white;opacity:0.8">About Me:</h3> <br />
                                    </td>
                                    <td><asp:LinkButton ID="lblAboutMeEdit" runat="server" href="#AboutMe" role="button" data-toggle="modal" Text="Edit"></asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr />
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2" class="col-lg-12">
                                    <asp:Label runat="server" ID="lblAboutMe" Text="Message"></asp:Label>
                                    </td>
                                </tr>
                            </table>   
                        </div>
                        <div class="tab-pane fade in" id="tab2">
                            <asp:Repeater ID="rptrRecentUpdates" runat="server">
                                <ItemTemplate>
                                    <table style="width:100%" class="table-responsive">
                                        <tr>
                                            <td style="width:85%">
                                                <asp:Label runat="server" ID="lblUserStatus" Text='<%# Eval("StatusText") %>' CssClass="pull-left"></asp:Label>
                                            </td>
                                            <td style="width:10%">
                                                <asp:Label runat="server" ID="lblStatusTimeStamp" Text='<%# Eval("TimeStamps") %>' CssClass="pull-right"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <hr />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane fade in" id="tab0">
                            <h3>This is tab 3</h3>
                        </div>
                    </div>
               </div>
           </div>
        </div>
      </div>
    </div>
 <div class="popup-box chat-popup" id="qnimate">
    		  <div class="popup-head">
				<div class="popup-head-left pull-left"><img src="http://bootsnipp.com/img/avatars/bcf1c0d13e5500875fdd5a7e8ad9752ee16e7462.jpg" alt="iamgurdeeposahan">Gurdeep Osahan</div>
					  <div class="popup-head-right pull-right">
						<div class="btn-group">
    								  <button class="chat-header-button" data-toggle="dropdown" type="button" aria-expanded="false">
									   <i class="glyphicon glyphicon-cog"></i> </button>
									  <ul role="menu" class="dropdown-menu pull-right">
										<li><a href="#">Media</a></li>
										<li><a href="#">Block</a></li>
										<li><a href="#">Clear Chat</a></li>
										<li><a href="#">Email Chat</a></li>
									  </ul>
						</div>
						
						<button data-widget="remove" id="removeClass" class="chat-header-button pull-right" type="button"><i class="glyphicon glyphicon-off"></i></button>
                      </div>
			  </div>
			<div class="popup-messages">
    		
			
			
			
			<div class="direct-chat-messages">
                    
					
					<div class="chat-box-single-line">
								<abbr class="timestamp">October 8th, 2015</abbr>
					</div>
					
					
					<!-- Message. Default to the left -->
                    <div class="direct-chat-msg doted-border">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left">Osahan</span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <img alt="message user image" src="http://bootsnipp.com/img/avatars/bcf1c0d13e5500875fdd5a7e8ad9752ee16e7462.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                        Hey bro, how’s everything going ?
                      </div>
					  <div class="direct-chat-info clearfix">
                        <span class="direct-chat-timestamp pull-right">3.36 PM</span>
                      </div>
						<div class="direct-chat-info clearfix">
						<span class="direct-chat-img-reply-small pull-left">
							
						</span>
						<span class="direct-chat-reply-name">Singh</span>
						</div>
                      <!-- /.direct-chat-text -->
                    </div>
                    <!-- /.direct-chat-msg -->
					<div class="chat-box-single-line">
						<abbr class="timestamp">October 9th, 2015</abbr>
					</div>
					<!-- Message. Default to the left -->
                    <div class="direct-chat-msg doted-border">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left">Osahan</span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <img alt="" src="" class="direct-chat-img"><!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                        Hey bro, how’s everything going ?
                      </div>
					  <div class="direct-chat-info clearfix">
                        <span class="direct-chat-timestamp pull-right">3.36 PM</span>
                      </div>
						<div class="direct-chat-info clearfix">
						  <img alt="" src="" class="direct-chat-img big-round">
						<span class="direct-chat-reply-name">Singh</span>
						</div>
                      <!-- /.direct-chat-text -->
                    </div>
                    <!-- /.direct-chat-msg -->
                  </div>
			</div>
			<div class="popup-messages-footer">
			<textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" name="message"></textarea>
			<div class="btn-footer">
			<button class="bg_none"><i class="glyphicon glyphicon-film"></i> </button>
			<button class="bg_none"><i class="glyphicon glyphicon-camera"></i> </button>
            <button class="bg_none"><i class="glyphicon glyphicon-paperclip"></i> </button>
			<button class="bg_none pull-right"><i class="glyphicon glyphicon-thumbs-up"></i> </button>
			</div>
			</div>
	  </div>
    <div id="AboutMe" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			Update About Me
      </div>
      <div class="modal-body">
          <div class="form center-block">
            <div class="form-group">
              <asp:TextBox CssClass="form-control input-lg" autofocus="" placeholder="Let others know about you" runat="server" ID="txtAboutMe" TextMode="MultiLine"></asp:TextBox>
            </div>
          </div>
      </div>
      <div class="modal-footer">
          <div>
          <button class="btn btn-primary btn-sm" data-dismiss="modal" aria-hidden="true" runat="server" id="btnPostAboutMe" onserverclick="btnPostAboutMe_ServerClick">Post</button>
            <%--<ul class="pull-left list-inline"><li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href="#"><i class="glyphicon glyphicon-camera"></i></a></li><li><a href="#"><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>--%>
		  </div>	
      </div>
  </div>
  </div>
</div>
    </asp:Panel>
    <asp:Panel ID="pnlProfileError" runat="server" Visible="false">
        <div class="padding">
        <div class="full col-sm-12">
            <div class="row">               
                <div class="col-lg-12 col-sm-12">
    <h4><asp:Label Text="Error! Profile Not Found." runat="server" ID="lblProfileError" Visible="true"></asp:Label></h4>
                    </div>
            </div>
        </div>
        </div>
    </asp:Panel>
</asp:Content>
