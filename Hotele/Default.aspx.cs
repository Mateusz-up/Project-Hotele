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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonZaloguj_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Projekt_HoteleConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                SqlCommand cmdAdmin = new SqlCommand("select count(*) from Pracownik where email like '" + TextBoxLogin.Text + "' AND pass like'" + TextBoxHaslo.Text + "'", con);
                SqlCommand cmdUser = new SqlCommand("select count(*) from uzytkownicy where email like '" + TextBoxLogin.Text + "' AND pass like '" + TextBoxHaslo.Text + "'", con);
                SqlDataAdapter sdaAdmin = new SqlDataAdapter(cmdAdmin);
                SqlDataAdapter sdaUser = new SqlDataAdapter(cmdUser);

               

                DataTable dtAdmin = new DataTable();
                DataTable dtUser = new DataTable();
               
                sdaAdmin.Fill(dtAdmin);
                sdaUser.Fill(dtUser);
               
                
                cmdAdmin.ExecuteNonQuery();
                cmdUser.ExecuteNonQuery();
                if(String.IsNullOrEmpty(TextBoxLogin.Text) || String.IsNullOrEmpty(TextBoxHaslo.Text))
                {
                    Response.Write("<script>alert ('BŁĄD LOGOWANIA')</script>");
                }

                else if (dtAdmin.Rows[0][0].ToString() == "1")
                {

                    Session["LoginAdmina"] =TextBoxLogin.Text;
                    Response.Redirect("Panel_Administratora.aspx");

                }
                else if (dtUser.Rows[0][0].ToString() == "1")
                {
                    Session["LoginUsera"] = TextBoxLogin.Text;
                    
                    Response.Redirect("Panel_Uzytkownika.aspx");

                }
               
                else
                {
                    Response.Write("<script>alert ('BŁĄD LOGOWANIA zle dane logowania')</script>");
                }
              


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }
    }
}