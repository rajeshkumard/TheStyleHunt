using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Net;
using System.IO;
using Facebook;
//using ASPSnippets.FaceBookAPI;
//using FacebookAPI.Base;

public partial class _Default : System.Web.UI.Page
{
    support _support = new support();
    protected void Page_Load(object sender, EventArgs e)
    {
        //var client = new FacebookClient();
        //dynamic me = client.Get("zuck");
        //txtFName.Text = me.first_name;
        //txtLName.Text = me.last_name;

        //FaceBookConnect.API_Key = "733080083503463";
        //FaceBookConnect.API_Secret = "4fc48770b37978a3fc451f8c2d6ab591";
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
        //    lblCartQuan.Visible = false;
        }
        if (!IsPostBack)
        {
            menubind();

            //if (Request.QueryString["error"] == "access_denied")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
            //    return;
            //}

            //string code = Request.QueryString["code"];
            //if (!string.IsNullOrEmpty(code))
            //{
            //    string data = FaceBookConnect.Fetch(code, "me");
            //    FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
            //    faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);
            //    pnlFaceBookUser.Visible = true;
            //    lblId.Text = faceBookUser.Id;
            //    lblUserName.Text = faceBookUser.UserName;
            //    lblName.Text = data;
            //    lblEmail.Text = faceBookUser.Email;
            //    ProfileImage.ImageUrl = faceBookUser.PictureUrl;
            //    btnLogin.Enabled = false;
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

    protected void btnReg_Click(object sender, EventArgs e)
    {
        lblRegMsg.Text = "";
        if(txtPass_reg.Text==txtConPass_reg.Text)
        {
            string usercheck = _support.getValue("Select user_mail from user_info where user_mail='" + txtemail.Text.Trim() + "'");
            if (usercheck == "")
            {
                string EncryptedPass = _support.Encrypt(txtPass_reg.Text);
                string Query = "Insert into user_info (user_fname,user_lname,user_mail,user_pass,user_news_sub,user_reward_subscribe,user_reward_notifi,user_points) Values ('" + txtFName.Text + "','" + txtLName.Text + "','" + txtemail.Text + "','" + EncryptedPass + "','false','false','false','0')";
                string result = _support.insertQuery(Query);
                if (result == "True")
                {
                    Session.Add("Uname", txtemail.Text);
                    Server.Transfer("index.aspx");
                }
                else
                {
                    lblRegMsg.Text = "Please Try Again Later...!";
                    clear_reg();
                }
            }
            else
            {
                lblRegMsg.Text = "User Already Registered...!";
            }
        }
        else
        {
            lblRegMsg.Text = "Password Does Not Match, Please Try Again";
        }
    }
    private void clear_reg()
    {
        txtFName.Text = "";
        txtLName.Text = "";
        txtemail.Text = "";
        txtPass_reg.Text = "";
        txtConPass_reg.Text = "";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string Query = "SELECT user_pass,user_type FROM user_info WHERE user_mail='" + txtUName.Text + "'";
        DataTable dt = _support.getBulkValues(Query);
        if (_support.Decrypt(dt.Rows[0].ItemArray[0].ToString()) == txtPass.Text)
        {
            Session["Uname"] = txtUName.Text;
            foreach (string s in Session)
            {
                string.Concat(s, "=", Session[s]);
            }
            if (dt.Rows[0].ItemArray[1].ToString().ToLower() == "admin")
            {
                Session.Add("Admin", "True");
                Response.Redirect("admin/admin_page.aspx");
            }
            else
            {
                Session.Add("Admin", "False");

                if ((Session["myCartDT"] as DataTable) != null && (Session["myCartDT"] as DataTable).Rows.Count > 0)
                {
                    foreach (DataRow dr in (Session["myCartDT"] as DataTable).Rows)
                    {
                        _support.AddtoCart(dr.ItemArray[0].ToString(), Session["Uname"].ToString(), dr.ItemArray[2].ToString());
                    }

                    Session.Remove("myCartDT");
                }

                Server.Transfer("index.aspx");
            }
        }
        else
        {
            lblLoginMsg.Text = "Please Check Your Username or Password";
            txtUName.Text = "";
            txtPass.Text = "";
        }
    }
    protected void lbtnForgetPassword_Click(object sender, EventArgs e)
    {
        Server.Transfer("forgetpass.aspx");
    }
    protected void btnLoginFb_Click(object sender, EventArgs e)
    {
        
    }
}
public class FaceBookUser
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string UserName { get; set; }
    public string PictureUrl { get; set; }
    public string Email { get; set; }
}
