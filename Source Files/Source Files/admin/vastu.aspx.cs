using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    support _support = new support();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] != null && Session["Admin"].ToString().ToLower()=="true")
        {
            lbtnLog.Text = "LOGOUT";
        }
        else
        {
            Response.Redirect("../index.aspx");
        }
        if(!IsPostBack)
        {
            pendOrders();
            shipedOrders();
        }
    }


    private void shipedOrders()
    {
        string query = "Select * from vastu where status='Completed'";
        DataTable dtshpdOrders = getshporders(query);
        grdShippedOrder.DataSource = dtshpdOrders;
        grdShippedOrder.DataBind();
    }

    private void pendOrders()
    {
        string query = "Select * from vastu where status='Pending'";
        DataTable dtPendOrders = getpenorders(query);
        grdPendingOrders.DataSource = dtPendOrders;
        grdPendingOrders.DataBind();
    }

    private DataTable getshporders(string query)
    {
        DataTable temp = new DataTable();
        temp.Columns.Add("id");
        temp.Columns.Add("name");
        temp.Columns.Add("email");
        temp.Columns.Add("mobile");

        DataTable cartP = _support.getBulkValues(query);
        foreach (DataRow dr in cartP.Rows)
        {
            temp.Rows.Add(dr.ItemArray[0].ToString(),dr.ItemArray[1].ToString(), dr.ItemArray[3].ToString(), dr.ItemArray[2].ToString());
        }

        return temp;
    }

    private DataTable getpenorders(string query)
    {
        DataTable temp = new DataTable();
        temp.Columns.Add("id");
        temp.Columns.Add("name");
        temp.Columns.Add("email");
        temp.Columns.Add("mobile");

        DataTable cartP = _support.getBulkValues(query);
        foreach(DataRow dr in cartP.Rows)
        {
            temp.Rows.Add(dr.ItemArray[0].ToString(), dr.ItemArray[1].ToString(), dr.ItemArray[3].ToString(), dr.ItemArray[2].ToString());
        }

        return temp;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("addcart.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Server.Transfer("addcart.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("addcart.aspx");
    }
    protected void grdPendingOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("status"))
        {
            hidValuCartId.Value = grdPendingOrders.Rows[index].Cells[0].Text;
            mdlforPandingStatus.Show();
        }
       
    }

  
    protected void btnPendingStats_Click(object sender, EventArgs e)
    {
        string UpdateQuery = string.Empty;
        if(ddlstatuspending.SelectedValue.Equals("Completed"))
        {
            UpdateQuery = "Update vastu set status = '" + ddlstatuspending.SelectedValue + "' where id='" + hidValuCartId.Value + "'";
        }
        else
        {
            UpdateQuery = "Update vastu set status='" + ddlstatuspending.SelectedValue + "' where id='" + hidValuCartId.Value + "'";
        }
        string res = _support.insertQuery(UpdateQuery);
        if(res.ToLower()=="true")
        {
            pendOrders();
            shipedOrders();
        }
    }
    protected void grdShippedOrder_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("show"))
        {
            string cartid = grdShippedOrder.Rows[index].Cells[0].Text;
        }
    }
    protected void lbtnLog_Click(object sender, EventArgs e)
    {
        Session["Uname"] = null;
        Response.Redirect("../index.aspx");
    }
    protected void grdPendingOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPendingOrders.PageIndex = e.NewPageIndex;
        pendOrders();
    }
}