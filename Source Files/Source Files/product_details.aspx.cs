using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Net;
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
      //  lblCartQuan.Visible = false;
    }
    if (!IsPostBack)
    {
        menubind();

    }
    LoadMyData();
        if(lblAvailability.Text!="In Stock")
        {
            btnAddCart.Enabled = false;
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
            }
            else
            {
                lblCartQuan.Text = "0";
            }
        }
        else
        {
            DataTable myCart = Session["mycartDT"] as DataTable;
            lblCartQuan.Text = myCart.Rows.Count.ToString();
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

    private void LoadMyData()
    {
        string SelQuery = "Select * from product_detail where product_id = '" + Session["product_Id_Datalist"] + "'";
        dt = _support.getBulkValues(SelQuery);
        if(dt.Rows.Count==1)
        {
            lblProductName.Text = dt.Rows[0].ItemArray[1].ToString();
            lblAvailability.Text = dt.Rows[0].ItemArray[7].ToString();
            if(dt.Rows[0].ItemArray[7].ToString().ToLower()!="in stock")
            {
                btnAddCart.Enabled = false;
            }
            lblPrice.Text = dt.Rows[0].ItemArray[4].ToString();
            lblPriceinPoints.Text = lblPrice.Text + " Points";
            lblPointsEarned.Text = (Convert.ToInt32(lblPrice.Text) / 10).ToString() + " Points";
            txtareaOverview.Text = WebUtility.HtmlDecode(dt.Rows[0].ItemArray[2].ToString());
            txtAreaDetails.Text = WebUtility.HtmlDecode(dt.Rows[0].ItemArray[3].ToString());
            string image = "Select * from image_table where image_productId='" + dt.Rows[0].ItemArray[0].ToString() + "'";
            DataTable dt1 = _support.getBulkValues(image);
            imgProduct.ImageUrl = dt1.Rows[0].ItemArray[2].ToString();
            //imgProduct.Attributes.Add("data-zoom-image", dt1.Rows[0].ItemArray[2].ToString());
            //imgProduct.Attributes.Add("data-image", dt1.Rows[0].ItemArray[2].ToString());
        }
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

    protected void btnAddCart_Click(object sender, EventArgs e)
    {
        if (Session["Uname"] != null)
        {
            _support.AddtoCart(Session["product_Id_Datalist"].ToString(), Session["Uname"].ToString(), "1");
        }
        else
        {
            _support.AddtoCart(Session["product_Id_Datalist"].ToString(), "", "1");
        }
        //_support.AddtoCart(Session["product_Id_Datalist"].ToString(), Session["Uname"].ToString(), txtQuantity.Text);
        
    }
    protected void imgProduct_Click(object sender, ImageClickEventArgs e)
    {
        zoomImage.ImageUrl = imgProduct.ImageUrl;
        lblheader.Text = lblProductName.Text;
        mdlPopImageShow.Show();
    }
    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        if (Session["Uname"] != null)
        {
            _support.AddtoCart(Session["product_Id_Datalist"].ToString(), Session["Uname"].ToString(), txtQuantity.Text);
            Server.Transfer("addcart.aspx");
        }
        else
        {
            _support.AddtoCart(Session["product_Id_Datalist"].ToString(), "", txtQuantity.Text);
            Server.Transfer("addcart.aspx");
        }
    }
}