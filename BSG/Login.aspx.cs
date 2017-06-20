using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

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
            SqlConnection cnn = new SqlConnection();

            return false;
        }
    }
}