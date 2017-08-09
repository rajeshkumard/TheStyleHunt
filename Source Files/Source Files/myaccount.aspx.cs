using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    support _support = new support();
    DataTable user_info = new DataTable();
    DataTable default_addr_table = new DataTable();
    DataTable default_ship_table = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] != null)
        {
            lbtnReg.Text = "MY ACCOUNT";
            lbtnLog.Text = "LOGOUT";
          //  lblCartQuan.Visible = true;
            carq();
        }
        else
        {
            lbtnReg.Text = "REGISTER";
            lbtnLog.Text = "LOGIN";
          //  lblCartQuan.Visible = false;
        }
        if(Session["Admin"]=="True")
        {
            foradmin.Visible = Visible;
        }
        if (!IsPostBack)
        {
            menubind();
            getcartDetails();

        }
       
       // System.Diagnostics.Debugger.Break();
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

    private void getcartDetails()
    {
        string selQuery = "Select * from cart_shop where cart_user_id='" + Session["Uname"] + "'";
        DataTable dt = _support.getBulkValues(selQuery);

        grd_placed_order.DataSource = dt;
        grd_placed_order.DataBind();
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if(Session["Uname"]=="")
        {
            Response.Redirect("index.aspx");
            
        }
        else
        {
            getvalues();
        }
    }

    
    private void getvalues()
    {
        string query = "SELECT * FROM user_info WHERE user_mail='" + Session["Uname"] + "'";
        user_info = _support.getBulkValues(query);
        lblUname.Text = user_info.Rows[0].ItemArray[2].ToString() + " " + user_info.Rows[0].ItemArray[3].ToString();
        if (user_info.Rows[0].ItemArray[5].ToString() != null && user_info.Rows[0].ItemArray[5].ToString() != "")
        {
            lblPoint.Text = user_info.Rows[0].ItemArray[5].ToString();
           // lblPnt.Text = user_info.Rows[0].ItemArray[5].ToString();
            lblFName.Text = user_info.Rows[0].ItemArray[2].ToString();
            lblLName.Text = user_info.Rows[0].ItemArray[3].ToString();
            lblEmail.Text = Session["Uname"].ToString();
            lblCompany.Text = user_info.Rows[0].ItemArray[6].ToString();
            lblPriMobile.Text = user_info.Rows[0].ItemArray[7].ToString();
            lblFax.Text = user_info.Rows[0].ItemArray[8].ToString();
            txtFnameEdit.Text = user_info.Rows[0].ItemArray[2].ToString();
            txtLnameEdit.Text = user_info.Rows[0].ItemArray[3].ToString();
            txtCompany.Text = user_info.Rows[0].ItemArray[6].ToString();
            txtPrimaryMobile.Text = user_info.Rows[0].ItemArray[7].ToString();
            txtFax.Text = user_info.Rows[0].ItemArray[8].ToString();
            chkNewsEdit.Checked = Convert.ToBoolean(user_info.Rows[0].ItemArray[9].ToString());
        }
        else
        {
            lblPoint.Text = "0";
            //lblPnt.Text = "0";
            lblFName.Text = user_info.Rows[0].ItemArray[2].ToString();
            lblLName.Text = user_info.Rows[0].ItemArray[3].ToString();
            lblEmail.Text = Session["Uname"].ToString();
            lblCompany.Text = user_info.Rows[0].ItemArray[6].ToString();
            lblPriMobile.Text = user_info.Rows[0].ItemArray[7].ToString();
            lblFax.Text = user_info.Rows[0].ItemArray[8].ToString();
            txtFnameEdit.Text = user_info.Rows[0].ItemArray[2].ToString();
            txtLnameEdit.Text = user_info.Rows[0].ItemArray[3].ToString();
            txtCompany.Text = user_info.Rows[0].ItemArray[6].ToString();
            txtPrimaryMobile.Text = user_info.Rows[0].ItemArray[7].ToString();
            txtFax.Text = user_info.Rows[0].ItemArray[8].ToString();
            chkNewsEdit.Checked = Convert.ToBoolean(user_info.Rows[0].ItemArray[9].ToString());
        }
        checkForAddress();
        checkForNewSLetter();
    }

    private void checkForNewSLetter()
    {
        if(user_info.Rows.Count>0 && user_info.Rows[0].ItemArray[9].ToString()=="True")
        {
            lblNewsInfo.Text = "You have registered for General Newsletter";
        }
        else
        {
            lblNewsInfo.Text = "You are currently not subscribed to any Newsletter";
        }
    }

    private void checkForAddress()
    {
        //Default Billing Address
        string Query = "SELECT * FROM user_address WHERE user_mail='" + Session["Uname"] + "' and user_make_as_default='True'";
        default_addr_table = _support.getBulkValues(Query);
        if (default_addr_table.Rows.Count == 1)
        {
            lblAdd1.Text = default_addr_table.Rows[0].ItemArray[2].ToString();
            lblAdd2.Text = default_addr_table.Rows[0].ItemArray[3].ToString();
            lblCity.Text = default_addr_table.Rows[0].ItemArray[4].ToString();
            lblState.Text = default_addr_table.Rows[0].ItemArray[5].ToString();
            lblPincode.Text = default_addr_table.Rows[0].ItemArray[6].ToString();
            lblcountry.Text = default_addr_table.Rows[0].ItemArray[7].ToString();
            lblMobile.Text = default_addr_table.Rows[0].ItemArray[9].ToString();
        }
        if (default_addr_table.Rows.Count == 0)
        {
            lblAdd1.Text = "You have not set a Default Billing Address";
        }
        //Default Billing Address
        string Query1 = "SELECT * FROM user_address WHERE user_mail='" + Session["Uname"] + "' and user_make_as_shipping='True'";
        default_ship_table = _support.getBulkValues(Query1);
        if (default_ship_table.Rows.Count == 1)
        {
            lblSAdd1.Text = default_ship_table.Rows[0].ItemArray[2].ToString();
            lblSAdd2.Text = default_ship_table.Rows[0].ItemArray[3].ToString();
            lblSCity.Text = default_ship_table.Rows[0].ItemArray[4].ToString();
            lblSState.Text = default_ship_table.Rows[0].ItemArray[5].ToString();
            lblSPin.Text = default_ship_table.Rows[0].ItemArray[6].ToString();
            lblSCountry.Text = default_ship_table.Rows[0].ItemArray[7].ToString();
            lblSMobile.Text = default_ship_table.Rows[0].ItemArray[9].ToString();
        }
        if (default_ship_table.Rows.Count == 0)
        {
            lblSAdd1.Text = "You have not set a Default Shipping Address";
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

    protected void lbtnChangePass_Click(object sender, EventArgs e)
    {

        WarningModal.Show();
    }
    protected void lbtnManageAddress_Click(object sender, EventArgs e)
    {
        moDelAddress.Show();
    }
    protected void btnSaveEditUserInfo_Click(object sender, EventArgs e)
    {
        if(txtNewPass.Text!="" && txtNewPass.Text!="" && txtCPass.Text!="")
        {
            string Query = "Update user_info Set user_fname='" + txtFnameEdit.Text + "',user_lname='" + txtLnameEdit.Text + "',user_pass='" + txtNewPass.Text + "',user_company='" + txtCompany.Text + "',user_pri_mobile='" + txtPrimaryMobile.Text + "',user_fax='" + txtFax.Text + "',user_news_sub='" + chkNewsEdit.Checked + "' Where user_mail='" + Session["Uname"] + "'";
            string res =_support.insertQuery(Query);
            if(res=="True")
            {
                WarningModal.Hide();
            }
            
        }
        else
        {
            string Query = "Update user_info Set user_fname='" + txtFnameEdit.Text + "',user_lname='" + txtLnameEdit.Text + "',user_company='" + txtCompany.Text + "',user_pri_mobile='" + txtPrimaryMobile.Text + "',user_fax='" + txtFax.Text + "',user_news_sub='" + chkNewsEdit.Checked + "' Where user_mail='" + Session["Uname"] + "'";
            string res = _support.insertQuery(Query);
            if (res == "True")
            {
                WarningModal.Hide();
            }
            getvalues();
        }
    }
    protected void btnSaveAddr_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        string query = string.Empty;
        if(default_addr_table.Rows.Count==0 && default_ship_table.Rows.Count==0)
        {
            query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','True','" + txtMobileEditNew.Text + "','True')";
        }
        if(default_addr_table.Rows.Count>0 && chkbxMakeAsDefEdit.Checked==true && chkbxMakeAsShippingEdit.Checked==false)
        {
            string queryUpdate = "Update user_address Set user_make_as_default='False' Where user_mail='" + Session["Uname"] + "'";
            string res = _support.insertQuery(queryUpdate);
            if(res.ToLower()=="true")
            {
                query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','True','" + txtMobileEditNew.Text + "','"+chkbxMakeAsShippingEdit.Checked+"')";
            }
        }
        if(default_addr_table.Rows.Count == 0 && chkbxMakeAsDefEdit.Checked == true && chkbxMakeAsShippingEdit.Checked == false)
        {
                query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','True','" + txtMobileEditNew.Text + "','" + chkbxMakeAsShippingEdit.Checked + "')";
        }
        if(default_ship_table.Rows.Count>0 && chkbxMakeAsShippingEdit.Checked==true && chkbxMakeAsDefEdit.Checked==false)
        {
            string queryupdate = "Update user_address Set user_make_as_shipping='False' Where user_mail='" + Session["Uname"] + "'";
            string res = _support.insertQuery(queryupdate);
            if (res.ToLower() == "true")
            {
                query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','"+chkbxMakeAsDefEdit.Checked+"','" + txtMobileEditNew.Text + "','True')";
            }
        }
        if (default_ship_table.Rows.Count == 0 && chkbxMakeAsShippingEdit.Checked == true && chkbxMakeAsDefEdit.Checked == false)
        {
                query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','False','" + txtMobileEditNew.Text + "','True')";
        }
        if(default_ship_table.Rows.Count>0 && default_addr_table.Rows.Count>0 && chkbxMakeAsDefEdit.Checked==true && chkbxMakeAsShippingEdit.Checked==true)
        {
            string queryupdate = "Update user_address Set user_make_as_shipping='False',user_make_as_default='False' Where user_mail='" + Session["Uname"] + "'";
            string res = _support.insertQuery(queryupdate);
            if (res.ToLower() == "true")
            {
                query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','True','" + txtMobileEditNew.Text + "','True')";
            }
        }
        if(chkbxMakeAsDefEdit.Checked==false&&chkbxMakeAsShippingEdit.Checked==false&&default_addr_table.Rows.Count==0&&default_ship_table.Rows.Count==0)
        {
            query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','True','" + txtMobileEditNew.Text + "','True')";
        }
        if(default_addr_table.Rows.Count>0 && default_ship_table.Rows.Count>0 && chkbxMakeAsDefEdit.Checked==false&&chkbxMakeAsShippingEdit.Checked==false)
        {
            query = "INSERT into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping) Values('" + Session["Uname"] + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','False','" + txtMobileEditNew.Text + "','False')";
        }
        string result = _support.insertQuery(query);
        if(result.ToLower()=="true")
        {
            lblAddModelWar.Text = "Address Added to Address Book Successfully";
            txtAddr1EditNew.Text = "";
            txtAddr2EditNew.Text = "";
            txtCityEditNew.Text="";
            txtCountryEditNew.Text="";
            txtStateEditNew.Text="";
            txtPinEditNew.Text="";
            txtMobileEditNew.Text="";
            chkbxMakeAsDefEdit.Checked=false;
            chkbxMakeAsShippingEdit.Checked=false;
            checkForAddress();
                
        }
        else
        {
            lblAddModelWar.Text = "Error..Try Again!!!";
        }
    }

    protected void lbtnAddrMan_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_man.aspx");
    }
    protected void grd_placed_order_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName.Equals("details"))
        {
            string cartId = grd_placed_order.Rows[index].Cells[0].Text;
            grdOrderDetView.DataSource = getorderdetailTable(cartId);
            grdOrderDetView.DataBind();

            mdlPopforOrderDet.Show();
        }
        if(e.CommandName.Equals("track"))
        {
            string cartId = grd_placed_order.Rows[index].Cells[0].Text;
            string status = _support.getValue("Select cart_status from cart_shop where cart_Id ='" + cartId + "'");
            if(status.ToLower()=="approved")
            {
                imgTrck.ImageUrl = "../images/workflow/approval.PNG";
                mdlPopforOrderTrack.Show();
            }
            else if(status.ToLower()=="processed")
            {
                imgTrck.ImageUrl = "../images/workflow/processing.PNG";
                mdlPopforOrderTrack.Show();
            }
            else if(status.ToLower()=="shipped")
            {
                imgTrck.ImageUrl = "../images/workflow/shipping.PNG";
                mdlPopforOrderTrack.Show();
            }
            else if(status.ToLower()=="delivered")
            {
                imgTrck.ImageUrl = "../images/workflow/delivery.PNG";
                mdlPopforOrderTrack.Show();
            }
        }
    }

    private DataTable getorderdetailTable(string cartId)
    {
        DataTable orderDetRev = new DataTable();
        orderDetRev.Columns.Add("product_name");
        orderDetRev.Columns.Add("product_price");
        orderDetRev.Columns.Add("cart_pro_quantity");
        orderDetRev.Columns.Add("sub_total");

        string selQury = "Select * from cart_products where cart_pro_shop_Id='" + cartId + "'";
        DataTable cartTab = _support.getBulkValues(selQury);
        foreach(DataRow dr in cartTab.Rows)
        {
            string cartProProId = dr.ItemArray[1].ToString();
            string selQury2 = "Select * from product_detail where product_id ='" + cartProProId + "'";
            DataTable proTab = _support.getBulkValues(selQury2);
            if(proTab.Rows.Count==1)
            {
                double subTol = Convert.ToDouble(proTab.Rows[0].ItemArray[4].ToString()) * Convert.ToDouble(dr.ItemArray[3].ToString());
                orderDetRev.Rows.Add(proTab.Rows[0].ItemArray[1].ToString(), proTab.Rows[0].ItemArray[4].ToString(), dr.ItemArray[3].ToString(), subTol.ToString());
            }
        }

        double total=0;
        foreach(DataRow dr3 in orderDetRev.Rows)
        {
            total = total + Convert.ToDouble(dr3.ItemArray[3].ToString());
        }
        lblGrndTotal.Text = total.ToString();
        return orderDetRev;
    }
    protected void foradmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin/admin_page.aspx");
    }
}