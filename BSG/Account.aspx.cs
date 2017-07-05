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
            if(!IsPostBack)
            {
                dgvAccount.DataBind();
            }
            else
            {
                dgvAccount.DataBind();
            }
            
        }

        protected void btnAddAccount_Click(object sender, EventArgs e)
        {
            
        }
        private SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BSGConnectionString"].ConnectionString);
        protected void Add_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
            if (isAdd.Text == "true") Add_Account();
            else Update_Account();
            Add_Phone(txtPhones.Text.Trim());
            dgvAccount.DataBind();
        }

        private void Add_Phone(string phones)
        {
            if (!validatePhones(phones)) return;
            cnn.Open();
            //Lấy ID của tài khoản vừa mới thêm
            SqlCommand cmd = new SqlCommand("GetAccountID", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@account", txtAccount.Text.Trim());
            int id = (int)cmd.ExecuteScalar();
            cmd.Parameters.AddWithValue("@id", id);
            //Xong lấy ID
            
            //Thêm số điện thoại vào bảng Account_Phone (nếu có)
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

        private void Update_Account()
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("GetAccountID", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@account", txtAccount.Text.Trim());
            int accID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "UpdateAccount";
            cmd.CommandType = CommandType.StoredProcedure;
            string pass = MD5.Encode(txtPassword.Text.Trim());
            string cp = Context.User.Identity.Name;
            cmd.Parameters.AddWithValue("@id", accID);
            cmd.Parameters.AddWithValue("@password", pass);
            cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@createdperson", cp);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cnn.Close();
        }

        private void Add_Account()
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("AddAccount", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            string pass = MD5.Encode(txtPassword.Text.Trim());
            string cp = Context.User.Identity.Name;
            cmd.Parameters.AddWithValue("@account", txtAccount.Text.Trim());
            cmd.Parameters.AddWithValue("@password", pass);
            cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@createdperson", cp);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cnn.Close();
        }

        private string[] phone;
        private bool validatePhones(string phones)
        {
            string[] dim = { " ", " ","\r\n"};
            phone = phones.Split(dim,StringSplitOptions.RemoveEmptyEntries);

            if (phone.Length < 1) return false;

            foreach (string sphone in phone)
                if (sphone.Length < 9 || sphone.Length > 16) return false;

            return true;
        }

        protected void txtAccount_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 20)
                args.IsValid = false;
            else args.IsValid = true;
        }

        protected void txtPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 10)
                args.IsValid = false;
            else args.IsValid = true;
        }

        protected void txtPhones_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!validatePhones(args.Value.Trim()))
                args.IsValid = false;
            else args.IsValid = true;
        }

        protected void btnDetele_Click(object sender, ImageClickEventArgs e)
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("DeleteAccountByID", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            Button btnDelete = (Button)sender;
            int id = Convert.ToInt32(btnDelete.CommandArgument.ToString());
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cnn.Close();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("DeleteAccountByID", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            Button btnDelete = (Button)sender;
            int id = Convert.ToInt32(btnDelete.CommandArgument.ToString());
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cnn.Close();
        }

        protected void DeleteAccount_Click(object sender, EventArgs e)
        {

        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
            Update_Account();
            Add_Phone(txtPhones.Text.Trim());
            dgvAccount.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            isAdd.Text = "true";
        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            isAdd.Text = "false";
        }
    }
}