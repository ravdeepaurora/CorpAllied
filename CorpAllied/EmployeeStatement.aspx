<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeStatement.aspx.cs" Inherits="CorpAllied.EmployeeStatement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type = "text/javascript">
        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td colspan="2">
               <h1><span>LOGO</span></h1>
            </td>
            <td colspan="2">
                <h2>
                <span>WestGates Resort</span><br />
                <span>Employee Witness Statement</span></h2>
            </td>
            <td colspan="2">
                <asp:CheckBoxList ID="chckbxContractoremployee" runat="server">
                    <asp:ListItem Text="Westgate Employee" Value="wgemployee" onclick="MutExChkList(this);"></asp:ListItem>
                    <asp:ListItem Text="Individual Contractor" Value="individualcontractor" onclick="MutExChkList(this);"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                <span>Incident No.</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtIncidentNo"></asp:TextBox>
            </td>
            <td>
                <span>Property</span>
            </td>
            <td>
                <asp:TextBox ID="txtProperty" runat="server"></asp:TextBox>
            </td>
            <td>
                <span>Location</span>
            </td>
            <td>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               <span>Name</span> 
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtName" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>
                    Address
                </span>
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtAddress" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Home Phone</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtHomePhone" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Personal Email(optional)</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" Width="100%" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Cellular</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCellular" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Text?</span>
            </td>
            <td>
                <asp:CheckBoxList runat="server" ID="chckbxText" RepeatDirection="Horizontal" RepeatColumns="2" RepeatLayout="Flow">
                    <asp:ListItem Text="Yes" Value="Yes" onclick="MutExChkList(this);"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" onclick="MutExChkList(this);"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
            <span>Supervisor's Name</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtSupervisorName" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Department</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtDepartment" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Schedule (Hours)</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtSchedule" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Days OFF</span>
            </td>
            <td colspan="2">
                <asp:CheckBoxList runat="server" ID="chckbxdaysoff" RepeatDirection="Horizontal" RepeatColumns="7" RepeatLayout="Flow">
                    <asp:ListItem Text="Sun" Value="Sun" />
                    <asp:ListItem Text="Mon" Value="Mon" />
                    <asp:ListItem Text="Tue" Value="Tue" />
                    <asp:ListItem Text="Wed" Value="Wed"  />
                    <asp:ListItem Text="Thu" Value="Thu" />
                    <asp:ListItem Text="Fri" Value="Fri" />
                    <asp:ListItem Text="Sat" Value="Sat" />
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align:center;">
                <span>NARRATIVE</span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:TextBox ID="txtNarrative" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align:center">
                <span>I swear/affirm the above statements are true and correct to the best of my knowledge and belief</span>
            </td>
        </tr>
        <tr>
            <td colspan="3">
               <b> Witness</b>
            </td>
            <td colspan="3">
                <b>Officer</b>
            </td>
        </tr>
        <tr >
            <td>
                <span>Printed Name</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtWPrintedName" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>
                <span>Printed Name</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtOPrintedName" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Signature</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtWSign" runat="server" Width="90%"></asp:TextBox>
            </td>
             <td>
                <span>Signature</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtOSign" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span>Date</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtDate" runat="server" Width="90%"></asp:TextBox>
            </td>
             <td>
                <span>Time</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtTime" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
