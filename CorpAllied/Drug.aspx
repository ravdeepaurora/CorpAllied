<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Drug.aspx.cs" Inherits="CorpAllied.Drug" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:80%">
        <tr>
            <td colspan="6" style="text-align:center">
                <h1>CFI & Westgate Resorts <br />
                Drug & Alcohol Screen Results</h1>
            </td>
        </tr>
        <tr>
            <td colspan="6">
               <u><span> Completed by Employer Representative and Donor</span></u>
            </td>
        </tr>
        <tr>
            <td>
                <span>Employer</span>
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtEmployer" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Address</span>
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtAddress" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>City</span>
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </td>
            <td>
                <span>State</span>
            </td>
            <td>
                <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
            </td>
            <td>
                <span>ZIP</span>
            </td>
            <td>
                <asp:TextBox ID="txtZIP" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Donor Name</span>
            </td>
            <td>
                <asp:TextBox ID="txtDonorName" runat="server"></asp:TextBox>
            </td>
            <td>
                <span>ID Type</span>
            </td>
            <td>
                <asp:TextBox ID="txtIDType" runat="server"></asp:TextBox>
            </td>
            <td>
                <span>Last Four SS#</span>
            </td>
            <td>
                <asp:TextBox ID="txtLast4SS" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Reason for Test</span>
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtReasonforTest" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span>I certify that I am about to provide my oral fluid to the collector.  I will not adulterate my specimen in any manner and the information provided on this form is correct.  I hereby consent to these tests, release and hold harmless the employer.  I give permission for these results to be given to Westgate Team Member Services. </span>
            </td>
        </tr>
        <tr>
            <td>
                <span>Donor's Signature</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtDonorSign" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Date</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtDonorsigndate" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span>I certify that the donor’s identification has been verified.  I certify that I have used the specimen received from the donor and that I have recorded the screening test results of the swap testing devices listed below. </span>
            </td>
        </tr>
        <tr>
            <td>
                <span>Collectors's Signature</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCollectorssign" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Date</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCollectordate" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span>Test Conducted</span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:CheckBox ID="chckbxOratect" runat="server" Value="Oratect" Text="Oratect" />
                    <br />
               <asp:CheckBox runat="server" ID="chckbxALCO" Text="ALCO" Value="ALCO"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Oratect Lot no.</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtOratectLotNo" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Expiration Date</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtOExpirationDate" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>ALCO Lot no.</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtALCOLotNo" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Expiration Date</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtAExpirationDate" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
               <b><u><span>Test Results</span></u></b> 
            </td>
        </tr>
        <tr>
            <td colspan="3">
               <b><u> <span>Negative</span></u></b>
            </td>
            <td colspan="3">
               <b><u><span>Presumptive Positive</span></u></b> 
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:CheckBoxList ID="chckbxTestResultsNeg" runat="server">
                    <asp:ListItem Text="Methampethamines (ME)" Value="NegMethampethamines"></asp:ListItem>
                    <asp:ListItem Text="Cocaine (CO)" Value="NegCocaine"></asp:ListItem>
                    <asp:ListItem Text="Phencyclidine (PC)" Value="NegPhencyclidine"></asp:ListItem>
                    <asp:ListItem Text="Marijuana (TH)" Value="NegMarijuana"></asp:ListItem>
                    <asp:ListItem Text="Amphametamine (AM)" Value="NegAmphametamine"></asp:ListItem>
                    <asp:ListItem Text="Opiate (OP)" Value="NegOpiate"></asp:ListItem>
                    <asp:ListItem Text="Alcohol" Value="NegAlcohol"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td colspan="3">
                <asp:CheckBoxList ID="chckbxTestResultsPos" runat="server">
                    <asp:ListItem Text="Methampethamines (ME)" Value="PosMethampethamines"></asp:ListItem>
                    <asp:ListItem Text="Cocaine (CO)" Value="PosCocaine"></asp:ListItem>
                    <asp:ListItem Text="Phencyclidine (PC)" Value="PosPhencyclidine"></asp:ListItem>
                    <asp:ListItem Text="Marijuana (TH)" Value="PosMarijuana"></asp:ListItem>
                    <asp:ListItem Text="Amphametamine (AM)" Value="PosAmphametamine"></asp:ListItem>
                    <asp:ListItem Text="Opiate (OP)" Value="PosOpiate"></asp:ListItem>
                    <asp:ListItem Text="Alcohol" Value="PosAlcohol"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <b><u><span>Confirmation Test Required</span></u></b>
            </td>
            <td colspan="5">
                <asp:CheckBoxList ID="chckbxConfirmTest" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <small><span> This assay provides preliminary results.  A more specific laboratory test will be conducted with all presumptive positive test results.</span></small>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button runat="server" ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
