using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
namespace BSG
{
    public partial class SendSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Send_Click(object sender, EventArgs e)
        {

        }
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BSGConnectionString"].ConnectionString);
        protected void GroupCodeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string[] dim = { "<", ">" };
            string[] s = txtMessage.Text.Trim().Split(dim, StringSplitOptions.RemoveEmptyEntries);

            if (s.Length < 2) args.IsValid = false;
            else
            {
                cnn.Open();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "CountByGroupCode";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@groupCode", s[0]);
                int count = (int)cmd.ExecuteScalar();
                if (count == 1) args.IsValid = true;
                else args.IsValid = false;
                cmd.Dispose();
                cnn.Close();
            }
        }

        protected void ContentValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string[] dim = { "<", ">" };
            string[] s = txtMessage.Text.Trim().Split(dim, StringSplitOptions.RemoveEmptyEntries);

            if (s.Length < 2) args.IsValid = false;
            else args.IsValid = true;
        }

        protected void AccountValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string acc = User.Identity.Name;
            args.IsValid = false;
        }
    }
}