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
        }
    }


    private void pendOrders()
    {
        string query = "Select * from cart_shop where cart_status='Approved'";
        DataTable dtPendOrders = getpenorders(query);
        grdPendingOrders.DataSource = dtPendOrders;
        grdPendingOrders.DataBind();
    }

    private DataTable getpenorders(string query)
    {
        DataTable temp = new DataTable();
        temp.Columns.Add("cart_Id");
        temp.Columns.Add("cart_user_name");
        temp.Columns.Add("user_s_address");
        temp.Columns.Add("mobile");
        temp.Columns.Add("ship_method");
        temp.Columns.Add("total_items");
        temp.Columns.Add("cart_price");

        DataTable cartP = _support.getBulkValues(query);
        foreach(DataRow dr in cartP.Rows)
        {
            string username = _support.getValue("Select (user_fname + ' ' + user_lname) as name from user_info where user_mail='" + dr.ItemArray[2].ToString() + "'");
            string address = _support.getValue("Select (user_name + ' ' + user_address1 + ' ' + user_address2 + ' ' + user_city + ' ' + user_state + ' ' + user_country + ' ' + user_pincode) as address from user_address where id='" + dr.ItemArray[1].ToString() + "'");
            string mobile = _support.getValue("Select user_mobile from user_address where id='" + dr.ItemArray[1].ToString() + "'");
            string quantity = _support.getValue("Select sum (cast (cart_pro_quatity as int)) from cart_products where cart_pro_shop_Id='" + dr.ItemArray[0].ToString() + "'");

            temp.Rows.Add(dr.ItemArray[0].ToString(), username, address, mobile, dr.ItemArray[12].ToString(), quantity, dr.ItemArray[9].ToString());
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
        if(e.CommandName.Equals("show"))
        {
            string cartid = grdPendingOrders.Rows[index].Cells[0].Text;
            grdPendingDetView.DataSource = getgrdPendingDetView(cartid);
            grdPendingDetView.DataBind();
            mdlforPandingDetails.Show();
        }
    }

    private object getgrdPendingDetView(string cartid)
    {
        DataTable orderDetRev = new DataTable();
        orderDetRev.Columns.Add("product_name");
        orderDetRev.Columns.Add("product_price");
        orderDetRev.Columns.Add("cart_pro_quantity");
        orderDetRev.Columns.Add("sub_total");

        string selQury = "Select * from cart_products where cart_pro_shop_Id='" + cartid + "'";
        DataTable cartTab = _support.getBulkValues(selQury);
        foreach (DataRow dr in cartTab.Rows)
        {
            string cartProProId = dr.ItemArray[1].ToString();
            string selQury2 = "Select * from product_detail where product_id ='" + cartProProId + "'";
            DataTable proTab = _support.getBulkValues(selQury2);
            if (proTab.Rows.Count == 1)
            {
                double subTol = Convert.ToDouble(proTab.Rows[0].ItemArray[4].ToString()) * Convert.ToDouble(dr.ItemArray[3].ToString());
                orderDetRev.Rows.Add(proTab.Rows[0].ItemArray[1].ToString(), proTab.Rows[0].ItemArray[4].ToString(), dr.ItemArray[3].ToString(), subTol.ToString());
            }
        }

        double total = 0;
        foreach (DataRow dr3 in orderDetRev.Rows)
        {
            total = total + Convert.ToDouble(dr3.ItemArray[3].ToString());
        }
        lblGrndTotal.Text = total.ToString();
        return orderDetRev;
    }
    protected void btnPendingStats_Click(object sender, EventArgs e)
    {
        string UpdateQuery = string.Empty;
        UpdateQuery = "Update cart_shop set cart_status='" + ddlstatuspending.SelectedValue + "' where cart_Id='" + hidValuCartId.Value + "'";
        string res = _support.insertQuery(UpdateQuery);
        if(res.ToLower()=="true")
        {
            pendOrders();
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