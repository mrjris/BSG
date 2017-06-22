using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace BSG
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            bool success = check(txtAccount.Text, txtPassword.Text);
            if(success)
            {
                FormsAuthentication.RedirectFromLoginPage(txtAccount.Text,chkRememberLogin.Checked);
            }
            else
            {
                lblError.Text = "Đăng nhập không thành công.";
            }
        }
        private bool check(string acc, string pass)
        {
            pass = MD5.Encode(pass);
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BSGConnectionString"].ConnectionString);
            cnn.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("GetAccounts", cnn);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@acc", acc);
                cmd.Parameters.AddWithValue("@pass", pass);

                int count = (int)cmd.ExecuteScalar();
                if (count == 1) return true;
                else return false;

            }
            catch
            {

            }
            finally
            {
                if (cnn != null) cnn.Close();
            }

            return false;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}