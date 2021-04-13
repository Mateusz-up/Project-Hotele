<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Panel_Administratora.aspx.cs" Inherits="Hotele.Panel_Administratora" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left: 40px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelImie" runat="server" ForeColor="#CC0000" Text="Witaj"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelLoginAdministratora" runat="server" ForeColor="#00CC00" Text="Login_Admina"></asp:Label>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonDodawanieAdmina" runat="server" BorderStyle="Double" ForeColor="#339966" Text="Dodaj administratora" Width="155px" OnClick="ButtonDodawanieAdmina_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonWylogowanie" runat="server" BorderStyle="Dashed" ForeColor="#0000CC" OnClick="ButtonWylogowanie_Click" Text="Wyloguj się" Width="155px" />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelRezerwacje" runat="server" ForeColor="#996600" Text="Rezerwacje"></asp:Label>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridViewRezerwacje" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCFF99" BorderStyle="None" BorderWidth="2px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceRezerwacje" OnSelectedIndexChanged="GridViewRezerwacje_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="nazwa_hotelu" HeaderText="nazwa_hotelu" SortExpression="nazwa_hotelu" />
                    <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
                    <asp:BoundField DataField="standard" HeaderText="standard" SortExpression="standard" />
                    <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                    <asp:BoundField DataField="rodzaj_pokoju" HeaderText="rodzaj_pokoju" SortExpression="rodzaj_pokoju" />
                    <asp:BoundField DataField="numer_pokoju" HeaderText="numer_pokoju" SortExpression="numer_pokoju" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceRezerwacje" runat="server" ConnectionString="<%$ ConnectionStrings:Projekt_HoteleConnectionString %>" SelectCommand="select r.id,u.imie,u.nazwisko,u.email,h.nazwa_hotelu,h.miasto,h.standard, p.cena,p.rodzaj_pokoju,p.numer_pokoju from rezerwacje r left join uzytkownicy u on u.id=r.id_uzytkownika left join pokoje p on p.id=r.id_pokoju left join hotele h on h.id=p.id_hotelu;"></asp:SqlDataSource>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Wybrano rezerwacje o id :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelIDRezerwacji" runat="server" Text="-"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:CheckBox ID="CheckBoxRezerwacje" runat="server" Enabled="False" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonUsunRezerwacje" runat="server" BorderStyle="Inset" ForeColor="Red" OnClick="ButtonUsunRezerwacje_Click" Text="Usuń rezerwację" Width="160px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" ForeColor="#660066" Text="Użytkownicy"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonDodUzy" runat="server" BorderStyle="Inset" Height="44px" OnClick="ButtonDodUzy_Click" Text="Dodaj użytkownika" Width="145px" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridViewuzytkownicy" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#FF9900" BorderColor="#339933" BorderStyle="None" BorderWidth="2px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceuzytkownicy" OnSelectedIndexChanged="GridViewuzytkownicy_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceuzytkownicy" runat="server" ConnectionString="<%$ ConnectionStrings:Projekt_HoteleConnectionString %>" SelectCommand="SELECT [id], [imie], [nazwisko], [email] FROM [uzytkownicy]"></asp:SqlDataSource>
            <br />
            &nbsp;
            <asp:Label ID="Label3" runat="server" Text="Wybrano uzytkownika o id :"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelIDuzytkownika" runat="server" Text="-"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="CheckBoxuzytkownik" runat="server" Enabled="False" />
            <br />
&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonUsuwanie" runat="server" BorderStyle="Groove" Height="55px" OnClick="ButtonUsuwanie_Click" Text="Usuń użytkownika" Width="155px" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
