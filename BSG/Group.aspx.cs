using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;

namespace BSG
{
    public partial class Group : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlGroupCode_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BSGConnectionString"].ConnectionString);
        protected void GroupCode_ServerValidate(object source, ServerValidateEventArgs args)
        {
            txtInputGroupCode.Text = txtInputGroupCode.Text.Trim();
            //if (txtGroupCode.Text.Length > 20)
            //{
            //    args.IsValid = false;
            //}
            cnn.Open();
            SqlCommand cmd = cnn.CreateCommand();
            cmd.CommandText = "CountByGroupCode";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@groupCode", txtInputGroupCode.Text.Trim());

            int count = (int)cmd.ExecuteScalar();
            if (count > 0) args.IsValid = false;
            else args.IsValid = true;
            cmd.Dispose();
            cnn.Close();
        }
    }
}