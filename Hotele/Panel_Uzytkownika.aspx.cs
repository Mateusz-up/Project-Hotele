using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotele
{
    public partial class Panel_Uzytkownika : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Projekt_HoteleConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Label7.Text = (string) Session["LoginUsera"];
            if (Label7.Text == "")
            {
                Response.Redirect("Default.aspx");
            }

            try
            {
                string cmduzytkownik = "select u.imie,u.nazwisko,u.email,h.nazwa_hotelu,h.miasto,h.standard, p.cena,p.rodzaj_pokoju,p.numer_pokoju from rezerwacje r left join uzytkownicy u on u.id = r.id_uzytkownika left join pokoje p on p.id = r.id_pokoju left join hotele h on h.id = p.id_hotelu where email like '" + (string)Session["LoginUsera"] + "';";
                con.Open();
                SqlCommand cmd = new SqlCommand(cmduzytkownik, con);
                SqlDataReader readeruzytkownik = cmd.ExecuteReader();
                if(readeruzytkownik.HasRows)
                {
                    while (readeruzytkownik.Read())
                    {

                        LabelImie.Text = readeruzytkownik["imie"].ToString();
                        LabelNazwisko.Text = readeruzytkownik["nazwisko"].ToString();
                        LabelEmail.Text = readeruzytkownik["email"].ToString();

                        LabelHotel.Text = readeruzytkownik["nazwa_hotelu"].ToString();
                        LabelMiasto.Text = readeruzytkownik["miasto"].ToString();
                        LabelStandard.Text = readeruzytkownik["standard"].ToString();

                        LabelPokoj.Text = readeruzytkownik["rodzaj_pokoju"].ToString();
                        LabelCena.Text = readeruzytkownik["cena"].ToString();
                        Labelnr.Text = readeruzytkownik["numer_pokoju"].ToString();
                    }
                
                }
                else
                {
                   

                }
                readeruzytkownik.Close();

                con.Close();

              

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void ButtonWyloguj_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ButtonRezerw_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dodawanie_rezerwacji.aspx");
        }
    }

}

