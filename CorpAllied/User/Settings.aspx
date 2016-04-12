<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="CorpAllied.User.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="../css/SettingsCSS.css" rel="stylesheet" />
    <link href="../css/lightbox.min.css" rel="stylesheet" />
      <script type="text/javascript">
          function OpenFiledialog() {
              document.getElementById('<%= fileuploadProfilePic.ClientID %>').click();

          }
          function ShowFile() {
              var Filename = document.getElementById("<%=fileuploadProfilePic.ClientID %>").value;
//              if (Filename.contains(".jpg") || Filename.contains(".JPG")) {
//                  readURL(<%=fileuploadProfilePic.ClientID %>);
//                document.getElementById("<%=fileuploadProfilePic.ClientID%>").innerHTML = Filename;
//                var img = document.getElementById('image_upload_preview');
//                img.style.display = "inline";
//                var uploadbtn=document.getElementById('<%= btnUploadProfilePic.ClientID %>');
//                uploadbtn.disabled = false;
//                uploadbtn.value = "Upload Photo";
 //               uploadbtn.className = "btn btn-primary center-block";
              //          }
              if ((Filename.indexOf('.jpg') > -1) || (Filename.indexOf('.JPG') > -1)) {
                  readURL(<%=fileuploadProfilePic.ClientID %>);
                                  document.getElementById("<%=fileuploadProfilePic.ClientID%>").innerHTML = Filename;
                                  var img = document.getElementById('image_upload_preview');
                                  img.style.display = "inline";
                                  var uploadbtn=document.getElementById('<%= btnUploadProfilePic.ClientID %>');
                                  uploadbtn.disabled = false;
                                  uploadbtn.value = "Upload Photo";
                                 uploadbtn.className = "btn btn-primary center-block";
               }
            else {
                document.getElementById("<%=fileuploadProfilePic.ClientID %>").value = null;
                var img = document.getElementById('image_upload_preview');
            }
          }
          function readURL(input) {
              if (input.files && input.files[0]) {
                  var reader = new FileReader();

                  reader.onload = function (e) {
                      $('#image_upload_preview').attr('src', e.target.result);
                               }
                  reader.readAsDataURL(input.files[0]);
              }
          }
</script>
</asp:Content>
                                    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full col-sm-12">
                          <div class="row">
                            <div class="col-sm-4">
                                 <div class="panel panel-default">
                                 <div class="panel-heading"><h4>Change Profile Pic</h4></div>
                                 <div class="panel-body">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="registrationform">
                                 <div class="form-horizontal">
                                 <div class="form-group">
                                     <asp:FileUpload ID="fileuploadProfilePic" runat="server" style="display:none" onchange="ShowFile();return false" accept="image/*" />
                                     <%--<div class="col-lg-3"></div>
                                     <div class="col-lg-9">--%>
                                 <div class="show-image">
                                     <%--'<%# "ImageHandle.ashx?Id=" + Eval("StatusID") %>'--%>
                                 <a href='ImageHandle.ashx?pEmail=<%=Session["Username"].ToString()%>' onerror="this.src='~/img/camera.png'" data-lightbox="image-1" data-title="Profile Photo"><img src='ImageHandle.ashx?pEmail=<%=Session["Username"].ToString()%>' onerror="this.src='~/img/camera.png'" class="img-responsive center-block" style="width:206px;height:206px" id="image_upload_preview" /></a>
                                 <input class="update" type="button" value="New" onclick="OpenFiledialog()" />
                                 </div>
                                 <asp:Button ID="btnUploadProfilePic" runat="server" OnClick="btnUploadProfilePic_Click" Text="Upload Photo" CssClass="btn btn-primary center-block" />                                        
                                 </div>
                                 </div>
                                 </div>
                                 </div>                              
                                 </div>
                                 </div>
                                </div>
                               
                              <div class="col-sm-4">
                                 <div class="panel panel-default">
                                 <div class="panel-heading"><h4>Change Password</h4></div>
                                 <div class="panel-body">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="registrationform">
                                 <div class="form-horizontal">
                                 <div class="form-group">
                                 <asp:Label ID="lblOldPassword" runat="server" Text="Current Password" CssClass="col-lg-3 control-label">
                                 <asp:RequiredFieldValidator ValidationGroup="vgUpdatePassword" ID="rfvOldPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOldPassword" InitialValue="" Visible="true" Text="*" /></asp:Label>
                                 <div class="col-lg-9">
                                 <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" placeholder="Current Password" CssClass="form-control"></asp:TextBox>
                                 </div>
                                 </div>
                                 <div class="form-group" >
                                 <asp:Label ToolTip="Password Should be of 7 to 15 AlphaNumeric Characters only" ID="lblNewPassword" runat="server" Text="New Password" CssClass="col-lg-3 control-label">
                                 <asp:RequiredFieldValidator ToolTip="Password Should be of 7 to 15 AlphaNumeric Characters only" ValidationGroup="vgUpdatePassword" ID="rfvNewPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPassword" InitialValue="" Visible="true" Text="*" />
                                 <asp:RegularExpressionValidator ToolTip="Password Should be of 7 to 15 AlphaNumeric Characters only" ValidationGroup="vgUpdatePassword" ID="revNewPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPassword" ValidationExpression="[a-zA-Z0-9]{7,15}" Text="*"></asp:RegularExpressionValidator>
                                 </asp:Label>
                                 <div class="col-lg-9">
                                 <asp:TextBox ToolTip="Password Should be of 7 to 15 AlphaNumeric Characters only" ID="txtNewPassword" TextMode="Password" runat="server" placeholder="New Password" CssClass="form-control"></asp:TextBox>
                                 </div>
                                 </div>
                                 <div class="form-group">
                                 <asp:Label ID="lblReNewPassword" runat="server" Text="Repeat Password" CssClass="col-lg-3 control-label" ToolTip="Enter Same Password">
                                 <asp:RequiredFieldValidator ToolTip="Enter Same Password" ValidationGroup="vgUpdatePassword" ID="rfvReNewPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtRePassword" InitialValue="" Visible="true" Text="*" />
                                 <asp:CompareValidator ToolTip="Enter Same Password" runat="server" ValidationGroup="vgUpdatePassword" ID="cvReNewPassword" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" Text="*" Operator="Equal" Type="String"></asp:CompareValidator>
                                 </asp:Label>
                                 <div class="col-lg-9">
                                 <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server" placeholder="Repeat Password" CssClass="form-control" ToolTip="Enter Same Password"></asp:TextBox>
                                 </div>
                                 </div>
                                 <div class="form-group">
                                 <div class="col-lg-12 col-lg-offset-3">
                                     <br />
                                 <asp:Button ID="btnUpdatePassword" ValidationGroup="vgUpdatePassword" runat="server" CssClass="btn btn-primary" OnClick="btnUpdatePassword_Click" Text="Update" CausesValidation="true" />                        
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>                               
                                 </div>

                              <div class="col-sm-4">
                                 <div class="panel panel-default">
                                 <div class="panel-heading"><h4>Update Secondary Email</h4></div>
                                 <div class="panel-body">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="registrationform">
                                 <div class="form-horizontal">
                                 <div class="form-group">
                                 <asp:Label ID="lblOldEmail" runat="server" Text="Current Email" CssClass="col-lg-3 control-label">
                                 <asp:RequiredFieldValidator ValidationGroup="vgUpdateEmail" ID="rfvCurrentEmail" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOldEmail" InitialValue="" Visible="true" Text="*" /></asp:Label>
                                 <div class="col-lg-9">
                                 <asp:TextBox ID="txtOldEmail" TextMode="Email" runat="server" placeholder="Primary Email" CssClass="form-control"></asp:TextBox>
                                 </div>
                                 </div>
                                 <div class="form-group">
                                 <asp:Label ID="lblNewEmail" runat="server" Text="New Email" CssClass="col-lg-3 control-label">
                                 <asp:RequiredFieldValidator ValidationGroup="vgUpdateEmail" ID="rfvNewEmail" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewEmail" InitialValue="" Visible="true" Text="*" /></asp:Label>
                                 <div class="col-lg-9">
                                 <asp:TextBox ID="txtNewEmail" TextMode="Email" runat="server" placeholder="New Email" CssClass="form-control"></asp:TextBox>
                                 </div>
                                 </div>
                                 <div class="form-group">
                                 <asp:Label ID="lblCurrentPassword" runat="server" Text="Current Password" CssClass="col-lg-3 control-label">
                                 <asp:RequiredFieldValidator ValidationGroup="vgUpdateEmail" ID="rfvCurrentPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCurrentPassword" InitialValue="" Visible="true" Text="*" />&nbsp;</asp:Label>
                                 <div class="col-lg-9">
                                 <asp:TextBox ID="txtCurrentPassword" TextMode="Password" runat="server" placeholder="Current Password" CssClass="form-control"></asp:TextBox>
                                 </div>
                                 </div>
                                 <div class="form-group">
                                 <div class="col-lg-12 col-lg-offset-3">
                                     <br />
                                 <asp:Button ID="btnUpdateEmail" ValidationGroup="vgUpdateEmail" runat="server" CssClass="btn btn-primary" OnClick="btnUpdateEmail_Click" Text="Update" CausesValidation="true" />                        
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>                               
                                 </div>
                                 </div>
                              </div>
    <script src="../js/lightbox-plus-jquery.js"></script>
</asp:Content>
