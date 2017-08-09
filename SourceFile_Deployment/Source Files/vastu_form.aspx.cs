using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    support _support = new support();
    DataTable user_info = new DataTable();
    DataTable default_addr_table = new DataTable();
    DataTable default_ship_table = new DataTable();
    
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
{
    if (Session["Uname"] != null)
    {
        lbtnReg.Text = "MY ACCOUNT";
        lbtnLog.Text = "LOGOUT";
        lblCartQuan.Visible = true;
        carq();
    }
    else
    {
        lbtnReg.Text = "REGISTER";
        lbtnLog.Text = "LOGIN";
        lblCartQuan.Visible = false;
    }
    if (!IsPostBack)
    {
        menubind();
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

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string maxq = "Select max(id) from vastu";
        string maxc = _support.getValue(maxq);
        if(maxc=="")
        {
            maxc = "1";
        }
        else
        {
            maxc = (Convert.ToInt32(maxc) + 1).ToString();
        }
        
        

        string insertQuery = "Insert into vastu (id,name,email,mobile,status) values ('"+maxc+"','"+txtName.Text+"','"+txtemail.Text+"','"+txtMobile.Text+"','Pending')";
        string res = _support.insertQuery(insertQuery);
        if(res.ToLower()=="true")
        {
            List<string> filpathsemail = new List<string>();
            foreach(HttpPostedFile pf in fileUp1.PostedFiles)
            {
                var filenameSplit = Path.GetFileName(pf.FileName).Split('.');
                pf.SaveAs(Server.MapPath("~/pics/" + filenameSplit[0].ToString() + "_vastu_" + maxc + "." + filenameSplit[1].ToString()));
                string path = "~/pics/" + filenameSplit[0].ToString() + "_vastu_" + maxc + "." + filenameSplit[1].ToString();
                filpathsemail.Add(path);
                string insertQueryPic = "Insert into vastu_image(image_path,vastu_id)values('" + path + "','" + maxc + "')";
                _support.insertQuery(insertQueryPic); 
            }

            string subct = "Predict Vastu For Mr." + txtName.Text;
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Name : " + txtName.Text);
            
            sb.AppendLine("Mobile :" + txtMobile.Text);
            sb.AppendLine("Email :" + txtemail.Text);
            StringBuilder sb2 = new StringBuilder();
            sb2.AppendLine("Your Data has been recieved. We will Process and get back to you soon.");
            sb2.AppendLine("Regards,");
            sb2.AppendLine("Srijothedam Team.");
            //_support.sendmailwithattach("contact.srijothedam@gmail.com", subct,sb.ToString(), filpathsemail);
            //_support.sendmail(txtemail.Text, "Thank You Mr." + txtName.Text, sb2.ToString());
            lblmsg.Text = "Registration Success...!";
            clr();
        }
        else
        {
            lblmsg.Text = "Try Again";
        }
    }

    private void clr()
    {
        
        txtemail.Text = "";
        txtMobile.Text = "";
       
        txtName.Text = "";
    }
}