using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    public static string textboxValue { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["Uname"] != null && Session["Admin"].ToString().ToLower() == "true")
        {
            lbtnLog.Text = "LOGOUT";
        }
        else
        {
            Response.Redirect("../index.aspx");
        }
        if (!IsPostBack)
        {
            BindGrid();
            textboxValue = drpProductCatagory_A.Text;
        }
        
        //Literal1.Text = "<b>This is <I>Bold</I> Text</b>";
    }

   

    support _support = new support();
    DataTable dt = new DataTable();

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCompletionList(string prefixText, int count)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["project16ConnectionString"].ConnectionString;

            using (SqlCommand com = new SqlCommand())
            {
                //com.CommandText = "select Distinct product_catagory from product_catagory where " + "product_catagory like '%' + @Search + '%'";
                com.CommandText = "select Distinct product_catagory from product_catagory where product_catagory like '%' + @Search + '%'";

                com.Parameters.AddWithValue("@Search", prefixText);
                com.Connection = con;
                con.Open();
                List<string> countryNames = new List<string>();
                using (SqlDataReader sdr = com.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        countryNames.Add(sdr["product_catagory"].ToString());
                    }
                }
                con.Close();
                return countryNames;


            }

        }

    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod(EnableSession = true)]
    public static List<string> GetCompleteList2(string prefixText,int count)
    {
        
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["project16ConnectionString"].ConnectionString;

            using (SqlCommand com = new SqlCommand())
            {
                
                com.CommandText = "select Distinct product_sub_catagory from product_catagory where product_catagory = '" + HttpContext.Current.Session["strDwnPath"].ToString().TrimEnd() + "' and product_sub_catagory like '%' + @Search + '%'";
                com.Parameters.AddWithValue("@Search", prefixText);
                com.Connection = con;
                con.Open();
                List<string> countryNames = new List<string>();
                using (SqlDataReader sdr = com.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        countryNames.Add(sdr["product_sub_catagory"].ToString());
                    }
                }
                con.Close();
                return countryNames;
            }
        }
    }

    [System.Web.Services.WebMethod]
    public static string SetDownloadPath(string strpath)
    {
        Page objp = new Page();
        objp.Session["strDwnPath"] = strpath;
        return strpath;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod(EnableSession = true)]
    public static List<string> GetCompleteList3(string prefixText, int count)
    {

        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["project16ConnectionString"].ConnectionString;

            using (SqlCommand com = new SqlCommand())
            {

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


    private void BindGrid()
    {
        try
        {
            string Query = "Select * From product_detail";
            dt = _support.getBulkValues(Query);
            grdCatagory.DataSource = dt;
            grdCatagory.DataBind();
        }
        catch
        {
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
    protected void grdCatagory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        BindGrid();
        int index = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName.Equals("editRecord"))
        {
            GridViewRow gvrow = grdCatagory.Rows[index];
            Session.Add("IdCatagory", Convert.ToString((int)grdCatagory.DataKeys[index]["product_id"]));
            string test = Session["IdCatagory"].ToString();
            txtProductName_E.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
            txtProductCat_E.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
            txtProductSubCat_E.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
            txtareaProductOver_E.InnerHtml = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
            txtareaProductDet_E.InnerHtml = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
            txtProductPrice_E.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text).ToString();
            drpProductAvailable_E.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells[8].Text).ToString();
            updateModal.Show();
        }
        if(e.CommandName.Equals("deleteRecord"))
        {
            GridViewRow gvrow = grdCatagory.Rows[index];
            Session.Add("IdAddrDel", Convert.ToString((int)grdCatagory.DataKeys[index]["product_id"]));
            string DelQuery = "Delete from product_detail Where product_id='" + Session["IdAddrDel"] + "'";
            _support.insertQuery(DelQuery);
            string DelImage = "Delete from image_table Where image_productId='" + Session["IdAddrDel"] + "'";
            _support.insertQuery(DelImage);
            BindGrid();
        }
    }
    protected void btnSaveCatagory_Click(object sender, EventArgs e)
    {
        string getId = "Select max(product_id) from product_detail";
        string idTest = _support.getValue(getId);
        if(idTest=="")
        {
            Session.Add("product_Id", "1");
        }
        else
        {
            int val = Convert.ToInt32(idTest) + 1;
            Session.Add("product_Id", val.ToString());
        }
        
        //string html = WebUtility.HtmlEncode(txtAreaProductDet_A.InnerText);
        string insertQuery = "Insert into product_detail (product_id,product_name,product_overview,product_details,product_price,product_catagory,product_sub_catagory,product_availability) values ('" + Session["product_id"] + "','" + txtProductName_A.Text + "','" + WebUtility.HtmlEncode(txtAreaProductOver_A.InnerText) + "','" + WebUtility.HtmlEncode(txtAreaProductDet_A.InnerText) + "','" + txtProductPrice_A.Text + "','" + drpProductCatagory_A.Text + "','" + drpSubCatagory_A.Text + "','"+drpAvailability_A.SelectedValue+"')";
        string result = _support.insertQuery(insertQuery);
        if (result.ToLower() == "true")
        {
            foreach (HttpPostedFile postedFile in imgUpload_A.PostedFiles)
            {
                string MaxIdT = string.Empty;
                string maxiD = _support.getValue("select max(image_id) from image_table");
                if(maxiD!="")
                {
                    MaxIdT = (Convert.ToInt32(maxiD) + 1).ToString();
                }
                else
                {
                    MaxIdT = "1";
                }
                string filename =Path.GetFileName(postedFile.FileName);
                var filename_alter = filename.Split('.');
                string content_type = postedFile.ContentType;
                postedFile.SaveAs(Server.MapPath("~/pics/" + filename_alter[0].ToString()+"_"+MaxIdT+"."+filename_alter[1]));
                string path = "~/pics/" + filename_alter[0].ToString() + "_" + MaxIdT + "." + filename_alter[1];
                string Query = "Insert into image_table(image_id,image_filename,image_filepath,image_productId)values('" + MaxIdT + "','"+filename+"','"+path+"','" + Session["product_id"] + "')";
                _support.insertQuery(Query);
            }
            lblMsg.Text = "Product Added...!";
            txtAreaProductDet_A.InnerText = "";
            txtAreaProductOver_A.InnerText = "";
            txtProductName_A.Text = "";
            txtProductPrice_A.Text = "";
            Session["product_id"] = "";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string UpdateQuery = "Update product_detail set product_name='" + txtProductName_E.Text + "',product_overview='" + WebUtility.HtmlEncode(txtareaProductOver_E.InnerText) + "',product_details='" + WebUtility.HtmlEncode(txtareaProductDet_E.InnerText) + "',product_price='"+txtProductPrice_E.Text+"',product_availability='"+drpProductAvailable_E.SelectedValue+"' where product_id='" + Session["IdCatagory"].ToString() + "'";
        _support.insertQuery(UpdateQuery);
        BindGrid();
    }

    protected void grdCatagory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCatagory.PageIndex = e.NewPageIndex;
        grdCatagory.DataBind();
    }
    protected void lbtnLog_Click(object sender, EventArgs e)
    {
        Session["Uname"] = null;
        Response.Redirect("../index.aspx");
    }

   
}