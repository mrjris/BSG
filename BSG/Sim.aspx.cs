using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace BSG
{
    public partial class Sim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtUpdate.Text = "false";
            }
        }

        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BSGConnectionString"].ConnectionString);

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
           
            cnn.Open();
            SqlCommand cmd = cnn.CreateCommand();
            if (txtUpdate.Text !="True")
            {
                cmd.CommandText = "AddSim";
                cmd.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                cmd.CommandText = "UPDATE[Sim] SET [Phone] = @phone WHERE[Id] = @Id";
                int id = Convert.ToInt32(txtselectedID.Text);
                cmd.Parameters.AddWithValue("@id", id);
            }
            cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
            cmd.ExecuteNonQuery();
            dgvSim.DataBind();
            cnn.Close();
        }

        protected void dgvSim_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

                Label lblSstatus = (Label)e.Row.FindControl("lblStatus");

                if (lblSstatus.Text == "True")
                {
                    lblSstatus.Text = "Active";
                    ImageButton ImageButton5 = (ImageButton)e.Row.FindControl("ImageButton5");
                    ImageButton5.Visible = false;
                }
                else if (lblSstatus.Text == "False")
                {
                    lblSstatus.Text = "Inactive";
                    ImageButton ImageButton3 = (ImageButton)e.Row.FindControl("ImageButton3");
                    ImageButton ImageButton4 = (ImageButton)e.Row.FindControl("ImageButton4");
                    ImageButton3.Visible = false;
                    ImageButton4.Visible = false;
                }
            }
            catch
            {
                
            }
            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
            cnn.Open();
            SqlCommand cmd = cnn.CreateCommand();
            cmd.CommandText = "UPDATE [Sim] SET [Phone] = @phone, [Status] = 'TRUE' WHERE [Id] = @Id";
            cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
            cmd.ExecuteNonQuery();
            dgvSim.DataBind();
            cnn.Close();
        }
        
    }
}