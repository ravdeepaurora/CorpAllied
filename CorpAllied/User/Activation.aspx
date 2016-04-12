<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Activation.aspx.cs" Inherits="CorpAllied.User.Activation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1><asp:Label ID="lblActivationStatus" runat="server" Text="Activation Successful"></asp:Label></h1>
      <span><h3>
      <span><img src="../img/loading.gif" /></span>You will be Redirected in 5 seconds....If not Redirected <a id="AnchorClickhere" runat="server" href="../Login.aspx">Click Here</a></h3></span>
        
    </div>
    </form>
</body>
</html>
