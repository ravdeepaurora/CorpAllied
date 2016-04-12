<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuildingInspection.aspx.cs" Inherits="CorpAllied.BuildingInspection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Table runat="server" ID="tbl">
        <asp:TableRow>
            <asp:TableCell>
                <span>Date</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Building No.</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtBuildingNumber" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>Inspected By</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtInspectedBy" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>Work Order</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtWorkOrder" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
        <span>Select the following options</span>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Parking lot clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList0" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox0" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Building signage clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList1" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Landscaping maintained?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList2" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Exterior of building clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList3" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Walk around entire building?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList4" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                   Exterior grounds free of debris?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList5" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Exterior screens clean and in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList6" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    A/C units clean and in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList7" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Electrical boxes & panels closed & secured?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList8" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Raised sidewalks?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList9" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Emergency lights working?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList10" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Room directional signs present?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList11" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Room numbers signs present?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList12" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Emergency exit signs present?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList13" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Hallways clean and in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList14" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Walkaways clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList15" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Entrance ways clean and in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList16" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Globe lights clean and in good condition(Paint Needed)?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList17" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                   Fire Extinguisher present & current?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList18" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Fire pull stations in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList19" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Dryer vents clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList20" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Welcome mats present & clean?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList21" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Stairwells clean and in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList22" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Stairwell lights on during night time?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList23" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Elevator phone working?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList24" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Elevator clean and in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList25" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                  Trash bins present?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList26" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                   Posters in elevators?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList27" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Guest laundry room clean?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList28" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                    Luggage carts clean & in good condition?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList29" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Fire Valves clear?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList30" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                   Electrical room clear?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList31" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Boiler room clear?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList32" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <span>
                   Storage rooms clean, organised & secured?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList33" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <span>
                    Laundry Chutes closed?
                </span><br />
                <asp:RadioButtonList ID="RadioButtonList34" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
    
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <span>Any other areas needing attention</span>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="txtTextArea" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" OnClick="btnSubmit_UpdateClick" />
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
