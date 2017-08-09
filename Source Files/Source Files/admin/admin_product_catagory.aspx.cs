using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
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
        }
    }
    support _support = new support();
    DataTable dt = new DataTable();
    private void BindGrid()
    {
        try
        {
            string Query = "Select * From product_catagory";
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

    [System.Web.Services.WebMethod]
    public static string SetDownloadPath(string strpath)
    {
        Page objp = new Page();
        objp.Session["strDwnPath"] = strpath;
        return strpath;
    }

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
    public static List<string> GetCompleteList2(string prefixText, int count)
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

    protected void grdCatagory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        BindGrid();
        int index = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName.Equals("editRecord"))
        {
            GridViewRow gvrow = grdCatagory.Rows[index];
            Session.Add("IdCatagory", Convert.ToString((int)grdCatagory.DataKeys[index]["product_catagory_id"]));
            string test = Session["IdCatagory"].ToString();
            txtCatagory.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
            txtSCatagory.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
            drpEditTypeCatagory.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
            updateModal.Show();
        }
        if(e.CommandName.Equals("deleteRecord"))
        {
            GridViewRow gvrow = grdCatagory.Rows[index];
            Session.Add("IdAddrDel", Convert.ToString((int)grdCatagory.DataKeys[index]["product_catagory_id"]));
            string DelQuery = "Delete from product_catagory Where product_catagory_id='" + Session["IdAddrDel"] + "'";
            _support.insertQuery(DelQuery);
            BindGrid();
        }
    }
    protected void btnSaveCatagory_Click(object sender, EventArgs e)
    {
        string chkQuery = "Select * from product_catagory where lower(product_catagory)='" + txtCataEntry.Text.ToLower() + "' and lower(product_sub_catagory)='" + txtSCataEntry.Text.ToLower() + "'";
        DataTable dtChk = _support.getBulkValues(chkQuery);
        if (dtChk.Rows.Count == 0)
        {
            string inSertQuery = "Insert into product_catagory(product_catagory,product_sub_catagory,product_catagory_type) values ('" + txtCataEntry.Text + "','" + txtSCataEntry.Text + "','"+drpTypeCatagory.SelectedItem.Text+"')";
            string value = _support.insertQuery(inSertQuery);
            if (value == "True")
            {
                lblMsg.Text = "Catagory Added";
                txtCataEntry.Text = "";
                txtSCataEntry.Text = "";
                BindGrid();
            }
            else
            {
                lblMsg.Text = "Try Again";
            }
        }
        else
        {
            lblMsg.Text = "Catagory Already Added"; 
            txtCataEntry.Text = "";
            txtSCataEntry.Text = "";
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string UpdateQuery = "Update product_catagory set product_catagory='" + txtCatagory.Text + "',product_sub_catagory='" + txtSCatagory.Text + "',product_catagory_type='" + drpEditTypeCatagory.SelectedItem.Text + "' where product_catagory_id='" + Session["IdCatagory"].ToString() + "'";
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