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
    public partial class Dodawanie_rezerwacji : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Projekt_HoteleConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Text = (string)Session["LoginUsera"];
            {
                if (Label3.Text == "")
                {
                    Response.Redirect("Default.aspx");
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelIDRezerwacji.Text = GridView1.SelectedRow.Cells[1].Text;
            CheckBoxRezerwacje2.Checked = true;
            

        }

        protected void ButtonAnulowanie_Click(object sender, EventArgs e)
        {
            Response.Redirect("Panel_Uzytkownika.aspx");
        }

        protected void ButtonRezerwowanie_Click(object sender, EventArgs e)
        {
           
            if (CheckBoxRezerwacje2.Checked == false)

            {
                Response.Write("<script>alert ('Nie wybrano zadnej rezerwacji')</script>");
            }
            else
            {
                try
                {
                   // int cmdiduser="select id from uzytkownicy where id like '" +(int)Session["LoginUsera"]+"';";
                    string command = "insert into rezerwacje (id_pokoju,id_uzytkownika,id_pracownika) values ('" + LabelIDRezerwacji.Text + "','8','1');";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(command, con);
                    cmd.ExecuteNonQuery();



                    con.Close();
                    GridView1.DataBind();
                    Response.Redirect("Panel_Uzytkownika.aspx");
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}