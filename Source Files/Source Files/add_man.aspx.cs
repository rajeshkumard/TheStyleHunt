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
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if(Session["Uname"]=="")
        {
            Response.Redirect("index.aspx");
            
        }
    }
    DataTable dt = new DataTable();
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
       // lblCartQuan.Visible = false;
    }
    if (!IsPostBack)
    {
        menubind();
        BindGrid();

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

    void grdAddr_DataBound(object sender, EventArgs e)
    {
        if(grdAddr.HeaderRow!=null)
        {
            grdAddr.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }

    public void BindGrid()
    {
        try
        {
            string Query = "Select * From user_address Where user_mail='"+Session["Uname"].ToString()+"'";
            dt = _support.getBulkValues(Query);
            grdAddr.DataSource = dt;
            grdAddr.DataBind();
        }
        catch
        {
        }
    }

    private void executeUpdate(string address1,string address2,string city,string state,string country,string pin,string mobile,string def_addr,string def_ship,string id)
    {
        string Query = "Update user_address Set user_address1='" + address1 + "',user_address2='" + address2 + "',user_city='" + city + "',user_state='" + state + "',user_pincode='" + pin + "',user_country='" + country + "',user_make_as_default='" + def_addr + "',user_mobile='" + mobile + "',user_make_as_shipping='" + def_ship + "' Where id='"+id+"'";
        _support.insertQuery(Query);
    }

    protected void lbtnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("myaccount.aspx");
    }
    protected void grdAddr_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        BindGrid();
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("editRecord"))
        {
            GridViewRow gvrow = grdAddr.Rows[index];
            Session.Add("IdAddr", Convert.ToString((int)grdAddr.DataKeys[index]["id"]));
            txtModalAdd1Edit.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
            txtModalAdd2Edit.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
            txtModalCityEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
            txtModalStateEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text).ToString();
            txtModalCountryEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[8].Text).ToString();
            txtModalPinEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[9].Text).ToString();
            txtModalMobileEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[10].Text).ToString();
            chkModalDefEdit.Checked= Convert.ToBoolean((from r in dt.AsEnumerable() where r.Field<Int32>("id")==(int)grdAddr.DataKeys[index]["id"] select r.Field<string>("user_make_as_default")).FirstOrDefault());
            chkModalShipEdit.Checked = Convert.ToBoolean((from r in dt.AsEnumerable() where r.Field<Int32>("id") == (int)grdAddr.DataKeys[index]["id"] select r.Field<string>("user_make_as_shipping")).FirstOrDefault());
            lblResult.Visible = false;
            updateModal.Show();
        }
        if (e.CommandName.Equals("deleteRecord"))
        {
            GridViewRow gvrow = grdAddr.Rows[index];
            Session.Add("IdAddrDel", Convert.ToString((int)grdAddr.DataKeys[index]["id"]));
            string DelQuery = "Delete from user_address Where id='" + Session["IdAddrDel"] + "'";
            _support.insertQuery(DelQuery);
            BindGrid();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if(chkModalDefEdit.Checked==true)
        {
            string Query = "Update user_address Set user_make_as_default='False' Where user_mail='" + Session["Uname"] + "'";
            _support.insertQuery(Query);
        }
        if(chkModalShipEdit.Checked==true)
        {
            string Query = "Update user_address Set user_make_as_shipping='False' Where user_mail='" + Session["Uname"] + "'";
            _support.insertQuery(Query);
        }
        executeUpdate(txtModalAdd1Edit.Text, txtModalAdd2Edit.Text, txtModalCityEdit.Text, txtModalStateEdit.Text, txtModalCountryEdit.Text, txtModalPinEdit.Text, txtModalMobileEdit.Text, Convert.ToString(chkModalDefEdit.Checked), Convert.ToString(chkModalShipEdit.Checked), Session["IdAddr"].ToString());
        BindGrid();
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        updateModal.Hide();
    }
}