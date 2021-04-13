using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotele
{
    public partial class Dodawanie_uzytkownika : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Projekt_HoteleConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Labeladmina.Text = (string)Session["LoginAdmina"];
            {
                if (Labeladmina.Text == "")
                {
                    Response.Redirect("Default.aspx");
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Panel_Administratora.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmduser = new SqlCommand("select count(*) from uzytkownicy where email like '" + TextBoxEmail.Text + "'", con);
                SqlDataAdapter sdauser = new SqlDataAdapter(cmduser);
                
                DataTable dtUser = new DataTable();
                sdauser.Fill(dtUser);
                cmduser.ExecuteNonQuery();

                if (String.IsNullOrEmpty(TextBoxImie.Text) || String.IsNullOrEmpty(TextBoxEmail.Text) || String.IsNullOrEmpty(TextBoxHaslo.Text) || String.IsNullOrEmpty(TextBoxNazwisko.Text))
                {
                    Response.Write("<script>alert ('BŁĄD LOGOWANIA')</script>");
                }

                else if (dtUser.Rows[0][0].ToString() == "1")
                {
                    Response.Write("<script>alert ('Uzytkownik z takim emailem juz istnieje podaj inny email')</script>");
                    con.Close();
                }
                else
                {

                    con.Close();
                    DodawanieUzytkownika();

                }


            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }




        }

        protected void DodawanieUzytkownika()
        {
            try
            {

                string command = "INSERT INTO uzytkownicy (imie,nazwisko,email,pass) VALUES ('" + TextBoxImie.Text + "','" + TextBoxNazwisko.Text + "','" + TextBoxEmail.Text + "','"+TextBoxHaslo.Text+ "');";
                con.Open();
                SqlCommand cmd = new SqlCommand(command, con);

                cmd.ExecuteNonQuery();



                Response.Write("<script>alert ('Dodano uzytkownika')</script>");
                Response.Redirect("Panel_Administratora.aspx");


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

    }
}