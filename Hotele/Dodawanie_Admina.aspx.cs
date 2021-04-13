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
    public partial class Dodawanie_Admina : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Projekt_HoteleConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelLoginAdministratora.Text = (string)Session["LoginAdmina"];
            {
                if (LabelLoginAdministratora.Text == "")
                {
                    Response.Redirect("Default.aspx");
                }

            }
        }

        protected void ButtonAnuluj_Click(object sender, EventArgs e)
        {
            Response.Redirect("Panel_Administratora.aspx");
        }

        protected void ButtonPotwierdzenie_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmdAdmin = new SqlCommand("select count(*) from Pracownik where email like '" + TextBoxLogin.Text + "'", con);
                SqlDataAdapter sdaAdmin = new SqlDataAdapter(cmdAdmin);
                DataTable dtAdmin = new DataTable();
                DataTable dtUser = new DataTable();
                sdaAdmin.Fill(dtAdmin);
                cmdAdmin.ExecuteNonQuery();

                if (String.IsNullOrEmpty(TextBoxImie.Text) || String.IsNullOrEmpty(TextBoxLogin.Text) || String.IsNullOrEmpty(TextBoxHaslo.Text))
                {
                    Response.Write("<script>alert ('BŁĄD LOGOWANIA')</script>");
                }

                else if (dtAdmin.Rows[0][0].ToString() == "1")
                {
                    Response.Write("<script>alert ('Uzytkownik z takim emailem juz istnieje podaj inny email')</script>");
                    con.Close();
                }
                else
                {
                    
                    con.Close();
                    DodawanieAdministratora();
                    
                }


            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }

            protected void DodawanieAdministratora()
        {
            try
            {

                string command = "INSERT INTO Pracownik (imie,email,pass) VALUES ('" + TextBoxImie.Text + "','" + TextBoxLogin.Text + "','"+ TextBoxHaslo.Text+"');";
                con.Open();
                SqlCommand cmd = new SqlCommand(command, con);
                
                cmd.ExecuteNonQuery();



                    Response.Write("<script>alert ('Dodano administratora')</script>");
                    Response.Redirect("Panel_Administratora.aspx");

               
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        

    }
}