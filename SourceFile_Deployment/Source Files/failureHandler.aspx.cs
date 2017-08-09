using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

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
    responsehandling();
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
    if (!IsPostBack)
    {
        menubind();

    }
   
    
}

    private void responsehandling()
    {
        try
        {

            string[] merc_hash_vars_seq;
            string merc_hash_string = string.Empty;
            string merc_hash = string.Empty;
            string order_id = string.Empty;
            string hash_seq = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";

            if (Request.Form["status"] == "success")
            {

                merc_hash_vars_seq = hash_seq.Split('|');
                Array.Reverse(merc_hash_vars_seq);
                merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];


                foreach (string merc_hash_var in merc_hash_vars_seq)
                {
                    merc_hash_string += "|";
                    merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");

                }
               // Response.Write(merc_hash_string);
                merc_hash = Generatehash512(merc_hash_string).ToLower();



                if (merc_hash != Request.Form["hash"])
                {
                    lblorderId.Text = Request.Form["productinfo"];
                   // Response.Write("Hash value did not matched");

                }
                else
                {

                    order_id = Request.Form["txnid"];
                    lblorderId.Text = Request.Form["productinfo"];
                   // Response.Write("value matched");

                    //Hash value did not matched
                }

            }

            else
            {

                lblorderId.Text = Request.Form["productinfo"];
               // Response.Write("Hash value did not matched");
                // osc_redirect(osc_href_link(FILENAME_CHECKOUT, 'payment' , 'SSL', null, null,true));

            }
        }

        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");

        }
    }

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
  


}