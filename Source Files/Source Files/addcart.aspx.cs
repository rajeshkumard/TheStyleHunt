using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class addcart : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    support _support = new support();

    public string action1 = string.Empty;
    public string hash1 = string.Empty;
    public string txnid1 = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] != null)
        {
            lbtnReg.Text = "MY ACCOUNT";
            lbtnLog.Text = "LOGOUT";
            //lblCartQuan.Visible = true;
            txtEmailEditNew.Text = Session["Uname"].ToString();
            carq();
        }
        else
        {
            lbtnReg.Text = "REGISTER";
            lbtnLog.Text = "LOGIN";
           // lblCartQuan.Visible = false;
        }
        try
        {

            key.Value = ConfigurationManager.AppSettings["MERCHANT_KEY"];
            if (string.IsNullOrEmpty(Request.Form["hash"]))
            {
                btnFinalSubmit.Visible = true;
            }
            else
            {
                btnFinalSubmit.Visible = false;
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        if (!IsPostBack)
        {
            menubind();

            //if (!IsPostBack)
            //{
            dt = createdates();
            cart_main_grid.DataSource = dt;
            cart_main_grid.DataBind();
            reviewGrid.DataSource = dt;
            reviewGrid.DataBind();
            //menubind();
            addressbind();
            datatbind();
            //}
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

    #region Cart
    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }

    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
    #endregion

    private void datatbind()
    {
        double total=0;
       foreach(GridViewRow gvr in reviewGrid.Rows)
       {
           double val = Convert.ToDouble(gvr.Cells[3].Text);
           total = total + val;
       }
       if (reviewGrid.Rows.Count > 0)
       {
           lblSubReview.Text = total.ToString();
           lblyouWill.Text = (total / 10).ToString();
           string ship_method = getRadioValue(this.Controls, "cori_method");
           if (ship_method == "rbneconomy")
           {
               lblGrandRevview.Text = (Convert.ToDouble(lbleconomy.Text) + Convert.ToDouble(total.ToString())).ToString();
               Label4.Text = lblGrandRevview.Text;
               lblShippingCharge.Text = lbleconomy.Text;
               Label1.Text = lbleconomy.Text;
           }
           else if (ship_method == "rbninPost")
           {
               lblGrandRevview.Text = (Convert.ToDouble(lblIndianPost.Text) + Convert.ToDouble(total.ToString())).ToString();
               Label4.Text = lblGrandRevview.Text;
               lblShippingCharge.Text = lblIndianPost.Text;
               Label1.Text = lblIndianPost.Text;
           }
       }
      
    }

    private void addressbind()
    {
        if (Session["Uname"] != null)
        {
            string selAddr = "Select * from user_address where user_mail='" + Session["Uname"].ToString() + "'";
            DataTable dtAddrTab = _support.getBulkValues(selAddr);
            DataTable forGrid = new DataTable();
            forGrid.Columns.Add("Id");
            forGrid.Columns.Add("Address");
            foreach (DataRow dr1 in dtAddrTab.Rows)
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendLine(dr1.ItemArray[11].ToString() + "<br />");
                sb.AppendLine(dr1.ItemArray[2].ToString() + "<br/>");
                sb.AppendLine(dr1.ItemArray[3].ToString() + "<br/>");
                sb.AppendLine(dr1.ItemArray[4].ToString() + "<br/>");
                sb.AppendLine(dr1.ItemArray[5].ToString() + "<br/>");
                sb.AppendLine(dr1.ItemArray[7].ToString() + "-" + dr1.ItemArray[6].ToString() + "<br/>");
                sb.AppendLine("Mobile : " + dr1.ItemArray[9].ToString());
                forGrid.Rows.Add(dr1.ItemArray[0], sb);
            }

            grdAddr.DataSource = forGrid;
            grdAddr.DataBind();
        }
        else
        {
            if (Session["myaddressTable"] != null)
            {
                grdAddr.DataSource = (Session["myaddressTable"] as DataTable);
                grdAddr.DataBind();
            }
        }
    }

    private DataTable createdates()
    {

        if (Session["Uname"] != null)
        {
            DataTable temp = new DataTable();
            temp.Columns.Add("Image");
            temp.Columns.Add("product_name");
            temp.Columns.Add("product_price");
            temp.Columns.Add("quantity_main_grid");
            temp.Columns.Add("sub_total_main_grid");
            temp.Columns.Add("cart_pro_Id");
            // temp.Columns.Add("grand_total_main_grid");

            string selct = "Select * from cart_products where cart_pro_user_id='" + Session["Uname"] + "' and cart_pro_shop_id is null";
            DataTable cart_temp = _support.getBulkValues(selct);
            foreach (DataRow dr_cart in cart_temp.Rows)
            {
                string cart_pro_product_id = dr_cart.ItemArray[1].ToString();
                string pro_det_Select = "Select * from product_detail where product_id ='" + cart_pro_product_id + "'";
                DataTable pro_info = _support.getBulkValues(pro_det_Select);
                string pro_image_sel = "Select * from image_table where image_productId ='" + cart_pro_product_id + "'";
                DataTable pro_image = _support.getBulkValues(pro_image_sel);
                int prouct_quant = Convert.ToInt32(dr_cart.ItemArray[3].ToString());
                int subtotal = prouct_quant * Convert.ToInt32(pro_info.Rows[0].ItemArray[4].ToString());
                temp.Rows.Add(pro_image.Rows[0].ItemArray[2].ToString(), pro_info.Rows[0].ItemArray[1].ToString(), pro_info.Rows[0].ItemArray[4].ToString(), prouct_quant.ToString(), subtotal.ToString(), dr_cart.ItemArray[0].ToString());
            }
            return temp;
        }
        else
        {
            if (Session["myCartDT"] != null)
            {
                DataTable temp = new DataTable();
                temp.Columns.Add("Image");
                temp.Columns.Add("product_name");
                temp.Columns.Add("product_price");
                temp.Columns.Add("quantity_main_grid");
                temp.Columns.Add("sub_total_main_grid");
                temp.Columns.Add("cart_pro_Id");

                foreach (DataRow dr in (Session["myCartDT"] as DataTable).Rows)
                {
                    string cart_pro_product_id = dr.ItemArray[0].ToString();
                    string pro_det_Select = "Select * from product_detail where product_id ='" + cart_pro_product_id + "'";
                    DataTable pro_info = _support.getBulkValues(pro_det_Select);
                    string pro_image_sel = "Select * from image_table where image_productId ='" + cart_pro_product_id + "'";
                    DataTable pro_image = _support.getBulkValues(pro_image_sel);
                    int prouct_quant = Convert.ToInt32(dr.ItemArray[2].ToString());
                    int subtotal = prouct_quant * Convert.ToInt32(pro_info.Rows[0].ItemArray[4].ToString());
                    temp.Rows.Add(pro_image.Rows[0].ItemArray[2].ToString(), pro_info.Rows[0].ItemArray[1].ToString(), pro_info.Rows[0].ItemArray[4].ToString(), prouct_quant.ToString(), subtotal.ToString(), cart_pro_product_id);
                }
                return temp;
            }
            else
            {
                return null;
            }

            
        }
    }

    protected void cart_main_grid_DataBound(object sender, EventArgs e)
    {
        
    }

    protected void cart_main_grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow gdr = cart_main_grid.Rows[index];
        if (e.CommandName == "increase_quatity")
        {
            if (Convert.ToInt32(((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text) > 1)
            {
                ((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text = (Convert.ToInt32(((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text) - 1).ToString();
                ((Label)gdr.FindControl("sub_total_main_grid")).Text = (Convert.ToInt32(((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text) * Convert.ToInt32(gdr.Cells[2].Text)).ToString();
                string p1 = ((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text;
                string p2 = cart_main_grid.DataKeys[gdr.RowIndex]["cart_pro_Id"].ToString();
                updatedb(p1,p2);
                DataTable dt = createdates();
                reviewGrid.DataSource = dt;
                reviewGrid.DataBind();
                datatbind();
            }
        }
        if(e.CommandName=="decrease_quatity")
        {
            ((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text = (Convert.ToInt32(((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text) + 1).ToString();
            ((Label)gdr.FindControl("sub_total_main_grid")).Text = (Convert.ToInt32(((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text) * Convert.ToInt32(gdr.Cells[2].Text)).ToString();
            string p1 = ((TextBox)gdr.Cells[4].FindControl("quantity_main_grid")).Text;
            string p2 = cart_main_grid.DataKeys[gdr.RowIndex]["cart_pro_Id"].ToString();
            updatedb(p1, p2);
            DataTable dt = createdates();
            reviewGrid.DataSource = dt;
            reviewGrid.DataBind(); 
            datatbind();
           // lastgridbind();
        }
        if(e.CommandName=="delete")
        {
            if (Session["Uname"] != null)
            {
                string value = cart_main_grid.DataKeys[gdr.RowIndex]["cart_pro_Id"].ToString();
                string delQuery = "Delete from cart_products where cart_pro_Id='" + value + "'";
                _support.insertQuery(delQuery);
                Response.Redirect("addcart.aspx");
            }
            else
            {
                string value = cart_main_grid.DataKeys[gdr.RowIndex]["cart_pro_Id"].ToString();
                foreach(DataRow dr in (Session["myCartDT"] as DataTable).Rows)
                {
                    if(dr.ItemArray[0].ToString().Contains(value))
                    {
                        dr.Delete();
                        break;
                    }
                }
                Response.Redirect("addcart.aspx");
            }
        }

        int total=0;
        foreach(GridViewRow ger in cart_main_grid.Rows)
        {
            total = total + Convert.ToInt32(((Label)ger.FindControl("sub_total_main_grid")).Text);
        }
        Label4.Text = total.ToString();
    }

    private void updatedb(string p1, string p2)
    {
        if (Session["Uname"] != null)
        {
            string UpadteQry = "Update cart_products set cart_pro_quatity='" + p1 + "' where cart_pro_Id='" + p2 + "'";
            _support.insertQuery(UpadteQry);
        }
        else
        {
            foreach(DataRow dr in (Session["myCartDT"] as DataTable).Rows)
            {
                if(dr.ItemArray[0].ToString().Equals(p2))
                {
                    dr.SetField("cart_pro_quatity", p1);
                }
            }
        }
    }
   
    //protected void cart_main_grid_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    string imagedata = cart_main_grid.DataKeys[e.Row.RowIndex].Values[0].ToString();
    //    (e.Row.FindControl("image_main_grid") as Image).ImageUrl = "data:image/jpeg;base64," + imagedata;
    //}
   
    private void deselect_RB_in_gridview()
    {
        foreach(GridViewRow gr in grdAddr.Rows)
        {
            RadioButton rb = (gr.FindControl("rbnAddrInside") as RadioButton);
            rb.Checked = false;
        }
    }
    public static int addressId { get; set; }
    protected void grdAddr_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName.Equals("select"))
        {
            deselect_RB_in_gridview();
            CheckBox cb = (grdAddr.Rows[index].FindControl("rbnAddrInside") as CheckBox);
            cb.Checked = true;
            addressId = Convert.ToInt32(grdAddr.DataKeys[index]["Id"].ToString());
        }
    }
    protected void rbnPauyumoney_CheckedChanged(object sender, EventArgs e)
    {
        if(rbnPauyumoney.Checked==true)
        {
            lblPauymoney.Visible = true;
            lblPauymoney.Text = "You will be redirected to PayUMoney Checkout page when you place an order.";
            lblBanktra.Visible = false;
            lblChkDD.Visible = false;
        }
    }
    protected void rbnBankTra_CheckedChanged(object sender, EventArgs e)
    {
        if(rbnBankTra.Checked==true)
        {
            lblPauymoney.Visible = false;
            lblBanktra.Visible = true;
            lblBanktra.TextMode = TextBoxMode.MultiLine;
            lblBanktra.ReadOnly = true;
            lblBanktra.Text = "BankDetails";
            lblChkDD.Visible = false;
        }
    }
    protected void rbnChkDD_CheckedChanged(object sender, EventArgs e)
    {
        if (rbnChkDD.Checked == true)
        {
            lblPauymoney.Visible = false;
            lblBanktra.Visible = false;
            lblChkDD.Visible = true;
            lblChkDD.TextMode = TextBoxMode.MultiLine;
            lblChkDD.ReadOnly = true;
            lblChkDD.Text = "Make Payable at:";
        }
    }
    protected void btnFinalSubmit_Click(object sender, EventArgs e)
    {
        string pay_method = getRadioValue(this.Controls, "pay_method");
        string pay_details = string.Empty;
        
            if(pay_method=="rbnPauyumoney")
            {
                pay_details = "PayuMoney";
            }
            else if(pay_method=="rbnBankTra")
            {
                pay_details = "BankTransfer";
            }
            else if(pay_method=="rbnChkDD")
            {
                pay_details = lblChkDD.Text;
            }
        string ship_method = getRadioValue(this.Controls, "cori_method");
        string ship_details = string.Empty;
       
            if(ship_method=="rbneconomy")
            {
                ship_details = lbleconomy.Text;
            }
            else if(ship_method=="rbninPost")
            {
                ship_details = lblIndianPost.Text;
            }
            string addressCheckStr = "";
            foreach (GridViewRow gr in grdAddr.Rows)
            {
                RadioButton rb = (gr.FindControl("rbnAddrInside") as RadioButton);
                if(rb.Checked==true)
                {
                    addressCheckStr = "True";
                    break;
                }
            }
            string getId = "Select max(cart_Id) from cart_shop";
            string getMaxId = _support.getValue(getId);
            int GetMaxIdShop;
            if(getMaxId=="")
            {
                GetMaxIdShop = 1;
            }
            else
            {
                GetMaxIdShop = Convert.ToInt32(getMaxId) + 1;
            }
            if (pay_method != "" && ship_method != "" && addressCheckStr!="")
            {
                if(pay_method!="rbnPauyumoney")
                {
                string user_name = string.Empty;
                string user_Id = string.Empty;
                string mobileNo = string.Empty;
                string today = DateTime.Now.ToString("yyyy-MM-dd");
                string insertQuery = string.Empty;
                if (Session["Uname"] != null)
                {
                    string point = _support.getValue("Select user_points from user_info where user_mail ='" + Session["Uname"].ToString() + "'");
                    double pointc = Convert.ToDouble(point) + Convert.ToDouble(lblyouWill.Text);
                     _support.insertQuery("Update user_info set user_points = '" + pointc.ToString() + "' where user_mail='" + Session["Uname"].ToString() + "'");
                    insertQuery = "Insert into cart_shop(cart_id,cart_address_id,cart_user_id,cart_price,cart_pay_method,cart_pay_details,cart_ship_method,cart_ship_detail,cart_status,cart_order_date) values (" + Convert.ToInt32(GetMaxIdShop) + ",'" + addressId + "','" + Session["Uname"].ToString() + "','" + lblGrandRevview.Text + "','" + pay_method + "','" + pay_details + "','" + ship_method + "','" + ship_details + "','Approved','" + today + "')";
                    user_Id = Session["Uname"].ToString();
                    user_name = _support.getValue("Select user_name from user_address where id='" + addressId + "'");
                    mobileNo = _support.getValue("Select user_mobile from user_address where id='" + addressId + "'");
                }
                else
                {
                    user_name = _support.getValue("Select user_name from user_address where id='" + addressId + "'");
                    mobileNo = _support.getValue("Select user_mobile from user_address where id='" + addressId + "'");
                     user_Id = _support.getValue("Select user_mail from user_address where id='" + addressId + "'");
                    insertQuery = "Insert into cart_shop(cart_id,cart_address_id,cart_user_id,cart_price,cart_pay_method,cart_pay_details,cart_ship_method,cart_ship_detail,cart_status,cart_order_date) values (" + Convert.ToInt32(GetMaxIdShop) + ",'" + addressId + "','" + user_Id + "','" + lblGrandRevview.Text + "','" + pay_method + "','" + pay_details + "','" + ship_method + "','" + ship_details + "','Approved','" + today + "')";
                }
                string res=_support.insertQuery(insertQuery);
                if(res.ToLower()=="true")
                {
                    if(Session["uname"]!=null)
                    foreach(GridViewRow gdr in cart_main_grid.Rows)
                    {
                        string MyQuery = "Update cart_products set cart_pro_shop_id='" + GetMaxIdShop + "' where cart_pro_Id='" + cart_main_grid.DataKeys[gdr.RowIndex]["cart_pro_Id"].ToString() + "'";
                        _support.insertQuery(MyQuery);
                    }
                    else
                    {
                        DataTable temp5 = Session["myCartDT"] as DataTable;
                        foreach (DataRow d in temp5.Rows)
                        {
                            string InsertQuery4 = "Insert into cart_products (cart_pro_product_Id,cart_pro_user_id,cart_pro_quatity,cart_pro_shop_Id) values ('" + d.ItemArray[0] + "','" + d.ItemArray[1] + "','" + d.ItemArray[2] + "','" + GetMaxIdShop + "')";
                            _support.insertQuery(InsertQuery4);
                        }
                    }

                    Session.Remove("myaddressTable");
                    Session.Remove("myCartDT");
                    sendemail(GetMaxIdShop, reviewGrid, user_Id);
                    Session.Add("SorderId", GetMaxIdShop);
                    Server.Transfer("successHandler1.aspx");
                   // lblMsg.Text="Order Placed";
                 //   Server.Transfer("myaccount.aspx");
                }
                else
                {
                    lblMsg.Text="Error...Try Again...!";
                }
            }
                else
                {
                    string user_name = string.Empty;
                    string user_Id = string.Empty;
                    string mobileNo = string.Empty;
                    string today = DateTime.Now.ToString("yyyy-MM-dd");
                    string insertQuery = string.Empty;
                    if (Session["Uname"] != null)
                    {
                        string point = _support.getValue("Select user_points from user_info where user_mail ='" + Session["Uname"].ToString() + "'");
                        double pointc = Convert.ToDouble(point) + Convert.ToDouble(lblyouWill.Text);
                        _support.insertQuery("Update user_info set user_points = '" + pointc.ToString() + "' where user_mail='" + Session["Uname"].ToString() + "'");
                        insertQuery = "Insert into cart_shop(cart_id,cart_address_id,cart_user_id,cart_price,cart_pay_method,cart_pay_details,cart_ship_method,cart_ship_detail,cart_status,cart_order_date) values (" + Convert.ToInt32(GetMaxIdShop) + ",'" + addressId + "','" + Session["Uname"].ToString() + "','" + lblGrandRevview.Text + "','" + pay_method + "','" + pay_details + "','" + ship_method + "','" + ship_details + "','Approved','" + today + "')";
                        user_Id = Session["Uname"].ToString();
                        user_name = _support.getValue("Select user_name from user_address where id='" + addressId + "'");
                        mobileNo = _support.getValue("Select user_mobile from user_address where id='" + addressId + "'");
                    }
                    else
                    {
                        user_name = _support.getValue("Select user_name from user_address where id='" + addressId + "'");
                        mobileNo = _support.getValue("Select user_mobile from user_address where id='" + addressId + "'");
                        user_Id = _support.getValue("Select user_mail from user_address where id='" + addressId + "'");
                        insertQuery = "Insert into cart_shop(cart_id,cart_address_id,cart_user_id,cart_price,cart_pay_method,cart_pay_details,cart_ship_method,cart_ship_detail,cart_status,cart_order_date) values (" + Convert.ToInt32(GetMaxIdShop) + ",'" + addressId + "','" + user_Id + "','" + lblGrandRevview.Text + "','" + pay_method + "','" + pay_details + "','" + ship_method + "','" + ship_details + "','Approved','" + today + "')";
                    }
                    string res = _support.insertQuery(insertQuery);
                    if (res.ToLower() == "true")
                    {
                        foreach (GridViewRow gdr in cart_main_grid.Rows)
                        {
                            string MyQuery = "Update cart_products set cart_pro_shop_id='" + GetMaxIdShop + "' where cart_pro_Id='" + cart_main_grid.DataKeys[gdr.RowIndex]["cart_pro_Id"].ToString() + "'";
                            _support.insertQuery(MyQuery);
                        }
                        Session.Remove("myaddressTable");
                        Session.Remove("myCartDT");
                        sendemail(GetMaxIdShop, reviewGrid, user_Id);
                        #region Payment Gateway
                        try
                        {
                            string[] hashVarsSeq;
                            string hash_string = string.Empty;
                            if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating txnid
                            {
                                Random rnd = new Random();
                                string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
                                txnid1 = strHash.ToString().Substring(0, 20);
                            }
                            else
                            {
                                txnid1 = Request.Form["txnid"];
                            }
                            if (string.IsNullOrEmpty(Request.Form["hash"])) // generating hash value
                            {
                                if (
                                    string.IsNullOrEmpty(ConfigurationManager.AppSettings["MERCHANT_KEY"]) ||
                                    string.IsNullOrEmpty(txnid1) ||
                                    string.IsNullOrEmpty(lblGrandRevview.Text)
                                    )
                                {
                                    //error

                                    lblMsg.Text = "Information Not Filled Properly";
                                    return;
                                }

                                else
                                {

                                    hashVarsSeq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); // spliting hash sequence from config
                                    hash_string = "";
                                    foreach (string hash_var in hashVarsSeq)
                                    {
                                        if (hash_var == "key")
                                        {
                                            hash_string = hash_string + ConfigurationManager.AppSettings["MERCHANT_KEY"];
                                            hash_string = hash_string + '|';
                                        }
                                        else if (hash_var == "txnid")
                                        {
                                            hash_string = hash_string + txnid1;
                                            hash_string = hash_string + '|';
                                        }
                                        else if (hash_var == "amount")
                                        {
                                            hash_string = hash_string + Convert.ToDecimal(lblGrandRevview.Text).ToString("g29");
                                            hash_string = hash_string + '|';
                                        }
                                        else if (hash_var == "productinfo")
                                        {
                                            hash_string = hash_string + GetMaxIdShop;
                                            hash_string = hash_string + '|';
                                        }
                                        else if (hash_var == "firstname")
                                        {
                                            hash_string = hash_string + user_name;
                                            hash_string = hash_string + '|';
                                        }
                                        else if (hash_var == "email")
                                        {
                                            hash_string = hash_string + user_Id;
                                            hash_string = hash_string + '|';
                                        }
                                        else
                                        {
                                            hash_string = hash_string + (Request.Form[hash_var] != null ? Request.Form[hash_var] : "");// isset if else
                                            hash_string = hash_string + '|';
                                        }
                                    }

                                    hash_string += ConfigurationManager.AppSettings["SALT"];// appending SALT

                                    hash1 = Generatehash512(hash_string).ToLower();         //generating hash
                                    action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";// setting URL

                                }


                            }

                            else if (!string.IsNullOrEmpty(Request.Form["hash"]))
                            {
                                hash1 = Request.Form["hash"];
                                action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";

                            }




                            if (!string.IsNullOrEmpty(hash1))
                            {
                                hash.Value = hash1;
                                txnid.Value = txnid1;

                                System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                                data.Add("hash", hash.Value);
                                data.Add("txnid", txnid.Value);
                                data.Add("key", key.Value);
                                string AmountForm = Convert.ToDecimal(lblGrandRevview.Text).ToString("g29");// eliminating trailing zeros
                                data.Add("amount", AmountForm);
                                data.Add("firstname", user_name.Trim());
                                data.Add("email", user_Id.Trim());
                                data.Add("phone", mobileNo.Trim());
                                data.Add("productinfo", GetMaxIdShop.ToString().Trim());
                                data.Add("surl", "http://srijothedam.in/successHandler.aspx");
                                data.Add("furl", "http://srijothedam.in/failureHandler.aspx");
                                data.Add("lastname", "");
                                data.Add("curl", "");
                                data.Add("address1", "");
                                data.Add("address2", "");
                                data.Add("city", "");
                                data.Add("state", "");
                                data.Add("country", "");
                                data.Add("zipcode", "");
                                data.Add("udf1", "");
                                data.Add("udf2", "");
                                data.Add("udf3", "");
                                data.Add("udf4", "");
                                data.Add("udf5", "");
                                data.Add("pg", "");
                                data.Add("service_provider", "payu_paisa");


                                string strForm = PreparePOSTForm(action1, data);
                                Page.Controls.Add(new LiteralControl(strForm));

                            }

                            else
                            {
                                //no hash

                            }

                        }

                        catch (Exception ex)
                        {
                            Response.Write("<span style='color:red'>" + ex.Message + "</span>");

                        }
                        #endregion
                        // lblMsg.Text="Order Placed";
                        //   Server.Transfer("myaccount.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Error...Try Again...!";
                    }
                }
            }
            else
            {
                lblMsg.Text = "Check Shipping Method,Payment Method,Billing Information Again..!";
            }
        
    }
    private void ccavenue()
    {
        
    }

    private void sendemail(int GetMaxIdShop, GridView reviewGrid, string user)
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("<h1>Srijothedam</h1><br /><h3>Thank you for choosing us. Your Order Id is : " + GetMaxIdShop.ToString()+"</h3>");
        sb.AppendLine("<br /><h3> Your Order Details : </h3><br />");
        sb.AppendLine("<table class=\"table table-responsive\"  border=\"1\"><tr><th>Product Name</th><th>Price</th><th>Quantity</th><th>SubTotal</th></tr>");
        foreach(GridViewRow gvr in reviewGrid.Rows)
        {
            sb.AppendLine("<tr><td>" + gvr.Cells[0].Text + "</td>");
            sb.AppendLine("<td>" + gvr.Cells[1].Text + "</td>");
            sb.AppendLine("<td>" + gvr.Cells[2].Text + "</td>");
            sb.AppendLine("<td>" + gvr.Cells[3].Text + "</td></tr>");
        }
        sb.AppendLine("</table><br />");
        sb.AppendLine("<div class=text-right>");
        sb.AppendLine("You will earn " + lblyouWill.Text + " points<br />");
        sb.AppendLine("Shipping Charge Rs." + lblShippingCharge.Text + "<br />");
        sb.AppendLine("Grand Total Rs." + lblGrandRevview.Text+"<br /></div>");
        sb.AppendLine("<br />Thank & Regards,<br />");
        sb.AppendLine("Srijothedam Team.");
        if(Session["Uname"]!=null)
        {
            //_support.sendmail(Session["Uname"].ToString(),"Order Confirmation",sb.ToString());
        }
        else
        {
            //_support.sendmail(user, "Order Confirmation", sb.ToString());
        }
    }

    private string getRadioValue(ControlCollection controlCollection, string p)
    {
        string ret = "";
        foreach (Control ctl in controlCollection)
        {
            if (ctl.Controls.Count != 0)
            {
                if (ret == "")
                    ret = getRadioValue(ctl.Controls, p);
            }

            if (ctl.ToString() == "System.Web.UI.WebControls.RadioButton")
            {
                RadioButton rb = (RadioButton)ctl;
                if (rb.GroupName == p && rb.Checked == true)
                    ret = rb.ID;
            }
        }
        return ret;
    }
    protected void btnSaveAddr_Click(object sender, EventArgs e)
    {
        if(Session["Uname"]!=null)
        {
            string insertQuery = "Insert into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping,user_name) values ('" + Session["Uname"].ToString() + "','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','False','" + txtMobileEditNew.Text + "','False','"+txtNameEditNew.Text+"')";
            _support.insertQuery(insertQuery);
            addressbind();
        }
        else
        {
            string insertQuery = "Insert into user_address(user_mail,user_address1,user_address2,user_city,user_state,user_pincode,user_country,user_make_as_default,user_mobile,user_make_as_shipping,user_name) values ('"+txtEmailEditNew.Text+"','" + txtAddr1EditNew.Text + "','" + txtAddr2EditNew.Text + "','" + txtCityEditNew.Text + "','" + txtStateEditNew.Text + "','" + txtPinEditNew.Text + "','" + txtCountryEditNew.Text + "','False','" + txtMobileEditNew.Text + "','False','" + txtNameEditNew.Text + "');" + "SELECT SCOPE_IDENTITY() AS id;";
           string id = _support.insertQuery(insertQuery,"id");
            if(Session["myaddressTable"] ==null)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Address");
                StringBuilder sb = new StringBuilder();
                sb.AppendLine(txtNameEditNew.Text + "<br />");
                sb.AppendLine(txtAddr1EditNew.Text + "<br/>");
                sb.AppendLine(txtAddr2EditNew.Text + "<br/>");
                sb.AppendLine(txtCityEditNew.Text + "<br/>");
                sb.AppendLine(txtStateEditNew.Text + "<br/>");
                sb.AppendLine(txtCountryEditNew.Text + "-" + txtPinEditNew.Text + "<br/>");
                sb.AppendLine("Mobile : " + txtMobileEditNew.Text);
                dt.Rows.Add(id, sb);
                Session.Add("myaddressTable", dt);
                addressbind();
            }
            else
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendLine(txtNameEditNew.Text + "<br />");
                sb.AppendLine(txtAddr1EditNew.Text + "<br/>");
                sb.AppendLine(txtAddr2EditNew.Text + "<br/>");
                sb.AppendLine(txtCityEditNew.Text + "<br/>");
                sb.AppendLine(txtStateEditNew.Text + "<br/>");
                sb.AppendLine(txtCountryEditNew.Text + "-" + txtPinEditNew.Text + "<br/>");
                sb.AppendLine("Mobile : " + txtMobileEditNew.Text);
                (Session["myaddressTable"] as DataTable).Rows.Add(id, sb);
                addressbind();
            }
           // addressbind();
        }
    }
    protected void add_new_addr_Click(object sender, EventArgs e)
    {
        moDelAddress.Show();
    }
    protected void rbneconomy_CheckedChanged(object sender, EventArgs e)
    {
        datatbind();
    }
    protected void rbninPost_CheckedChanged(object sender, EventArgs e)
    {
        datatbind();
    }
    protected void lbtnReg_Click1(object sender, EventArgs e)
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
}