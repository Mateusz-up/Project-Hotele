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
    public partial class Panel_Administratora : System.Web.UI.Page
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

        protected void ButtonUsunRezerwacje_Click(object sender, EventArgs e)
        {
            if (CheckBoxRezerwacje.Checked == false)

            {
                Response.Write("<script>alert ('Nie wybrano zadnej rezerwacji')</script>");
            }
            else
            {
                try
                {
                    con.Open();

                    string cmdUsuwanie = "Delete from rezerwacje where id like '" + LabelIDRezerwacji.Text + "'";
                    SqlCommand cmd = new SqlCommand(cmdUsuwanie, con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                    GridViewRezerwacje.DataBind();
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }

        }

            protected void ButtonWylogowanie_Click(object sender, EventArgs e)
            {
                Response.Redirect("Default.aspx");
            }

          

        protected void ButtonDodawanieAdmina_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dodawanie_Admina.aspx");
        }

        protected void GridViewRezerwacje_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelIDRezerwacji.Text = GridViewRezerwacje.SelectedRow.Cells[1].Text;
            CheckBoxRezerwacje.Checked = true;
        }

        protected void GridViewuzytkownicy_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelIDuzytkownika.Text = GridViewuzytkownicy.SelectedRow.Cells[1].Text;
            CheckBoxuzytkownik.Checked = true;
        }

        protected void ButtonUsuwanie_Click(object sender, EventArgs e)
        {
            if (CheckBoxuzytkownik.Checked == false)

            {
                Response.Write("<script>alert ('Nie wybrano zadnego uzytkownika')</script>");
            }
            else
            {
                try
                {
                    con.Open();

                    string cmdUsuwanie2 = "Delete from uzytkownicy where id like '" + LabelIDuzytkownika.Text + "'";
                    SqlCommand cmd = new SqlCommand(cmdUsuwanie2, con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                    GridViewuzytkownicy.DataBind();
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }
        }

        protected void ButtonDodUzy_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dodawanie_uzytkownika.aspx");
        }
    }

}