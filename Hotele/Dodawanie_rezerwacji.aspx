<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dodawanie_rezerwacji.aspx.cs" Inherits="Hotele.Dodawanie_rezerwacji" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Login"></asp:Label>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" ForeColor="#996600" Text="Dokonaj Rezerwacji"></asp:Label>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#339966" BorderWidth="2px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceHotele_Pokoje" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nazwa_hotelu" HeaderText="nazwa_hotelu" SortExpression="nazwa_hotelu" />
                    <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
                    <asp:BoundField DataField="standard" HeaderText="standard" SortExpression="standard" />
                    <asp:BoundField DataField="rodzaj_pokoju" HeaderText="rodzaj_pokoju" SortExpression="rodzaj_pokoju" />
                    <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                    <asp:BoundField DataField="numer_pokoju" HeaderText="numer_pokoju" SortExpression="numer_pokoju" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceHotele_Pokoje" runat="server" ConnectionString="<%$ ConnectionStrings:Projekt_HoteleConnectionString %>" SelectCommand="SELECT hotele.nazwa_hotelu, hotele.miasto, hotele.standard, pokoje.rodzaj_pokoju, pokoje.cena, pokoje.numer_pokoju, pokoje.id FROM hotele INNER JOIN pokoje ON hotele.id = pokoje.id_hotelu"></asp:SqlDataSource>
&nbsp;<br />
&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="#6600CC" Text="Wybrano Rezerwacje o id :"></asp:Label>
&nbsp;
            <asp:Label ID="LabelIDRezerwacji" runat="server" Text="-"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="CheckBoxRezerwacje2" runat="server" Enabled="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSourceID" runat="server"></asp:SqlDataSource>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonAnulowanie" runat="server" BorderStyle="Double" Height="45px" OnClick="ButtonAnulowanie_Click" Text="Anuluj" Width="145px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonRezerwowanie" runat="server" BorderStyle="Dashed" Height="45px" OnClick="ButtonRezerwowanie_Click" Text="Rezerwuj" Width="145px" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
