using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddQuestion : System.Web.UI.Page
{

    protected int selectedCategory;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void select(object sender, EventArgs e)
    {
        selectedCategory = int.Parse(((DropDownList)sender).DataValueField);
        Response.Write(selectedCategory);
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        Response.Write(DropDownList1.SelectedValue);
        Response.Write(title.Text);
        Response.Write(body.Text);
    }
}