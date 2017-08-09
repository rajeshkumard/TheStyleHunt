using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    support _support = new support();
    DataTable user_info = new DataTable();
    DataTable default_addr_table = new DataTable();
    DataTable default_ship_table = new DataTable();
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if (Session["myCartDT"] as DataTable == null)
        {
            DataTable myCart = new DataTable();
            Session.Add("myCartDT", myCart);
        }
    }
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
{
    if ((Session["myCartDT"] as DataTable).Columns.Count == 0)
    {
        DataTable myCart = Session["myCartDT"] as DataTable;
        myCart.Columns.Add("cart_pro_product_Id");
        myCart.Columns.Add("cart_pro_user_id");
        myCart.Columns.Add("cart_pro_quatity");
    }
    if (Session["Uname"] != null)
    {
        lbtnReg.Text = "MY ACCOUNT";
        lbtnLog.Text = "LOGOUT";
     //   lblCartQuan.Visible = true;
        carq();
    }
    else
    {
        lbtnReg.Text = "REGISTER";
        lbtnLog.Text = "LOGIN";
     //   lblCartQuan.Visible = false;
    }
    if (!IsPostBack)
    {
        menubind();
        dt = createdatas();
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    
}

    #region HeaderProperties
    private void carq()
    {
        if (Session["Uname"] != null)
        {
            string query = "Select count(*) from cart_products where cart_pro_user_id='" + Session["Uname"].ToString() + "' and cart_pro_shop_Id is null";
            string coutRet = _support.getValue(query);
            if (coutRet != "")
            {
                lblCartQuan.Text = coutRet;
                lblCartCount.Text = coutRet;
            }
            else
            {
                lblCartQuan.Text = "0";
                lblCartCount.Text = "0";
            }
        }
        else
        {
            DataTable myCart = Session["mycartDT"] as DataTable;
            lblCartQuan.Text = myCart.Rows.Count.ToString();
            lblCartCount.Text = myCart.Rows.Count.ToString();
        }
    }
    private void menubind()
    {
        DataTable dt = new DataTable();
        string selectQuery = "Select * from product_catagory";
        dt = _support.getBulkValues(selectQuery);
        dt.DefaultView.Sort = "product_catagory" + " " + "ASC";
        dt = dt.DefaultView.ToTable();

        var catagory = dt.AsEnumerable().Select(row => row.Field<string>("product_catagory")).Distinct();

        foreach (string _catagory in catagory)
        {
            if (_catagory != "")
            {
                MenuItem menu_catagory = new MenuItem();
                menu_catagory.Text = _catagory;

                IEnumerable<DataRow> dr = dt.AsEnumerable().Where(row1 => row1.ItemArray.ElementAt(1).ToString() == _catagory);
                foreach (DataRow dr1 in dr)
                {
                    MenuItem menu_subcatagory = new MenuItem();
                    menu_subcatagory.Text = dr1.ItemArray.ElementAt(2).ToString();
                    menu_subcatagory.Value = dr1.ItemArray.ElementAt(0).ToString();
                    menu_catagory.ChildItems.Add(menu_subcatagory);
                }
                headerMenu.Items.Add(menu_catagory);
            }
        }
    }
    protected void lbtnLog_Click(object sender, EventArgs e)
    {
        if (lbtnLog.Text == "LOGOUT")
        {
            Session["Uname"] = null;
            Server.Transfer("reg_form.aspx");
        }
        if (lbtnLog.Text == "LOGIN")
        {
            Session["Uname"] = null;
            //Response.Redirect("reg_form.aspx");
            Server.Transfer("reg_form.aspx");
        }
    }
    protected void lbtnReg_Click(object sender, EventArgs e)
    {
        if (lbtnReg.Text == "MY ACCOUNT")
        {
            Server.Transfer("myaccount.aspx");
        }
        if (lbtnReg.Text == "REGISTER")
        {
            Session.Add("Uname", "");
            Server.Transfer("reg_form.aspx");
        }
    }
    protected void headerMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        // Server.Transfer("header1.aspx");
        Session.Add("pro_sub_cat", e.Item.Text);
        if (e.Item.Parent != null)
        {
            Session.Add("pro_cat", e.Item.Parent.Text);
        }
        //Server.Transfer("product_catagory.aspx");
        Response.Redirect("product_catagory.aspx");
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> getSearchBarResult(string prefixText, int count)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["project16ConnectionString"].ConnectionString;

            using (SqlCommand com = new SqlCommand())
            {
                //com.CommandText = "select Distinct product_catagory from product_catagory where " + "product_catagory like '%' + @Search + '%'";
                com.CommandText = "select Distinct product_name from product_detail where product_name like '%' + @Search + '%'";

                com.Parameters.AddWithValue("@Search", prefixText);
                com.Connection = con;
                con.Open();
                List<string> countryNames = new List<string>();
                using (SqlDataReader sdr = com.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        countryNames.Add(sdr["product_name"].ToString());
                    }
                }
                con.Close();
                return countryNames;


            }

        }

    }

    protected void btnHeaderSearch_Click(object sender, EventArgs e)
    {
        Session["product_Id_Datalist"] = _support.getValue("Select product_id from product_detail where product_name='" + txtSearchHeader.Text + "'");
        Server.Transfer("product_details.aspx");
    }
    #endregion

    private DataTable createdatas()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("product_id");
        dt.Columns.Add("product_name");
        dt.Columns.Add("product_overview");
        dt.Columns.Add("product_details");
        dt.Columns.Add("product_price");
        dt.Columns.Add("product_availability");
        dt.Columns.Add("image");
        string query = string.Empty;
        if (Session["pro_cat"]!=null)
        {
            if (drpFilter.SelectedItem.Text == "Name")
            {
                query = "Select * from product_detail where product_catagory='" + Session["pro_cat"] + "' and product_sub_catagory='" + Session["pro_sub_cat"] + "' order by product_name";
            }
            else if(drpFilter.SelectedItem.Text=="Price Low to High")
            {
                query = "Select * from product_detail where product_catagory='" + Session["pro_cat"] + "' and product_sub_catagory='" + Session["pro_sub_cat"] + "' order by product_price asc";
            }
            else if(drpFilter.SelectedItem.Text=="Price High to Low")
            {
                query = "Select * from product_detail where product_catagory='" + Session["pro_cat"] + "' and product_sub_catagory='" + Session["pro_sub_cat"] + "' order by product_price desc";
            }
        }
        else
        {
            if (drpFilter.SelectedItem.Text == "Name")
            {
                query = "Select * from product_detail where product_catagory='" + Session["pro_sub_cat"] + "' order by product_name";
            }
            else if (drpFilter.SelectedItem.Text == "Price Low to High")
            {
                query = "Select * from product_detail where product_catagory='" + Session["pro_sub_cat"] + "' order by product_price asc";
            }
            else if (drpFilter.SelectedItem.Text == "Price High to Low")
            {
                query = "Select * from product_detail where product_catagory='" + Session["pro_sub_cat"] + "' order by product_price desc";
            }
        }
        if (Session["pro_cat"] != null)
        {
            pro_c.Value = Session["pro_cat"].ToString();
        }
        Session.Remove("pro_cat");
        
        //string query = "Select * from product_detail";
        DataTable temp = _support.getBulkValues(query);
        if (temp.Rows.Count > 0)
        {
            foreach (DataRow dr in temp.Rows)
            {
                string imageUrl = null;
                string id = dr.ItemArray[0].ToString();
                string imgquery = "select * from image_table where image_productId = '" + id + "'";
                DataTable image = _support.getBulkValues(imgquery);
                if(image.Rows.Count>0)
                {
                    imageUrl = image.Rows[0].ItemArray[2].ToString();
                }
                
                
                dt.Rows.Add(dr.ItemArray[0], dr.ItemArray[1], dr.ItemArray[2], dr.ItemArray[3], dr.ItemArray[4], dr.ItemArray[7],imageUrl);
            }
        }
        return dt;
    }

    protected void btnCart_Click(object sender, EventArgs e)
    {
        string label12 = DataList1.DataKeys[0].ToString();
        _support.AddtoCart(Session["product_Id_Datalist"].ToString(), Session["Uname"].ToString(), "1");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label label = e.Item.FindControl("pro_id") as Label;
        Session.Add("product_Id_Datalist", label.Text);
        if(e.CommandName=="addcart")
        {
           // _support.AddtoCart(Session["product_Id_Datalist"].ToString(), Session["Uname"].ToString(), "1");
            if (Session["Uname"] != null)
            {
                _support.AddtoCart(Session["product_Id_Datalist"].ToString(), Session["Uname"].ToString(), "1");
            }
            else
            {
                _support.AddtoCart(Session["product_Id_Datalist"].ToString(), "", "1");
            }
        }
        
        carq();
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
       
       string bytes = (string)DataBinder.Eval(e.Item.DataItem, "image");
        //string base64string = Convert.ToBase64String(bytes, 0, bytes.Length);
        (e.Item.FindControl("imgDisplay") as Image).ImageUrl = bytes;
        if((string)DataBinder.Eval(e.Item.DataItem,"product_availability")!="In Stock")
        {
            (e.Item.FindControl("btnCart") as Button).Enabled = false;
        }
       // Image1.ImageUrl = "data:image/png;base64," + base64string;
    }
    protected void product_click_Command(object sender, CommandEventArgs e)
    {
        Session.Add("product_Id_Datalist", e.CommandArgument);
        Response.Redirect("product_details.aspx");
    }
    protected void drpFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (pro_c.Value != "" && pro_c.Value != null)
        {
            Session.Add("pro_cat", pro_c.Value);
        }
        dt = createdatas();
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    protected void btnGoCart_Click(object sender, EventArgs e)
    {
        Server.Transfer("addcart.aspx");
    }
}