<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CorpAllied.Login" %>

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
    <title>Login Here!</title>
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
                    Login<strong> Here</strong></h1>
                <h5>
                    <strong>CorpAllied.com</strong></h5>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Credentials <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblUsername" runat="server" Text="UserName" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtUserName" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtUserName" TextMode="Email" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtPassword" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control"
                                    TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblProfile" runat="server" Text="Profile" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                            <div class="radio">
                                <label>
                               <asp:RadioButtonList runat="server" ID="rdoLoginProfile">
                                <asp:ListItem Text="User" Selected="True" Value="User"></asp:ListItem>
                                <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                                </asp:RadioButtonList>
                                </label>
                            </div>
                        </div>
                            </div>
                         <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" /> &nbsp&nbsp
                                <asp:LinkButton ID="lnkbtnForgetPassword" CausesValidation="false" runat="server" OnClick="lnkbtnForgetPassword_Click" Text="Forgot Password" CssClass="btn btn-warning"></asp:LinkButton>                       
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <label>
                               <asp:Label runat="server" ID="lblError" ToolTip="Verify Credentials" Text="Incorrect Username\Password or Account not Active " ForeColor="White"></asp:Label>                       
                            </label>
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
