<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CorpAllied.Admin.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Panel</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
<link href="../css/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
<link href="../css/sb-admin-2.css" rel="stylesheet" />

    <!-- Custom Fonts -->
<link href="../css/font-awesome.min.css" rel="stylesheet" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" runat="server">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="E-mail" TextMode="Email" autofocus runat="server" ID="txtUsername" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox  CssClass="form-control" placeholder="Password" name="password" TextMode="Password" runat="server" ID="txtPassword" />
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-lg btn-success btn-block" Text="Login" OnClick="btnLogin_Click"></asp:Button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
<script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
<script src="../js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
<script src="../js/sb-admin-2.js"></script>

</body>

</html>
