<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CorpAllied.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8" content="" />
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template"/>
    <title>Register Here!</title>
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
                    <li><a href="Login.aspx">Login</a> </li>
                    <li><a href="#">About Us</a> </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <h1>
                    CorpAllied <strong>Registration Portal </strong>for Students/Company</h1>
                <h5>
                    <strong>CorpAllied.com</strong></h5>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Registration Form <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                                <asp:Label ID="lblStatus" Visible="false" runat="server" CssClass="control-label col-lg-12" Text="Email Already Registered! Redirecting..." ForeColor="White" Font-Bold="true" Font-Underline="true"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="col-lg-2 control-label">
                                <asp:RegularExpressionValidator runat="server" ID="revFirstName" Text="*" ControlToValidate="txtFirstName" ForeColor="Red" Display="Dynamic" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFirstName" InitialValue="" Visible="true" Text="*" /></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtFirstName" TextMode="SingleLine" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                          </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="Last Name" CssClass="col-lg-2 control-label">
                                <asp:RegularExpressionValidator runat="server" ID="revLastName" Text="*" ControlToValidate="txtLastName" ForeColor="Red" Display="Dynamic" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtLastName" InitialValue="" Visible="true" Text="*" Display="Dynamic" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtLastName" TextMode="SingleLine" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="col-lg-offset-0" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="col-lg-2 control-label">
                                <asp:RegularExpressionValidator runat="server" ID="revPassword" Text="*" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" ValidationExpression="[a-zA-Z0-9]{7,15}"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPassword" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control"
                                    TextMode="Password" ToolTip="Password Should Be of 7 to 15 Characters and AlphaNumeric Only"></asp:TextBox>
                                <%--<div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chckbxRememberMe" runat="server" Text="Remember Me" />
                                    </label>
                                </div>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="col-lg-2 control-label">
                                <asp:CompareValidator ID="cvConfirmPassword" Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" runat="server" Visible="true" Text="*" Operator="Equal" Type="String" />
                            <asp:RequiredFieldValidator ID="rfvConfirmPassword" Display="Dynamic" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtConfirmPassword" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" CssClass="form-control"
                                    TextMode="Password"></asp:TextBox>
                                <%--<div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chckbxRememberMe" runat="server" Text="Remember Me" />
                                    </label>
                                </div>--%>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblSecurityQts" runat="server" Text="Security Question" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:DropDownList ID="ddlSecurityQts" runat="server" CssClass="form-control ddl" DataTextField="SecurityQuestion" DataValueField="ID" >
                                </asp:DropDownList>                              
                            </div>
                        </div>
                          <div class="form-group">
                            <asp:Label ID="lblSecurityAnswer" runat="server" Text="Security Answer" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator ID="rfvSecurityAnswer" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtSecurityAnswer" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtSecurityAnswer" runat="server" placeholder="Security Answer" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="col-lg-2 control-label">
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtAddress" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtAddress" runat="server" ForeColor="Black" TextMode="SingleLine" placeholder="Address" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblContact" runat="server" Text="Mobile" CssClass="col-lg-2 control-label">
                                <asp:RegularExpressionValidator runat="server" ID="revMobile" Text="*" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvContact" runat="server" CssClass="col-lg-offset-0" ForeColor="Red" ControlToValidate="txtMobile" Display="Dynamic" InitialValue="" Visible="true" Text="*" />
                            </asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtMobile" runat="server" placeholder="Mobile" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rdolstGender" runat="server">
                                            <asp:ListItem Value="Male" Text="Male" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblCompanyUser" runat="server" Text="Company or User" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rdolstCompanyUser" runat="server">
                                            <asp:ListItem Value="User" Text="User" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="Company" Text="Company"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:DropDownList ID="ddlCountryList" runat="server" CssClass="form-control ddl">
                                    <asp:ListItem Text="India" Value="India" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
                                    <asp:ListItem Text="UK" Value="UK"></asp:ListItem>
                                </asp:DropDownList>                              
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text="Submit" CausesValidation="true" />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click"  CausesValidation="false"/> <br />                            
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
