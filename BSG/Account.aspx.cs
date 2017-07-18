using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BSG
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditAccount_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddAccount_Click(object sender, EventArgs e)
        {
            if (!isAddAccountValidated())
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#addModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);
                return;
            }

            string s = "";

            return;
        }

        private bool isAddAccountValidated()
        {
            txtAddAccount.Text = txtAddAccount.Text.Trim();
            string err = "";
            if (txtAddAccount.Text.Length < 1 || txtAddPassword.Text.Length < 1)
                err += "Tên tài khoản, mật khẩu không được để trống\r\n";
            else if (txtAddAccount.Text.Length > 20 || txtAddPassword.Text.Length > 20)
                err += "Tên tài khoản, mật khẩu không được quá 20 ký tự\r\n";

            string[] dim = { " ", ",", ".", ";", "\r\n" };
            string phones = txtAddPhones.Text.Trim();
            string[] phone = phones.Split(dim, StringSplitOptions.RemoveEmptyEntries);
            foreach (string sphone in phone)
                if (sphone.Length > 16) err += "Số điện thoại vượt quá 16 ký tự";

            lblAddValidate.Text = err;
            
            return err=="";
        }

        protected void btnDeleteAccount_Click(object sender, EventArgs e)
        {

        }
    }
}