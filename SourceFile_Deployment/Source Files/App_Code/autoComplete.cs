using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for autoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class autoComplete : System.Web.Services.WebService
{
    support _support = new support();
    public autoComplete()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<string> FetchProductList(string mail)
    {
        List<string> temp = new List<string>();
        string query = "Select Distinct product_catagory from product_catagory where product_catagory like '%' + '" + mail + "' + '%'";
        DataTable dt = _support.getBulkValues(query);
        foreach(DataRow dr in dt.Rows)
        {
            temp.Add(dr.ItemArray[0].ToString());
        }

        return temp;
    }

}
