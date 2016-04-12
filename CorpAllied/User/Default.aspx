<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CorpAllied.User.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/UserDefault.css" rel="stylesheet" />
    <link href="../css/lightbox.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
    
    
    <script type="text/javascript">
        function runFileUpload()
        {
            document.getElementById("<%=fileupldStatus.ClientID%>").click();

        }
        function RemoveFile()
        {
            var img = document.getElementById('image_upload_preview');
            document.getElementById("<%=fileupldStatus.ClientID %>").value = "";
            img.style.display = "none";
            var listRemove = document.getElementById('RemoveUploadedFile');
            listRemove.style.display = "none";
        }
        function ShowFile()
        {
            var Filename = document.getElementById("<%=fileupldStatus.ClientID %>").value;
            //if (Filename.contains(".jpg") || Filename.contains(".JPG")) {
             //   readURL(<%=fileupldStatus.ClientID %>);
             //   document.getElementById("<%=lblFileUploadState.ClientID%>").innerHTML = Filename;
             //   var img = document.getElementById('image_upload_preview');
             //   img.style.display = "inline";
             //   var listRemove = document.getElementById('RemoveUploadedFile');
             //   listRemove.style.display = "inline";
           // }
             if((Filename.indexOf('.jpg') > -1)||(Filename.indexOf('.JPG') > -1))
            {
                readURL(<%=fileupldStatus.ClientID %>);
                document.getElementById("<%=lblFileUploadState.ClientID%>").innerHTML = Filename;
                var img = document.getElementById('image_upload_preview');
                img.style.display = "inline";
                var listRemove = document.getElementById('RemoveUploadedFile');
                listRemove.style.display = "inline";
            }
            else {
                document.getElementById("<%=lblFileUploadState.ClientID%>").innerHTML = "";
                document.getElementById("<%=fileupldStatus.ClientID %>").value = null;
                var img = document.getElementById('image_upload_preview');
                img.style.display = "none";
                
            }
        }
        function ShowSuccessPost()
        {
            alert("Posted on Timeline");
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image_upload_preview').attr('src', e.target.result);
                    $('#image_upload_preview').css({"height":"60px","width":"100px"});
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <%--<div class="column col-sm-10 col-xs-11" id="main">
                
                <!-- top nav -->
              	<div class="navbar navbar-blue navbar-static-top">  
                    <div class="navbar-header">
                      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle</span>
                        <span class="icon-bar"></span>
          				<span class="icon-bar"></span>
          				<span class="icon-bar"></span>
                      </button>
                      <a href="/" class="navbar-brand logo">C</a>
                  	</div>
                  	<nav class="collapse navbar-collapse" role="navigation">
                    <div class="navbar-form navbar-left">
                        <div class="input-group input-group-sm" style="max-width:360px;">
                          <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
                          <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
                    </div>
                    <ul class="nav navbar-nav">
                      <li>
                        <a href="#"><i class="glyphicon glyphicon-home"></i> Home</a>
                      </li>
                      <li>
                        <a href="#postModal" role="button" data-toggle="modal"><i class="glyphicon glyphicon-plus"></i> Post</a>
                      </li>
                      <li>
                        <a href="#"><span class="badge">Profile:User</span></a>
                      </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-marginright">
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i></a>
                        <ul class="dropdown-menu">
                          <li><a href="#">Blogs</a></li>
                          <li><a href="#">Events</a></li>
                          <li><a href="#">Profile</a></li>
                          <li><a href="#">Settings</a></li>
                          <li><a href="#s">LogOut</a></li>
                        </ul>
                      </li>
                    </ul>
                  	</nav>
                </div>
                <!-- /top nav -->--%>
              
                <div class="padding">
                    <div class="full col-sm-9">
                      <asp:FileUpload ID="fileupldStatus" runat="server" onchange="ShowFile();return false" style="visibility:hidden;" accept="image/jpg"/>
                        
                        <!-- content -->                      
                      	<div class="row">
                          <div class="col-sm-12">
                         <!-- main col left --> 
                         <div class="col-sm-12">
                           <div class="well"> 
                                   <div class="form-horizontal" role="form">
                                    <h4>What's New</h4>
                                     <div class="form-group" style="padding:14px;">
                                      <asp:TextBox ID="txtStatus" TextMode="MultiLine" runat="server" ValidationGroup="vgStatusGrp" CssClass="form-control" placeholder="Update your status"></asp:TextBox>
                                         <asp:RequiredFieldValidator InitialValue="" ID="rfvStatusText" runat="server" Text="" ControlToValidate="txtStatus" ValidationGroup="vgStatusGrp"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Button PostBackUrl="~/User/Default.aspx" runat="server" ValidationGroup="vgStatusGrp" ID="btnPost" OnClick="btnPost_Click" CssClass="btn btn-primary pull-right" Text="Post" type="button"></asp:Button>
                                   <ul class="list-inline">
                                   <li><a class="onmousehover" onclick="runFileUpload();return false"><i class="glyphicon glyphicon-camera"></i></a></li>
                                       <li><asp:Label ID="lblFileUploadState" runat="server" style="visibility:hidden;position:fixed"></asp:Label></li>
                                       <li><asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="fileupldStatus" ErrorMessage="Only JPEG images are allowed" 
                            ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])$)" Display="Dynamic"/></li>
                                       <li><span><img id="image_upload_preview" src="http://placehold.it/100x100" class="img-thumbnail" height="100" width="100" style="display:none"  /><i class="glyphicon glyphicon-remove onmousehover" id="RemoveUploadedFile" onclick="RemoveFile(); return false" style="color:red;display:none;top:33px;left:-13px"></i></span></li>
                                       
                                  </ul>
                                  </div>
                              </div></div>
                             <div class="col-sm-6">
                                    <asp:Repeater ID="rptrLatestEvent" runat="server">
                                    <ItemTemplate>
                               <div class="panel panel-default">
                                 <div class="panel-heading"><i class="pull-right"><small><a href="Events.aspx">View All</a></small></i><h4><asp:Label runat="server" ID="lblEventName" Text='<%# Eval("EventName") %>'></asp:Label></h4></div>
                                  <div class="panel-body">
                                      <small>
                                    <p class="text-muted">Event On:<asp:Label Text='<%#Eval("EventOccurenceDate") %>' ID="lblEventOccurenceOn" runat="server"></asp:Label></p>
                                    <p class="text-muted">Event Created On:<asp:Label Text='<%#Eval("EventCreateDate") %>' ID="lblEventCreateDate" runat="server"></asp:Label></p>
                                      </small>
                                    <div class="clearfix"></div>
                                    <hr>                                 
                                      <asp:Label ID="lblEventDetails" runat="server" Text='<% #Eval("EventDetails") %>'></asp:Label>
                                  </div>
                               </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                 </div>
                            <div class="col-sm-6">
                               <asp:Repeater ID="rptrLatestBlog" runat="server">
                                    <ItemTemplate>
                               <div class="panel panel-default">
                                 <div class="panel-heading"><i class="pull-right"><small><a href="Blogs.aspx">View All</a> </small></i><h4><asp:Label runat="server" ID="lblBlogName" Text='<%# Eval("BlogName") %>'></asp:Label></h4></div>
                                  <div class="panel-body">
                                      <small>
                                    <p><a href="#">Blog Created On:<asp:Label Text='<%#Eval("BlogDate") %>' ID="lblBlogCreateDate" runat="server"></asp:Label></a></p>
                                      </small>
                                    <div class="clearfix"></div>
                                    <hr>                                 
                                      <asp:Label ID="lblBlogText" runat="server" Text='<% #Eval("BlogText") %>'></asp:Label>
                                  </div>
                               </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                             </div>
                             
                              
                             <asp:UpdatePanel ID="updtePnlRptr" runat="server" UpdateMode="Conditional">
                                 <ContentTemplate>
                             <asp:Repeater ID="rptrStatus" runat="server" OnItemCommand="rptrStatus_ItemCommand" >
                                 <ItemTemplate>
                                     <div class="col-sm-12">
                                         <div class="panel panel-default">
                                             <div class="panel-heading">
                                                 <asp:Button class="pull-right" ID="btnPostDel" runat="server" Visible="false" CommandName="Delete" Style="margin-bottom: 2px; color: gray; font-weight: 200; background-color: transparent; border: none" Text="Delete" Font-Size="Small"></asp:Button>
                                                 <asp:Panel ID="pnlAfterDel" runat="server" Visible="false">
                                                     <i class="glyphicon glyphicon-ok pull-right" style="color: #00cc00;" runat="server" id="greencheck"></i>
                                                     <asp:Button class="pull-right" ID="btnYes" runat="server" Visible="" CommandName="ConfirmDelete" Style="margin-bottom: 2px; color: gray; font-weight: 200; background-color: transparent; border: none" Text="Yes" Font-Size="Small"></asp:Button>
                                                     <i class="glyphicon glyphicon-remove pull-right" style="color: red;" runat="server" id="redcross" />
                                                     <asp:Button class="pull-right" ID="btnNo" runat="server" Visible="" CommandName="ConfirmCancel" Style="margin-bottom: 2px; color: gray; font-weight: 200; background-color: transparent; border: none" Text="No" Font-Size="Small"></asp:Button>
                                                 </asp:Panel>
                                                 <h4 style="margin-bottom: 2px"><a href="Profile.aspx?Profileid=<%# Eval("UserID")%>">
                                                     <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>&nbsp;Posted</a></h4>
                                                 <small style="font-size: 12px">
                                                     <asp:Label ID="lblPostedOn" runat="server" ForeColor="#A89F9F" Text='<%# Eval("PostedOn", "{0:d MMM yy}") %>'></asp:Label></small>
                                             </div>
                                             <div class="panel-body">
                                                 <asp:Label runat="server" ID="lblStatusText" Text='<%#Eval("Status") %>'></asp:Label>
                                                 <asp:Panel Visible="false" ID="plceholderbr" runat="server">
                                                     <br />
                                                 </asp:Panel>
                                                 <a href='<%# "ImageHandle.ashx?Id=" + Eval("StatusID") %>' data-lightbox='image-<%#Eval("StatusID") %>' data-title="Uploaded Photo">
                                                     <asp:Image ID="imgStatus" runat="server" CssClass="img-responsive" AlternateText="" Visible="false" ImageUrl='<%# "ImageHandle.ashx?Id=" + Eval("StatusID") %>' /></a>
                                                 <asp:Label ID="lblStatusID" runat="server" Style="visibility: hidden" Text='<%#Eval("StatusID") %>'></asp:Label>
                                                 <hr style="margin-bottom: 3px">
                                                 <small>
                                                     <asp:Label ID="lblLikeCount" runat="server" Text='<%#Eval("LikesCount")%>'></asp:Label>&nbsp;Likes</small>
                                                 <div class="input-group">
                                                     <div class="input-group-btn">
                                                         <asp:Button class="btn btn-default" ID="btnStatusThumbsup" runat="server" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" CommandName="Select" Text="+1"></asp:Button>
                                                         <asp:LinkButton runat="server" CommandName="InsertComment" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" ValidationGroup="vgComment" ID="btnComment" class="btn btn-default"><i class="glyphicon glyphicon-comment"></i></asp:LinkButton>
                                                     </div>
                                                     <asp:TextBox ID="txtComment" runat="server" CssClass="form-control" ValidationGroup="vgComment" placeholder="Add a comment.." AutoPostBack="false" ViewStateMode="Enabled" />
                                                     <%--<asp:RequiredFieldValidator ID="rfvComments" ValidationGroup="vgComment" runat="server" ControlToValidate="txtComment" InitialValue="" Text="" Display="Dynamic" ></asp:RequiredFieldValidator>--%>
                                                 </div>
                                                 <div class="clearfix">
                                                     <asp:Panel ID="pnlComments" runat="server" ScrollBars="Auto" Style="width: 100%; max-height: 200px" CssClass="panel panel-body" Visible="false">

                                                         <%--Repeater Comments--%>

                                                         <asp:Repeater ID="rptrComments" runat="server" OnItemCommand="rptrComments_ItemCommand">
                                                             <ItemTemplate>
                                                                 <table style="width: 100%" class="table-responsive">
                                                                     <tr>
                                                                         <td rowspan="2" style="width: 10%">
                                                                             <a href='ImageHandle.ashx?pEmail=<%# Eval("UserEmail")%>' data-lightbox="image-2" data-title="Profile Photo">
                                                                                 <img class="col-md-1 img-circle" style="margin: 0px; height: 50px" onerror="this.src='http://lorempixel.com/140/140/'" id="imgProfile" src='ImageHandle.ashx?pEmail=<%# Eval("UserEmail").ToString()%>' />
                                                                                 <asp:HiddenField ID="hdnfldCommentID" runat="server" Value='<%#Eval("ID") %>' /></td>
                                                                         <td>
                                                                             <a href="Profile.aspx?Profileid=<%# Eval("UserID")%>">
                                                                                 <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' class="pull-left"></asp:Label>&nbsp;Commented:</a><asp:Label ID="lblCommentPostDate" runat="server" class="pull-right" Text='<%#Eval("DateAndTime","{0:d MMM yy}") %>'></asp:Label>
                                                                         </td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>
                                                                             <table style="width: 100%">
                                                                                 <tr>
                                                                                     <td style="width: 80%">
                                                                                         <asp:Label ID="lblComments" CssClass="pull-left" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                                                     </td>
                                                                                     <td>
                                                                                         <asp:Button class="pull-right" ID="btnPostDelComment" runat="server" CommandName="DeleteComment" Visible="false" Style="margin-bottom: 2px; color: gray; font-weight: 200; background-color: transparent; border: none" Text="Delete" Font-Size="Small"></asp:Button>
                                                                                         <asp:Panel ID="pnlAfterDelComment" runat="server" Visible="false">
                                                                                             <i class="glyphicon glyphicon-ok pull-right" style="color: #00cc00;" runat="server" id="greencheck"></i>
                                                                                             <asp:Button class="pull-right" ID="btnYesCommentDel" runat="server" CommandName="ConfirmDeleteComment" Style="margin-bottom: 2px; color: gray; font-weight: 200; background-color: transparent; border: none" Text="Yes" Font-Size="Small"></asp:Button>
                                                                                             <i class="glyphicon glyphicon-remove pull-right" style="color: red;" runat="server" id="redcross" />
                                                                                             <asp:Button class="pull-right" ID="btnNoComment" runat="server" CommandName="ConfirmCancelComment" Style="margin-bottom: 2px; color: gray; font-weight: 200; background-color: transparent; border: none" Text="No" Font-Size="Small"></asp:Button>
                                                                                         </asp:Panel>
                                                                                     </td>
                                                                                 </tr>
                                                                             </table>

                                                                         </td>
                                                                     </tr>
                                                                     <tr>
                                                                 </table>

                                                                 <hr />
                                                             </ItemTemplate>
                                                         </asp:Repeater>
                                                         <%--<table class="table table-responsive" style="border:none">
                                             <tr>
                                             <td align="center" style="border:none">
                                                    <asp:Button Font-Bold="false" Font-Size="X-Small" ID="btnLoadMoreComments" runat="server" Text="Load More Comments"
                                                      CssClass="btn btn-toolbar" style="background-color:transparent;color:#3b5999;font-weight:600" />
                                                    </td>
                                                    </tr>
                                         </table>--%>
                                                     </asp:Panel>
                                                 </div>
                                             </div>
                                         </div>
                                         </div>
                                 </ItemTemplate>
                             </asp:Repeater>
        
                        <table class="table table-responsive" style="border:none">
                             <tr>
    <td align="center" colspan="5" style="border:none">
        <asp:Button ID="btnLoadMore" runat="server" Text="Load More Updates"
            onclick="btnLoadMore_Click" CssClass="btn btn-toolbar" style="background-color:transparent;color:#3b5999;font-weight:600" />
            </td>
            </tr>
    </table>

    </ContentTemplate>   
        </asp:UpdatePanel>    
                              

                           
                             <%-- <div id="featured" class="panel panel-default">
                                <div class="panel-heading"> <h4>Bootstrap Examples</h4></div>
                                  <div class="panel-body">
                                    <div class="list-group">
                                      <a href="http://bootply.com/tagged/modal" class="list-group-item">Modal / Dialog</a>
                                      <a href="http://bootply.com/tagged/datetime" class="list-group-item">Datetime Examples</a>
                                      <a href="http://bootply.com/tagged/datatable" class="list-group-item">Data Grids</a>
                                    </div>
                                  </div>
                              </div>--%>
                           
                              <%--<div class="well"> 
                                   <form class="form-horizontal" role="form">
                                    <h4>What's New</h4>
                                     <div class="form-group" style="padding:14px;">
                                      <textarea class="form-control" placeholder="Update your status"></textarea>
                                    </div>
                                    <button class="btn btn-primary pull-right" type="button">Post</button><ul class="list-inline"><li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
                                  </form>
                              </div>--%>
                           
<%--                              <div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>More Templates</h4></div>
                                  <div class="panel-body">
                                    <img src="http://localhost:4077/placehold.it/150x150" class="img-circle pull-right"> <a href="#">Free @Bootply</a>
                                    <div class="clearfix"></div>
                                    There a load of new free Bootstrap 3 ready templates at Bootply. All of these templates are free and don't require extensive customization to the Bootstrap baseline.
                                    <hr>
                                    <ul class="list-unstyled"><li><a href="http://www.bootply.com/templates">Dashboard</a></li><li><a href="http://www.bootply.com/templates">Darkside</a></li><li><a href="http://www.bootply.com/templates">Greenfield</a></li></ul>
                                  </div>
                              </div>
                           
                              <div class="panel panel-default">
                                <div class="panel-heading"><h4>What Is Bootstrap?</h4></div>
                               	<div class="panel-body">
                                	Bootstrap is front end frameworkto build custom web applications that are fast, responsive &amp; intuitive. It consist of CSS and HTML for typography, forms, buttons, tables, grids, and navigation along with custom-built jQuery plug-ins and support for responsive layouts. With dozens of reusable components for navigation, pagination, labels, alerts etc..                          </div>
                              </div>--%>
                          
                          <!-- main col right -->
                          <%--<div class="col-sm-6">
                               
                                <div class="well" style="display:none"> 
                                   <div class="form">
                                    <h4>Sign-up</h4>
                                    <div class="input-group text-center">
                                    <input type="text" class="form-control input-lg" placeholder="Enter your email address">
                                      <span class="input-group-btn"><button class="btn btn-lg btn-primary" type="button">OK</button></span>
                                    </div>
                                  </div>
                                </div>
                      
                               <div class="panel panel-default">
                                 <div class="panel-heading"><a href="Events.aspx" class="pull-right">View all</a> <h4>Latest Events</h4></div>
                                  <div class="panel-body">
                                    <p><a href="#"><asp:Label Text="Demo Text" ID="lblEventText" runat="server"></asp:Label></a></p>
                                    <div class="clearfix"></div>
                                    <hr>
                                    Design, build, test, and prototype using Bootstrap in real-time from your Web browser. Bootply combines the power of hand-coded HTML, CSS and JavaScript with the benefits of responsive design using Bootstrap. Find and showcase Bootstrap-ready snippets in the 100% free Bootply.com code repository.
                                  </div>
                               </div>
                            
                               <div class="panel panel-default">
                                 <div class="panel-heading"><a href="Blogs.aspx" class="pull-right">View all</a> <h4>Latest Blogs</h4></div>
                                  <div class="panel-body">
                                    <a href="#">Keyword: Bootstrap</a>
                                    <div class="clearfix"></div>
                                    <hr>
                                    <p>If you're looking for help with Bootstrap code, the <code>twitter-bootstrap</code> tag at <a href="http://stackoverflow.com/questions/tagged/twitter-bootstrap">Stackoverflow</a> is a good place to find answers.</p>
                                    <hr>
                                    <form>
                                    <div class="input-group">
                                      <div class="input-group-btn">
                                      <asp:Button class="btn btn-default" ID="btnThumbsup" runat="server" OnClientClick="SetLike();return false" Text="+1"></asp:Button><button class="btn btn-default"><i class="glyphicon glyphicon-share"></i></button>
                                      </div>
                                      <asp:TextBox ID="txtComment" runat="server"  CssClass="form-control" placeholder="Add a comment.."/>
                                    </div>
              
                                    </form>
                                  </div>
                               </div>

                               <%--<div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Portlet Heading</h4></div>
                                  <div class="panel-body">
                                    <ul class="list-group">
                                    <li class="list-group-item">Modals</li>
                                    <li class="list-group-item">Sliders / Carousel</li>
                                    <li class="list-group-item">Thumbnails</li>
                                    </ul>
                                  </div>
                               </div>
                            
                               <div class="panel panel-default">
                                <div class="panel-thumbnail"><img src="/assets/example/bg_4.jpg" class="img-responsive"></div>
                                <div class="panel-body">
                                  <p class="lead">Social Good</p>
                                  <p>1,200 Followers, 83 Posts</p>
                                  
                                  <p>
                                    <img src="https://lh6.googleusercontent.com/-5cTTMHjjnzs/AAAAAAAAAAI/AAAAAAAAAFk/vgza68M4p2s/s28-c-k-no/photo.jpg" width="28px" height="28px">
                                    <img src="https://lh4.googleusercontent.com/-6aFMDiaLg5M/AAAAAAAAAAI/AAAAAAAABdM/XjnG8z60Ug0/s28-c-k-no/photo.jpg" width="28px" height="28px">
                                    <img src="https://lh4.googleusercontent.com/-9Yw2jNffJlE/AAAAAAAAAAI/AAAAAAAAAAA/u3WcFXvK-g8/s28-c-k-no/photo.jpg" width="28px" height="28px">
                                  </p>
                                </div>
                              </div>
                            
                          </div>--%>
                             </div>
                       </div><!--/row-->
                      
                        <div class="row">
                          <div class="col-sm-6">
                            <a href="#">Twitter</a> <small class="text-muted">|</small> <a href="#">Facebook</a> <small class="text-muted">|</small> <a href="#">Google+</a>
                          </div>
                        </div>
                      
                        <div class="row" id="footer">    
                          <div class="col-sm-6">
                            
                          </div>
                          <div class="col-sm-6">
                            <p>
                            <a href="#" class="pull-right">©Copyright 2016</a>
                            </p>
                          </div>
                        </div>
                      
                      <hr>
                      
                      <h4 class="text-center">
                      <a href="#" target="ext">Brought to You by CorpAllied</a>
                      </h4>
                        
                      <hr>
                        
                      
                    </div><!-- /col-9 -->
                </div><!-- /padding -->
         <%--  <div align="right">
         <a href="javascript:;" id="scrollToTop">&#x25B2;</a>
               <a href="#main" id="scrollToTop">&#x25B2;</a>
    </div>--%>
            
    <!--post modal-->
<%--<div id="postModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			Update Status
      </div>
      <div class="modal-body">
          <div class="form center-block">
            <div class="form-group">
              <textarea class="form-control input-lg" autofocus="autofocus" placeholder="What do you want to share?"></textarea>
            </div>
          </div>
      </div>
      <div class="modal-footer">
          <div>
          <button class="btn btn-primary btn-sm" data-dismiss="modal" aria-hidden="true">Post</button>
            <ul class="pull-left list-inline">
            <li><a href="#"><i class="glyphicon glyphicon-upload"></i></a></li>
            <li><a href="#"><i class="glyphicon glyphicon-camera"></i></a></li>
            </ul>
		  </div>	
      </div>
  </div>
  </div>
     
</div>--%>

   <script src="../js/lightbox-plus-jquery.js"></script>
</asp:Content>
