using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BSG
{
    public partial class Thongke : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed2_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void FromDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            txtFromDate.Text = FromDateCalendar.SelectedDate.ToShortDateString();
        }

        protected void ToDateCaledar_SelectionChanged(object sender, EventArgs e)
        {
            txtToDate.Text = ToDateCaledar.SelectedDate.ToShortDateString();
        }
    }
}