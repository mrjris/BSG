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
            if(!IsPostBack)
            {
            }
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

            

        protected void gdvGroups_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = 0;
            int id;
            GridViewRow row;
            GridView grid = sender as GridView;
            try
            {
                rowIndex = Convert.ToInt32(e.CommandArgument); // Get the current row
                row = grid.Rows[rowIndex];
                txtGroupID.Text = rowIndex.ToString();
            }
            catch
            {

            }

            switch (e.CommandName)
            {
                case "myDelete":
                    cnn.Open();
                    SqlCommand cmd = cnn.CreateCommand();
                    cmd.CommandText = "DELETE FROM [Group] WHERE GroupId= @groupId";
                    cmd.Parameters.AddWithValue("@groupId", rowIndex);
                    cmd.ExecuteNonQuery();
                    gdvGroups.DataBind();
                    cnn.Close();
                    break;
                default:
                    break;
            }

            
        }

        protected void AddGroup_Click(object sender, EventArgs e)
        {

        }

        protected void EditGroup_Click(object sender, EventArgs e)
        {

        }

        protected void Search_Click(object sender, EventArgs e)
        {

        }
    }
}