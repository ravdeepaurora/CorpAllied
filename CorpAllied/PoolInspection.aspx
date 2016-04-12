<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PoolInspection.aspx.cs" Inherits="CorpAllied.PoolInspection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Table runat="server" ID="table1">
        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Date
                </span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Pool
                </span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPool" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>Inspected By</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtInspectedBy" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <span>Please select from the following options</span>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>
                Area around pool clean?
                </span><br />
                <asp:RadioButtonList ID="rdobtn1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment1" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Furniture clean & in good repair?</span><br />
                  <asp:RadioButtonList ID="rdobtn2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment2" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Deck clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="rdobtn3" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment3" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Shepherds hook &  life rings present?</span><br />
                  <asp:RadioButtonList ID="rdobtn4" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment4" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>
                Landscaping maintained?
                </span><br />
                <asp:RadioButtonList ID="rdobtn5" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment5" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                 Depth markers visible?</span><br />
                  <asp:RadioButtonList ID="rdobtn6" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment6" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>
                Pool signage present & in good condition?
                </span><br />
                <asp:RadioButtonList ID="rdobtn7" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment7" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>No diving signs visible?</span><br />
                  <asp:RadioButtonList ID="rdobtn8" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment8" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
            Walk around outside of fence?
                </span><br />
                <asp:RadioButtonList ID="rdobtn9" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment9" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Ladders secure?
                </span><br />
                  <asp:RadioButtonList ID="rdobtn10" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment10" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Grounds free of debris?
                </span><br />
                <asp:RadioButtonList ID="rdobtn11" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment11" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Bathrooms clean?</span><br />
                  <asp:RadioButtonList ID="rdobtn12" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment12" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Fencing in good condition?
                </span><br />
                <asp:RadioButtonList ID="rdobtn13" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment13" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Bathroom Paper products stocked?</span><br />
                  <asp:RadioButtonList ID="rdobtn14" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment14" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Gates self closing and self latching?
                </span><br />
                <asp:RadioButtonList ID="rdobtn15" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment15" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Bathroom garbage cans clean & empty?</span><br />
                  <asp:RadioButtonList ID="rdobtn16" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment16" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Inside pool lighting operational?
                </span><br />
                <asp:RadioButtonList ID="rdobtn17" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment17" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Pool bar storage areas locked?</span><br />
                  <asp:RadioButtonList ID="rdobtn18" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment18" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Pool pump equipment secured?
                </span><br />
                <asp:RadioButtonList ID="rdobtn19" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment19" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Pool & Spa water clean & clear?</span><br />
                  <asp:RadioButtonList ID="rdobtn20" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment20" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
           Spa rules signs present?
                </span><br />
                <asp:RadioButtonList ID="rdobtn21" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment21" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Emergency Phone working?</span><br />
                  <asp:RadioButtonList ID="rdobtn22" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment22" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Trash containers present & clean?
                </span><br />
                <asp:RadioButtonList ID="rdobtn23" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment23" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Jacuzzi Clock working?</span><br />
                  <asp:RadioButtonList ID="rdobtn24" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment24" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
             Overhead lighting working?
                </span><br />
                <asp:RadioButtonList ID="rdobtn25" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment25" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>ADA Pool Lift Operational?</span><br />
                  <asp:RadioButtonList ID="rdobtn26" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment26" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <span>
                Umbrellas stands secured to base?
                </span><br />
                <asp:RadioButtonList ID="rdobtn27" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="2">
                    <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment27" runat="server"></asp:TextBox>
            </asp:TableCell>
           
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
    </form>
</body>
</html>
