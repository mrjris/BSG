using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BSG
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dgvAccount.DataBind();
        }

        protected void btnAddAccount_Click(object sender, EventArgs e)
        {
            
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
            
            string pass = MD5.Encode(txtPassword.Text.Trim());
            string cp = Context.User.Identity.Name;
            try
            {


                SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BSGConnectionString"].ConnectionString);
                cnn.Open();
                SqlCommand cmd;
                //Thêm tài khoản mới vào bảng Account
                if (isAdd.Text == "true")
                {
                    cmd = new SqlCommand("AddAccount", cnn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@account", txtAccount.Text.Trim());
                    cmd.Parameters.Add("@password", pass);
                    cmd.Parameters.Add("@description", txtDescription.Text.Trim());
                    cmd.Parameters.Add("@createdperson", cp);
                }
                else
                {
                    cmd = new SqlCommand("UpdateAccount", cnn);
                    cmd.CommandText = "GetAccountID";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@account", txtAccount.Text.Trim());
                    int accID = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "UpdateAccount";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", accID);
                    cmd.Parameters.Add("@password", pass);
                    cmd.Parameters.Add("@description", txtDescription.Text.Trim());
                    cmd.Parameters.Add("@createdperson", cp);
                }
                cmd.ExecuteNonQuery();
                //Xong thêm tài khoản
                dgvAccount.DataBind();

                //Lấy ID của tài khoản vừa mới thêm
                cmd.CommandText = "GetAccountID";
                cmd.CommandType = CommandType.StoredProcedure;

                int id = (int)cmd.ExecuteScalar();
                cmd.Parameters.Add("@id", id);
                //Xong lấy ID

                
                //Thêm số điện thoại vào bảng Account_Phone (nếu có)
                if (!validatePhones()) return;
                cmd.CommandText = "AddPhone";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                foreach (var sphone in phone)
                {
                    cmd.Parameters.AddWithValue("@phone", sphone);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }

                cmd.Dispose();
                cnn.Close();
            }
            catch (Exception ex)
            {
                isAdd.Text = ex.Message;
            }

        }

        private string[] phone;
        private bool validatePhones()
        {
            
            string phones = txtPhones.Text.Trim();
            char[] dim = { ' ', ';' };
            phone = phones.Split(dim);

            if (phone.Length < 1) return false;

            foreach (string sphone in phone)
                if (sphone.Length < 9 || sphone.Length > 16) return false;

            return true;
        }
    }
}