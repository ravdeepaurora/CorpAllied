<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="CorpAllied.ResetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8" content="" />
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template" />
    <title>Reset Password!</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="Default.aspx">CorpAllied</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Our Services</a> </li>
                    <li><a href="#">Careers</a> </li>
                    <li><a href="Register.aspx">Register</a> </li>
                    <li><a href="#">About Us</a> </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <h1>
                    Reset<strong> Password</strong></h1>
                <h5>
                    <strong>CorpAllied.com</strong></h5>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Verify Details <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblProfile" runat="server" CssClass="col-lg-2 col-xs-3 col-sm-2 col-md-2 control-label" Text="Profile"></asp:Label>
                          <asp:RadioButtonList ID="rdoCompanyorUser" runat="server" CssClass="col-lg-10 col-sm-10 col-md-10 col-xs-8" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Text="User" Value="User"></asp:ListItem>
                              <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                          </asp:RadioButtonList>
                            </div>
                        <div class="form-group">
                            <asp:Label ID="lblUsername" runat="server" Text="Enter Email" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" CssClass="col-lg-offset-0" Display="Dynamic" ForeColor="Red" ControlToValidate="txtUserName" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtUserName" TextMode="Email" runat="server" placeholder="Email" CssClass="form-control" ToolTip="Enter Email & Press Enter To Retrieve Security Qts" AutoPostBack="true" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <asp:Label ID="lblSecurityQts" runat="server" Text="Security Question" CssClass="col-lg-2 control-label"></asp:Label>
                            <asp:Label ID="lblSecurityQtsRetrieved" runat="server" CssClass="col-lg-10 col-xs-10 col-md-10 col-sm-10" Text="Enter Email First"></asp:Label>
                            </div>
                        <div class="form-group">
                            <asp:Label ID="lblSecurityAnswer" runat="server" Text="Security Answer" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvSecurityAnswer" runat="server" CssClass="col-lg-offset-0" ValidationGroup="vgVerifyAnswer" ForeColor="Red" ControlToValidate="txtSecurityAnswer" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtSecurityAnswer" runat="server" placeholder="Answer" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnVerifyAnswer" runat="server" ValidationGroup="vgVerifyAnswer" CssClass="btn btn-warning" Enabled="false" Text="Verify Answer" OnClick="btnVerifyAnswer_Click" />
                                                       
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblNewPassword" runat="server" Text="New Password" CssClass="col-lg-2 control-label">
                                <asp:RegularExpressionValidator Text="*" ForeColor="Red" runat="server" Display="Dynamic" ValidationExpression="[a-zA-z0-9]{7,15}" ControlToValidate="txtNewPassword"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvNewPassword" Display="Dynamic" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtNewPassword" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtNewPassword" Enabled="false" TextMode="Password" runat="server" placeholder="Password" CssClass="form-control" ToolTip="Enter New Password"></asp:TextBox>            
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" Enabled="false" runat="server" Text="Confirm Password" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvConfirmNewPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtConfirmPassword" InitialValue="" Visible="true" Text="*" />
                                <asp:CompareValidator Display="Dynamic" ID="cvConfirmNewPassword" Type="String" Operator="Equal" runat="server" CssClass="col-lg-offset-0" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Text="*"></asp:CompareValidator>
                            </asp:Label>
                            
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtConfirmPassword" Enabled="false" TextMode="Password" runat="server" placeholder="Confirm Password" CssClass="form-control" ToolTip="Confirm New Password"></asp:TextBox>            
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-primary" Text="Reset" Enabled="false" OnClick="btnReset_Click" CausesValidation="true" /> &nbsp;&nbsp;                    
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Label ID="lblStatus" runat="server" ForeColor="White" Visible="false" Text="Success....Redirecting!"></asp:Label>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "img/44.jpg",
            "img/colorful.jpg",
            "img/34.jpg",
            "img/images.jpg"
        ],

        {
            duration: 1500,
            fade: 1500
        }
    );
    </script>
    </form>
</body>
</html>
