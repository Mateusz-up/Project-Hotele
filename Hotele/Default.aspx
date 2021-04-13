<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hotele.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="#0000CC" Text="Hotele"></asp:Label>
            <br />
            <br />
            <br />
        </div>
        <asp:Label ID="LabelLogin" runat="server" ForeColor="#663300" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxLogin" runat="server" Height="25px" MaxLength="50" Width="135px" BorderStyle="Solid" style="margin-left: 0px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="Prosze podac email do konta!">**</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="LabelHaslo" runat="server" ForeColor="#006600" Text="Hasło"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxHaslo" runat="server" Height="25px" MaxLength="50" TextMode="Password" Width="135px" BorderStyle="Solid"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="Prosze podac haslo do konta!">**</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonZaloguj" runat="server" ForeColor="#666633" Text="ZALOGUJ" OnClick="ButtonZaloguj_Click" BorderStyle="Inset" Height="40px" Width="150px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" />
    </form>
</body>
</html>
